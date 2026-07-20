UCLASS()
class UGameplayAbility_CharacterAI_Scavenger_Adult_Rideable : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always;

    default InitialDailyRoutineClass = UDailyRoutine_Scavenger_Rideable_Idle::StaticClass();

    default AssessmentModuleClass = UAIARM_Creature_Scavenger_Rideable;
}

UCLASS()
class UGameplayAbility_CharacterAI_Scavenger_Adult_Rideable_Cohsel : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always;

    default InitialDailyRoutineClass = UDailyRoutine_Scavenger_Rideable_Cohsel_Idle::StaticClass();

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Scavenger_Adult::StaticClass());
}

class UDailyRoutine_Scavenger_Rideable_Idle : UDailyRoutine_Scavenger_Rideable
{
    default RelationshipModifiersToApply.Add(UActivePersonalRelationshipModifier_FriendlyToPlayer);

    default Schedule(0, 0, UAIState_Scavenger_Rideable_Living_Day(), Location::Anywhere);
}

class UDailyRoutine_Scavenger_Rideable_Cohsel_Idle : UAIState_DailyRoutine_Creature
{

    default Schedule(0, 0, UAIState_Scavenger_Living_Day(), Location::Anywhere);
}

class UDailyRoutine_Scavenger_Rideable_ExitUnrideableZone : UDailyRoutine_Scavenger_Rideable
{
    default RelationshipModifiersToApply.Add(UActivePersonalRelationshipModifier_FriendlyToPlayer);

    default Schedule(0, 0, UAIState_Scavenger_Rideable_ExitUnrideableZone(), Location::Anywhere);
}

class UDailyRoutine_Scavenger_Rideable_Follow : UDailyRoutine_Scavenger_Rideable
{
    default RelationshipModifiersToApply.Add(UActivePersonalRelationshipModifier_FriendlyToPlayer);
    default bSimulateRoutineTasksFromStartTime = false;

    default Schedule(0, 0, UAIState_Scavenger_Rideable_Follow(), Location::Anywhere);
}

class UDailyRoutine_Scavenger_Rideable : UAIState_DailyRoutine_Creature
{
    default Schedule(0, 0, UAIState_Scavenger_Rideable_Living_Day(), Location::Anywhere);

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Perception.OnSensedSelfWithTag(GameplayTag::State_RidingBlocked)
                  .TickRate(0.5f)
                  .PerceptionGained
                  .BindUFunction(this, n"PerceptionHandler_InBlockedArea");

        Perception.OnSensedSelfWithTag(GameplayTag::State_RidingBlocked)
                  .TickRate(5.0f)
                  .PerceptionLost
                  .BindUFunction(this, n"PerceptionHandler_NoLongerInBlockedArea");
    }

    UFUNCTION()
    private void PerceptionHandler_InBlockedArea(const FRememberedPerception&in Perception,
                                                          const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsInSubStateOfClass(UAIState_Scavenger_Rideable_ExitUnrideableZone))
        {
            DoInterruptStateOfClass(UAIState_Scavenger_Rideable_ExitUnrideableZone);
        }
    }

    UFUNCTION()
    private void PerceptionHandler_NoLongerInBlockedArea(const FRememberedPerception&in Perception,
                                                         const FPerceptionShortTermMemory&in Memory)
    {
        NPCState.ExchangeDailyRoutineToClass(UDailyRoutine_Scavenger_Rideable_Idle);
    }
}

UCLASS()
class UAIState_Scavenger_Rideable_ExitUnrideableZone : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        FVector RandomLocation;
        while (NPCState.HasGameplayTag(GameplayTag::State_RidingBlocked) && FindRandomReachableLocation(RandomLocation))
        {
            AI.GotoPosition(RandomLocation);

            WaitOneTick();
        }
    }

    protected bool FindRandomReachableLocation(FVector& OutRandomLocation) const
    {
        FBox Bounds = NPCState.RegionTraits.GetTraitBoundsOfClass(URegionTrait_BlockRiding);

        if (Bounds.Extent.IsNearlyZero())
            return false;

        const int32 NumSampleTries = 10;

        // Try a couple times until we find a location that is outside of the volume. If that doesn't work, give up.
        for (int32 i = 0; i < NumSampleTries; i++)
        {
            if (!UNavigationSystemV1::TryGetRandomNavigablePointInRadius(NPCState, NPCState.ApproximateNavAgentLocation, Bounds.Extent.Size2D() * 2.0f, OutRandomLocation))
            {
                // No reachable location at all, this will never work so we can return here already.
                return false;
            }

            if (!NPCState.RegionTraits.HasPotentiallyApplicableTraitOfClassAtLocation(OutRandomLocation, URegionTrait_BlockRiding))
            {
                return true;
            }
        }

        return false;
    }
}

UCLASS()
class UAIState_Scavenger_Rideable_Follow : UGothicCharacterSimulateableAIState
{
    UPROPERTY()
    float FollowDistance = 300.0f;

    UPROPERTY()
    float SprintWhenFurtherAwayThan = 1000;

    /** Character that called us last. */
    UPROPERTY()
    AGothicCharacter CalledBy;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        if (CalledBy == nullptr)
        {
            while (!bShouldExitState && (CalledBy == nullptr))
            {
                CalledBy =Cast<AGothicCharacter>(GetNPCState().GetActorInstigator());

                WaitOneTick();
            }
        }
        
       while (!AI.IsFollowingActor(CalledBy))
       {
            AI.StartFollowingActor(CalledBy, FollowDistance, true, SprintWhenFurtherAwayThan); 
            WaitOneTick();
       }

       while(!bShouldExitState)
       {
            if ((CalledBy.ActorLocation.DistSquared2D(GetNPCState().ActorLocation) <= Math::Square(FollowDistance+50)/*Magic number to make sure the mount reaches de location*/) ||
                    CalledBy.HasGameplayTag(GameplayTag::State_RidingBlocked))

            {
                bShouldExitState = true;
            }      
           
            WaitOneTick();
        }
    
        AI.StopFollowingActor(CalledBy);
        
        GetNPCState().ExchangeDailyRoutineToClass(UDailyRoutine_Scavenger_Rideable_Idle::StaticClass());
        
    }
}

UCLASS()
class UAIState_Scavenger_Rideable_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.70f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.10f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.05f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 15.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;

    // if character wants to go to a spot with one of these tags, it will always start a random interaction here. 
    // If you want this specific interaction to start, only add this tag as PossibleAction to the spot
    default AlwaysStartInteractionOnSpotWithInteractions.AddTag(GameplayTag::Action_Ambient_Eat);
}