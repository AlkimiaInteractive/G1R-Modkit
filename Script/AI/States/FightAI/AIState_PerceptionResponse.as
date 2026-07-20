enum ESwitchAIStateMode
{
    Interrupt,
    EndState_Cancel,
    EndState_DisallowGracefulExit
}

enum ESwitchAIStateEndInteractionMode
{
    None,
    EndAnyOngoingInteraction,
    EndAnyOngoingInteraction_Quick,
    EndAnyOngoingInteraction_Instant
}

/** AI State coming from an AIEventResponse that requires the triggering Perception to be passed */
UCLASS()
class UAIState_PerceptionResponse : UGothicCharacterAIState
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_Quiet);
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);

    UPROPERTY()
    EGothicFocusPriority FocusPriority = EGothicFocusPriority::PerceptionResponse;

    UPROPERTY()
    FGameplayTag AIStateTag;

    UPROPERTY()
    FRememberedPerception RememberedPerception;

    UPROPERTY()
    EConflictType InitialConflictType = EConflictType::None;

    UPROPERTY()
    FGameplayTag StartingAssessmentTag;

    UPROPERTY()
    FGameplayTagContainer Context;

    UPROPERTY()
    bool bHasSetRememberedPerception = false;

    UPROPERTY()
    bool bStopTargetingOnStart = false;

    UPROPERTY()
    bool bTargetCharacterOfInterest = true;

    UPROPERTY()
    ESwitchAIStateMode SwitchAIStateMode = ESwitchAIStateMode::EndState_DisallowGracefulExit;

    UPROPERTY()
    ESwitchAIStateEndInteractionMode EndInteractionMode = ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Quick;

    UPROPERTY()
    FGameplayTagContainer CharacterTagsBeforeStateSwitch;

    UPROPERTY()
    FGameplayTagContainer OwnedTagsDelayStateStart;
    default OwnedTagsDelayStateStart.AddTag(GameplayTag::Debuff_Paralyzed);

    UPROPERTY()
    bool bStopTalking = false;

    UPROPERTY()
    const bool bMemorizeStateUsage = false;

    void SetupRememberedPerception(FGameplayTag AssessmentTag, FRememberedPerception Perception)
    {
        RememberedPerception = Perception;
        StartingAssessmentTag = AssessmentTag;
        RememberedPerception.ContextTags.AddTag(StartingAssessmentTag);
        bHasSetRememberedPerception = true;
    }

    /** Returns how many times this state has been started and registered in long term memory in the last TimespanSeconds. */
    UFUNCTION(BlueprintCallable)
    int GetTimesAIStateStarted(float TimespanSeconds = -1.0f)
    {
        if (TimespanSeconds <= 0.0f)
        {
            auto FilteredMemories = AI.CharacterState.LongTermMemory.Filter()
                .WithTag(AIStateTag)
                .Affecting(CharacterState.CharacterGlobalId);

            return FilteredMemories.Count;
        }

        auto FilteredMemories = AI.CharacterState.LongTermMemory.Filter()
                .WithTag(AIStateTag)
                .Affecting(CharacterState.CharacterGlobalId)
                .AfterTime(FInGameTime::XRealtimeSecondsAgo(TimespanSeconds));

        return FilteredMemories.Count;
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        PerformActionsBasedOnPastOwnedTags();
        
        if (bMemorizeStateUsage)
        {
            FMemorizedEvent Event;
            Event.AffectedCharacterGlobalId = CharacterState.CharacterGlobalId;
            Event.EventTags.AddTag(AIStateTag);
            Event.Time = FInGameTime::Now();

            AI.CharacterState.LongTermMemory.MemorizeEvent(Event);
        }

        switch(EndInteractionMode)
        {
            case ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction:
            {
                AI.EndAnyOngoingInteraction();
                break;
            }
            case ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Quick:
            {
                AI.EndAnyOngoingInteractionQuick();
                break;
            }
            case ESwitchAIStateEndInteractionMode::EndAnyOngoingInteraction_Instant:
            {
                TryEndInteractionInstant();
                break;
            }
            case ESwitchAIStateEndInteractionMode::None:
            default:
            {
                break;
            }
        }

        if (bStopTargetingOnStart)
        {
            AI.StopTargetingEnemy(FocusPriority);
        }

        if (bTargetCharacterOfInterest && Self.CanMove() && IsValid(CharacterOfInterest) && AI.Character.Perception.CanSee(CharacterOfInterest))
        {
            EnableStrafeMovementAndTurnToTargetMode();
            AI.TargetCharacterOfInterest(FocusPriority, this);
        }

        if (bStopTalking && AI.CharacterState.IsSpeaking())
        {
            AI.StopTalking();
        }
        
        bool bOwnedTagsDelayStart = true;
        while (bOwnedTagsDelayStart)
        {
            bOwnedTagsDelayStart = false;
            for (auto Tag : OwnedTagsDelayStateStart.GameplayTags)
            {
                if (Self.HasGameplayTag(Tag))
                {
                    bOwnedTagsDelayStart = true;
                    break;
                }
            }

            WaitOneTick();
        }

        if (Context.HasTag(GameplayTag::State_Ambush))
        {
            FGameplayTagContainer RequiredTags;
            RequiredTags.AddTag(GameplayTag::State_Ambush);

            BroadcastPerceptionEventInRadius(GameplayTag::AreaEvent_AmbushStarted,
                1000.0f,
                RequiredTags,
                CharacterOfInterest != nullptr ? CharacterOfInterest.CharacterState : nullptr,
                CharacterOfInterest != nullptr ? CharacterOfInterest.CharacterState : nullptr);
        }
    }

    void PerformActionsBasedOnPastOwnedTags()
    {
        if (CharacterTagsBeforeStateSwitch.IsEmpty())
            return;

        if (CharacterTagsBeforeStateSwitch.GameplayTags.Contains(GameplayTag::State_Drugs_Forced_Alcohol_High))
        {
            AddDynamicOwnedGameplayTagToOwner(GameplayTag::State_Drugs_Forced_Alcohol_High);
        }
    }

    void TryEndInteractionInstant()
    {
        if (CharacterState.HasAnyGameplayTags(AI.AllowInstantCancelInteractions))
        {
            AI.EndAnyOngoingInteractionInstant();
            return;
        }
        
        AI.EndAnyOngoingInteractionQuick();
    }

    bool IsTargetInWater() const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        return CharacterOfInterest.IsSwimming() || CharacterOfInterest.IsDiving();
    }

    bool CanAttackFromRange() const
    {
        if (AI.MaximumRangedAttackHorizontalDistance <= 0.0f)
            return false;

        if (!AI.bRangedAttackRequiresRangedWeapon)
            return true;

        if (Self.HasDrawnRangedWeapon())
            return true;

        if (Self.HasDrawnMagicSpell())
            return true;
        
        return false;
    }

    bool IsTargetReachable(float MeleeReach = 150.0f) const
    {
        if (!IsValid(CharacterOfInterest))
            return false;

        if (!Self.IsSwimming() && !Self.IsDiving() && 
            IsTargetInWater() && 
            !CanAttackFromRange() && 
            !Self.Inventory.HasUsableRangedWeaponInInventory() &&
            !AI.bCanReachSwimmingTargetFromLand)
        {
            return false;
        }
        
        float HorizontalReach = MeleeReach;
        float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 3;
        if (AI.MaximumRangedAttackHorizontalDistance > 0.0f &&
            (!AI.bRangedAttackRequiresRangedWeapon ||
             Self.Inventory.HasUsableRangedWeaponInInventory() ||
             Self.HasDrawnRangedWeapon()))
        {
            HorizontalReach = AI.MaximumRangedAttackHorizontalDistance;
            VerticalReach = 1000.0f;
        }

        FVector SelfToCharacterOfInterest = CharacterOfInterest.NavAgentLocation - Self.NavAgentLocation;
        FVector SelfToCharacterOfInterest_HorizontalComponents = SelfToCharacterOfInterest; SelfToCharacterOfInterest_HorizontalComponents.Z = 0;
        
        if (Math::Abs(SelfToCharacterOfInterest.Z) <= VerticalReach && SelfToCharacterOfInterest_HorizontalComponents.Size() <= HorizontalReach)
            return true;

        FVector Location;
        if (UNavigationSystemV1::CanTargetBeReached3D(
                AI.Character, 
                CharacterOfInterest, 
                HorizontalReach, 
                VerticalReach, 
                false, Location))
        {
            return true;
        }
        
        return false;
    }

    void BroadcastPerceptionEventInRadius(FGameplayTag EventTag, float Radius, FGameplayTagContainer RequiredTagsOfReceiver, AGothicCharacterState Affected, AGothicCharacterState Instigator)
    {
        if (!EventTag.IsValid() || !IsValid(AI) || !IsValid(AI.Character))
            return;

        auto NearbyActorSubsystem = UNearbyActorsSubsystem::Get();

        if (!IsValid(NearbyActorSubsystem))
            return;

        TArray<AGothicCharacter> CharactersToBroadcastTo;

        for (auto OtherActor : NearbyActorSubsystem.FindActorsOfClassInRadius(AGothicCharacter, AI.CharacterState.ActorLocation, Radius))
        {
            auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);
            if (!IsValid(OtherCharacter) || !IsValid(OtherCharacter.CharacterState))
                continue;

            if (OtherCharacter.IsPlayerCharacterOrPlayerControlled())
                continue;

            if (!OtherCharacter.HasAllGameplayTags(RequiredTagsOfReceiver))
                continue;

            if (!AI.CharacterState.IsFriendlyTowards(OtherCharacter.CharacterState))
                continue;

            auto OtherAI = Cast<UGameplayAbility_CharacterAI_Gothic>(OtherCharacter.AI);
            if (!IsValid(OtherAI))
                continue;

            OtherAI.ForceHearingPerception(AI.Self.CharacterState);
            CharactersToBroadcastTo.Add(OtherCharacter);
        }

        WaitOneTick();

        for (auto OtherCharacter : CharactersToBroadcastTo)
        {
            auto PerceptionSystem = UPerceptionSystem::Get();
            PerceptionSystem.BroadcastPerceptionEvent (
                EventTag, 
                AI.Self.ActorLocation, 
                AI.Self,
                OtherCharacter, 
                Instigator,
                Affected,
                nullptr, 
                FGameplayTagContainer());
        }
        
    }
}