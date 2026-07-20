
UCLASS()
class UGameplayAbility_CharacterAI_Human : UGameplayAbility_CharacterAI_Gothic
{    
    // default InitialDailyRoutineClass = UDailyRoutine_Test_Stuff::StaticClass();
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable;

    default ConversationAIStateClass = UAIState_Conversation::StaticClass();
    default FoundSomeoneInMyBedAIStateClass = UAIState_FoundSomeoneInMyBed;

    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Thigh);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Inventory);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_LeanWall_Side);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_LookAround);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_SearchAround);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Pee);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_RepairBuilding);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Smalltalk);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_WashSelf_High);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PlayTune);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_CountOre);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_RoastScavenger);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_TeachTrain);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Listen);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Preach);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Dance);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_WomanDance);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_ReadBook_Shell);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PracticeMagic);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_HerbAlchemy);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PickOre);

    /// TARGET SCORING
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_PlayerBias(), 0.5f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_IgnoreUnkillableDefeatedInCombat(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_TargetForCombatExecution(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterDistance(), 10.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_CharacterTargetGroupLimits(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AlreadyTargeting(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_AttackedMe(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_DistanceToPreferredLocation(), 1.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_InsideSameTerritory(), 10.0f);
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_IgnoreFleeingOrDisengagingTarget(), 1.0f);

    /// ITEM SCORING
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_Weapon_CloseToTarget());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_TargetGroundedButUnreachable());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_TargetFlying());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_TargetInWater());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Weapon_ActualWeaponBonus());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Fists_NotWeaponBonus());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_NoThreatWeapon_NotWeaponBonus());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_Personality_WeaponPreference());
    /// Melee Weapon Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_BasePriorityBySkill());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_MeleeWeapon_PrioritizeIfBluntAndTargetFrozen());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseFists());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseWatchFightWeapon());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseSwimmingWeapon());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseClimbingWeapon());
    /// Ranged weapon scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_BasePriorityBySkill());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_RangedWeapon_PrioritizeIfTargetFarAway());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_DisableIfNoAmmunitionInInventory());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_PrioritizeIfPassiveAttackerRole());
    // default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Mlt_RangedWeapon_BonusIfTargetOutsidePreferredLocationRadius()); 
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_RangedWeapon_DisableIfInCombatEndActionsState());
    /// Spell Scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_Base());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_DisableAnySpell_TargetImmune());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeChargedSpells_EnemyFarOrImpaired());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeAreaSpells_MultipleEnemies());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PenalizeSlowProjectiles());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeComboSpells());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeDamage());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeDamageEffects());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeControl_TargetIsStronger());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeDamageSpells_WithControl_EnemyNotImpaired());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_DisableControlSpells_NotSustained_NoDamage_CharacterImpaired());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_PrioritizeKillSpells());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_DisableUnusableSpells());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_BannedSpells_Always());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_BannedSpells_AgainstPlayer());
    /// Consumable scoring
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Consumable_HealthItems());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Consumable_ManaItems());
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Consumable_DisableHealOvertimeConsumablesIfAlreadyHealing());

    /// AIStates
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_BlockedPath, UAIState_Warning_Crime_Human_BlockedPath);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Trespassing, UAIState_Warning_Crime_Human_Trespassing);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere, UAIState_Warning_Crime_Human_NotWelcomeHere);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Lockpicking, UAIState_Warning_Crime_Human_Lockpicking);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Interaction, UAIState_Warning_Crime_Human_Interaction);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Crime_Human_WeaponDrawn);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Pickpocket, UAIState_Warning_Crime_Human_Pickpocket);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Theft, UAIState_Warning_Crime_Human_Theft);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Creeping, UAIState_Warning_Crime_Human_Creeping);
    default SetAIStateClassForType(GameplayTag::AIState_Observe_Creeping, UAIState_Observe_Creeping_Human);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Disengage, UAIState_Disengage);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Human_Generic);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Fear, UAIState_Fear);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Recover, UAIState_Recovering);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_WatchFight, UAIState_WatchFight);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_CombatEndActions, UAIState_CombatEndActions_Human);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TrainingFightResult_Victory, UAIState_ClaimVictory);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TrainingFightResult_Defeat, UAIState_AcceptDefeat);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_HumanOrc);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigateAlarm, UAIState_InvestigateAlarm);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TheftPursuit, UAIState_TheftPursuit);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigatePickpocket_Heard, UAIState_InvestigatePickpocket_Heard);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptFailed, UAIState_InvestigatePickpocket_AttemptFailed);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigatePickpocket_AttemptSucceeded, UAIState_InvestigatePickpocket_AttemptSucceeded);    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_InvestigatePouch_Heard, UAIState_InvestigatePouch_Heard);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_WatchHostile, UAIState_WatchHostile);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Flee_GetGuardHelp, UAIState_FleeToGuard);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_GoGetGuard, UAIState_GoGetGuard);
    default SetAIStateClassForType(GameplayTag::AIState_MagicSleep, UAIState_MagicSleep);
    default SetAIStateClassForType(GameplayTag::AIState_Controlled, UAIState_Controlled);
    default SetAIStateClassForType(GameplayTag::AIState_Charmed, UAIState_Charmed);
    default SetAIStateClassForType(GameplayTag::AIState_Wait_BlockedPath, UAIState_WaitForBlockedPath);
    default SetAIStateClassForType(GameplayTag::AIState_Wait_DefeatedIntruder, UAIState_WaitForDefeatedIntruderToLeave);
    default SetAIStateClassForType(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter, UAIState_Wait_WaryOfNearbyPerceivedCharacter);
    default SetAIStateClassForType(GameplayTag::AIState_Wait_DemandPaymentForCrimes, UAIState_DemandPaymentForCrimes);
    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_PickUp, UAIState_InteractWithItem_PickUp);
    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_PickUpAndConsume, UAIState_InteractWithItem_PickUpAndConsume);
    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_Meatbug, UAIState_InteractWithMeatbug);
    default SetAIStateClassForType(GameplayTag::AIState_AlertCrime_Pickpocket, UAIState_AlertPickpocket);

    default AssessmentModuleClass = UAIARM_Human;
    default CrimeProcessingSubsystemClass = UCrimeProcessingSubsystem_Human;

    default DefeatedAIStateClass = UAIState_Defeated;

    UFUNCTION(BlueprintOverride)
    void ActivateAbility()
    {
        // UInteractorComponent::GetOrCreate(Self);

        // SwitchAIStateImmediately(UAIState_Example_RestartState());
        // SwitchAIStateImmediately(UAIState_Smalltalk::StaticClass(), Cast<AGothicCharacter>(AIScript::LocalPlayer));

        // SwitchAIStateImmediately(UAIState_Human_QueueForSomething::StaticClass());
        //SwitchAIStateImmediately(UDailyRoutine_Test::StaticClass());
        // SwitchAIStateImmediately(UAIState_Attack::StaticClass(), Cast<AGothicCharacter>(AIScript::LocalPlayer));
    }

    // UPreferredLocationComponent PreferredLocation { get { return UPreferredLocationComponent::Get(PersistentSelf); }}
    // UPersonalBelongingsComponent PersonalBelongings { get { return UPersonalBelongingsComponent::Get(PersistentSelf); }}

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        BindAssessmentToPerception(Perception.HearEnemyInRangeWhileGuiding(2000.0f).Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_ThreateningCharacter);
        
        BindAssessmentToPerception(Perception.HearEnemyInRangeWhileAggressiveFollowing(2000.0f).Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Sensed_ThreateningCharacter);

        BindAssessmentToPerception(Perception.HeardEnemyCharacterWithAttackOnSight().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Heard_Enemy);

        BindAssessmentToPerception(Perception.SeenLivingEnemyCharacterWithAttackOnSight().Delay(0.5f),
            WhenGained = GameplayTag::AIEvent_Seen_Enemy);

        BindAssessmentToPerception(Perception.SeenMeatbugWithinRange(250.0f), WhenGained = GameplayTag::AIEvent_Seen_Meatbug);

        // BindAssessmentToPerception(Perception.HeardPreachingCharacter(),
        //     WhenGained = GameplayTag::AIEvent_Heard_Preaching);

        BindAssessmentToPerception(Perception.SeenPreachingCharacter(),
            WhenGained = GameplayTag::AIEvent_Seen_PreachingCharacter);

        // Gained + Lost MUST share the same handler instance. Each accessor call
        // allocates a new handler; splitting the two leaves TriggeredFor stuck on
        // the Gained handler (Lost dispatch only visits handlers owning a Lost
        // delegate), and OnSeenPotentiallyCreepingCharacter goes silent on re-crouch.
        FPerceptionHandler& CreepingHandler = Perception.SeenPotentiallyCreepingCharacter();
        CreepingHandler.PerceptionGained.BindUFunction(this, n"OnSeenPotentiallyCreepingCharacter");
        CreepingHandler.PerceptionLost.BindUFunction(this, n"OnLostPotentiallyCreepingCharacter");

        Perception.SeenNPCWithinCheeringDistance().PerceptionGained.BindUFunction(this, n"OnSeenNPCWithinCheeringDistance");

        BindAssessmentToPerception(Perception.SeenNeutralPlayerWithinCheeringDistance(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_Neutral);
        
        BindAssessmentToPerception(Perception.SeenFriendlyPlayerWithinCheeringDistance(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);

        BindAssessmentToPerception(Perception.SeenProtectingPlayerWithinCheeringDistance(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);

        BindAssessmentToPerception(Perception.SeenProtectedPlayerWithinCheeringDistance_Basic(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);

        BindAssessmentToPerception(Perception.SeenProtectedPlayerWithinCheeringDistance_FromNonFriendly(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);

        BindAssessmentToPerception(Perception.SeenProtectedPlayerWithinCheeringDistance_Premium(),
            WhenGained = GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance_FriendlyOrProtected);

        BindAssessmentToPerception(Perception.JustSeenCharacterInFightingState_NonCreature().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Seen_Combat);
        BindAssessmentToPerception(Perception.JustSeenCharacterInWarningState_NonCreature().Delay(0.3f),
            WhenGained = GameplayTag::AIEvent_Seen_Warning);

        Perception.OnHeardItemInGuildOwnedArea().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItemInOwnedArea");
        Perception.OnHeardItemInPersonallyOwnedArea().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItemInOwnedArea");
        
        // BindAssessmentToPerception(Perception.OnHeardItem(),
        //     WhenGained = GameplayTag::AIEvent_Heard_Noise_Item);
        
        // Items
        if (CharacterState.HasGameplayTag(GameplayTag::CampRole_Leadership))
        {

            Perception.OnSeenValuableItem(100.0f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
        }
        else
        {
            if (CharacterState.HasGameplayTag(GameplayTag::CampRole_Workforce))
            {
                Perception.OnSeenValuableItem(5.0f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
            }
            else if (CharacterState.HasGameplayTag(GameplayTag::CampRole_Guard))
            {
                Perception.OnSeenValuableItem(20.0f).PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
            }

            Perception.OnSeenOreItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
            
            Perception.OnSeenBoozeItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenFoodItem");
            
            Perception.OnSeenHealingPotionItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
            
            if (CharacterState.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
            {
                Perception.OnSeenDrugItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenFoodItem");
            }
        }

        if (CharacterState.HasGameplayTag(GameplayTag::Skill_Mage))
        {
            Perception.OnSeenManaPotionItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
        }
    }

    UFUNCTION()
    private void PerceptionEvent_SeenValuableItem(const FRememberedPerception&in Perception,
                                                  const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_Item_Valuable, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SeenFoodItem(const FRememberedPerception&in Perception,
                                              const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_Item_Food, Perception);
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
    private void OnSeenNPCWithinCheeringDistance(const FRememberedPerception&in Perception,
                                                 const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        auto TargetCharacterState = Perception.Origin.CharacterState;        
        if (!IsValid(TargetCharacterState) || !IsValid(TargetCharacterState.Character))
            return;

        if (CharacterState.IsDead() || CharacterState.IsDefeated() || TargetCharacterState.IsDead() || TargetCharacterState.IsDefeated())
            return;

        if (TargetCharacterState.HasGameplayTag(GameplayTag::Debuff_Sleep) || TargetCharacterState.HasGameplayTag(GameplayTag::Action_Ambient_Sleep))
            return;

        if (TargetCharacterState.HasGameplayTag(GameplayTag::Character_Personality_Outcast_All))
            return;

        if (TargetCharacterState.HasGameplayTag(GameplayTag::Character_Personality_Outcast_OldCamp) && 
            CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp))
            return;

        if (TargetCharacterState.HasGameplayTag(GameplayTag::Character_Personality_Outcast_NewCamp) && 
            CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_NewCamp))
            return;

        // Target can't see self
        if (TargetCharacterState.Character.IsFacingAwayFromOtherCharacter(CharacterState.Character) && !TargetCharacterState.CanSeeCharacter(CharacterState))
            return;

        // Some education
        if (TargetCharacterState.IsSpeaking())
            return;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (CharacterState.GetDistanceTo(PlayerCharacter) > 2000.0f)
            return;
        
        Log(f"[PassBy] {CharacterState.CharacterUniqueName} to {TargetCharacterState.CharacterUniqueName}");
        AssessEvent(GameplayTag::AIEvent_Seen_CharacterWithinCheeringDistance, Perception);
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
}

UCLASS() 
class UGameplayAbility_CharacterAI_Diego : UGameplayAbility_CharacterAI_Human
{
    default AddWeightedCombatTargetScoringEntry(UAICombatTargetScoringEntry_ZombieBias(), 10000.0f);
}