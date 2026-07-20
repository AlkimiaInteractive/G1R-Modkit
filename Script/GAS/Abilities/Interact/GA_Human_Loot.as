class UGA_Human_Loot : UGameplayAbilityLoot
{
    UPROPERTY()
    const float TimeSecondsPerEvent = 4.0f;

    UPROPERTY()
    bool bLootedSomething = false;

    UPROPERTY()
    bool bGraceExpired = false;

    // Cached between reclaim and container-loot steps so HandleReclaimContainerTheftByValue
    // can act on the same plan without rebuilding it.
    UPROPERTY()
    FStolenItemReclaimPlan CachedReclaimPlan;

    UPROPERTY()
    const float ContainerLootInterBucketSkipChance = 0.20f;

    UFUNCTION(BlueprintOverride)
    void HandleNPCLooting() 
    {
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

        bGraceExpired = false;
        if (IsValid(AvatarCharacter))
        {
            auto AIGothic = Cast<UGameplayAbility_CharacterAI_Gothic>(AvatarCharacter.AI);
            if (IsValid(AIGothic))
            {
                auto CombatEndState = Cast<UAIState_CombatEndActions_Human>(AIGothic.CurrentState);
                if (IsValid(CombatEndState))
                    bGraceExpired = CombatEndState.LastBodyGraceExpired;
            }
        }

        if (TargetCharacter.IsSpecies(GameplayTag::Species_Creature))
        {
            HandleTryLootingMeatFromCreature();
        }
        else
        {
            HandleReclaimStolenItems();
        }
    }

    UFUNCTION()
    void OnLootedNothing()
    {
        auto Self = Cast<AGothicCharacter>(AvatarActorFromActorInfo);
        if (!IsValid(Self))
            return;

        auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(Self.AI);
        if (!IsValid(AI))
            return;
        
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
        if (!IsValid(TargetCharacter))
            return;
        
        Self.CharacterState.Voiceline.SayVoiceline(GameplayTag::Sound_Voice_Reaction_Loot_Nothing, OptionalOther = TargetCharacter.CharacterState);
    }

    UFUNCTION()
    private void LootingLastStep()
    {
        if (!bLootedSomething)
        {
            OnLootedNothing();
            System::SetTimer(this, n"HandleLootingFinished", TimeSecondsPerEvent, false);
            return;
        }

        System::SetTimer(this, n"HandleLootingFinished", 0.5f, false);
    }

    UFUNCTION()
    private void HandleLootingFinished()
    {
        MontageJumpToSection(n"End");
        EndAbility();
    }

    UFUNCTION()
    private void HandleTryLootingMeatFromCreature()
    {
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
        
        int32 FoodAmount = MAX_int32;
        if(TryTakeItemOfTypeFromTarget(TargetCharacter, GameplayTag::Item_Food, FoodAmount))
        {
            System::SetTimer(this, n"HandleLootingFinished", TimeSecondsPerEvent, false);
            bLootedSomething = true;
            return;
        }

        System::SetTimer(this, n"HandleLootingFinished", 0.5f, false);
    }

    UFUNCTION()
    private void HandleReclaimStolenItems()
    {
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());

        if (!IsValid(AvatarCharacter) || !IsValid(TargetCharacter))
        {
            System::SetTimer(this, n"HandleTryLootingWeapon", 0.5f, false);
            return;
        }

        auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(AvatarCharacter.AI);
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
        {
            System::SetTimer(this, n"HandleTryLootingWeapon", 0.5f, false);
            return;
        }

        AGothicCharacterState DefeatedState = TargetCharacter.CharacterState;
        AGothicCharacterState LooterState = AvatarCharacter.CharacterState;
        if (!IsValid(DefeatedState) || !IsValid(LooterState))
        {
            System::SetTimer(this, n"HandleTryLootingWeapon", 0.5f, false);
            return;
        }

        UCrimeProcessingSubsystem CrimeSys = AI.CrimeProcessingSubsystem;

        FStolenItemReclaimPlan Plan = CrimeSys.BuildReclaimPlanForLooter(DefeatedState, LooterState, bGraceExpired);
        CachedReclaimPlan = Plan;

        CrimeSys.ForgiveCrimesByID(Plan.TheftCrimeIDsForgiveInvalidClassOnly, LooterState);

        bool bReclaimedSomething = false;
        for (auto Row : Plan.Rows)
        {
            if (Row.ItemClass.IsValid())
            {
                auto RowCDO = Cast<UItemDefinition>(Row.ItemClass.GetDefaultObject());
                if (IsValid(RowCDO) && RowCDO.HasItemSpec(GameplayTag::Item_Property_Quest))
                    continue;
            }

            if (TryTakeItemWithDefinitionFromTarget(TargetCharacter, Row.ItemClass, Row.Amount, Row.TargetSlot))
                bReclaimedSomething = true;
        }

        if (bReclaimedSomething)
            bLootedSomething = true;

        float NextDelay = bReclaimedSomething ? TimeSecondsPerEvent : 0.5f;
        System::SetTimer(this, n"HandleReclaimContainerTheftByValue", NextDelay, false);
    }

    UFUNCTION()
    private void HandleReclaimContainerTheftByValue()
    {
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());

        if (!IsValid(AvatarCharacter) || !IsValid(TargetCharacter))
        {
            FinishContainerLootStep();
            return;
        }

        AGothicCharacterState LooterState = AvatarCharacter.CharacterState;
        AGothicCharacterState DefeatedState = TargetCharacter.CharacterState;

        // Gate: only when defeated grace expired and we actually have container thefts queued.
        if (!bGraceExpired || CachedReclaimPlan.ContainerTheftCrimeIDs.Num() == 0 || CachedReclaimPlan.ContainerTheftValueCap <= 0)
        {
            FinishContainerLootStep();
            return;
        }

        auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(AvatarCharacter.AI);
        UCrimeProcessingSubsystem CrimeSys = IsValid(AI) ? AI.CrimeProcessingSubsystem : nullptr;

        TArray<TSubclassOf<UItemDefinition>> LockedToOtherVictims;
        if (IsValid(CrimeSys) && IsValid(LooterState) && IsValid(DefeatedState))
            LockedToOtherVictims = CrimeSys.CollectTheftItemClassesLockedToOtherAliveVictims(DefeatedState, LooterState, bGraceExpired);

        TArray<UItemDefinition> BucketDrug;
        TArray<UItemDefinition> BucketJunk;
        TArray<UItemDefinition> BucketFood;
        TArray<UItemDefinition> BucketDrink;
        TArray<UItemDefinition> BucketMaterial;
        TArray<UItemDefinition> BucketHerb;
        TArray<UItemDefinition> BucketPotion;
        BuildContainerLootBuckets(TargetCharacter, LockedToOtherVictims,
            BucketDrug, BucketJunk, BucketFood, BucketDrink, BucketMaterial, BucketHerb, BucketPotion);

        int32 BucketCount = BucketDrug.Num() + BucketJunk.Num() + BucketFood.Num() + BucketDrink.Num()
                          + BucketMaterial.Num() + BucketHerb.Num() + BucketPotion.Num();

        if (BucketCount == 0)
        {
            FinishContainerLootStep();
            return;
        }

        int32 RunningValue = 0;
        int32 CurrentBucket = 0;
        const int32 BucketCountMax = 7;

        while (CurrentBucket < BucketCountMax && RunningValue < CachedReclaimPlan.ContainerTheftValueCap)
        {
            if (BucketSize(CurrentBucket, BucketDrug, BucketJunk, BucketFood, BucketDrink, BucketMaterial, BucketHerb, BucketPotion) == 0)
            {
                CurrentBucket++;
                continue;
            }

            // Inter-bucket variety roll: maybe move on before exhausting current bucket.
            if (CurrentBucket + 1 < BucketCountMax
                && BucketSize(CurrentBucket + 1, BucketDrug, BucketJunk, BucketFood, BucketDrink, BucketMaterial, BucketHerb, BucketPotion) > 0
                && Math::RandRange(0.0f, 1.0f) < ContainerLootInterBucketSkipChance)
            {
                CurrentBucket++;
                continue;
            }

            UItemDefinition Item = PopBucketFront(CurrentBucket, BucketDrug, BucketJunk, BucketFood, BucketDrink, BucketMaterial, BucketHerb, BucketPotion);
            if (!IsValid(Item))
                continue;

            int32 ItemValue = Item.m_Value;
            if (ItemValue <= 0)
                ItemValue = 1;

            int32 Remaining = CachedReclaimPlan.ContainerTheftValueCap - RunningValue;
            int32 MaxByValue = Math::FloorToInt(float(Remaining) / float(ItemValue));
            if (MaxByValue <= 0)
            {
                // Single item already exceeds remaining budget: stop instead of overshooting.
                break;
            }

            // Native TryTakeItemWithDefinitionFromTarget ignores the Amount parameter for
            // stacked items (returns true/false only). Snapshot how many of this class the
            // defeated holds and call once per unit so we can charge the real value taken.
            int32 AvailableBefore = CountItemsOfClassInInventory(TargetCharacter, Item.Class);
            int32 TakeBudget = Math::Min(AvailableBefore, MaxByValue);

            if (TakeBudget <= 0)
                continue;

            int32 TakenCount = 0;
            for (int t = 0; t < TakeBudget; ++t)
            {
                int32 InvBefore = TargetCharacter.GetInventory().Items.Num();
                if (!TryTakeItemWithDefinitionFromTarget(TargetCharacter, Item.Class, 1))
                    break;
                int32 InvAfter = TargetCharacter.GetInventory().Items.Num();
                if (InvAfter >= InvBefore)
                    break;
                TakenCount++;
            }

            if (TakenCount > 0)
            {
                RunningValue += TakenCount * ItemValue;
                bLootedSomething = true;
            }
        }

        FinishContainerLootStep();
    }

    private int32 BucketSize(int32 Idx,
        const TArray<UItemDefinition>& Drug, const TArray<UItemDefinition>& Junk,
        const TArray<UItemDefinition>& Food, const TArray<UItemDefinition>& Drink,
        const TArray<UItemDefinition>& Material, const TArray<UItemDefinition>& Herb,
        const TArray<UItemDefinition>& Potion) const
    {
        switch (Idx)
        {
            case 0: return Drug.Num();
            case 1: return Junk.Num();
            case 2: return Food.Num();
            case 3: return Drink.Num();
            case 4: return Material.Num();
            case 5: return Herb.Num();
            case 6: return Potion.Num();
        }
        return 0;
    }

    private UItemDefinition PopBucketFront(int32 Idx,
        TArray<UItemDefinition>& Drug, TArray<UItemDefinition>& Junk,
        TArray<UItemDefinition>& Food, TArray<UItemDefinition>& Drink,
        TArray<UItemDefinition>& Material, TArray<UItemDefinition>& Herb,
        TArray<UItemDefinition>& Potion) const
    {
        UItemDefinition Result = nullptr;
        switch (Idx)
        {
            case 0: if (Drug.Num()     > 0) { Result = Drug[0];     Drug.RemoveAt(0); }     break;
            case 1: if (Junk.Num()     > 0) { Result = Junk[0];     Junk.RemoveAt(0); }     break;
            case 2: if (Food.Num()     > 0) { Result = Food[0];     Food.RemoveAt(0); }     break;
            case 3: if (Drink.Num()    > 0) { Result = Drink[0];    Drink.RemoveAt(0); }    break;
            case 4: if (Material.Num() > 0) { Result = Material[0]; Material.RemoveAt(0); } break;
            case 5: if (Herb.Num()     > 0) { Result = Herb[0];     Herb.RemoveAt(0); }     break;
            case 6: if (Potion.Num()   > 0) { Result = Potion[0];   Potion.RemoveAt(0); }   break;
        }
        return Result;
    }

    UFUNCTION()
    private void FinishContainerLootStep()
    {
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if (IsValid(AvatarCharacter))
        {
            auto AI = Cast<UGameplayAbility_CharacterAI_Gothic>(AvatarCharacter.AI);
            if (IsValid(AI) && IsValid(AI.CrimeProcessingSubsystem) && IsValid(AvatarCharacter.CharacterState))
            {
                AI.CrimeProcessingSubsystem.ForgiveCrimesByID(CachedReclaimPlan.TheftCrimeIDsForgiveAfterReclaimAttempt, AvatarCharacter.CharacterState);
                AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
                if (IsValid(TargetCharacter) && IsValid(TargetCharacter.CharacterState))
                    AI.CrimeProcessingSubsystem.ForgivePickpocketCrimesFullyReclaimedFromBody(TargetCharacter.CharacterState, AvatarCharacter.CharacterState);
            }
        }
        System::SetTimer(this, n"HandleTryLootingWeapon", 0.5f, false);
    }

    private void BuildContainerLootBuckets(AGothicCharacter Target,
        const TArray<TSubclassOf<UItemDefinition>>& LockedToOtherVictims,
        TArray<UItemDefinition>& OutDrug, TArray<UItemDefinition>& OutJunk,
        TArray<UItemDefinition>& OutFood, TArray<UItemDefinition>& OutDrink,
        TArray<UItemDefinition>& OutMaterial, TArray<UItemDefinition>& OutHerb,
        TArray<UItemDefinition>& OutPotion) const
    {
        for (UItemDefinition Item : Target.GetInventory().Items)
        {
            if (!IsValid(Item))
                continue;
            if (Item.HasItemSpec(GameplayTag::Item_Property_Quest))
                continue;
            if (Item.HasItemSpec(GameplayTag::Item_Property_NonDroppable))
                continue;
            if (LockedToOtherVictims.Contains(Item.Class))
                continue;
            // Handled by dedicated steps further down the pipeline.
            if (Item.ItemType.MatchesTag(GameplayTag::Item_Weapon))
                continue;
            if (Item.ItemType.MatchesTag(GameplayTag::Item_Ore))
                continue;

            if      (Item.ItemType.MatchesTag(GameplayTag::Item_Drug))     OutDrug.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Junk))     OutJunk.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Food))     OutFood.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Drink))    OutDrink.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Material)) OutMaterial.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Herb))     OutHerb.Add(Item);
            else if (Item.ItemType.MatchesTag(GameplayTag::Item_Potion))   OutPotion.Add(Item);
        }

        // Shuffle each bucket so loot order is non-deterministic per-encounter.
        ShuffleItemArray(OutDrug);
        ShuffleItemArray(OutJunk);
        ShuffleItemArray(OutFood);
        ShuffleItemArray(OutDrink);
        ShuffleItemArray(OutMaterial);
        ShuffleItemArray(OutHerb);
        ShuffleItemArray(OutPotion);
    }

    private int32 CountItemsOfClassInInventory(AGothicCharacter Target, TSubclassOf<UItemDefinition> ItemClass) const
    {
        if (!IsValid(Target) || !ItemClass.IsValid())
            return 0;
        int32 N = 0;
        for (UItemDefinition Item : Target.GetInventory().Items)
        {
            if (IsValid(Item) && Item.Class == ItemClass)
                N++;
        }
        return N;
    }

    private void ShuffleItemArray(TArray<UItemDefinition>& InOut) const
    {
        int32 N = InOut.Num();
        for (int i = N - 1; i > 0; --i)
        {
            int32 j = Math::RandRange(0, i);
            if (j != i)
            {
                UItemDefinition Tmp = InOut[i];
                InOut[i] = InOut[j];
                InOut[j] = Tmp;
            }
        }
    }

    UFUNCTION()
    private void HandleTryLootingWeapon()
    {
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        AGothicNPCState NPCState = Cast<AGothicNPCState>(AvatarCharacter.GetCharacterState());
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
        
        if (!IsValid(NPCState) || !IsValid(NPCState.AIAbility))
        {
            System::SetTimer(this, n"HandleTryLootingOre", 0.5f, false);
            return;
        }

        auto AIGothic = Cast<UGameplayAbility_CharacterAI_Gothic>(NPCState.AIAbility);
        if (!IsValid(AIGothic))
        {
            System::SetTimer(this, n"HandleTryLootingOre", 0.5f, false);
            return;
        }

        UCrimeProcessingSubsystem CrimeSys = AIGothic.CrimeProcessingSubsystem;
        TArray<TSubclassOf<UItemDefinition>> LockedToOtherVictims;
        if (IsValid(CrimeSys) && IsValid(AvatarCharacter.CharacterState) && IsValid(TargetCharacter.CharacterState))
            LockedToOtherVictims = CrimeSys.CollectTheftItemClassesLockedToOtherAliveVictims(TargetCharacter.CharacterState, AvatarCharacter.CharacterState, bGraceExpired);

        UItemDefinition BestWeapon = nullptr;
        float BestValue = 0.0f;

        // We want the AI to loot Melee weapons, Ranged weapons or Runes
        for (UItemDefinition Item : TargetCharacter.GetInventory().Items)
        {
            if (Item.HasItemSpec(GameplayTag::Item_Property_Quest))
                continue;
            
            if (Item.HasItemSpec(GameplayTag::Item_Property_NonDroppable))
                continue;

            // Will not loot nonweapons in this step
            if (!Item.ItemType.MatchesTag(GameplayTag::Item_Weapon))
                continue;

            if (Item.HasItemSpec(GameplayTag::Item_Property_NoThreat))
                continue;

            // Will not loot scrolls
            if (Item.ItemType.MatchesTag(GameplayTag::Item_Weapon_Scroll))
                continue;

            if (LockedToOtherVictims.Contains(Item.Class))
                continue;
            
            float Value = Item.m_Value;
            if (Value <= BestValue)
                continue;

            BestWeapon = Item;
            BestValue = Value;
        }

        auto PerceptionSystem = UPerceptionSystem::Get();

        if(IsValid(BestWeapon) && TryTakeItemWithDefinitionFromTarget(TargetCharacter, BestWeapon.GetClass(), 1))
        {
            FGameplayTagContainer WeaponTags;
            WeaponTags.AddTag(BestWeapon.ItemType);
            WeaponTags.AppendTags(BestWeapon.GetAllMatchingSpecs(GameplayTag::Item_Range));
            PerceptionSystem.BroadcastPerceptionEvent (GameplayTag::Perception_Character_Looted_Body_Weapon, TargetCharacter.ActorLocation, AvatarCharacter, TargetCharacter, AvatarCharacter, TargetCharacter, nullptr, WeaponTags, BestWeapon.m_Value);
            System::SetTimer(this, n"HandleTryLootingOre", TimeSecondsPerEvent, false);
            bLootedSomething = true;
            return;
        }

        System::SetTimer(this, n"HandleTryLootingOre", 0.5f, false);
    }

    UFUNCTION()
    private void HandleTryLootingOre()
    {
        AGothicCharacter AvatarCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        AGothicCharacter TargetCharacter = Cast<AGothicCharacter>(m_InteractiveActor.Get());
        auto PerceptionSystem = UPerceptionSystem::Get();        
        
        int32 OreAmount = MAX_int32;
        int32 InvBeforeOre = TargetCharacter.GetInventory().Items.Num();
        if(TryTakeItemOfTypeFromTarget(TargetCharacter, GameplayTag::Item_Ore, OreAmount))
        {
            int32 InvAfterOre = TargetCharacter.GetInventory().Items.Num();
            int32 ActualOreTaken = InvBeforeOre - InvAfterOre;
            PerceptionSystem.BroadcastPerceptionEvent (GameplayTag::Perception_Character_Looted_Body_Ore, TargetCharacter.ActorLocation, AvatarCharacter, TargetCharacter, AvatarCharacter, TargetCharacter, nullptr, FGameplayTagContainer(), ActualOreTaken);
            System::SetTimer(this, n"LootingLastStep", TimeSecondsPerEvent, false);
            bLootedSomething = true;
            return;
        }

        System::SetTimer(this, n"LootingLastStep", 0.5f, false);
    }
}
