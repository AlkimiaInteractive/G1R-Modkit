UCLASS()
class UAIState_GoGetGuard : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default AIStateTag = GameplayTag::AIState_Conflict_GoGetGuard;

    /** Tuning null / non-crime → use these. */
    UPROPERTY(EditDefaultsOnly, Category = "Crime|GuardEscort|Fallback")
    float FallbackSearchRadius = 10000.0f;

    UPROPERTY(EditDefaultsOnly, Category = "Crime|GuardEscort|Fallback")
    float FallbackGuardAckDeadlineSeconds = 180.0f;

    UPROPERTY(EditDefaultsOnly, Category = "Crime|GuardEscort|Fallback")
    float FallbackHandoffMaxDistanceToThiefOrScene = 750.0f;

    /** Set in ResolveTuning() at DoTask() start. */
    private float ResolvedSearchRadius;
    private float ResolvedGuardAckDeadlineSeconds;
    private float ResolvedHandoffMaxDistanceToThiefOrScene;

    /** Crime tag from event or first Crime_* in ContextTags → GetTuningFor; else Fallback*. */
    private void ResolveTuning()
    {
        UCrimeTuningConfig_Base Tuning = nullptr;
        if (IsValid(AI) && IsValid(AI.CrimeProcessingSubsystem))
        {
            FGameplayTag CrimeTag = RememberedPerception.EventTag;
            if (!CrimeTag.MatchesTag(GameplayTag::Crime))
            {
                for (FGameplayTag ContextTag : RememberedPerception.ContextTags.GameplayTags)
                {
                    if (ContextTag.MatchesTag(GameplayTag::Crime))
                    {
                        CrimeTag = ContextTag;
                        break;
                    }
                }
            }
            Tuning = AI.CrimeProcessingSubsystem.GetTuningFor(CrimeTag);
        }

        ResolvedSearchRadius = IsValid(Tuning) ? Tuning.GuardSearchRadius : FallbackSearchRadius;
        ResolvedGuardAckDeadlineSeconds = IsValid(Tuning) ? Tuning.GuardAckDeadlineSeconds : FallbackGuardAckDeadlineSeconds;
        ResolvedHandoffMaxDistanceToThiefOrScene = IsValid(Tuning) ? Tuning.HandoffMaxDistanceToThiefOrScene : FallbackHandoffMaxDistanceToThiefOrScene;
    }

    float NavDistanceToTheftSceneOrMax()
    {
        FVector NavTarget = RememberedPerception.Instigator.AtNavPosition;
        if (NavTarget == FVector::ZeroVector)
            NavTarget = RememberedPerception.Origin.AtNavPosition;
        if (NavTarget == FVector::ZeroVector && IsValid(RememberedPerception.Instigator.Character))
            NavTarget = RememberedPerception.Instigator.Character.NavAgentLocation;
        if (NavTarget == FVector::ZeroVector)
            return MAX_flt;
        return Self.NavAgentLocation.Distance(NavTarget);
    }

    float MinDistanceToThiefOrTheftScene()
    {
        float DistScene = NavDistanceToTheftSceneOrMax();
        float DistThief = MAX_flt;
        if (IsValid(RememberedPerception.Instigator.Character))
            DistThief = Self.GetDistanceTo(RememberedPerception.Instigator.Character);
        return Math::Min(DistScene, DistThief);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        DisableStrafeMovementAndTurnToTargetMode();

        ResolveTuning();

        AGothicCharacter GuardCharacter = nullptr;

        while(!bShouldExitState)
        {
            GuardCharacter = nullptr;
            bool bFound = false;
            float MinPathLength = MAX_flt;
            for (auto OtherActor : UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter, Self.NavAgentLocation, ResolvedSearchRadius))
            {
                auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);
                if (!IsValid(OtherCharacter) || !OtherCharacter.HasGameplayTag(GameplayTag::CampRole_Guard))
                    continue;

                if (OtherCharacter.IsDefeated() || OtherCharacter.IsDead())
                    continue;

                if (OtherCharacter.IsPlayerCharacterOrPlayerControlled())
                    continue;

                float VerticalReach = AI.Character.SimpleCollisionHalfHeight * 2 + OtherCharacter.SimpleCollisionHalfHeight;

                FVector Location;
                if (!UNavigationSystemV1::CanTargetBeReached3D(
                        AI.Character, 
                        OtherCharacter,
                        100.0f, 
                        VerticalReach, 
                        false, Location))
                {
                    continue;
                }

                float32 PathLength = MAX_flt;
                if (!UNavigationSystemV1::DoesPathExistWithinLengthLimit(Self, Self.NavAgentLocation, OtherCharacter.NavAgentLocation, MinPathLength, PathLength))
                    continue;

                MinPathLength = PathLength;
                bFound = true;
                GuardCharacter = OtherCharacter;
            }

            if (!bFound)
            {
                EndTaskAsFailure();
                WaitSeconds(0.3f);
                return;
            }

            SetWalkSpeed(EWalkSpeed::Running);
            AI.GotoCharacter(GuardCharacter, 150.0f);

            if (GuardCharacter.IsDefeated() || GuardCharacter.IsDead())
                continue;

            AI.StartFollowingActor(GuardCharacter, 150.0f, true, 300.0f);

            // Notify guard
            auto GuardAI = GuardCharacter.GetCharacterAI();

            if (!IsValid(GuardAI))
            {
                EndTaskAsFailure();
                WaitSeconds(0.3f);
                return;
            }

            GuardAI.ForceHearingPerception(CharacterState);
            FRememberedPerception AlertMemory = RememberedPerception;
            AlertMemory.EventTag = GameplayTag::AIEvent_Heard_Alert_Crime;
            AlertMemory.ContextTags.AppendTags(RememberedPerception.ContextTags);
            if (RememberedPerception.EventTag.MatchesTag(GameplayTag::Crime))
                AlertMemory.ContextTags.AddTag(RememberedPerception.EventTag);
            GuardAI.AssessEvent(AlertMemory.EventTag, AlertMemory);
            WaitSeconds(1.0f);
            break;
        }

        SetWalkSpeed(EWalkSpeed::Running);

        FString WaitBreakReason = "";
        FInGameTime WaitForGuardAckDeadline = FInGameTime::XRealtimeSecondsFromNow(ResolvedGuardAckDeadlineSeconds);
        bool bFollowingThiefToCatchUp = false;
        while (IsValid(GuardCharacter))
        {
            if (GuardCharacter.IsDead() || GuardCharacter.IsDefeated())
            {
                WaitBreakReason = GuardCharacter.IsDead() ? "GuardDead" : "GuardDefeated";
                break;
            }

            if (WaitForGuardAckDeadline.IsTimeInThePast())
            {
                WaitBreakReason = "Timeout180s";
                break;
            }

            // Guard is still investigating the alarm -> keep following.
            if (GuardCharacter.HasGameplayTag(GameplayTag::AIState_Conflict_InvestigateAlarm))
            {
                WaitOneTick();
                continue;
            }

            // Guard has finished investigating or engaged the criminal -> stop following so the
            // post-loop handoff can switch us into Warning_Crime_Theft as the personal victim.
            if (GuardCharacter.HasGameplayTag(GameplayTag::AIState_Conflict_Combat))
            {
                WaitBreakReason = "GuardCombat";
                break;
            }
            if (GuardCharacter.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
            {
                float MinReach = MinDistanceToThiefOrTheftScene();
                if (MinReach > ResolvedHandoffMaxDistanceToThiefOrScene && IsValid(RememberedPerception.Instigator.Character))
                {
                    if (!bFollowingThiefToCatchUp)
                    {
                        AI.StopFollowingActor();
                        AI.StartFollowingActor(RememberedPerception.Instigator.Character, 200.0f, true, 450.0f);
                        SetWalkSpeed(EWalkSpeed::Running);
                        bFollowingThiefToCatchUp = true;
                    }
                    WaitOneTick();
                    continue;
                }
                WaitBreakReason = "GuardWarning";
                break;
            }
            if (GuardCharacter.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
            {
                WaitBreakReason = "GuardDailyRoutine";
                break;
            }

            WaitOneTick();
        }

        AI.StopFollowingActor();

        // Handoff: generic AIEvent_Guard_ConfrontedCriminalAtCrimeScene; Crime_* in ContextTags; AssessEventWithExtraTags so EventHasTag(Crime_*) matches.
        if (IsValid(RememberedPerception.Instigator.CharacterState)
         && !Self.IsDead() && !Self.IsDefeated())
        {
            FRememberedPerception ConfrontPerception = RememberedPerception;
            ConfrontPerception.ContextTags.AppendTags(RememberedPerception.ContextTags);
            if (RememberedPerception.EventTag.MatchesTag(GameplayTag::Crime))
                ConfrontPerception.ContextTags.AddTag(RememberedPerception.EventTag);
            ConfrontPerception.EventTag = GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene;
            AI.AssessEventWithExtraTags(ConfrontPerception.EventTag, ConfrontPerception, ConfrontPerception.ContextTags);
            WaitSeconds(0.2f);
        }
    }

    FString GetDisplayName() const override
    {
        return "Go Get Guard State";
    }
}