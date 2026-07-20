enum ECrimeSeverityLevel
{
    None,
    Minimal,
    Low,
    Medium,
    High,
    Critical,
    ECrimeSeverityLevel_MAX
}

struct FCrimeSeverityStack
{
    FCrimeSeverityStack(FString _Name, FGameplayTag _CrimeTag, float _MaxSeverity)
    {
        Name = _Name;
        CrimeTags.AddTag(_CrimeTag);
        MaximumSeverity = _MaxSeverity;
    }

    FCrimeSeverityStack(FString _Name, FGameplayTagContainer _CrimeTags, float _MaxSeverity)
    {
        Name = _Name;
        CrimeTags = _CrimeTags;
        MaximumSeverity = _MaxSeverity;
    }

    const FString Name;
    const FGameplayTagContainer CrimeTags;
    const float MaximumSeverity;
}

struct FCrimeSeverityStackValues
{
    float Active = 0.0f;
    float Suppressed = 0.0f;
    float Forgiven = 0.0f;
    float MaxSeverityFound = -1.0f;
    FCrimeEntry MostSevereCrime;
}

struct FCrimeSeverityResult
{
    float NormalizedSeverity;
    FCrimeEntry MostSevereCrime;

    FCrimeSeverityResult(float Severity, FCrimeEntry MostSevereCrimeEntry)
    {
        NormalizedSeverity = Severity;
        MostSevereCrime = MostSevereCrimeEntry;
        b_IsValid = true;
    }

    private bool b_IsValid = false;
    bool IsValid()
    {
        return b_IsValid;
    }
}

struct FStolenItemReclaimPlanRow
{
    int CrimeID = 0;
    TSubclassOf<UItemDefinition> ItemClass;
    int Amount = 1;
    EInventoryTypes TargetSlot = EInventoryTypes::None;
}

struct FStolenItemReclaimPlan
{
    TArray<FStolenItemReclaimPlanRow> Rows;
    TArray<int> TheftCrimeIDsForgiveInvalidClassOnly;
    TArray<int> TheftCrimeIDsForgiveAfterReclaimAttempt;

    // Container-theft fallback. Populated only for theft crimes whose ItemDefinitionClass
    // is unknown and a designated reclaimer is the looter. The body is then looted from
    // prioritized item buckets up to ContainerTheftValueCap.
    TArray<int> ContainerTheftCrimeIDs;
    int32 ContainerTheftValueCap = 0;
}

class UAIValueSet_CrimeUpdateRecheck : UAIValueSet
{
    UPROPERTY()
    TArray<FCrimeRegisterData> CrimeNotFoundData;
}

UFUNCTION(BlueprintCallable)
int GlobalGetFineToPayForTheftCrimesByCriminal(AGothicCharacterState Witness, const AGothicCharacterState Criminal)
{
    auto CrimeProcessingSubsystem = UCrimeProcessingSubsystem::Get();

    if (!IsValid(CrimeProcessingSubsystem))
        return 0;
    
    return CrimeProcessingSubsystem.GetFineToPayForTheftCrimesByCriminal(Witness, Criminal).X;
}

UCLASS()
class UCrimeProcessingSubsystem : UScriptWorldSubsystem
{
    UPROPERTY()
    UCrimeSystemConfig CrimeSystemConfig;

    UCrimeProcessingSubsystem()
    {
        CrimeSystemConfig = UCrimeSystemConfig();
        CrimeSystemConfig.SetupContainerTheftLootValueCaps();

        TArray<FCrimeSeverityStack> CrimeSeverityStacks;

        CrimeDefinitions.Add(GameplayTag::Crime_Assault_Fists, UCrimeDefinition_Assault_Fists);
        CrimeDefinitions.Add(GameplayTag::Crime_Assault_Weapon, UCrimeDefinition_Assault_Weapon);
        CrimeDefinitions.Add(GameplayTag::Crime_DefeatedAgain, UCrimeDefinition_DefeatedAgain);
        CrimeDefinitions.Add(GameplayTag::Crime_Defeated, UCrimeDefinition_Defeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Murder, UCrimeDefinition_Murder);
        FGameplayTagContainer ViolentCrimeTags;
        ViolentCrimeTags.AddTag(GameplayTag::Crime_Assault_Fists);
        ViolentCrimeTags.AddTag(GameplayTag::Crime_Assault_Weapon);
        ViolentCrimeTags.AddTag(GameplayTag::Crime_DefeatedAgain);
        ViolentCrimeTags.AddTag(GameplayTag::Crime_Defeated);
        ViolentCrimeTags.AddTag(GameplayTag::Crime_Murder);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Violent Crimes", ViolentCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_ThreateningWeaponDrawn, UCrimeDefinition_ThreateningWeaponDrawn);
        CrimeDefinitions.Add(GameplayTag::Crime_FistsDrawn, UCrimeDefinition_FistsDrawn);
        CrimeDefinitions.Add(GameplayTag::Crime_ThreateningWeaponTooClose, UCrimeDefinition_ThreateningWeaponTooClose);
        CrimeDefinitions.Add(GameplayTag::Crime_FistsTooClose, UCrimeDefinition_FistsTooClose);
        CrimeDefinitions.Add(GameplayTag::Crime_DirectThreat_Weapon, UCrimeDefinition_DirectThreat_Weapon);
        CrimeDefinitions.Add(GameplayTag::Crime_DirectThreat_Fists, UCrimeDefinition_DirectThreat_Fists);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_WeaponDrawn, UCrimeDefinition_IgnoredWarning_WeaponDrawn);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_FistsDrawn, UCrimeDefinition_IgnoredWarning_FistsDrawn);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_DirectThreat_Weapon, UCrimeDefinition_IgnoredWarning_DirectThreat_Weapon);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_DirectThreat_Fists, UCrimeDefinition_IgnoredWarning_DirectThreat_Fists);
        FGameplayTagContainer ThreatCrimeTags;
        ThreatCrimeTags.AddTag(GameplayTag::Crime_ThreateningWeaponDrawn);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_FistsDrawn);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_ThreateningWeaponTooClose);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_FistsTooClose);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_DirectThreat_Weapon);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_DirectThreat_Fists);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_WeaponDrawn);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_FistsDrawn);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_DirectThreat_Weapon);
        ThreatCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_DirectThreat_Fists);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Threat Crimes", ThreatCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_BlockingPath, UCrimeDefinition_BlockingPath);
        FGameplayTagContainer AnnoyingCrimeTags;
        AnnoyingCrimeTags.AddTag(GameplayTag::Crime_BlockingPath);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Annoying Crimes", AnnoyingCrimeTags, 3.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Theft, UCrimeDefinition_Theft);
        CrimeDefinitions.Add(GameplayTag::Crime_Lockpicking, UCrimeDefinition_Lockpicking);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_Lockpicking, UCrimeDefinition_IgnoredWarning_Lockpicking);
        CrimeDefinitions.Add(GameplayTag::Crime_Interaction, UCrimeDefinition_Interaction);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_Interaction, UCrimeDefinition_IgnoredWarning_Interaction);
        CrimeDefinitions.Add(GameplayTag::Crime_Pickpocket_Fail, UCrimeDefinition_Pickpocket_Fail);
        CrimeDefinitions.Add(GameplayTag::Crime_Pickpocket_Success, UCrimeDefinition_Pickpocket_Success);
        FGameplayTagContainer PropertyCrimeTags;
        PropertyCrimeTags.AddTag(GameplayTag::Crime_Theft);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_Lockpicking);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_Lockpicking);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_Interaction);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_Interaction);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_Pickpocket_Fail);
        PropertyCrimeTags.AddTag(GameplayTag::Crime_Pickpocket_Success);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Property Crimes", PropertyCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_Permanent, UCrimeDefinition_DialogueRealFight_Fists_Loot_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_UntilDefeated, UCrimeDefinition_DialogueRealFight_Fists_Loot_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_RegularDuration, UCrimeDefinition_DialogueRealFight_Fists_Loot_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_Loot, UCrimeDefinition_DialogueRealFight_Fists_Loot_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_Permanent, UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_UntilDefeated, UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_RegularDuration, UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions, UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_Permanent, UCrimeDefinition_DialogueRealFight_Fists_ToDeath_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_UntilDefeated, UCrimeDefinition_DialogueRealFight_Fists_ToDeath_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_RegularDuration, UCrimeDefinition_DialogueRealFight_Fists_ToDeath_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath, UCrimeDefinition_DialogueRealFight_Fists_ToDeath_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_Permanent, UCrimeDefinition_DialogueRealFight_Weapon_Loot_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_UntilDefeated, UCrimeDefinition_DialogueRealFight_Weapon_Loot_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_RegularDuration, UCrimeDefinition_DialogueRealFight_Weapon_Loot_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot, UCrimeDefinition_DialogueRealFight_Weapon_Loot_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_Permanent, UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_UntilDefeated, UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_RegularDuration, UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions, UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_Permanent, UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_UntilDefeated, UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_RegularDuration, UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath, UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_RegularDuration);
        FGameplayTagContainer DialogueRealFightCrimeTags;
        DialogueRealFightCrimeTags.AddTag(GameplayTag::Crime_Dialogue_RealFight);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Dialogue RealFight", DialogueRealFightCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_Permanent, UCrimeDefinition_DialoguePettyFight_Fists_Loot_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Fists_Loot_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Fists_Loot_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_RegularDuration, UCrimeDefinition_DialoguePettyFight_Fists_Loot_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot, UCrimeDefinition_DialoguePettyFight_Fists_Loot_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_Permanent, UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_RegularDuration, UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions, UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_Permanent, UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_RegularDuration, UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath, UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_Permanent, UCrimeDefinition_DialoguePettyFight_Weapon_Loot_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Weapon_Loot_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Weapon_Loot_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_RegularDuration, UCrimeDefinition_DialoguePettyFight_Weapon_Loot_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot, UCrimeDefinition_DialoguePettyFight_Weapon_Loot_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_Permanent, UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_RegularDuration, UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions, UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_RegularDuration);

        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_Permanent, UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_Permanent);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_MinimalDuration, UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_MinimalDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_UntilDefeated, UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_UntilDefeated);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_RegularDuration, UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_RegularDuration);
        CrimeDefinitions.Add(GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath, UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_RegularDuration);

        FGameplayTagContainer DialoguePettyFightCrimeTags;
        DialoguePettyFightCrimeTags.AddTag(GameplayTag::Crime_Dialogue_PettyFight);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Dialogue PettyFight", DialoguePettyFightCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Trespassing_OnGuild, UCrimeDefinition_Crime_Trespassing);
        CrimeDefinitions.Add(GameplayTag::Crime_Trespassing_OnPerson, UCrimeDefinition_Crime_Trespassing);
        CrimeDefinitions.Add(GameplayTag::Crime_IgnoredWarning_Trespassing, UCrimeDefinition_IgnoredWarning_Trespassing);
        FGameplayTagContainer TrespassingCrimeTags;
        TrespassingCrimeTags.AddTag(GameplayTag::Crime_Trespassing);
        TrespassingCrimeTags.AddTag(GameplayTag::Crime_IgnoredWarning_Trespassing);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Trespassing Crimes", TrespassingCrimeTags, 10.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Creeping, UCrimeDefinition_Creeping);
        FGameplayTagContainer CreepingCrimeTags;
        CreepingCrimeTags.AddTag(GameplayTag::Crime_Creeping);
        CrimeSeverityStacks.Add(FCrimeSeverityStack("Creeping Crimes", CreepingCrimeTags, 4.0f));

        CrimeDefinitions.Add(GameplayTag::Crime_Anti_Defeated_Self, UCrimeDefinition_AntiCrime_Defeated_Self);
        CrimeDefinitions.Add(GameplayTag::Crime_Anti_Defeated_Other, UCrimeDefinition_AntiCrime_Defeated_Other);
        // FGameplayTagContainer AntiCrimeTags;
        // AntiCrimeTags.AddTag(GameplayTag::Crime_Anti);

        for (int i = 0; i < CrimeSeverityStacks.Num(); ++i)
        {
            for (FGameplayTag CrimeTag : CrimeSeverityStacks[i].CrimeTags.GameplayTags)
            {
                CrimeTagToSeverityStackIDs.Add(CrimeTag, i);
            }

            CrimeSeverityStackMap.Add(i, CrimeSeverityStacks[i]);
        }
    }

    UPROPERTY()
    const float MaxCrimeSeverity = 10.0f;

    UPROPERTY()
    const float MaxForgivenCrimeSumSeverity = 2.0f;

    UPROPERTY()
    const float MaxSuppressedCrimeSumSeverity = 4.0f;

    UPROPERTY()
    TMap<ECrimeSeverityLevel, FVector2D> SeverityThresholds;
    default SeverityThresholds.Add(ECrimeSeverityLevel::Minimal, FVector2D(0.0f, 0.01f));
    default SeverityThresholds.Add(ECrimeSeverityLevel::Low, FVector2D(0.01f, 4.0f));
    default SeverityThresholds.Add(ECrimeSeverityLevel::Medium, FVector2D(4.0f, 6.0f));
    default SeverityThresholds.Add(ECrimeSeverityLevel::High, FVector2D(6.0f, 8.0f));
    default SeverityThresholds.Add(ECrimeSeverityLevel::Critical, FVector2D(8.0f, MAX_flt));

    UPROPERTY()
    TArray<float> FineTierPrices;
    default FineTierPrices.Add(50.0f);
    default FineTierPrices.Add(200.0f);
    default FineTierPrices.Add(500.0f);
    default FineTierPrices.Add(1000.0f);
    default FineTierPrices.Add(2000.0f);

    UPROPERTY()
    float FineMultiplierPenalty = 1.2f;

    UPROPERTY()
    private float _MaxCalculatedSeverity = 11.5f;

    float GetMaxCalculatedSeverity() const property
    {
        return _MaxCalculatedSeverity;
    }
    
    UPROPERTY()
    const TMap<FGameplayTag, TSubclassOf<UCrimeDefinition>> CrimeDefinitions;

    UPROPERTY()
    const TMap<FGameplayTag, int> CrimeTagToSeverityStackIDs;

    UPROPERTY()
    const TMap<int, FCrimeSeverityStack> CrimeSeverityStackMap;

    /** Crime value modifiers to score perceived crime events */
    UPROPERTY()
    TArray<UCrimeSeverityAdditiveModifier> CrimeSeverityAdditiveModifiers;

    UPROPERTY()
    TArray<UCrimeSeverityMultiplicativeModifier> CrimeSeverityMultiplicativeModifiers;

    /** Default age-decay shape; used when a UCrimeDefinition has bOverrideAgeDecay = false. */
    UPROPERTY()
    FCrimeAgeDecayParams DefaultCrimeAgeDecayParams;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|Theft")
    UCrimeTuningConfig_Theft TheftTuning;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|Pickpocket")
    UCrimeTuningConfig_Pickpocket PickpocketTuning;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Crime|Creeping")
    UCrimeTuningConfig_Creeping CreepingTuning;


    UFUNCTION(BlueprintCallable)
    const UCrimeDefinition GetCrimeDefinition(FGameplayTag Crime) const
    {
        TSubclassOf<UCrimeDefinition> DefinitionClass;
        FGameplayTag CurrentCrimeTag = Crime;
        while (CurrentCrimeTag.IsValid())
        {
            if (CrimeDefinitions.Find(CurrentCrimeTag, DefinitionClass))
                return DefinitionClass.DefaultObject;

            CurrentCrimeTag = CurrentCrimeTag.RequestDirectParent();
        }

        return nullptr;
    }

    /** Tuning for crime tag. When adding a new crime: register instance + add branch here. */
    UFUNCTION(BlueprintCallable)
    UCrimeTuningConfig_Base GetTuningFor(FGameplayTag CrimeTag) const
    {
        if (!CrimeTag.IsValid())
            return nullptr;

        if (CrimeTag.MatchesTag(GameplayTag::Crime_Theft))
            return TheftTuning;

        if (CrimeTag.MatchesTag(GameplayTag::Crime_Pickpocket))
            return PickpocketTuning;

        if (CrimeTag.MatchesTag(GameplayTag::Crime_Creeping))
            return CreepingTuning;

        // TODO Trespassing: if (CrimeTag.MatchesTag(GameplayTag::Crime_Trespassing))  return TrespassingTuning;
        // TODO Interaction: if (CrimeTag.MatchesTag(GameplayTag::Crime_Interaction))  return InteractionTuning;
        // TODO Lockpicking: if (CrimeTag.MatchesTag(GameplayTag::Crime_Lockpicking))  return LockpickingTuning;

        return nullptr;
    }

    UFUNCTION(BlueprintCallable)
    ECrimeSeverityLevel GetCrimeSeverityLevelFromValue(float Severity)
    {
        for (auto SeverityThreshold : SeverityThresholds)
        {
            if (IsCrimeSeverityWithinThreshold(Severity, SeverityThreshold.Key))
                return SeverityThreshold.Key;
        }

        return ECrimeSeverityLevel::None;
    }

    UFUNCTION(BlueprintCallable)
    bool IsCrimeSeverityWithinThreshold(float Severity, ECrimeSeverityLevel ExpectedLevel)
    {
        if (!SeverityThresholds.Contains(ExpectedLevel))
            return false;

        auto Threshold = SeverityThresholds[ExpectedLevel];

        float AbsoluteMagnitude = Math::Abs(Severity);
        return AbsoluteMagnitude >= Threshold.X && AbsoluteMagnitude < Threshold.Y;
    }

    UFUNCTION(BlueprintCallable)
    ERelationship GetBestRelationship(TArray<ERelationship> Relationships)
    {
        ERelationship MaximumRelationship = ERelationship::Unknown;
        for (auto Relationship : Relationships)
        {
            if (Relationship <= MaximumRelationship)
                continue;

            MaximumRelationship = Relationship;
        }

        return MaximumRelationship;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipRelativeRank GetBestRelativeRank(TArray<ERelationshipRelativeRank> RelativeRanks)
    {
        ERelationshipRelativeRank MaximumRelativeRank = ERelationshipRelativeRank::Unknown;
        for (auto RelativeRank : RelativeRanks)
        {
            if (RelativeRank <= MaximumRelativeRank)
                continue;

            MaximumRelativeRank = RelativeRank;
        }

        return MaximumRelativeRank;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipHostility GetMostRelevantHostilityFromPersonalVictims(TArray<FCrimeVictimPersonHandle> VictimPersonHandles) const
    {
        ERelationshipHostility MostRelevantHostility = ERelationshipHostility::Unknown;
        for (auto VictimCharacterHandle : VictimPersonHandles)
        {
            if (MostRelevantHostility == ERelationshipHostility::Help)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::Help)
            {
                MostRelevantHostility = ERelationshipHostility::Help;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromNonFriendly)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromNonFriendly)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromNonFriendly;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild_Premium;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromCreature)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromCreature)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromCreature;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::CloseFriend)
            {
                continue;
            }
            else if (VictimCharacterHandle.HostilityTowardsPerson == ERelationshipHostility::CloseFriend)
            {
                MostRelevantHostility = ERelationshipHostility::CloseFriend;
                continue;
            }

            MostRelevantHostility = VictimCharacterHandle.HostilityTowardsPerson;
        }

        return MostRelevantHostility;
    }

    UFUNCTION(BlueprintCallable)
    ERelationship GetBestRelationshipFromPersonalVictims(TArray<FCrimeVictimPersonHandle> VictimPersonHandles) const
    {
        ERelationship MaximumRelationship = ERelationship::Unknown;
        for (auto VictimCharacterHandle : VictimPersonHandles)
        {
            if (VictimCharacterHandle.RelationshipTowardsPerson <= MaximumRelationship)
                continue;

            MaximumRelationship = VictimCharacterHandle.RelationshipTowardsPerson;
        }

        return MaximumRelationship;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipRelativeRank GetBestRelativeRankFromPersonalVictims(TArray<FCrimeVictimPersonHandle> VictimPersonHandles) const
    {
        ERelationshipRelativeRank MaximumRelativeRank = ERelationshipRelativeRank::Unknown;
        for (auto VictimCharacterHandle : VictimPersonHandles)
        {
            if (VictimCharacterHandle.RelativeRankTowardsPerson <= MaximumRelativeRank)
                continue;

            MaximumRelativeRank = VictimCharacterHandle.RelativeRankTowardsPerson;
        }

        return MaximumRelativeRank;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipHostility GetMostRelevantHostilityFromGuildVictims(TArray<FCrimeVictimGuildHandle> VictimGuildHandles) const
    {
        ERelationshipHostility MostRelevantHostility = ERelationshipHostility::Unknown;
        for (auto VictimGuildHandle : VictimGuildHandles)
        {
            if (MostRelevantHostility == ERelationshipHostility::Help)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::Help)
            {
                MostRelevantHostility = ERelationshipHostility::Help;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromNonFriendly)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromNonFriendly)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromNonFriendly;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromDifferentGuild)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild_Premium;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::ProtectFromCreature)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromCreature)
            {
                MostRelevantHostility = ERelationshipHostility::ProtectFromCreature;
                continue;
            }

            if (MostRelevantHostility == ERelationshipHostility::CloseFriend)
            {
                continue;
            }
            else if (VictimGuildHandle.HostilityTowardsGuild == ERelationshipHostility::CloseFriend)
            {
                MostRelevantHostility = ERelationshipHostility::CloseFriend;
                continue;
            }

            MostRelevantHostility = VictimGuildHandle.HostilityTowardsGuild;
        }

        return MostRelevantHostility;
    }

    UFUNCTION(BlueprintCallable)
    ERelationship GetBestRelationshipFromGuildVictims(TArray<FCrimeVictimGuildHandle> VictimGuildHandles) const
    {
        ERelationship MaximumRelationship = ERelationship::Unknown;
        for (auto VictimGuildHandle : VictimGuildHandles)
        {
            if (VictimGuildHandle.RelationshipTowardsGuild <= MaximumRelationship)
                continue;

            MaximumRelationship = VictimGuildHandle.RelationshipTowardsGuild;
        }

        return MaximumRelationship;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipRelativeRank GetBestRelativeRankFromGuildVictims(TArray<FCrimeVictimGuildHandle> VictimGuildHandles) const
    {
        ERelationshipRelativeRank MaximumRelativeRank = ERelationshipRelativeRank::Unknown;
        for (auto VictimGuildHandle : VictimGuildHandles)
        {
            if (VictimGuildHandle.RelativeRankTowardsGuild <= MaximumRelativeRank)
                continue;

            MaximumRelativeRank = VictimGuildHandle.RelativeRankTowardsGuild;
        }

        return MaximumRelativeRank;
    }

    /** When criminal is transformed (e.g. wolf), resolve to caster (e.g. Hero) so the crime flows as if the player did it as human. */
    UFUNCTION(BlueprintCallable)
    void ResolveCriminalForCrime(AGothicCharacterState CriminalCharacterState, AGothicCharacterState& OutResolvedCriminal, AGothicCharacterState& OutActualDamager) const
    {
        OutResolvedCriminal = CriminalCharacterState;
        OutActualDamager = nullptr;
        if (!IsValid(OutResolvedCriminal) || !OutResolvedCriminal.HasGameplayTag(GameplayTag::State_Transformed))
            return;
        if (!IsValid(CriminalCharacterState.Character))
            return;
        AGothicCharacter CasterCharacter = Cast<AGothicCharacter>(CriminalCharacterState.Character.GetActorInstigator());
        if (!IsValid(CasterCharacter) || !IsValid(CasterCharacter.CharacterState))
            return;
        OutActualDamager = OutResolvedCriminal;
        OutResolvedCriminal = CasterCharacter.CharacterState;
    }

    UFUNCTION(BlueprintCallable)
    TMap<int, FCrimeSeverityStackValues> CalculateCrimeSeverityStacksForCharacter(AGothicCharacterState Witness, const AGothicCharacterState Criminal, float&out AntiSumResult) const
    {
        return CalculateCrimeSeverityStacksForCharacterAtTime(
            Witness,
            Criminal,
            FInGameTime::Now().TotalSeconds,
            AntiSumResult);
    }

    UFUNCTION(BlueprintCallable)
    TMap<int, FCrimeSeverityStackValues> CalculateCrimeSeverityStacksForCharacterAtTime(
        AGothicCharacterState Witness,
        const AGothicCharacterState Criminal,
        float EvaluationTimeSeconds,
        float&out AntiSumResult) const
    {
        float AntiSum = 0.0f;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);

        TArray<FRelativeCrimeDataEntry> RelativeCrimes;
        if (!CrimeMemory.GetRelativeCrimesOfCharacter(RelativeCrimes, Witness))
        {
            AntiSumResult = 0.0f;
            return TMap<int, FCrimeSeverityStackValues>();
        }

        auto CrimesByCriminal = CrimeMemory.GetAllCrimesCommitedBy(Criminal);

        TMap<FName, FGameplayTagContainer> PersonalCrimesEvaluated;
        TMap<FGameplayTag, FGameplayTagContainer> GuildCrimesEvaluated;

        TMap<int, FCrimeSeverityStackValues> SeverityStackValues = TMap<int, FCrimeSeverityStackValues>();

        // Reevaluate all crimes
        for (int i = RelativeCrimes.Num() - 1; i >= 0; i--)
        {
            auto RelativeCrimeData = RelativeCrimes[i];

            if (!CrimesByCriminal.Contains(RelativeCrimeData.ID))
                continue;

            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrimeData.ID))
                continue;

            FCrimeEntry CrimeEntry = FCrimeEntry(GlobalCrimeData, RelativeCrimeData);

            if (IsUniqueCrimeAndAlreadyEvaluated(CrimeEntry, PersonalCrimesEvaluated, GuildCrimesEvaluated))
                continue;

            if (EvaluationTimeSeconds < CrimeEntry.TimeCommitted.TotalSeconds)
                continue;

            float CrimeAgeSeconds = EvaluationTimeSeconds - CrimeEntry.TimeCommitted.TotalSeconds;
            auto Result = EvaluateCrimeAtAge(Witness, CrimeEntry, CrimeAgeSeconds);

            for (auto PersonalVictimHandle : CrimeEntry.VictimCharacterHandles)
            {
                PersonalCrimesEvaluated.FindOrAdd(PersonalVictimHandle.VictimGlobalID).AddTag(CrimeEntry.CrimeType);
            }

            for (auto GuildVictimHandle : CrimeEntry.VictimGuildHandles)
            {
                GuildCrimesEvaluated.FindOrAdd(GuildVictimHandle.Guild).AddTag(CrimeEntry.CrimeType);
            }

            if (CrimeEntry.CrimeType.MatchesTag(GameplayTag::Crime_Anti))
            {
                AntiSum += Result;
            }
            else
            {
                int ID;
                bool bFoundID = TryGetSeverityStackIDFromCrimeTag(CrimeEntry.CrimeType, ID);
                if (!bFoundID)
                    continue;

                auto& Values = SeverityStackValues.FindOrAdd(ID, FCrimeSeverityStackValues());
                if (Values.MaxSeverityFound < Result)
                {
                    Values.MaxSeverityFound = Result;
                    Values.MostSevereCrime = CrimeEntry;
                }

                if (CrimeEntry.bIsForgiven)
                {
                    Values.Forgiven += Result;
                }
                else if (CrimeEntry.bIsSuppressed)
                {
                    Values.Suppressed += Result;
                }
                else
                {
                    Values.Active += Result;
                }
            }
        }

        AntiSumResult = AntiSum;
        return SeverityStackValues;
    }

    UFUNCTION()
    FCrimeSeverityResult GetSeverityStackNormalizedSeverity(int ID, FCrimeSeverityStackValues SeverityStackValues, float AntiSum) const
    {
        FCrimeSeverityStackValues SeverityValues = SeverityStackValues;
        FCrimeSeverityStack SeverityStackConfig;
        if (!CrimeSeverityStackMap.Find(ID, SeverityStackConfig))
            return FCrimeSeverityResult();

        float MaximumSeverity = SeverityStackConfig.MaximumSeverity;
        float Severity = Math::Min(
            GetNormalizedCrimeSeverity(SeverityValues.Active, SeverityValues.Forgiven, SeverityValues.Suppressed, AntiSum), 
            MaximumSeverity);
        
        return FCrimeSeverityResult(Severity, SeverityStackValues.MostSevereCrime);
    }

    UFUNCTION()
    FCrimeSeverityResult GetHighestNormalizedSeverityFromSeverityStackValues(TMap<int, FCrimeSeverityStackValues> SeverityStackValues, float AntiSum) const
    {
        float HighestNormalizedSeverity = -1.0f;
        FCrimeSeverityResult Result;

        for (auto Pair : SeverityStackValues)
        {
            auto SeverityResult = GetSeverityStackNormalizedSeverity(Pair.Key, Pair.Value, AntiSum);
            
            if (HighestNormalizedSeverity >= SeverityResult.NormalizedSeverity)
                continue;

            HighestNormalizedSeverity = SeverityResult.NormalizedSeverity;
            Result = SeverityResult;
        }

        return Result;
    }

    bool TryGetSeverityStackIDFromCrimeTag(FGameplayTag CrimeTag, int&out ID) const
    {
        bool bFoundID = CrimeTagToSeverityStackIDs.Find(CrimeTag, ID);
        if (bFoundID)
            return true;

        for (auto Tag : CrimeTag.GameplayTagParents.GameplayTags)
        {
            bFoundID = CrimeTagToSeverityStackIDs.Find(Tag, ID);
            if (bFoundID)
                return true;
        }

        return false;
    } 

    UFUNCTION(BlueprintCallable)
    FCrimeSeverityResult EvaluateCrimesInMemoryForCharacter(AGothicCharacterState Witness, const AGothicCharacterState Criminal) const
    {
        float AntiSum = 0.0f;
        auto SeverityStackValues = CalculateCrimeSeverityStacksForCharacter(Witness, Criminal, AntiSum);

        return GetHighestNormalizedSeverityFromSeverityStackValues(SeverityStackValues, AntiSum);
    }

    UFUNCTION(BlueprintCallable)
    FCrimeSeverityResult EvaluateCrimesInMemoryForCharacterAtTime(
        AGothicCharacterState Witness,
        const AGothicCharacterState Criminal,
        float EvaluationTimeSeconds) const
    {
        float AntiSum = 0.0f;
        auto SeverityStackValues = CalculateCrimeSeverityStacksForCharacterAtTime(
            Witness,
            Criminal,
            EvaluationTimeSeconds,
            AntiSum);

        return GetHighestNormalizedSeverityFromSeverityStackValues(SeverityStackValues, AntiSum);
    }

    UFUNCTION()
    private bool IsUniqueCrimeAndAlreadyEvaluated(FCrimeEntry CrimeEntry, TMap<FName, FGameplayTagContainer> PersonalCrimesEvaluated, TMap<FGameplayTag, FGameplayTagContainer> GuildCrimesEvaluated) const
    {
        const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(CrimeEntry.CrimeType);
        if (!IsValid(CrimeDefinition))
            return false;

        if (!CrimeDefinition.MemoryHandlingTags.HasTag(GameplayTag::Memory_Crime_SingleEntryPerVictim))
            return false;

        for (auto VictimCharacterHandle : CrimeEntry.VictimCharacterHandles)
        {
            FGameplayTagContainer CrimesAgainstCharacter;
            if (!PersonalCrimesEvaluated.Find(VictimCharacterHandle.VictimGlobalID, CrimesAgainstCharacter))
                return false;

            if (!CrimesAgainstCharacter.HasTag(CrimeDefinition.CrimeUniquenessTag))
                return false;
        }

        for (auto VictimGuildHandle : CrimeEntry.VictimGuildHandles)
        {
            FGameplayTagContainer CrimesAgainstGuild;
            if (!GuildCrimesEvaluated.Find(VictimGuildHandle.Guild, CrimesAgainstGuild))
                return false;

            if (!CrimesAgainstGuild.HasTag(CrimeDefinition.CrimeUniquenessTag))
                return false;
        }

        return true;
    }

    /** Calculates the severity for a single crime entry based on the severity modifiers */
    UFUNCTION(BlueprintCallable)
    float EvaluateCrimeEntry(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) const
    {
        // Duration / Age multiplier
        // Get a multiplier from 0.0 to 1.0 inversely proportional to the Age of the memory vs its duration; 
        // should be = to 1 when the memory is new and = to 0 when the memory is older than the duration
        float AgeTimeSeconds = FInGameTime::Now().TotalSeconds - CrimeEntry.TimeCommitted.TotalSeconds;

        return EvaluateCrime(Witness, CrimeEntry, AgeTimeSeconds);
    }

    /** Evaluates a crime at an explicit age, primarily for diagnostics and visualization. */
    UFUNCTION(BlueprintCallable)
    float EvaluateCrimeAtAge(AGothicCharacterState Witness, FCrimeEntry CrimeEntry, float AgeTimeSeconds) const
    {
        return EvaluateCrime(Witness, CrimeEntry, Math::Max(0.0f, AgeTimeSeconds));
    }

    UFUNCTION()
    private float EvaluateCrime(AGothicCharacterState Witness, FCrimeEntry CrimeEntry, float AgeTimeSeconds) const
    {
        const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(CrimeEntry.CrimeType);

        if (!IsValid(CrimeDefinition))
            return 0.0f;

        FInGameTime Duration = CrimeDefinition.GetDuration(CrimeEntry);

        float BaseSeverity = CrimeEntry.BaseSeverity;
        float Severity = BaseSeverity;

        if (AgeTimeSeconds >= Duration.TotalSeconds)
        {
            return 0.0f;
        }

        for (auto Modifier : CrimeSeverityAdditiveModifiers)
        {
            float ModifierWeight = 0.0f;

            if (!IsValid(CrimeDefinition) || !CrimeDefinition.SeverityModifierWeights.Find(Modifier.Class, ModifierWeight))
                continue;

            float AdditiveModifierValue = Modifier.AdditiveSeverity(Witness, CrimeEntry);
            if (AdditiveModifierValue == 0.0f)
                continue;

            Severity += AdditiveModifierValue * ModifierWeight;
        }

        if (BaseSeverity >= 0.0f)
        {
            Severity = Math::Max(Severity, 0.0f);
        }

        for (auto Modifier : CrimeSeverityMultiplicativeModifiers)
        {
            float MultiplierWeight = 0.0f;

            if (!IsValid(CrimeDefinition) || !CrimeDefinition.SeverityMultiplierWeights.Find(Modifier.Class, MultiplierWeight))
                continue;

            if (MultiplierWeight <= 0.0f)
                continue;

            if (Severity == 0.0f)
                break;

            float Multiplier = Modifier.SeverityMultiplier(Witness, CrimeEntry) * MultiplierWeight;

            if (Severity < 0.0f && Multiplier < 0.0f)
            {
                Multiplier *= -1.0f;
            }

            Severity *= Multiplier;
        }

        if (AgeTimeSeconds > 0.0f)
        {
            float NormalizedAge01 = AgeTimeSeconds / Duration.TotalSeconds;
            FCrimeAgeDecayParams DecayParams = CrimeDefinition.GetAgeDecayParams(this);
            float AgeMultiplier = ComputeAgeSeverityMultiplier(NormalizedAge01, DecayParams);
            Severity *= AgeMultiplier;
        }

        if (CrimeEntry.bIsForgiven)
        {
            return Math::Min(Severity, CrimeDefinition.MaximumSeverityWhenForgiven);
        }

        if (CrimeEntry.bIsSuppressed)
        {
            return Math::Min(Severity, CrimeDefinition.MaximumSeverityWhenSuppressed);
        }

        return Severity;
    }

    /** Calculates the normalized severity based on the sum of the severities of all crimes in the queue */
    UFUNCTION(BlueprintCallable)
    float GetNormalizedCrimeSeverity(float ActiveSeveritySum, float ForgivenSeveritySum, float SuppressedSeveritySum, float AntiCrimeSum) const
    {
        float EvaluatedSeveritySum = ActiveSeveritySum + Math::Min(ForgivenSeveritySum, MaxForgivenCrimeSumSeverity) + Math::Min(SuppressedSeveritySum, MaxSuppressedCrimeSumSeverity);
        return Math::Max(0.0f, (MaxCrimeSeverity + AntiCrimeSum) * (EvaluatedSeveritySum + AntiCrimeSum) / Math::Max(MaxCalculatedSeverity, 1.0f));
    }

    UFUNCTION(BlueprintCallable)
    TSet<AGothicCharacterState> GetEventAreaOwningCharacterStates(FGameplayTag AreaTag)
    {
        if (!AreaTag.IsValid())
            return TSet<AGothicCharacterState>();
                
        UOwnershipSubsystem OwnershipSubsystem = UOwnershipSubsystem::Get();

        // Affected Characters
        TSet<AGothicCharacterState> OwningCharacters = OwnershipSubsystem.GetAllPersonalOwnersOfArea(AreaTag);

        return OwningCharacters;
    }

    UFUNCTION(BlueprintCallable)
    FGameplayTagContainer GetEventAreaOwningGuilds(FGameplayTag AreaTag)
    {
        if (!AreaTag.IsValid())
            return FGameplayTagContainer();
                
        UOwnershipSubsystem OwnershipSubsystem = UOwnershipSubsystem::Get();

        // Affected Guilds
        FGameplayTagContainer OwningGuilds = OwnershipSubsystem.GetAllGuildsOwningArea(AreaTag);

        return OwningGuilds;
    }

    UFUNCTION(BlueprintCallable)
    TSet<AGothicCharacterState> GetEventInteractableOwningCharacterStates(FPerceivedInteractiveObject InteractiveObject)
    {
        // Affected Characters
        auto OwningCharacters = InteractiveObject.PersonallyOwnedBy;

        return OwningCharacters;
    }

    UFUNCTION(BlueprintCallable)
    FGameplayTagContainer GetEventInteractableOwningGuilds(FPerceivedInteractiveObject InteractiveObject)
    {
        // Affected Guilds
        FGameplayTagContainer OwningGuilds = InteractiveObject.OwnedByGuilds;

        return OwningGuilds;
    }

    UFUNCTION(BlueprintCallable)
    FCrimeRegisterData MakeNewCrimeRegisterData(FGameplayTag CrimeType, AGothicCharacterState CriminalCharacterState, AGothicCharacterState TrueCriminalCharacterState, AGothicCharacterState VictimCharacterState, FGameplayTag AreaTag = FGameplayTag::Empty, FPerceivedInteractiveObject InteractiveObject = FPerceivedInteractiveObject())
    {
        FCrimeRegisterData CrimeRegisterInfo;
        CrimeRegisterInfo.CrimeType = CrimeType;
        CrimeRegisterInfo.TimeCommitted = FInGameTime::Now();
        CrimeRegisterInfo.CriminalCharacterState = CriminalCharacterState;
        CrimeRegisterInfo.TrueCriminalCharacterState = TrueCriminalCharacterState;
        CrimeRegisterInfo.AreaTag = AreaTag;

        bool bIsPersonalCrime = false; // !VictimCharacterStates.IsEmpty();

        // Retrieve CrimeDefinition to check Affected entity source value
        const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(CrimeRegisterInfo.CrimeType);
        CrimeRegisterInfo.AffectedEntitySource = CrimeDefinition.AffectedEntitySource;

        // Initial Victim arrays
        TArray<AGothicCharacterState> VictimCharacterStates;
        FGameplayTagContainer VictimGuilds;        

        // Get victims as Affected entity source value determines
        switch (CrimeDefinition.AffectedEntitySource)
        {
            case ECrimeAffectedEntitySource::Event:
            {
                bIsPersonalCrime = VictimCharacterState != nullptr;

                if (VictimCharacterState == nullptr)
                    break;

                VictimCharacterStates.Add(VictimCharacterState);
                break;
            }
            case ECrimeAffectedEntitySource::Area:
            {
                TSet<AGothicCharacterState> OwningCharacters = GetEventAreaOwningCharacterStates(AreaTag);
                FGameplayTagContainer OwningGuilds = GetEventAreaOwningGuilds(AreaTag);

                VictimGuilds.AppendTags(OwningGuilds);               

                if (OwningCharacters.IsEmpty())
                    break;

                bIsPersonalCrime = true;

                for (auto VictimPersonalOwnerState : OwningCharacters)
                {
                    if (VictimPersonalOwnerState.IsIgnoringHomeTrespassing(AreaTag))
                        return CrimeRegisterInfo; // Return invalid register

                    VictimCharacterStates.Add(VictimPersonalOwnerState);
                }
                break;
            }
            case ECrimeAffectedEntitySource::Item:
            case ECrimeAffectedEntitySource::Interactable:
            {
                if (IsValid(InteractiveObject.InteractiveObjectDefinition))
                {
                    CrimeRegisterInfo.InteractiveObjectDefinitionClass = InteractiveObject.InteractiveObjectDefinition.Class;
                }

                if (IsValid(InteractiveObject.ItemDefinition))
                {
                    CrimeRegisterInfo.ItemDefinitionClass = InteractiveObject.ItemDefinition.Class;
                }

                auto OwningCharacters = GetEventInteractableOwningCharacterStates(InteractiveObject);
                FGameplayTagContainer OwningGuilds = GetEventInteractableOwningGuilds(InteractiveObject);

                // If item guild owner is criminal guild, no crime, crime entry is invalid
                if (CriminalCharacterState.Guild.MatchesAny(OwningGuilds))
                    return CrimeRegisterInfo;

                VictimGuilds.AppendTags(OwningGuilds);                

                if (OwningCharacters.IsEmpty())
                    break;

                bIsPersonalCrime = true;

                for (auto VictimPersonalOwnerState : OwningCharacters)
                {
                    // If item personal owner is criminal, no crime, crime entry is invalid
                    if (VictimPersonalOwnerState == CriminalCharacterState)
                        return CrimeRegisterInfo;

                    VictimCharacterStates.Add(VictimPersonalOwnerState);
                }
                break;
            }
        }

        if (VictimCharacterStates.IsEmpty() && VictimGuilds.IsEmpty())
        {
            CrimeRegisterInfo.bIsValid = false;
            return CrimeRegisterInfo;
        }

        CrimeRegisterInfo.VictimCharacterStates = VictimCharacterStates;
        CrimeRegisterInfo.VictimGuilds = VictimGuilds;

        if (!CrimeRegisterInfo.AreaTag.IsValid() && IsValid(CriminalCharacterState))
        {
            CrimeRegisterInfo.AreaTag = CriminalCharacterState.AreaTagOfLocation;
        }

        auto ConflictGroup = CriminalCharacterState.Character.GetConflictGroup();
        if (IsValid(ConflictGroup) && (
            (CrimeDefinition.bInvalidWithinPettyFight && ConflictGroup.ConflictType == EConflictType::PettyFight) ||
            (CrimeDefinition.bInvalidWithinTrainingFight && ConflictGroup.ConflictType == EConflictType::TrainingFight)))
        {
            for (auto Victim : VictimCharacterStates)
            {
                if (!IsValid(Victim) || 
                    !IsValid(Victim.Character) || 
                    !ConflictGroup.IsCharacterInvolved(Victim.Character))
                {
                    break;
                }

                CrimeRegisterInfo.bIsValid = false;
                return CrimeRegisterInfo;
            }
        }

        CrimeRegisterInfo.bIsValid = true;

        return CrimeRegisterInfo;
    }

    /** Registers a new GlobalCrimeData as well as the associated RelativeCrimeData for the Witness.
     *  Returns the Global Crime ID
     */
    UFUNCTION(BlueprintCallable)
    int RegisterCrimeFromWitness(AGothicCharacterState Witness, FCrimeRegisterData& CrimeRegistryData) const
    {
        if (!IsValid(Witness))
            return -1;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);

        int CrimeID = CrimeMemory.RegisterCrime(
            CrimeRegistryData.CriminalCharacterState, 
            CrimeRegistryData.VictimCharacterStates, 
            CrimeRegistryData.CrimeType, 
            CrimeRegistryData.AreaTag,
            CrimeRegistryData.TimeCommitted,
            CrimeRegistryData.VictimGuilds,
            false,
            CrimeRegistryData.AffectedEntitySource, 
            CrimeRegistryData.ItemDefinitionClass,
            CrimeRegistryData.InteractiveObjectDefinitionClass,
            CrimeRegistryData.TrueCriminalCharacterState
        );

        if (CrimeID == -1)
            return CrimeID;

        CrimeMemory.RegisterRelativeCrimeEntryFromParameters(
            CrimeRegistryData.CriminalCharacterState, 
            Witness, 
            CrimeRegistryData.VictimCharacterStates,
            CrimeRegistryData.VictimGuilds,
            CrimeID, 
            CrimeRegistryData.CrimeType);

        return CrimeID;
    }

    /** Registers a new GlobalCrimeData.
     *  Returns the Global Crime ID
     */
    UFUNCTION(BlueprintCallable)
    int RegisterGlobalCrimeOnly(FCrimeRegisterData& CrimeRegistryData) const
    {
        if (!IsValid(CrimeRegistryData.CriminalCharacterState))
            return -1;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(CrimeRegistryData.CriminalCharacterState);

        return CrimeMemory.RegisterCrime(
            CrimeRegistryData.CriminalCharacterState, 
            CrimeRegistryData.VictimCharacterStates, 
            CrimeRegistryData.CrimeType, 
            CrimeRegistryData.AreaTag,
            CrimeRegistryData.TimeCommitted,
            CrimeRegistryData.VictimGuilds,
            false,
            CrimeRegistryData.AffectedEntitySource, 
            CrimeRegistryData.ItemDefinitionClass,
            CrimeRegistryData.InteractiveObjectDefinitionClass,
            CrimeRegistryData.TrueCriminalCharacterState
        );
    }

    // Suppress
    UFUNCTION(BlueprintCallable)
    void SuppressWitnessRelativeCrimes(AGothicCharacterState Witness, AGothicCharacterState Criminal = nullptr, FGameplayTag CrimeType = FGameplayTag::Empty, bool bAnyCriminal = false, bool bLatestOnly = false)
    {
        if (!IsValid(Witness))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);
        if (!IsValid(CrimeMemory))
            return;

        TArray<FRelativeCrimeDataEntry> RelativeCrimes;
        if (!CrimeMemory.GetRelativeCrimesOfCharacter(RelativeCrimes, Witness))
            return;

        TSet<int> CrimesToSuppress = TSet<int>();
        for (auto RelativeCrimeData : RelativeCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrimeData.ID))
                continue;

            const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(GlobalCrimeData.CrimeType);
            if (!IsValid(CrimeDefinition))
                continue;
            
            if (!CrimeDefinition.bIsSuppressable)
                continue;

            if (CrimeType.IsValid() && !GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            if (IsValid(Criminal) && GlobalCrimeData.CriminalGlobalID != Criminal.CharacterGlobalId)
                continue;

            if (!bAnyCriminal && !IsValid(Criminal) && !GlobalCrimeData.CriminalGlobalID.IsNone())
                continue;
            
            CrimesToSuppress.Add(RelativeCrimeData.ID);

            if (bLatestOnly)
                break;
        }

        for (int CrimeID : CrimesToSuppress)
        {
            CrimeMemory.SuppressRelativeCrime(CrimeID, Witness);
        }
    }

    // Forgive
    UFUNCTION(BlueprintCallable)
    void ForgiveCrimesRelevantToWitness(AGothicCharacterState Witness, AGothicCharacterState Criminal, FGameplayTag CrimeType = FGameplayTag::Empty, bool bLatestOnly = false, bool bSkipTheftAndPickpocketSuccessForLootReclaim = false)
    {
        if (!IsValid(Witness))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);

        TArray<int> GlobalCrimes;

        if (IsValid(Criminal))
        {
            GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(Criminal);
        }
        else
        {
            GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBefore(FInGameTime::Now());
        }

        TSet<int> CrimesToForgive = TSet<int>();
        for (auto CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            // if (CrimeType.MatchesTag(GameplayTag::Crime_Anti))
            //     continue;

            if (bSkipTheftAndPickpocketSuccessForLootReclaim
                && (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Theft)
                    || GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success)))
                continue;

            if (CrimeType.IsValid() && !GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(GlobalCrimeData.CrimeType);
            if (!IsValid(CrimeDefinition))
                continue;

            if (!CrimeDefinition.bIsForgivable)
                continue;
            
            if (!CrimeDefinition.bIsForgivableWithoutKnowledge && !CrimeMemory.CharacterHasRelativeCrime(Witness, GlobalCrimeData.ID))
                continue;

            FRelativeCrimeDataEntry RelativeCrimeData;
            if (!CrimeMemory.GetRelativeCrime(RelativeCrimeData, GlobalCrimeData.ID, Witness))
            {
                RelativeCrimeData = CrimeMemory.ConvertCrimeToRelativeMemoryWithoutRemembering(Witness, CrimeID);
            }
            
            FCrimeEntry CrimeEntry = FCrimeEntry(GlobalCrimeData, RelativeCrimeData);
            float Severity = EvaluateCrimeEntry(Witness, CrimeEntry);
            
            if (Severity <= 0.0f)
                continue;

            CrimesToForgive.Add(CrimeID);

            if (bLatestOnly)
                break;
        }

        for (int CrimeID : CrimesToForgive)
        {
            CrimeMemory.ForgiveCrime(CrimeID);
        }
    }

    AGothicCharacterState GetDesignatedTheftPersonalReclaimer(FGlobalCrimeDataEntry& GlobalCrimeData, AGothicCharacterState LooterFallback) const
    {
        for (auto VictimGlobalID : GlobalCrimeData.VictimGlobalIDs)
        {
            AGothicCharacterState VictimState = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
            if (IsValid(VictimState) && !VictimState.IsDead() && !VictimState.IsDefeated())
                return VictimState;
        }
        return LooterFallback;
    }

    /** VictimGlobalIDs on crime may resolve to a different CharacterGlobalId than the CharacterState that actually loots (spawnpoint vs debug tool, etc.). Same CharacterUniqueName => same logical victim for reclaim. */
    bool PersonalVictimStateMatchesLooter(AGothicCharacterState VictimOrReclaimer, AGothicCharacterState Looter)
    {
        if (!IsValid(Looter) || !IsValid(VictimOrReclaimer))
            return false;
        if (VictimOrReclaimer == Looter)
            return true;
        return VictimOrReclaimer.CharacterUniqueName == Looter.CharacterUniqueName;
    }

    bool PickpocketCrimeHasReclaimableStacksLeftOnBody(AGothicCharacterState DefeatedCriminal, int CrimeID, UCrimeMemorySubsystem CrimeMemory) const
    {
        if (!IsValid(DefeatedCriminal) || !IsValid(CrimeMemory))
            return false;

        FGlobalCrimeDataEntry GlobalCrimeData;
        if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
            return false;

        float CrimeT = GlobalCrimeData.TimeCommitted.TotalSeconds;
        const float PickpocketEvtBeforeCrimeSec = 45.0f;
        const float PickpocketEvtAfterCrimeSec = 15.0f;

        for (auto VictimGlobalID : GlobalCrimeData.VictimGlobalIDs)
        {
            AGothicCharacterState Victim = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
            if (!IsValid(Victim))
                continue;

            TArray<FMemorizedEvent> PickpocketNoTime = Victim.LongTermMemory
                .Filter()
                .WithTag(GameplayTag::Perception_ItemRemovedByPickpocket)
                .CausedBy(DefeatedCriminal.CharacterGlobalId)
                .Affecting(Victim.CharacterGlobalId)
                .Array;

            for (auto Evt : PickpocketNoTime)
            {
                float EvT = Evt.Time.TotalSeconds;
                if (EvT < CrimeT - PickpocketEvtBeforeCrimeSec || EvT > CrimeT + PickpocketEvtAfterCrimeSec)
                    continue;

                auto ResolvedClass = Evt.OptionalClass1.Get();
                if (!IsValid(ResolvedClass))
                    continue;

                auto ItemDefCDO = Cast<UItemDefinition>(ResolvedClass.GetDefaultObject());
                if (!IsValid(ItemDefCDO))
                    continue;

                if (ItemDefCDO.IsA(UItMi_Orenugget))
                    continue;

                int Amount = Math::FloorToInt(Evt.Magnitude);
                if (Amount <= 0)
                    continue;

                auto ItemClass = ItemDefCDO.Class;
                if (DefeatedCriminal.Inventory.CountItemsOfClass(ItemClass) > 0)
                    return true;
            }
        }

        return false;
    }

    UFUNCTION(BlueprintCallable)
    void ForgiveCrimesByID(TArray<int> CrimeIDs, AGothicCharacterState CrimeMemoryAnchor)
    {
        if (!IsValid(CrimeMemoryAnchor))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(CrimeMemoryAnchor);
        if (!IsValid(CrimeMemory))
            return;

        for (int CrimeID : CrimeIDs)
        {
            CrimeMemory.ForgiveCrime(CrimeID);
        }
    }

    /** True if VictimState carries an active LootCharacter modifier targeting Criminal (i.e. queued to loot). */
    bool VictimIntendsToLootCriminal(AGothicCharacterState VictimState, AGothicCharacterState Criminal)
    {
        if (!IsValid(VictimState) || !IsValid(Criminal))
            return false;
        for (auto Modifier : VictimState.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_LootCharacter::StaticClass()))
                continue;
            auto LootMod = Cast<UActivePersonalRelationshipModifier_LootCharacter>(Modifier);
            if (IsValid(LootMod) && LootMod.TargetCharacter == Criminal)
                return true;
        }
        return false;
    }

    /**
     * Returns true if body (DefeatedCriminal) has at least one unforgiven Theft or
     * Pickpocket_Success crime whose designated personal reclaimer is alive, not
     * defeated, logically != Looter, still has reclaimable stacks on the body,
     * AND that reclaimer actually intends to loot (carries LootCharacter modifier).
     * Used by UAIState_CombatEndActions_Human::Loot() to defer looting to the victim.
     */
    bool HasAliveNonSelfPersonalReclaimerWithOpenTheftOnBody(AGothicCharacterState DefeatedCriminal, AGothicCharacterState Looter)
    {
        if (!IsValid(DefeatedCriminal) || !IsValid(Looter))
            return false;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Looter);
        if (!IsValid(CrimeMemory))
            return false;

        TArray<int> GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(DefeatedCriminal);

        for (int CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (GlobalCrimeData.bIsForgiven)
                continue;

            if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Theft))
            {
                AGothicCharacterState Designated = GetDesignatedTheftPersonalReclaimer(GlobalCrimeData, Looter);
                if (!IsValid(Designated) || Designated.IsDead() || Designated.IsDefeated())
                    continue;
                if (PersonalVictimStateMatchesLooter(Designated, Looter))
                    continue;
                if (!GlobalCrimeData.ItemDefinitionClass.IsValid())
                    continue;
                if (DefeatedCriminal.Inventory.CountItemsOfClass(GlobalCrimeData.ItemDefinitionClass) <= 0)
                    continue;
                if (!VictimIntendsToLootCriminal(Designated, DefeatedCriminal))
                    continue;
                return true;
            }
            else if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
            {
                for (auto VictimGlobalID : GlobalCrimeData.VictimGlobalIDs)
                {
                    AGothicCharacterState Victim = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
                    if (!IsValid(Victim) || Victim.IsDead() || Victim.IsDefeated())
                        continue;
                    if (PersonalVictimStateMatchesLooter(Victim, Looter))
                        continue;
                    if (!PickpocketCrimeHasReclaimableStacksLeftOnBody(DefeatedCriminal, CrimeID, CrimeMemory))
                        continue;
                    if (!VictimIntendsToLootCriminal(Victim, DefeatedCriminal))
                        continue;
                    return true;
                }
            }
        }

        return false;
    }

    /** Quest items must never be reclaimed. Crime is still resolved by the caller. */
    bool IsQuestItemClass(TSubclassOf<UItemDefinition> ItemClass) const
    {
        if (!ItemClass.IsValid())
            return false;
        auto CDO = Cast<UItemDefinition>(ItemClass.GetDefaultObject());
        return IsValid(CDO) && CDO.HasItemSpec(GameplayTag::Item_Property_Quest);
    }

    /**
     * Builds the reclaim plan for this Looter.
     * bIgnoreAlivePersonalVictimPriority: when true (grace expired), the looter
     * takes theft-reclaim items even if an alive personal victim hasn't collected
     * them yet. Pickpocket Pouch routing is unaffected.
     */
    FStolenItemReclaimPlan BuildReclaimPlanForLooter(AGothicCharacterState DefeatedCriminal, AGothicCharacterState Looter, bool bIgnoreAlivePersonalVictimPriority = false)
    {
        FStolenItemReclaimPlan Plan;

        if (!IsValid(DefeatedCriminal) || !IsValid(Looter))
            return Plan;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Looter);
        if (!IsValid(CrimeMemory))
            return Plan;

        TArray<int> GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(DefeatedCriminal);
        const float PickpocketEvtBeforeCrimeSec = 45.0f;
        const float PickpocketEvtAfterCrimeSec = 15.0f;

        for (int CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (GlobalCrimeData.bIsForgiven)
                continue;

            if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Theft))
            {
                AGothicCharacterState Designated = GetDesignatedTheftPersonalReclaimer(GlobalCrimeData, Looter);
                bool bLogicalVictimEq = PersonalVictimStateMatchesLooter(Designated, Looter);
                if (!bLogicalVictimEq && !bIgnoreAlivePersonalVictimPriority)
                    continue;

                auto ItemClass = GlobalCrimeData.ItemDefinitionClass;
                if (!ItemClass.IsValid())
                {
                    // Container-source thefts (chest/crate) carry no per-item class because
                    // the native broadcast aggregates the loot session. Route them to the
                    // value-based fallback loot path when this looter is the designated reclaimer
                    bool bHasContainerSource = IsValid(GlobalCrimeData.InteractiveObjectDefinitionClass);
                    if (bHasContainerSource && bIgnoreAlivePersonalVictimPriority)
                    {
                        Plan.ContainerTheftCrimeIDs.Add(CrimeID);
                        Plan.TheftCrimeIDsForgiveAfterReclaimAttempt.Add(CrimeID);
                        if (Plan.ContainerTheftValueCap <= 0 && IsValid(CrimeSystemConfig))
                            Plan.ContainerTheftValueCap = CrimeSystemConfig.GetContainerTheftLootValueCapForGuild(Looter.Guild);
                        continue;
                    }

                    Plan.TheftCrimeIDsForgiveInvalidClassOnly.Add(CrimeID);
                    continue;
                }

                // Quest items must never be reclaimed; leave on body but resolve the crime.
                if (IsQuestItemClass(ItemClass))
                {
                    Plan.TheftCrimeIDsForgiveAfterReclaimAttempt.Add(CrimeID);
                    continue;
                }

                FStolenItemReclaimPlanRow Row;
                Row.CrimeID = CrimeID;
                Row.ItemClass = ItemClass;
                Row.Amount = 1;
                Row.TargetSlot = EInventoryTypes::None;
                Plan.Rows.Add(Row);
                Plan.TheftCrimeIDsForgiveAfterReclaimAttempt.Add(CrimeID);
            }
            else if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
            {
                float CrimeT = GlobalCrimeData.TimeCommitted.TotalSeconds;

                for (auto VictimGlobalID : GlobalCrimeData.VictimGlobalIDs)
                {
                    AGothicCharacterState Victim = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
                    if (!IsValid(Victim))
                        continue;

                    AGothicCharacterState StackReclaimer = Looter;
                    if (!Victim.IsDead() && !Victim.IsDefeated())
                        StackReclaimer = Victim;

                    if (!PersonalVictimStateMatchesLooter(StackReclaimer, Looter))
                        continue;

                    TArray<FMemorizedEvent> PickpocketNoTime = Victim.LongTermMemory
                        .Filter()
                        .WithTag(GameplayTag::Perception_ItemRemovedByPickpocket)
                        .CausedBy(DefeatedCriminal.CharacterGlobalId)
                        .Affecting(Victim.CharacterGlobalId)
                        .Array;

                    for (auto Evt : PickpocketNoTime)
                    {
                        float EvT = Evt.Time.TotalSeconds;
                        if (EvT < CrimeT - PickpocketEvtBeforeCrimeSec || EvT > CrimeT + PickpocketEvtAfterCrimeSec)
                            continue;

                        auto ResolvedClass = Evt.OptionalClass1.Get();
                        if (!IsValid(ResolvedClass))
                            continue;

                        auto ItemDefCDO = Cast<UItemDefinition>(ResolvedClass.GetDefaultObject());
                        if (!IsValid(ItemDefCDO))
                            continue;

                        if (ItemDefCDO.IsA(UItMi_Orenugget))
                            continue;

                        // Quest items must never be reclaimed.
                        if (ItemDefCDO.HasItemSpec(GameplayTag::Item_Property_Quest))
                            continue;

                        int Amount = Math::FloorToInt(Evt.Magnitude);
                        if (Amount <= 0)
                            continue;

                        FStolenItemReclaimPlanRow Row;
                        Row.CrimeID = CrimeID;
                        Row.ItemClass = ItemDefCDO.Class;
                        Row.Amount = Amount;
                        Row.TargetSlot = EInventoryTypes::Pouch;
                        Plan.Rows.Add(Row);
                    }
                }
            }
        }

        return Plan;
    }

    /**
     * Returns item classes that are reserved for alive personal victims and should
     * not be looted by this Looter's generic weapon/ore pass.
     */
    TArray<TSubclassOf<UItemDefinition>> CollectTheftItemClassesLockedToOtherAliveVictims(AGothicCharacterState DefeatedCriminal, AGothicCharacterState Looter, bool bIgnoreAliveVictimLock = false)
    {
        TArray<TSubclassOf<UItemDefinition>> Locked;
        if (bIgnoreAliveVictimLock)
            return Locked;

        if (!IsValid(DefeatedCriminal) || !IsValid(Looter))
            return Locked;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Looter);
        if (!IsValid(CrimeMemory))
            return Locked;

        TArray<int> GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(DefeatedCriminal);
        const float PickpocketEvtBeforeCrimeSec = 45.0f;
        const float PickpocketEvtAfterCrimeSec = 15.0f;

        for (int CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (GlobalCrimeData.bIsForgiven)
                continue;

            if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Theft))
            {
                AGothicCharacterState Designated = GetDesignatedTheftPersonalReclaimer(GlobalCrimeData, Looter);
                if (!PersonalVictimStateMatchesLooter(Designated, Looter))
                {
                    auto ItemClass = GlobalCrimeData.ItemDefinitionClass;
                    if (ItemClass.IsValid() && !Locked.Contains(ItemClass))
                        Locked.Add(ItemClass);
                }
            }
            else if (GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
            {
                float CrimeT = GlobalCrimeData.TimeCommitted.TotalSeconds;

                for (auto VictimGlobalID : GlobalCrimeData.VictimGlobalIDs)
                {
                    AGothicCharacterState Victim = AGothicCharacterState::FindByGlobalId(VictimGlobalID);
                    if (!IsValid(Victim))
                        continue;

                    AGothicCharacterState StackReclaimer = Looter;
                    if (!Victim.IsDead() && !Victim.IsDefeated())
                        StackReclaimer = Victim;

                    if (PersonalVictimStateMatchesLooter(StackReclaimer, Looter))
                        continue;

                    TArray<FMemorizedEvent> PickpocketNoTime = Victim.LongTermMemory
                        .Filter()
                        .WithTag(GameplayTag::Perception_ItemRemovedByPickpocket)
                        .CausedBy(DefeatedCriminal.CharacterGlobalId)
                        .Affecting(Victim.CharacterGlobalId)
                        .Array;

                    for (auto Evt : PickpocketNoTime)
                    {
                        float EvT = Evt.Time.TotalSeconds;
                        if (EvT < CrimeT - PickpocketEvtBeforeCrimeSec || EvT > CrimeT + PickpocketEvtAfterCrimeSec)
                            continue;

                        auto ResolvedClass = Evt.OptionalClass1.Get();
                        if (!IsValid(ResolvedClass))
                            continue;

                        auto ItemDefCDO = Cast<UItemDefinition>(ResolvedClass.GetDefaultObject());
                        if (!IsValid(ItemDefCDO))
                            continue;

                        if (ItemDefCDO.IsA(UItMi_Orenugget))
                            continue;

                        int Amount = Math::FloorToInt(Evt.Magnitude);
                        if (Amount <= 0)
                            continue;

                        auto Cls = ItemDefCDO.Class;
                        if (!Locked.Contains(Cls))
                            Locked.Add(Cls);
                    }
                }
            }
        }

        return Locked;
    }

    void ForgivePickpocketCrimesFullyReclaimedFromBody(AGothicCharacterState DefeatedCriminal, AGothicCharacterState CrimeMemoryAnchor)
    {
        if (!IsValid(DefeatedCriminal) || !IsValid(CrimeMemoryAnchor))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(CrimeMemoryAnchor);
        if (!IsValid(CrimeMemory))
            return;

        TArray<int> GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(DefeatedCriminal);
        for (int CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (GlobalCrimeData.bIsForgiven)
                continue;

            if (!GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
                continue;

            if (!PickpocketCrimeHasReclaimableStacksLeftOnBody(DefeatedCriminal, CrimeID, CrimeMemory))
            {
                CrimeMemory.ForgiveCrime(CrimeID);
            }
        }
    }

    // Forget
    UFUNCTION(BlueprintCallable)
    void ForgetCrimes(AGothicCharacterState Criminal, FGameplayTag CrimeType = FGameplayTag::Empty, bool bLatestOnly = false)
    {
        if (!IsValid(Criminal))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Criminal);

        auto GlobalCrimes = CrimeMemory.GetAllCrimesCommitedBy(Criminal);
        TSet<int> CrimesToForget = TSet<int>();
        for (auto CrimeID : GlobalCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (CrimeType.IsValid() && !GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            CrimesToForget.Add(CrimeID);

            if (bLatestOnly)
                break;
        }

        for (int CrimeID : CrimesToForget)
        {
            CrimeMemory.RemoveCrime(CrimeID);
        }
    }

    // Synchronize from source
    UFUNCTION(BlueprintCallable)
    void SynchronizeRelativeCrimesFromSource(AGothicCharacterState Witness, AGothicCharacterState SourceCharacterState)
    {
        if (!IsValid(Witness))
            return;

        if (SourceCharacterState.HasGameplayTag(GameplayTag::Memory_Crime_Character_NoSynchronizing) ||
            Witness.HasGameplayTag(GameplayTag::Memory_Crime_Character_NoSynchronizing))
            return;

        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);

        TArray<FRelativeCrimeDataEntry> SourceRelativeCrimes;
        if (!CrimeMemory.GetRelativeCrimesOfCharacter(SourceRelativeCrimes, SourceCharacterState))
            return;
        
        for (auto RelativeCrimeData : SourceRelativeCrimes)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrimeData.ID))
                continue;

            const UCrimeDefinition CrimeDefinition = GetCrimeDefinition(GlobalCrimeData.CrimeType);
            if (CrimeDefinition.MemoryHandlingTags.HasTag(GameplayTag::Memory_Crime_NoSyncronizing_BlockEverything))
                continue;
            
            // TODO: Temporary change to test if mud is passing memories during combat
            auto Criminal = AGothicCharacterState::FindByGlobalId(GlobalCrimeData.CriminalGlobalID);
            if (!IsValid(Criminal))
                continue;

            ERelationship CurrentSourceRelationshipTowardsCriminal = SourceCharacterState.GetRelationshipTowards(Criminal);
            ERelationship PastSourceRelationshipTowardsCriminal = RelativeCrimeData.RelationshipTowardsCriminal;

            bool bSourceFriendlyToVictim = false;
            for (auto Handle : RelativeCrimeData.VictimCharacterHandles)
            {
                ERelationship PastSourceRelationshipTowardsVictim = Handle.RelationshipTowardsPerson;
                if (PastSourceRelationshipTowardsVictim == ERelationship::Friend)
                {
                    bSourceFriendlyToVictim = true;
                    break;
                }
            }

            if (CurrentSourceRelationshipTowardsCriminal != ERelationship::Enemy && 
                CurrentSourceRelationshipTowardsCriminal != ERelationship::Angry &&
                PastSourceRelationshipTowardsCriminal != ERelationship::Enemy && 
                PastSourceRelationshipTowardsCriminal != ERelationship::Angry &&
                PastSourceRelationshipTowardsCriminal != ERelationship::Neutral && 
                !bSourceFriendlyToVictim)
                continue;
                

            if (CrimeMemory.CharacterHasRelativeCrime(Witness, RelativeCrimeData.ID))
                continue;

            CrimeMemory.CreateRelativeMemoriesToCrime(Witness, RelativeCrimeData.ID, ERelativeCrimeOrigin::ConflictSync);
        }
    }

    // Get fine for current theft crimes by criminal characterstate - returns Vector2D where X is fine value and Y is crime count
    UFUNCTION(BlueprintCallable)
    FIntVector2 GetFineToPayForTheftCrimesByCriminal(AGothicCharacterState Witness, const AGothicCharacterState Criminal)
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);
        if (!IsValid(CrimeMemory))
            return FIntVector2(0, 0);

        float TotalStolenValue = 0;
        int CrimeCount = 0;

        TArray<FRelativeCrimeDataEntry> RelativeCrimes;
        TArray<int> GlobalCrimeIDsByCriminal = CrimeMemory.GetAllCrimesCommitedBy(Criminal);
        CrimeMemory.GetRelativeCrimesOfCharacter(RelativeCrimes, Witness);

        for (auto RelativeCrimeData : RelativeCrimes)
        {
            if (!GlobalCrimeIDsByCriminal.Contains(RelativeCrimeData.ID))
                continue;

            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrimeData.ID))
                continue;

            auto CrimeDefinition = GetCrimeDefinition(GlobalCrimeData.CrimeType);
            if (!IsValid(CrimeDefinition))
                continue;

            if (!CrimeDefinition.bIsForgivable || !CrimeDefinition.bIsForgivableWithoutKnowledge)
                continue;

            if (!GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Theft) && 
                !GlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success))
                continue;

            auto ItemDefinition = GlobalCrimeData.ItemDefinitionClass.GetDefaultObject();
            if (!IsValid(ItemDefinition))
                continue;

            TotalStolenValue += ItemDefinition.m_Value;
            CrimeCount++;
        }

        TotalStolenValue *= FineMultiplierPenalty;

        for (auto Tier : FineTierPrices)
        {
            if (TotalStolenValue > Tier)
                continue;

            return FIntVector2(Math::FloorToInt(Tier), CrimeCount);
        }

        return FIntVector2(Math::FloorToInt(FineTierPrices.Last()), CrimeCount);
    }

    void EndContinuousCrime(AGothicCharacterState Criminal, FGameplayTag CrimeType)
    {
        auto CrimeDefinition = GetCrimeDefinition(CrimeType);
        if (!IsValid(CrimeDefinition))
            return;

        if (!CrimeDefinition.bAutoForgiveOnEnd || CrimeDefinition.DurationType != ECrimeDurationType::Continuous)
            return;
        
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Criminal);
        if (!IsValid(CrimeMemory))
            return;

        TArray<int> GlobalCrimeIDsByCriminal = CrimeMemory.GetAllCrimesCommitedBy(Criminal);

        for (auto CrimeID : GlobalCrimeIDsByCriminal)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (CrimeType.IsValid() && !GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            CrimeMemory.ForgiveCrime(CrimeID);
                break;
        }
    }

    void EndContinuousTrespassingCrime(AGothicCharacterState Criminal, FGameplayTag CrimeType, FGameplayTag AreaTag)
    {
        auto CrimeDefinition = GetCrimeDefinition(CrimeType);
        if (!IsValid(CrimeDefinition))
            return;

        if (!CrimeDefinition.bAutoForgiveOnEnd || CrimeDefinition.DurationType != ECrimeDurationType::Continuous)
            return;
        
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Criminal);
        if (!IsValid(CrimeMemory))
            return;

        TArray<int> GlobalCrimeIDsByCriminal = CrimeMemory.GetAllCrimesCommitedBy(Criminal);

        for (int i = GlobalCrimeIDsByCriminal.Num() - 1; i >= 0; i--)
        {
            int CrimeID = GlobalCrimeIDsByCriminal[i];
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            if (CrimeType.IsValid() && !GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            if (AreaTag.IsValid() && !GlobalCrimeData.AreaTag.MatchesTagExact(AreaTag))
                continue;

            CrimeMemory.ForgiveCrime(CrimeID);
                break;
        }
    }

    UFUNCTION(BlueprintCallable)
    FGlobalCrimeMemoryFilter FilterGlobalCrimes(AGothicCharacterState WorldReferenceCharacter)
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(WorldReferenceCharacter);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();
        
        TArray<int> GlobalCrimeIDsByCriminal = CrimeMemory.GetAllCrimesCommitedBefore(FInGameTime::Now());

        TArray<FGlobalCrimeDataEntry> GlobalCrimes;
        for (auto CrimeID : GlobalCrimeIDsByCriminal)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                continue;

            GlobalCrimes.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(GlobalCrimes, WorldReferenceCharacter);
    }

    UFUNCTION(BlueprintCallable)
    FRelativeCrimeMemoryFilter FilterRelativeCrimesOfWitness(AGothicCharacterState Witness)
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Witness);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> RelativeCrimes;
        if (!CrimeMemory.GetRelativeCrimesOfCharacter(RelativeCrimes, Witness))
            return FRelativeCrimeMemoryFilter();
        
        return FRelativeCrimeMemoryFilter(RelativeCrimes, Witness);
    }

    /** Build a FRememberedPerception from a crime entry for use in AI assessment events. */
    UFUNCTION(BlueprintCallable)
    bool CreateAssessmentPerceptionFromCrime(FRememberedPerception&out RememberedPerception, FCrimeEntry CrimeEntry, float NormalizedCrimeSeverity) const
    {
        FRememberedPerception FakePerception;

        for (auto GuildHandle : CrimeEntry.VictimGuildHandles)
        {
            FakePerception.Affected.Tags.AddTag(GuildHandle.Guild);
        }

        for (auto CharacterHandle : CrimeEntry.VictimCharacterHandles)
        {
            FakePerception.AffectedCharacterUniqueNames.Add(CharacterHandle.VictimGlobalID);
        }

        FakePerception.EventTag = CrimeEntry.CrimeType;
        FakePerception.Magnitude = NormalizedCrimeSeverity;

        auto CriminalCharacterState = AGothicCharacterState::FindByGlobalId(CrimeEntry.CriminalGlobalID);
        if (!IsValid(CriminalCharacterState))
            return false;

        FakePerception.Instigator.CharacterState = CriminalCharacterState;
        FakePerception.Origin.CharacterState = CriminalCharacterState;
        if (IsValid(FakePerception.Instigator.CharacterState))
        {
            FakePerception.Instigator.Character = FakePerception.Instigator.CharacterState.Character;
            FakePerception.Origin.Character = FakePerception.Origin.CharacterState.Character;
        }

        if (!CrimeEntry.TrueCriminalGlobalID.IsNone())
        {
            AGothicCharacterState ActualDamagerState = AGothicCharacterState::FindByGlobalId(CrimeEntry.TrueCriminalGlobalID);
            if (!IsValid(ActualDamagerState))
                return false;

            if (IsValid(ActualDamagerState) && IsValid(ActualDamagerState.Character))
            {
                FakePerception.Instigator.Character = ActualDamagerState.Character;
                FakePerception.Origin.Character = ActualDamagerState.Character;
            }
        }

        if (IsValid(CriminalCharacterState))
        {
            FakePerception.Instigator.AtPosition = CriminalCharacterState.CharacterLocation;
            FakePerception.Origin.AtPosition = CriminalCharacterState.CharacterLocation;

            // NavAgentLocation is needed for navigation calls (e.g. UAIState_InvestigateAlarm).
            // Use the (possibly TrueCriminal-overridden) Character reference so we get the nav
            // position of the correct actor.
            if (IsValid(FakePerception.Instigator.Character))
            {
                FakePerception.Instigator.AtNavPosition = FakePerception.Instigator.Character.NavAgentLocation;
                FakePerception.Origin.AtNavPosition = FakePerception.Instigator.Character.NavAgentLocation;
            }
        }

        if (CrimeEntry.AffectedEntitySource == ECrimeAffectedEntitySource::Event && !CrimeEntry.VictimCharacterHandles.IsEmpty())
        {
            auto VictimCharacterState = AGothicCharacterState::FindByGlobalId(CrimeEntry.VictimCharacterHandles.Last().VictimGlobalID);
            if (!IsValid(VictimCharacterState))
                return false;
            
            FakePerception.Affected.CharacterState = VictimCharacterState;
            FakePerception.Affected.Character = VictimCharacterState.Character;
            FakePerception.Affected.AtPosition = VictimCharacterState.CharacterLocation;
            if (IsValid(VictimCharacterState.Character))
            {
                FakePerception.Affected.AtNavPosition = VictimCharacterState.Character.NavAgentLocation;
            }            
        }

        if (!CrimeEntry.VictimCharacterHandles.IsEmpty())
        {
            FakePerception.Affected.Relationship = GetBestRelationshipFromPersonalVictims(CrimeEntry.VictimCharacterHandles);
            FakePerception.Affected.Hostility = GetMostRelevantHostilityFromPersonalVictims(CrimeEntry.VictimCharacterHandles);
            FakePerception.Affected.RelativeRank = GetBestRelativeRankFromPersonalVictims(CrimeEntry.VictimCharacterHandles);
        }
        else if (!CrimeEntry.VictimGuildHandles.IsEmpty())
        {
            FakePerception.Affected.Relationship = GetBestRelationshipFromGuildVictims(CrimeEntry.VictimGuildHandles);
            FakePerception.Affected.Hostility = GetMostRelevantHostilityFromGuildVictims(CrimeEntry.VictimGuildHandles);
            FakePerception.Affected.RelativeRank = GetBestRelativeRankFromGuildVictims(CrimeEntry.VictimGuildHandles);
        }

        FakePerception.Instigator.Relationship = CrimeEntry.RelationshipTowardsCriminal;
        FakePerception.Instigator.RelativeRank = CrimeEntry.RelativeRankTowardsCriminal;
        FakePerception.Instigator.Hostility = CrimeEntry.HostilityTowardsCriminal;
        FakePerception.Origin.Relationship = CrimeEntry.RelationshipTowardsCriminal;
        FakePerception.Origin.RelativeRank = CrimeEntry.RelativeRankTowardsCriminal;
        FakePerception.Origin.Hostility = CrimeEntry.HostilityTowardsCriminal;

        for (auto CrimeVictimGuildHandle : CrimeEntry.VictimGuildHandles)
        {
            if (FakePerception.Affected.Tags.HasTagExact(CrimeVictimGuildHandle.Guild))
                continue;

            FakePerception.Affected.Tags.AddTag(CrimeVictimGuildHandle.Guild);
        }

        if (CrimeEntry.CriminalGuild.IsValid())
        {
            FakePerception.Instigator.Tags.AddTag(CrimeEntry.CriminalGuild);
        }

        if (CrimeEntry.AreaTag.IsValid())
        {
            FakePerception.Instigator.Tags.AddTag(CrimeEntry.AreaTag);
        }

        if (IsValid(CrimeEntry.InteractiveObjectDefinitionClass))
        {
            FakePerception.ContextTags.AddTag(GameplayTag::Object_Door);
        }

        RememberedPerception = FakePerception;
        return true;
    }
}

USTRUCT()
struct FRelativeCrimeMemoryFilter
{
    FRelativeCrimeMemoryFilter(TArray<FRelativeCrimeDataEntry>& _Array, AGothicCharacterState _CharacterReference)
    {
        Array = _Array;
        CharacterReference = _CharacterReference;
    }

    AGothicCharacterState CharacterReference;
    TArray<FRelativeCrimeDataEntry> Array;

    FRelativeCrimeMemoryFilter ByCriminal(AGothicCharacterState Criminal) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Criminal);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            if (GlobalCrimeData.CriminalGlobalID != Criminal.CharacterGlobalId)
                continue;

            NewArray.Add(RelativeCrime);
        }

        return FRelativeCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FRelativeCrimeMemoryFilter AffectingCharacter(AGothicCharacterState Victim) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Victim);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            if (!GlobalCrimeData.VictimGlobalIDs.Contains(Victim.CharacterGlobalId))
                continue;

            NewArray.Add(RelativeCrime);
        }

        return FRelativeCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FRelativeCrimeMemoryFilter AffectingGuild(FGameplayTag Guild) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            if (!GlobalCrimeData.VictimGuilds.HasTag(Guild))
                continue;

            NewArray.Add(RelativeCrime);
        }

        return FRelativeCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FRelativeCrimeMemoryFilter OfCrimeType(FGameplayTag CrimeType) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            if (!GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            NewArray.Add(RelativeCrime);
        }

        return FRelativeCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FRelativeCrimeMemoryFilter WithForgivenessValue(bool bIsForgiven) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FRelativeCrimeMemoryFilter();

        TArray<FRelativeCrimeDataEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            if (GlobalCrimeData.bIsForgiven != bIsForgiven)
                continue;

            NewArray.Add(RelativeCrime);
        }

        return FRelativeCrimeMemoryFilter(NewArray, CharacterReference);
    }

    TArray<FCrimeEntry> GetFullCrimeDataArray() const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return TArray<FCrimeEntry>();

        TArray<FCrimeEntry> NewArray;
        for (auto RelativeCrime : Array)
        {
            FGlobalCrimeDataEntry GlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, RelativeCrime.ID))
                continue;

            NewArray.Add(FCrimeEntry(GlobalCrimeData, RelativeCrime));
        }

        return NewArray;
    }

    TArray<FRelativeCrimeDataEntry> GetRelativeCrimeDataArray() const
    {
        return Array;
    }
}

USTRUCT()
struct FGlobalCrimeMemoryFilter
{
    FGlobalCrimeMemoryFilter(TArray<FGlobalCrimeDataEntry>& _Array, AGothicCharacterState _CharacterReference)
    {
        Array = _Array;
        CharacterReference = _CharacterReference;
    }

    AGothicCharacterState CharacterReference;
    TArray<FGlobalCrimeDataEntry> Array;

    FGlobalCrimeMemoryFilter ByCriminal(AGothicCharacterState Criminal) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Criminal);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();

        TArray<FGlobalCrimeDataEntry> NewArray;
        for (auto GlobalCrimeData : Array)
        {
            if (GlobalCrimeData.CriminalGlobalID != Criminal.CharacterGlobalId)
                continue;

            NewArray.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FGlobalCrimeMemoryFilter AffectingCharacter(AGothicCharacterState Victim) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(Victim);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();

        TArray<FGlobalCrimeDataEntry> NewArray;
        for (auto GlobalCrimeData : Array)
        {
            if (!GlobalCrimeData.VictimGlobalIDs.Contains(Victim.CharacterGlobalId))
                continue;

            NewArray.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FGlobalCrimeMemoryFilter AffectingGuild(FGameplayTag Guild) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();

        TArray<FGlobalCrimeDataEntry> NewArray;
        for (auto GlobalCrimeData : Array)
        {
            if (!GlobalCrimeData.VictimGuilds.HasTag(Guild))
                continue;

            NewArray.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FGlobalCrimeMemoryFilter OfCrimeType(FGameplayTag CrimeType) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();

        TArray<FGlobalCrimeDataEntry> NewArray;
        for (auto GlobalCrimeData : Array)
        {
            if (!GlobalCrimeData.CrimeType.MatchesTag(CrimeType))
                continue;

            NewArray.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(NewArray, CharacterReference);
    }

    FGlobalCrimeMemoryFilter WithForgivenessValue(bool bIsForgiven) const
    {
        auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterReference);
        if (!IsValid(CrimeMemory))
            return FGlobalCrimeMemoryFilter();

        TArray<FGlobalCrimeDataEntry> NewArray;
        for (auto GlobalCrimeData : Array)
        {
            if (GlobalCrimeData.bIsForgiven != bIsForgiven)
                continue;

            NewArray.Add(GlobalCrimeData);
        }

        return FGlobalCrimeMemoryFilter(NewArray, CharacterReference);
    }

    TArray<FGlobalCrimeDataEntry> GetGlobalCrimeDataArray() const
    {
        return Array;
    }
}

struct FTrespassingContext
{
    FGameplayTag CharacterAreaTag;

    TArray<FGameplayTag> GuildOwners;
    TSet<AGothicCharacterState> PersonalOwners;
    bool bIsBasicDataValid = false;
    bool bIsWitnessDataValid = false;

    bool bFoundMatchingCrime = false;

    bool bCharacterIsGuildOwner = false;
    bool bCharacterIsPersonalOwner = false;
    bool bWitnessIsGuildOwner = false;
    bool bWitnessIsPersonalOwner = false;
    bool bWitnessCanSeeCharacter = false;
    bool bWitnessPursuesTrespassingOnGuild = false;
    bool bCharacterIsTrespassingOnGuild = false;
    bool bWitnessPursuesTrespassingOnPerson = false;
    bool bCharacterIsTrespassingOnPerson = false;

    float GuildSeverity;
    float PersonalSeverity;

    ETrespassingResult Result = ETrespassingResult::NoTrespassing;

    bool IsNotTrespassing() const
    {
        if (Result == ETrespassingResult::NoTrespassing)
            return true;

        return false;
    }

    bool IsTrespassingIgnored() const
    {
        if (Result == ETrespassingResult::TrespassingIgnored_OnPerson_NotPursued ||
            Result == ETrespassingResult::TrespassingIgnored_OnPerson_SelfHome ||
            Result == ETrespassingResult::TrespassingIgnored_OnPerson_FriendlyHome ||
            Result == ETrespassingResult::TrespassingIgnored_OnPerson_NoFriendlyOwner ||
            Result == ETrespassingResult::TrespassingIgnored_OnGuild_NotPursued ||
            Result == ETrespassingResult::TrespassingIgnored_OnGuild_NoFriendlyOwner)
            return true;
        
        return false;
    }
}

enum ETrespassingResult
{
    NoTrespassing,
    TrespassingIgnored_OnPerson_NotPursued,
    TrespassingIgnored_OnGuild_NotPursued,
    TrespassingIgnored_OnPerson_SelfHome,
    TrespassingIgnored_OnPerson_FriendlyHome,
    TrespassingIgnored_OnPerson_NoFriendlyOwner,
    TrespassingIgnored_OnGuild_NoFriendlyOwner,
    Trespassing_OnPerson_Self,
    Trespassing_OnGuild_Self,
    Trespassing_OnPerson_Friendly,
    Trespassing_OnGuild_Friendly,
}

mixin FTrespassingContext GetTrespassingContextFor(const AGothicCharacterState CharacterState, const AGothicCharacterState Witness = nullptr)
{
    FTrespassingContext Context;

    if (!IsValid(CharacterState))
        return Context;

    UOwnershipSubsystem OwnershipSystem = UOwnershipSubsystem::Get();
    if (!IsValid(OwnershipSystem))
        return Context;
    
    // CHARACTER AREA AND OWNERS
    Context.CharacterAreaTag = CharacterState.AreaTagOfLocation;

    Context.GuildOwners = OwnershipSystem.GetAllGuildsOwningArea(Context.CharacterAreaTag).GameplayTags;
    Context.PersonalOwners = OwnershipSystem.GetAllPersonalOwnersOfArea(Context.CharacterAreaTag);

    Context.bIsBasicDataValid = true;
    //------------------------------------------------------------------------------------------------------------------------------------------

    if (!IsValid(Witness))
        return Context;

    if (CharacterState == Witness)
        return Context;

    // CHECKS
    Context.bCharacterIsGuildOwner = OwnershipSystem.IsGuildOwnerOfArea(CharacterState.Guild, Context.CharacterAreaTag);
    Context.bCharacterIsPersonalOwner = OwnershipSystem.IsCharacterPersonalOwnerOfArea(CharacterState, Context.CharacterAreaTag);
    Context.bWitnessIsGuildOwner = OwnershipSystem.IsGuildOwnerOfArea(Witness.Guild, Context.CharacterAreaTag);
    Context.bWitnessIsPersonalOwner = OwnershipSystem.IsCharacterPersonalOwnerOfArea(Witness, Context.CharacterAreaTag);
    Context.bWitnessCanSeeCharacter = IsValid(Witness.Character) && IsValid(CharacterState.Character) && Witness.Character.Perception.CanSee(CharacterState.Character);
    Context.bWitnessPursuesTrespassingOnGuild = Witness.Relationship.DoesCrimeApplyForOther(CharacterState, GameplayTag::Crime_Trespassing_OnGuild);
    Context.bCharacterIsTrespassingOnGuild = CharacterState.IsCharacterInAreaOwnedByDifferentGuild();
    Context.bWitnessPursuesTrespassingOnPerson = Witness.Relationship.DoesCrimeApplyForOther(CharacterState, GameplayTag::Crime_Trespassing_OnPerson);
    Context.bCharacterIsTrespassingOnPerson = CharacterState.IsCharacterInAreaOwnedByDifferentPerson();

    Context.GuildSeverity = Witness.Relationship.GetBaseSeverityOfCrimeIfCommitedByOther(
        CharacterState, GameplayTag::Crime_Trespassing_OnGuild);
    Context.PersonalSeverity = Witness.Relationship.GetBaseSeverityOfCrimeIfCommitedByOther(
        CharacterState, GameplayTag::Crime_Trespassing_OnPerson);
    //------------------------------------------------------------------------------------------------------------------------------------------

    bool bCrime = false;
    bool bImGuiCrimeLineDisplayed = false;

    ETrespassingResult OnPersonResult = ETrespassingResult::NoTrespassing;
    ETrespassingResult OnGuildResult = ETrespassingResult::NoTrespassing;

    if (!Context.bCharacterIsTrespassingOnPerson && !Context.bCharacterIsTrespassingOnGuild)
    {
        Context.Result = ETrespassingResult::NoTrespassing;
        Context.bIsWitnessDataValid = true;
        return Context;
    }

    if (!Context.bCharacterIsTrespassingOnPerson)
    {
        OnPersonResult = ETrespassingResult::NoTrespassing;
    }

    if (!Context.bCharacterIsTrespassingOnGuild)
    {
        OnGuildResult = ETrespassingResult::NoTrespassing;
    }

    if (Context.bCharacterIsTrespassingOnPerson && !Context.bWitnessPursuesTrespassingOnPerson)
    {
        OnPersonResult = ETrespassingResult::TrespassingIgnored_OnPerson_NotPursued;
        Context.bIsWitnessDataValid = true;
    }

    if (Context.bCharacterIsTrespassingOnGuild && !Context.bWitnessPursuesTrespassingOnGuild)
    {
        OnGuildResult = ETrespassingResult::TrespassingIgnored_OnGuild_NotPursued;
        Context.bIsWitnessDataValid = true;
    }

    if (Context.bCharacterIsTrespassingOnPerson && Context.bWitnessIsPersonalOwner && Witness.IsIgnoringHomeTrespassing(Context.CharacterAreaTag))
    {
        OnPersonResult = ETrespassingResult::TrespassingIgnored_OnPerson_SelfHome;
        Context.bIsWitnessDataValid = true;
    }

    if (Context.bCharacterIsTrespassingOnPerson && Context.bWitnessIsPersonalOwner)
    {
        bCrime = true;
        bool bFriendlyOwnerIgnoring = false;
        for (auto PersonalOwner : Context.PersonalOwners)
        {
            if (!Witness.IsFriendlyTowards(PersonalOwner) && 
                !Witness.IsProtecting(PersonalOwner) && 
                !PersonalOwner.IsProtecting(Witness))
                continue;

            if (PersonalOwner.IsIgnoringHomeTrespassing(Context.CharacterAreaTag))
            {
                OnPersonResult = ETrespassingResult::TrespassingIgnored_OnPerson_FriendlyHome;
                Context.bIsWitnessDataValid = true;
                bFriendlyOwnerIgnoring = true;
            }
        }

        if (!bFriendlyOwnerIgnoring)
        {
            OnPersonResult = ETrespassingResult::Trespassing_OnPerson_Self;
        }
    } 
    else if (Context.bCharacterIsTrespassingOnPerson)
    {
        bool bFriendlyOwnerIgnoring = false;
        for (auto PersonalOwner : Context.PersonalOwners)
        {
            if (!Witness.IsFriendlyTowards(PersonalOwner) && 
                !Witness.IsProtecting(PersonalOwner) && 
                !PersonalOwner.IsProtecting(Witness))
                continue;

            if (PersonalOwner.IsIgnoringHomeTrespassing(Context.CharacterAreaTag))
            {
                OnPersonResult = ETrespassingResult::TrespassingIgnored_OnPerson_FriendlyHome;
                Context.bIsWitnessDataValid = true;
                bFriendlyOwnerIgnoring = true;
            }

            bCrime = true;
        }

        if (!bFriendlyOwnerIgnoring && bCrime)
        {
            OnPersonResult = ETrespassingResult::Trespassing_OnPerson_Friendly;
        }
        else if (!bFriendlyOwnerIgnoring)
        {
            OnPersonResult = ETrespassingResult::TrespassingIgnored_OnPerson_NoFriendlyOwner;
        }

        bImGuiCrimeLineDisplayed = true;
    }

    if (Context.bCharacterIsTrespassingOnGuild && Context.bWitnessIsGuildOwner && Context.bWitnessPursuesTrespassingOnGuild)
    {
        bCrime = true;
        OnGuildResult = ETrespassingResult::Trespassing_OnGuild_Self;
        bImGuiCrimeLineDisplayed = true;
    } 
    else if (Context.bCharacterIsTrespassingOnGuild && Context.bWitnessPursuesTrespassingOnGuild)
    {
        for (auto GuildOwner : Context.GuildOwners)
        {
            auto StaticRelationshipEvaluation_WitnessToOwner =  URelationshipSystem::Get().StaticRelationshipBetween(Witness.Species, GameplayTag::Species, Witness.Guild, GuildOwner);
            auto StaticRelationshipEvaluation_OwnerToWitness =  URelationshipSystem::Get().StaticRelationshipBetween(GameplayTag::Species, Witness.Species, GuildOwner, Witness.Guild);
            if (StaticRelationshipEvaluation_WitnessToOwner.Relationship != ERelationship::Friend && 
                StaticRelationshipEvaluation_WitnessToOwner.Hostility != ERelationshipHostility::ProtectFromDifferentGuild &&
                StaticRelationshipEvaluation_WitnessToOwner.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Premium &&
                StaticRelationshipEvaluation_WitnessToOwner.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction &&
                StaticRelationshipEvaluation_OwnerToWitness.Hostility != ERelationshipHostility::ProtectFromDifferentGuild &&
                StaticRelationshipEvaluation_OwnerToWitness.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Premium &&
                StaticRelationshipEvaluation_OwnerToWitness.Hostility != ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                continue;
            
            bCrime = true;
            OnGuildResult = ETrespassingResult::Trespassing_OnGuild_Friendly;
            bImGuiCrimeLineDisplayed = true;
            break;
        }

        if (!bCrime)
        {
            OnGuildResult = ETrespassingResult::TrespassingIgnored_OnGuild_NoFriendlyOwner;
            bImGuiCrimeLineDisplayed = true;
        }
    }

    if (OnPersonResult == ETrespassingResult::NoTrespassing && OnGuildResult == ETrespassingResult::NoTrespassing)
    {
        Context.Result = ETrespassingResult::NoTrespassing;
    }
    else if (OnPersonResult == ETrespassingResult::Trespassing_OnPerson_Self || OnPersonResult == ETrespassingResult::Trespassing_OnPerson_Friendly)
    {
        if (OnGuildResult != ETrespassingResult::Trespassing_OnGuild_Self && OnGuildResult != ETrespassingResult::Trespassing_OnGuild_Friendly)
        {
            Context.Result = OnPersonResult;
        }
        else if (Context.GuildSeverity <= Context.PersonalSeverity)
        {
            Context.Result = OnPersonResult;
        }
        else
        {
            Context.Result = OnGuildResult;
        }
    }
    else if (OnGuildResult == ETrespassingResult::Trespassing_OnGuild_Self || OnGuildResult == ETrespassingResult::Trespassing_OnGuild_Friendly)
    {
        Context.Result = OnGuildResult;
    }
    else if (OnPersonResult != ETrespassingResult::NoTrespassing)
    {
        Context.Result = OnPersonResult;
    }
    else
    {
        Context.Result = OnGuildResult;
    }

    if (!bCrime)
    {
        Context.bIsWitnessDataValid = true;
        return Context;
    }

    // Find existing matching crime
    auto CrimeMemory = UCrimeMemorySubsystem::Get(CharacterState);
    auto GlobalCrimesByCriminal = CrimeMemory.GetAllCrimesCommitedBy(CharacterState);

    bool bIsCrimeActive = false;
    // Newest to oldest
    for (int CandidateCrimeID : GlobalCrimesByCriminal)
    {
        FGlobalCrimeDataEntry CandidateGlobalCrimeData;
        if (!CrimeMemory.GetCrimeByID(CandidateGlobalCrimeData, CandidateCrimeID))
            continue;
        
        if (CandidateGlobalCrimeData.bIsForgiven)
            continue;

        if (!CandidateGlobalCrimeData.CrimeType.MatchesTag(GameplayTag::Crime_Trespassing))
            continue;

        if (CandidateGlobalCrimeData.AreaTag.IsValid() && !CandidateGlobalCrimeData.AreaTag.MatchesTagExact(Context.CharacterAreaTag))
            continue;

        bIsCrimeActive = true;
        break;
    }

    Context.bFoundMatchingCrime = bIsCrimeActive;
    Context.bIsWitnessDataValid = true;
    return Context;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCharacterInAreaOwnedByDifferentGuild(const AGothicCharacterState CharacterState)
{
    if (!CharacterState.IsPlayerControlled() && !CharacterState.IsPlayerCharacter())
        return false;

    auto OwnershipSubsystem = UOwnershipSubsystem::Get();
    
    if (!OwnershipSubsystem.IsAreaOwnedByAnyGuild(CharacterState.AreaTagOfLocation))
        return false;

    if (OwnershipSubsystem.IsGuildOwnerOfArea(CharacterState.Guild, CharacterState.AreaTagOfLocation))
        return false;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCharacterInAreaOwnedByDifferentPerson(const AGothicCharacterState CharacterState)
{
    if (!CharacterState.IsPlayerControlled() && !CharacterState.IsPlayerCharacter())
        return false;

    auto OwnershipSubsystem = UOwnershipSubsystem::Get();

    if (!OwnershipSubsystem.IsAreaOwnedByAnyPerson(CharacterState.AreaTagOfLocation))
        return false;

    if (OwnershipSubsystem.IsCharacterPersonalOwnerOfArea(CharacterState, CharacterState.AreaTagOfLocation))
        return false;

    return true;
}

UFUNCTION(BlueprintCallable)
mixin bool IsIgnoringHomeTrespassing(const AGothicCharacterState OwnerCharacterState, FGameplayTag TrespassingAreaTag)
{
    UGameplayAbility_CharacterAI_Gothic AI = Cast<UGameplayAbility_CharacterAI_Gothic>(OwnerCharacterState.AI);
    if (!IsValid(AI))
        return false;

    UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);
    if (IsValid(ScheduledAIState) && ScheduledAIState.IsA(UAIState_Sleep))
       return false;

    if (OwnerCharacterState.AreaTagOfLocation.MatchesTag(TrespassingAreaTag) && 
        !OwnerCharacterState.HasGameplayTag(GameplayTag::AIState_Conflict) && 
        !AI.CurrentState.IsA(UAIState_FoundSomeoneInMyBed))
        return true;

    return false;
}

UFUNCTION(BlueprintCallable)
mixin bool IsCharacterTrespassingAccordingToWitness(const AGothicCharacterState CharacterState, const AGothicCharacterState WitnessCharacterState)
{
    auto TrespassingContext = CharacterState.GetTrespassingContextFor(WitnessCharacterState);
    switch (TrespassingContext.Result)
    {
        case ETrespassingResult::Trespassing_OnPerson_Self:
        case ETrespassingResult::Trespassing_OnPerson_Friendly:
        case ETrespassingResult::Trespassing_OnGuild_Self:
        case ETrespassingResult::Trespassing_OnGuild_Friendly:
            return true;
        default:
            return false;
    }
}