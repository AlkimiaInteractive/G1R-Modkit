/** AI State to cycle through actions to be done after combat */
UCLASS()
class UAIState_CombatEndActions : UAIState_Conflict
{
    default AssessmentModuleClass = UAIARM_State_CombatEndActions;
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);
    default AIStateTag = GameplayTag::AIState_Conflict_CombatEndActions;
    default DefaultConflictType = EConflictType::None;

    UPROPERTY()
    float SearchRadius = 4000.0f;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask(); 
        
        WaitSeconds(Math::RandRange(0.1f, 0.5f));
        AI.StopFollowingActor();
        DisableStrafeMovementAndTurnToTargetMode();
        AI.WaitUntilNoLongerBlocked();
    }

    FString GetDisplayName() const override
    {
        return "CombatEndActions";
    }
}

UCLASS()
class UAIState_CombatEndActions_Creature : UAIState_CombatEndActions
{
    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        Super::DoTask();

        // EAT IF CARNIVORE / OMNIVORE
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
        WaitSeconds(3.0f);
    }
}

UCLASS()
class UAIState_CombatEndActions_Human : UAIState_CombatEndActions
{
    TSet<ERelationship> ExecuteRelationships;
    default ExecuteRelationships.Add(ERelationship::Enemy);

    TSet<ERelationship> LootRelationships;
    default LootRelationships.Add(ERelationship::Hostile);
    default LootRelationships.Add(ERelationship::Angry);

    UPROPERTY()
    AGothicCharacter CharacterToExecute;

    UPROPERTY()
    AGothicCharacterState LastCharacterStateExecuted;

    UPROPERTY()
    AGothicCharacter CharacterToLoot;

    UPROPERTY()
    AGothicCharacterState LastCharacterStateLooted;

    UPROPERTY()
    bool bExecutedSomeone = false;
    
    UPROPERTY()
    bool bLootedSomeone = false;

    /** Seconds this NPC will wait for alive personal victim to reclaim before taking items itself. */
    UPROPERTY(EditDefaultsOnly, Category = "Crime|Reclaim")
    float ReclaimYieldGraceSeconds = 8.0f;

    /** How often the yield-predicate is polled during grace window. */
    UPROPERTY(EditDefaultsOnly, Category = "Crime|Reclaim")
    float ReclaimYieldPollSeconds = 0.5f;

    /**
     * Set by the cede-with-grace logic when grace expired before the victim reclaimed.
     * GA_Human_Loot reads this to use bIgnoreAlivePersonalVictimPriority in BuildReclaimPlanForLooter.
     */
    UPROPERTY()
    bool LastBodyGraceExpired = false;

    private float TotalValueLooted = 0.0f;
    private bool bLootedWeapon = false;
    private bool bLootedOre = false;
    private TArray<AGothicCharacterState> LootedCharacters;

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        Perception.SensedWeaponLootedBySelf().PerceptionGained.BindUFunction(this, n"OnWeaponLooted");
        Perception.SensedOreLootedBySelf().PerceptionGained.BindUFunction(this, n"OnOreLooted");
    }
    
    UFUNCTION()
    private void OnWeaponLooted(const FRememberedPerception&in Perception,
                                const FPerceptionShortTermMemory&in Memory)
    {
        TotalValueLooted += Perception.Magnitude;
        bLootedWeapon = true;

        FGenericVoicelineRequestContext VoicelineContext;
        if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Rune) || Perception.EffectCauserTags.HasTag(GameplayTag::Item_Weapon_Scroll))
        {
            VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Loot_Weapon_Magic);
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Range_Melee))
        {
            VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Loot_Weapon_Melee);
        }
        else if (Perception.EffectCauserTags.HasTag(GameplayTag::Item_Range_Long))
        {
            VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Loot_Weapon_Ranged);
        }
        else
        {
            VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Loot_Weapon);
        }

        AI.CharacterState.Voiceline.SayVoicelineWithContext(GameplayTag::Sound_Voice_Reaction_Loot_Item, CharacterToLoot.CharacterState, VoicelineContext);
    }

    UFUNCTION()
    private void OnOreLooted(const FRememberedPerception&in Perception,
                             const FPerceptionShortTermMemory&in Memory)
    {
        TotalValueLooted += Perception.Magnitude;
        bLootedOre = true;

        FGenericVoicelineRequestContext VoicelineContext;
        VoicelineContext.TagsMe.AddTag(GameplayTag::VoicelineContext_Loot_Ore);

        AI.CharacterState.Voiceline.SayVoicelineWithContext(GameplayTag::Sound_Voice_Reaction_Loot_Item, CharacterToLoot.CharacterState, VoicelineContext);
    }

    void Execute()
    {
        AI.Wait(0.5f);
        CharacterToExecute = GetClosestExecutableInSearchRadius();
        if (CharacterToExecute != nullptr)
        {            
            SelectAndDrawWeapon();   
        }

        while (CharacterToExecute != nullptr)
        {
            AI.ExecuteDefeatedCharacter(CharacterToExecute).While(n"IsCharacterToExecuteDefeated");
            WaitOneTick();
            if (CharacterToExecute.IsDead())
            {
                bExecutedSomeone = true;
                LastCharacterStateExecuted = CharacterToExecute.CharacterState;
            }
            
            WaitSeconds(0.5f);
            CharacterToExecute = GetClosestExecutableInSearchRadius();
        }
    }

    void Loot()
    {
        AI.Wait(0.5f);
        CharacterToLoot = GetClosestLootableInSearchRadius(LootedCharacters);

        if (!IsValid(CharacterToLoot))
            return;
        
        AI.UndrawWeapon();
        while (CharacterToLoot != nullptr)
        {
            // Cede body to alive personal victim if they still have items to reclaim AND intend to loot.
            // After yield expires (or if no intending victim exists), looter takes everything via grace bypass.
            LastBodyGraceExpired = false;
            auto AIGothic = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
            UCrimeProcessingSubsystem CrimeSys = IsValid(AIGothic) ? AIGothic.CrimeProcessingSubsystem : nullptr;
            if (IsValid(CrimeSys) && IsValid(CharacterToLoot.CharacterState) && IsValid(AI.CharacterState))
            {
                float GraceElapsed = 0.0f;
                while (IsValid(CharacterToLoot) && !CharacterToLoot.IsDead() && CharacterToLoot.IsDefeated()
                    && CrimeSys.HasAliveNonSelfPersonalReclaimerWithOpenTheftOnBody(CharacterToLoot.CharacterState, AI.CharacterState))
                {
                    if (GraceElapsed >= ReclaimYieldGraceSeconds)
                        break;
                    WaitSeconds(ReclaimYieldPollSeconds);
                    GraceElapsed += ReclaimYieldPollSeconds;
                }
                LastBodyGraceExpired = true;
            }

            AI.LootDefeatedCharacter(CharacterToLoot).While(n"IsCharacterToLootDefeated");
            AI.WaitUntilNoLongerSpeaking();
            WaitOneTick();
            LastCharacterStateLooted = CharacterToLoot.CharacterState;
            LastBodyGraceExpired = false;

            // TODO: Check if value is enough to forgive theft
            // if (TotalValueLooted)

            // If no theft, check triggered events, say looted nothing if no loot event was triggered for character
            
            LootedCharacters.Add(LastCharacterStateLooted);
            bLootedOre = false;
            bLootedWeapon = false;
            TotalValueLooted = 0.0f;
            WaitSeconds(0.5f);
            CharacterToLoot = GetClosestLootableInSearchRadius(LootedCharacters);
        }
    }

    void Heal()
    {
        if (Self.GetHealthAttribute() >= Self.GetMaxHealthAttribute())
            return;

        AddDynamicOwnedGameplayTagToOwner(GameplayTag::AIState_Conflict_Recover);
        int ItemsConsumed = 0;

        AI.SelectBestItemActionFromInventory(FGameplayTag::Empty, FGameplayTagContainer(), true);

        while (IsValid(SelectedItemAction) && ItemsConsumed < 2 && SelectedItemAction.ActionTag.MatchesTag(GameplayTag::Action_QuickConsume))
        {
            if (!IsValid(SelectedItem) || !Self.HasItem(SelectedItem.Class))
                break;

            if (!AI.UseItem(SelectedItem.Class).WasSuccessful())
                break;

            ItemsConsumed++;

            AI.SelectBestItemActionFromInventory(FGameplayTag::Empty, FGameplayTagContainer(), true);

            WaitOneTick();
        }

        RemoveDynamicOwnedGameplayTagFromOwner(GameplayTag::AIState_Conflict_Recover);
    }


    void InsertSortedByDistanceToSelf(TArray<AGothicCharacter>& Characters, AGothicCharacter CharacterToInsert) const
    {
        if (Characters.IsEmpty())
        {
            Characters.Add(CharacterToInsert);
            return;
        }

        int MinIndex = 0;
        int MaxIndex = Characters.Num() - 1;

        while (MinIndex != MaxIndex)
        {
            int GuessIndex = Math::FloorToInt((MinIndex + MaxIndex) * 0.5f);

            if (Characters[GuessIndex].ActorLocation.Distance(Self.ActorLocation) <= CharacterToInsert.ActorLocation.Distance(Self.ActorLocation))
            {
                MinIndex = GuessIndex + 1;
            }
            else
            {
                MaxIndex = GuessIndex;
            }
        }

        Characters.Insert(CharacterToInsert, MinIndex);
    }

    void SelectAndDrawWeapon()
    {
        if (!CanEquipWeapons())
            return;

        AI.ItemActionScoringEntryManager.UpdateAvailableItems();
        AI.WaitUntilNoLongerBlocked();
        AI.SelectBestItemActionFromInventory();
        if (SelectedItem == nullptr)
            return;

        AI.DrawItem(SelectedItem);
        AI.WaitUntilNoLongerBlocked();
    }

    AGothicCharacter GetClosestExecutableInSearchRadius() const
    {
        TSet<ERelationship> Relationships;
        Relationships.Add(ERelationship::Enemy);

        TSet<ERelationshipHostility> Hostilities;
        Hostilities.Add(ERelationshipHostility::Execute);
        Hostilities.Add(ERelationshipHostility::AttackOnSight);

        return AI.GetClosestExecutableCharacterInRadiusWithRelationship(SearchRadius, Relationships, Hostilities);
    }

    AGothicCharacter GetClosestLootableInSearchRadius(TArray<AGothicCharacterState> ExcludeCharacters) const
    {
        TSet<ERelationship> Relationships;
        Relationships.Add(ERelationship::Enemy);
        Relationships.Add(ERelationship::Hostile);
        Relationships.Add(ERelationship::Angry);

        TSet<ERelationshipHostility> Hostilities;
        Hostilities.Add(ERelationshipHostility::Loot);
        Hostilities.Add(ERelationshipHostility::Execute);

        return AI.GetClosestLootableCharacterInRadiusWithRelationship(ExcludeCharacters, SearchRadius, Relationships, Hostilities);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        SetWalkSpeed(EWalkSpeed::Running);
        Super::DoTask();

        if (AI.Character.HasDrawnBow() || AI.Character.HasDrawnCrossbow())
        {
            AbilitySystem::SendGameplayEventToActor(AI.Character, GameplayTag::End_Action_Aiming, FGameplayEventData());
        }

        Execute();
        Loot();
        Heal();

        // Wait for defeated intruder to leave
        AGothicCharacter PendingIntruder = nullptr;

        for (auto OtherCharacter : AI.Self.Perception.GetAllSensedCharacters(FGameplayTagContainer(), FGameplayTagContainer()))
        {
            if (!OtherCharacter.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState))
                continue;

            if (!OtherCharacter.IsDefeated() && 
                Self.Perception.Memory.Filter()
                    .FilterByType(GameplayTag::AIEvent_Seen_Defeated)
                    .FilterOriginCharacterIs(OtherCharacter)
                    .FilterRecent(10.0f)
                    .ToArray().IsEmpty())
                continue;
            
            PendingIntruder = OtherCharacter;
            break;
        }

        // Fallback: perception may have briefly lost the intruder during defeat anim or stand-up
        // movement out of the sensed list. Reuse the just-fought opponent if still trespassing.
        float MemoryRecency = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder).DefeatedMemoryRecentSeconds;

        if (!IsValid(PendingIntruder))
        {
            AGothicCharacter Candidate = nullptr;
            if (IsValid(LastCharacterStateExecuted) && IsValid(LastCharacterStateExecuted.Character))
            {
                Candidate = LastCharacterStateExecuted.Character;
            }
            else if (IsValid(LastCharacterStateLooted) && IsValid(LastCharacterStateLooted.Character))
            {
                Candidate = LastCharacterStateLooted.Character;
            }
            else if (IsValid(CharacterOfInterest))
            {
                Candidate = CharacterOfInterest;
            }

            if (IsValid(Candidate)
                && IsValid(Candidate.CharacterState)
                && Candidate.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState)
                && (Candidate.IsDefeated()
                    || !Self.Perception.Memory.Filter()
                        .FilterByType(GameplayTag::AIEvent_Seen_Defeated)
                        .FilterOriginCharacterIs(Candidate)
                        .FilterRecent(MemoryRecency)
                        .ToArray().IsEmpty()))
            {
                PendingIntruder = Candidate;
            }
        }

        if (IsValid(PendingIntruder))
        {
            // Prime per-character ValueSet so the wait state can hold the intruder across
            // perception gaps without re-threading data through RememberedPerception.
            auto Storage = AI.SpawnedStorage(UAIValueSet_DefeatedIntruder);
            Storage.LastKnownIntruder = PendingIntruder;
            Storage.TimeLastIntruderWasSensed = FInGameTime::Now();
            Storage.TimeIntruderStoodUp = FInGameTime();
            Storage.bTrespassReactivationFired = false;
            AI.AssessEvent(GameplayTag::AIEvent_WaitForDefeatedIntruder, FRememberedPerception());
            WaitSeconds(3.0f);
            return;
        }

        AssessEndState();
        WaitSeconds(3.0f);
    }

    void AssessEndState()
    {
        AI.WaitUntilNoLongerSpeaking();

        if (bExecutedSomeone)
        {
            AssessEndState_ExecutedCharacter();
            return;
        }

        if (Context.HasTag(GameplayTag::VoicelineContext_Death))
        {
            AssessEndState_DeadCharacter();
            return;
        }

        if (Context.HasTag(GameplayTag::VoicelineContext_ForgiveThisTime))
        {
            AssessEndState_Forgive();
            return;
        }

        if (Context.HasTag(GameplayTag::VoicelineContext_ForgetFight))
        {
            AssessEndState_Forget();
            return;
        }

        AI.AssessEvent(GameplayTag::AIEvent_State_Done, FRememberedPerception());
    }

    void AssessEndState_ExecutedCharacter()
    {
        FGameplayTagContainer ContextTags;
        ContextTags.AddTag(GameplayTag::VoicelineContext_Death);

        FRememberedPerception MurderPerception;
        MurderPerception.Affected.CharacterState = LastCharacterStateExecuted;
        MurderPerception.Affected.Character = LastCharacterStateExecuted.Character;
        MurderPerception.Instigator.Character = Self;
        MurderPerception.Instigator.CharacterState = CharacterState;
        MurderPerception.Affected.Relationship = ERelationship::Enemy;
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_State_Done,FRememberedPerception(), ContextTags);
    }

    void AssessEndState_DeadCharacter()
    {
        FGameplayTagContainer ContextTags;
        ContextTags.AddTag(GameplayTag::VoicelineContext_Death);
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_State_Done, RememberedPerception, ContextTags);
    }

    void AssessEndState_Forgive()
    {
        FGameplayTagContainer ContextTags;
        ContextTags.AddTag(GameplayTag::VoicelineContext_ForgiveThisTime);
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_State_Done, RememberedPerception, ContextTags);
    }

    void AssessEndState_Forget()
    {
        FGameplayTagContainer ContextTags;
        ContextTags.AddTag(GameplayTag::VoicelineContext_ForgetFight);
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_State_Done, RememberedPerception, ContextTags);
    }

    UFUNCTION()
    bool IsCharacterToExecuteDefeated() const
    {
        if (!IsValid(CharacterToExecute))
            return false;

        if (!CharacterToExecute.IsDefeated() && !CharacterToExecute.IsDead())
            return false;

        return true;
    }

    UFUNCTION()
    bool IsCharacterToLootDefeated() const
    {
        if (!IsValid(CharacterToLoot))
            return false;

        if (!CharacterToLoot.IsDefeated() && !CharacterToLoot.IsDead())
            return false;

        return true;
    }
}