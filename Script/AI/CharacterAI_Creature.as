
UCLASS()
class UGameplayAbility_CreatureAI : UGameplayAbility_CharacterAI_Gothic
{   
    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_Eat, UAIState_InteractWithItem_Eat);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_G1R);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Disengage, UAIState_Disengage_Creature);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter, UAIState_ChaseAndLookForHidingCharacter);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_Creature);
    // default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound, UAIState_InvestigateSuspiciousSound);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound, UAIState_InvestigateIdentifiedSound);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Creature);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Fear, UAIState_Flee_AlwaysFlee);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Flee_Predator, UAIState_Flee_Predator_NoHidingInteraction);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_IdentifySmell, UAIState_IdentifySmell);
    default SetAIStateClassForType(GameplayTag::AIState_IdentifySmell, UAIState_IdentifySmell_NoConflict);
    default SetAIStateClassForType(GameplayTag::AIState_InvestigateSound_Item, UAIState_InvestigateSound_Item_NoConflict);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_CombatEndActions, UAIState_CombatEndActions_Creature);

    default AssessmentModuleClass = UAIARM_Creature;

    /// TARGET SCORING
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 0.5f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_IgnoreDefeatedCharacterInCombat(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterDistance(), 100.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterTargetGroupLimits(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AlreadyTargeting(), 2.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AttackedMe(), 2.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_DistanceToPreferredLocation(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_InsideSameTerritory(), 10.0f);

    /// ITEM SCORING
    /// Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseSwimmingWeapon());
    
    bool IsWeaponConsideredAThreat(AGothicCharacter WeaponOwner) const override
    {
        // Creatures don't care about weapons
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

       	Perception.OnHeardFoodItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardFoodItem");
        Perception.OnSeenFoodItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenFoodItem");

        // Smelled character
        BindAssessmentToPerception(Perception.JustSmelledHostileCharacter(), 
            WhenGained = GameplayTag::AIEvent_Smelled_Character); // Only on Search state or non conflict state
        BindAssessmentToPerception(Perception.JustSmelledEnemyCharacter(), 
            WhenGained = GameplayTag::AIEvent_Smelled_Character); // Only on Search state or non conflict state
        BindAssessmentToPerception(Perception.JustSmelledPredator(), 
            WhenGained = GameplayTag::AIEvent_Smelled_Predator); // Only on Search state or non conflict state
        BindAssessmentToPerception(Perception.JustSmelledPrey(), 
            WhenGained = GameplayTag::AIEvent_Smelled_Character); // Only on Search state or non conflict state

        // Hostile Character entered Warning Range
        BindAssessmentToPerception(Perception.SeenHostileCharacterEnterWarningRange(WarnignHostileDistance),
            WhenGained = GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange);

        // Heard character
        BindAssessmentToPerception(Perception.HeardHostileCharacter(),
            WhenGained = GameplayTag::AIEvent_Heard_Hostile);

        BindAssessmentToPerception(Perception.HeardEnemyCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Heard_Enemy);

        BindAssessmentToPerception(Perception.SeenLivingEnemyCharacter().Delay(0.5f),
            WhenGained = GameplayTag::AIEvent_Seen_Enemy);
    }

    UFUNCTION()
    private void PerceptionEvent_SmelledFoodItem(const FRememberedPerception&in Perception,
                                                 const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (!WouldEatItem(Perception.PerceivedObject.ItemDefinition))
            return;

        AssessEvent(GameplayTag::AIEvent_Smelled_Item_Food, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_HeardFoodItem(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        if (Perception.EventTag.MatchesTag(GameplayTag::Perception_Character_Interaction))
            return;
        
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        if (!WouldEatItem(Perception.PerceivedObject.ItemDefinition))
            return;

        AssessEvent(GameplayTag::AIEvent_Heard_Noise_Item, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SeenFoodItem(const FRememberedPerception&in Perception,
                                              const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        if (!WouldEatItem(Perception.PerceivedObject.ItemDefinition))
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_Item_Food, Perception);
    }

    UFUNCTION(BlueprintCallable)
    bool WouldEatItem(const UItemDefinition ItemDefinition) const
    {
        FGameplayTagContainer FoodSpecs = ItemDefinition.GetAllMatchingSpecs(GameplayTag::Food);
        if (FoodSpecs.IsEmpty())
            return false;

        for (auto FoodSpec : FoodSpecs.GameplayTags)
        {
            if (!CharacterState.HasGameplayTag(FoodSpec))
                return false;
        }

        return true;
    }

    /** Override to decide whether character should be seen as a threat to us */
    bool IsCharacterConsideredAThreat(AGothicCharacter Other) const override
    {
        if (Other == Self.Owner)
            return false;
        
        if (Other.GetFeetLocation().Distance(Self.GetFeetLocation()) > 4000.0f)
            return false;

        return true;
    }
}

////////////////////////////////////////////////////////////////////////////////
//        EMPTY DAILY ROUTINE
////////////////////////////////////////////////////////////////////////////////
class UDailyRoutine_Test_None : UAIState_DailyRoutine_Creature
{
    
}

class UDailyRoutine_Test_PatrolTwoWaypoints : UAIState_DailyRoutine
{
    default Schedule(0, 0, UAIState_Test_PatrolTwoWaypoints(), Location::Spawnpoint, 5000.0f);
}

class UDailyRoutine_Test_PatrolTwoWaypoints_WeaponDrawn : UAIState_DailyRoutine
{
    default Schedule(0, 0, UAIState_Test_PatrolTwoWaypoints_WeaponDrawn(), Location::Spawnpoint, 5000.0f);
}

class UDailyRoutine_Test_PatrolBetweenWaypoints_WeaponDrawn : UAIState_DailyRoutine
{
    default Schedule(0, 0, UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn(), Location::Spawnpoint, 5000.0f);
}

class UDailyRoutine_Test_PatrolBetweenWaypoints_WeaponDrawn_Running : UAIState_DailyRoutine
{
    default Schedule(0, 0, UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn_Running(), Location::Spawnpoint, 5000.0f);
}

class UDailyRoutine_Test_PatrolBetweenWaypoints_WeaponDrawn_Sprinting : UAIState_DailyRoutine
{
    default Schedule(0, 0, UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn_Sprinting(), Location::Spawnpoint, 5000.0f);
}

class UAIState_Test_PatrolTwoWaypoints : UAIState_RandomInteractions_OnChainedSpots
{
    default SpotNames.Add(n"Waypoint_A");
    default SpotNames.Add(n"Waypoint_B");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround));
}

class UAIState_Test_PatrolTwoWaypoints_Night : UAIState_RandomInteractions_OnChainedSpots
{
    default TryTakeOutItemIfPossible = UItMw_1H_Torch;

    default SpotNames.Add(n"Waypoint_A");
    default SpotNames.Add(n"Waypoint_B");

    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround));
}

class UAIState_Test_PatrolTwoWaypoints_WeaponDrawn : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            WaitSeconds(2.0);

            AI.DrawMeleeWeapon();

            WaitSeconds(2.0);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_A"));

            AI.Wait(3.0f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_B"));

            AI.Wait(3.0f);
        }
    }
}

class UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            WaitSeconds(2.0);

            AI.DrawMeleeWeapon();

            WaitSeconds(2.0);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_A"));

            AI.Wait(5.0f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_B"));

            AI.Wait(5.0f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_C"));

            AI.Wait(5.0f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_D"));

            AI.Wait(5.0f);
        }
    }
}

class UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn_Running : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            WaitSeconds(2.0);

            AI.DrawMeleeWeapon();

            
            SetWalkSpeed(EWalkSpeed::Running);
            WaitSeconds(2.0);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_A"));

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_B"));

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_C"));

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_D"));

        }
    }
}


class UAIState_Test_PatrolBetweenWaypoints_WeaponDrawn_Sprinting : UGothicCharacterSimulateableAIState
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            if (CharacterState.Character == nullptr)
            {
                WaitSeconds(1.f);
                return;
            }

            AI.DrawMeleeWeapon();

            SetWalkSpeed(EWalkSpeed::Sprinting);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_A"), 120.f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_B"), 120.f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_C"), 120.f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_D"), 120.f);

            AI.GotoFreepoint(FInteractionSpotHandle(n"Waypoint_E"), 120.f);
        }
    }
}


////////////////////////////////////////////////////////////////////////////////
//        WOLF AI
////////////////////////////////////////////////////////////////////////////////
class UDailyRoutine_Test_Wolf : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_WanderAimlessly(), NAME_None, 2000.0f);
    // default Schedule(23, 0, UAIState_TauntTest(), NAME_None, 2000.0f);
}
