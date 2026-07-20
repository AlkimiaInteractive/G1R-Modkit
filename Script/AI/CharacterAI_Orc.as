UCLASS()
class UGameplayAbility_CharacterAI_Orc : UGameplayAbility_CharacterAI_Gothic
{    
    //default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable;
    default MaximumRangedAttackHorizontalDistance = 1500.0f;
    default bRangedAttackRequiresRangedWeapon = false;

    default ConversationAIStateClass = UAIState_Conversation::StaticClass();

    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_StandAround);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Smalltalk);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Drink);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Dance);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_SmashFood_Standing);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemyFemale);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Crafting_Cook);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_SowRice);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Campfire);


    /// TARGET SCORING
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 0.5f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_IgnoreDefeatedCharacterInCombat(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterDistance(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterTargetGroupLimits(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AlreadyTargeting(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AttackedMe(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_DistanceToPreferredLocation(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_IgnoreFleeingOrDisengagingTarget(), 1.0f);

    /// ITEM SCORING
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    /// Misc item scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseSwimmingWeapon());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseClimbingWeapon());

    /// AIStates
    default SetAIStateClassForType(GameplayTag::AIState_Wait_BlockedPath, UAIState_WaitForBlockedPath_Orc);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_BlockedPath, UAIState_Warning_Crime_Orc_BlockedPath);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Crime_Human_WeaponDrawn);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_HumanOrc);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Disengage, UAIState_Disengage);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Orc_Generic::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Recover, UAIState_Recovering);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_WatchFight, UAIState_WatchFight_Orc);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_CombatEndActions, UAIState_CombatEndActions_Human);
    default SetAIStateClassForType(GameplayTag::AIState_Observe_Creeping, UAIState_Observe_Creeping_Orc);

    default AssessmentModuleClass = UAIARM_Orc;
    default CrimeProcessingSubsystemClass = UCrimeProcessingSubsystem_Orc;

    UFUNCTION()
    void EnsureOrcBlockingPathDefaultsInitialized()
    {
        auto BlockingPathStorage = SpawnedStorage(UAIValueSet_BlockingPath);
        BlockingPathStorage.BlockingPathFrustrationThreshold = 1;
        BlockingPathStorage.BlockingPathFrustrationWindowDuration = 30.0f;
        BlockingPathStorage.BlockingPathNoLongerBlockedWindowDuration = 8.0f;
        BlockingPathStorage.BlockingPathNoLongerBlockedBurstThreshold = 2;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        EnsureOrcBlockingPathDefaultsInitialized();

        BindAssessmentToPerception(Perception.HearEnemyInRangeWhileGuiding(2000.0f).Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_ThreateningCharacter);

        BindAssessmentToPerception(Perception.HeardEnemyCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Heard_Enemy);

        BindAssessmentToPerception(Perception.HeardHostileCharacter().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Heard_Hostile);

        BindAssessmentToPerception(Perception.SeenLivingEnemyCharacter().Delay(0.5f),
            WhenGained = GameplayTag::AIEvent_Seen_Enemy);

        BindAssessmentToPerception(Perception.SeenFriendlyPlayerWithinCheeringDistance(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);
        
        BindAssessmentToPerception(Perception.JustSeenCharacterInFightingState_NonCreature(),
            WhenGained = GameplayTag::AIEvent_Seen_Combat);
        BindAssessmentToPerception(Perception.JustSeenCharacterInWarningState_NonCreature(),
            WhenGained = GameplayTag::AIEvent_Seen_Warning);

        Perception.OnHeardItemInGuildOwnedArea().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItemInOwnedArea");
        Perception.OnHeardItemInPersonallyOwnedArea().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItemInOwnedArea");

        auto BlockingPathStorage = SpawnedStorage(UAIValueSet_BlockingPath);
        Perception.OnPlayerBlockingMyPath(1000.0f).Delay(BlockingPathStorage.BlockConfirmationDelay).PerceptionGained
            .BindUFunction(this, n"HandleOrcPlayerBlockingPathFromCharacterAI");
        Log(f"[BlockPath][DR][Orc] Register OnPlayerBlockingMyPath on CharacterAI_Orc (Delay={BlockingPathStorage.BlockConfirmationDelay}s) — see Output Log, not on-screen messages");

        // Gained + Lost MUST share the same handler instance — otherwise
        // TriggeredFor never clears and Gained goes silent on re-crouch.
        FPerceptionHandler& CreepingHandler = Perception.SeenPotentiallyCreepingCharacter();
        CreepingHandler.PerceptionGained.BindUFunction(this, n"OnSeenPotentiallyCreepingCharacter");
        CreepingHandler.PerceptionLost.BindUFunction(this, n"OnLostPotentiallyCreepingCharacter");
    }

    UFUNCTION()
    private void PerceptionEvent_HeardItemInOwnedArea(const FRememberedPerception&in Perception,
                                                      const FPerceptionShortTermMemory&in Memory)
    {
        if (IsValid(Perception.Origin.CharacterState))
            return;
        
        if (Perception.EventTag.MatchesTag(GameplayTag::Perception_Character_Interaction))
            return;

        AssessEvent(GameplayTag::AIEvent_Heard_Noise_Item, Perception);
    }

    UFUNCTION()
    private void OnSeenPotentiallyCreepingCharacter(const FRememberedPerception&in Perception,
                                                    const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(CrimeProcessingSubsystem) || !IsValid(CrimeProcessingSubsystem.CreepingTuning))
            return;

        if (!CharacterState.AreaTagOfLocation.MatchesAny(CrimeProcessingSubsystem.CreepingTuning.ApplicableAreaTags))
            return;

        if (!Perception.Origin.CharacterState.IsPlayerCharacter() && !Perception.Origin.CharacterState.IsPlayerControlled())
            return;

        auto TrespassingContext = Perception.Origin.CharacterState.GetTrespassingContextFor(CharacterState);
        if (TrespassingContext.Result == ETrespassingResult::Trespassing_OnPerson_Self ||
            TrespassingContext.Result == ETrespassingResult::Trespassing_OnPerson_Friendly ||
            TrespassingContext.Result == ETrespassingResult::Trespassing_OnGuild_Self ||
            TrespassingContext.Result == ETrespassingResult::Trespassing_OnGuild_Friendly)
            return;
        
        if (TrespassingContext.Result != ETrespassingResult::NoTrespassing && !TrespassingContext.bWitnessIsGuildOwner && !TrespassingContext.bWitnessIsPersonalOwner)
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_Creeping, Perception);
    }

    // Empty by design — binding exists only so Lost dispatch clears TriggeredFor
    // on the shared handler, letting Gained refire on every re-crouch.
    UFUNCTION()
    private void OnLostPotentiallyCreepingCharacter(const FRememberedPerception&in Perception,
                                                    const FPerceptionShortTermMemory&in Memory)
    {
    }

    UFUNCTION()
    void HandleOrcPlayerBlockingPathFromCharacterAI(const FRememberedPerception&in Perception,
                                                    const FPerceptionShortTermMemory&in Memory)
    {
        EnsureOrcBlockingPathDefaultsInitialized();
        auto BlockingPathStorage = SpawnedStorage(UAIValueSet_BlockingPath);
        auto AI = Self.GetGothicAI();
        if (AI == nullptr)
            return;

        if (Self.IsInConversation())
            return;

        if (BlockingPathStorage.bPostConversationGraceActive)
        {
            if (BlockingPathStorage.PostConversationGraceStart.AgeInRealtimeSeconds < BlockingPathStorage.PostConversationGraceSeconds)
                return;
            BlockingPathStorage.bPostConversationGraceActive = false;
        }

        bool bDoingInteraction = IsValid(AI.CharacterState) && AI.CharacterState.IsDoingAnyInteraction();

        if (!Self.IsPathfollowing() && bDoingInteraction)
        {
            bool bAllowedWhileStanding = false;
            auto OrcDailyRoutine = Cast<UAIState_DailyRoutine_Orc>(AI.ScheduledDailyRoutineAIStateTemplate);
            if (IsValid(OrcDailyRoutine) && OrcDailyRoutine.OverrideAllowBlockingPathWhileStationary.IsSet())
            {
                bAllowedWhileStanding = OrcDailyRoutine.OverrideAllowBlockingPathWhileStationary.Value;
            }
            else
            {
                auto ScheduledState = Cast<UAIState_RandomInteractions>(AI.ScheduledDailyRoutineAIStateTemplate);
                bAllowedWhileStanding = IsValid(ScheduledState) && ScheduledState.bAllowBlockingPathWhileStationary;
            }

            if (!bAllowedWhileStanding)
                return;
        }
        else if (!Self.IsPathfollowing() && !bDoingInteraction)
        {
            return;
        }

        bool bAlreadyInBlockedPathFlow = AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Wait_BlockedPath) ||
                                         AI.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Warning_BlockedPath);
        bool bHasValidBlocker = Perception.Origin.Character != nullptr;
        bool bPathBlocked = bHasValidBlocker && Self.IsPathBlockedByGivenCharacter(Perception.Origin.Character, false);
        float DistToOrigin = bHasValidBlocker ? Self.GetDistanceTo(Perception.Origin.Character) : -1.0f;
        float PersonalSpaceRadius = Self.GetSimpleCollisionRadius() * BlockingPathStorage.BlockPersonalSpaceRadiusMultiplier;
        bool bWithinPersonalSpace = bHasValidBlocker && DistToOrigin <= PersonalSpaceRadius;
        bool bActuallyBlockedByPerceivedCharacter = bPathBlocked && bWithinPersonalSpace;
        float SecondsSinceLastAssess = BlockingPathStorage.bHasEmittedBlockingPathAssess ? BlockingPathStorage.LastBlockingPathAssessTime.AgeInRealtimeSeconds : -1.0f;
        bool bCooldownActive = BlockingPathStorage.bHasEmittedBlockingPathAssess && SecondsSinceLastAssess < BlockingPathStorage.BlockReassessCooldownSeconds;
        bool bCanTrackSoftSignal = !bAlreadyInBlockedPathFlow && !bCooldownActive && bHasValidBlocker;

        if (bCanTrackSoftSignal && !bActuallyBlockedByPerceivedCharacter)
            BlockingPathStorage.BlockSoftSignalCount++;
        else if (bActuallyBlockedByPerceivedCharacter || !bCanTrackSoftSignal)
            BlockingPathStorage.BlockSoftSignalCount = 0;

        bool bFallbackForceEmit = bCanTrackSoftSignal && !bActuallyBlockedByPerceivedCharacter &&
                                  BlockingPathStorage.BlockSoftSignalCount >= BlockingPathStorage.BlockSoftSignalThreshold;

        if (bAlreadyInBlockedPathFlow || bCooldownActive || (!bActuallyBlockedByPerceivedCharacter && !bFallbackForceEmit))
        {
            FString SkipReason = "";
            if (bAlreadyInBlockedPathFlow)
                SkipReason += "InFlow;";
            if (bCooldownActive)
                SkipReason += "Cooldown;";
            if (!bActuallyBlockedByPerceivedCharacter && !bFallbackForceEmit)
                SkipReason += "NoHardBlockNoFallback;";
            Log(f"[BlockPath][DR][Orc] GateSkip Reason={SkipReason} (InFlow={bAlreadyInBlockedPathFlow} Cooldown={bCooldownActive} ActuallyBlocked={bActuallyBlockedByPerceivedCharacter} PathBlocked={bPathBlocked} WithinPersonalSpace={bWithinPersonalSpace} Dist={DistToOrigin} Radius={PersonalSpaceRadius} FallbackForce={bFallbackForceEmit} SoftSignal={BlockingPathStorage.BlockSoftSignalCount}/{BlockingPathStorage.BlockSoftSignalThreshold} DoingInteraction={bDoingInteraction})");
            return;
        }

        BlockingPathStorage.bHasEmittedBlockingPathAssess = true;
        BlockingPathStorage.LastBlockingPathAssessTime = FInGameTime::Now();
        BlockingPathStorage.BlockSoftSignalCount = 0;
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
            GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bBlockingPathFrustrationIncrementedThisCycle = false;

        BlockingPathStorage.bWasPathfollowingAtBlockEmit = Self.IsPathfollowing();

        // Orc default = always escalate. Per-routine override can opt out.
        bool bAllowEscalationStationary = true;
        auto OrcDailyRoutineForEscalation = Cast<UAIState_DailyRoutine_Orc>(AI.ScheduledDailyRoutineAIStateTemplate);
        if (IsValid(OrcDailyRoutineForEscalation) && OrcDailyRoutineForEscalation.OverrideAllowBlockingPathEscalationWhileStationary.IsSet())
        {
            bAllowEscalationStationary = OrcDailyRoutineForEscalation.OverrideAllowBlockingPathEscalationWhileStationary.Value;
        }
        BlockingPathStorage.bAllowEscalationWhileStationary = bAllowEscalationStationary;

        Log(f"[BlockPath][DR][Orc] Emit AIEvent_Seen_CharacterBlockingPath (Blocker={Perception.Origin.Character} PathBlocked={bPathBlocked} Dist={DistToOrigin} Radius={PersonalSpaceRadius} WithinPersonalSpace={bWithinPersonalSpace} SoftSignalReset=0 Pathfollowing={BlockingPathStorage.bWasPathfollowingAtBlockEmit} AllowEscalationStationary={bAllowEscalationStationary} DoingInteraction={bDoingInteraction})");
        AI.AssessEvent(GameplayTag::AIEvent_Seen_CharacterBlockingPath, Perception);
    }
}

UCLASS()
class UGameplayAbility_CharacterAI_UndeadOrc : UGameplayAbility_CharacterAI_Orc
{
    default AssessmentModuleClass = UAIARM_Creature;
}