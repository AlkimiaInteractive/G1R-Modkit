///////////////////////////////////////
// TEST CRIME PROCESSING SYSTEM
///////////////////////////////////////

// enum ECrimeDirectness
// {
//     None, // Perceiver has no relation to the crime object
//     Indirect, // Perceiver is related to the crime object by guild or friendly relationship
//     Direct // Perceiver is the object of the crime or has personal ownership of it
// }

USTRUCT()
struct FCrimeEntry
{
    FCrimeEntry(FGameplayTag _CrimeType)
    {
        CrimeType = _CrimeType;
    }

    FCrimeEntry(FGlobalCrimeDataEntry Global, FRelativeCrimeDataEntry Relative)
    {
        // BASIC INFO
        ID = Global.ID;
        CrimeType = Global.CrimeType;
        TimeCommitted = Global.TimeCommitted;
        BaseSeverity = Relative.BaseSeverity;
        AffectedEntitySource = Global.AffectedEntitySource;
        AreaTag = Global.AreaTag;
        InteractiveObjectDefinitionClass = Global.InteractiveObjectDefinitionClass;
        ItemDefinitionClass = Global.ItemDefinitionClass;

        bIsForgiven = Global.bIsForgiven;
        bIsSuppressed = Relative.bIsSuppressed;

        // CRIMINAL
        CriminalGlobalID = Global.CriminalGlobalID;

        /** When criminal was resolved from a transformed character (e.g. wolf) to caster (Hero), this is the actual damager's GlobalID for combat targeting. */
        TrueCriminalGlobalID = Global.TrueCriminalGlobalID;

        CriminalGuild = Global.CriminalGuild;
        RelationshipTowardsCriminal = Relative.RelationshipTowardsCriminal;
        RelativeRankTowardsCriminal = Relative.RelativeRankTowardsCriminal;
        HostilityTowardsCriminal = Relative.HostilityTowardsCriminal;
        bCriminalIsInPartyWithWitness = Relative.bInPartyWithCriminal;

        // VICTIMS
        VictimGuildHandles = Relative.VictimGuildHandles;
        VictimCharacterHandles = Relative.VictimCharacterHandles;

        // DIRECTNESS
        Directness = Relative.Directness;
        bIsValid = true;
    }


    bool bIsValid = false;

    UPROPERTY()
    int ID = -1;

    UPROPERTY()
    ECrimeAffectedEntitySource AffectedEntitySource;

    UPROPERTY()
    FGameplayTag AreaTag;

    UPROPERTY()
    FInGameTime TimeCommitted;

    UPROPERTY()
    bool bIsForgiven;

    UPROPERTY()
    bool bIsSuppressed;

    UPROPERTY()
    TSubclassOf<UInteractiveObjectDefinition> InteractiveObjectDefinitionClass;

    UPROPERTY()
    TSubclassOf<UItemDefinition> ItemDefinitionClass;

    // BASIC INFO
    UPROPERTY()
    float BaseSeverity;

    UPROPERTY()
    FGameplayTag CrimeType;

    // CRIMINAL
    UPROPERTY()
    FName CriminalGlobalID;

    /** When criminal was resolved from a transformed character (e.g. wolf) to caster (Hero), this is the actual damager's GlobalID for combat targeting. */
    UPROPERTY()
    FName TrueCriminalGlobalID;

    UPROPERTY()
    FGameplayTag CriminalGuild;

    UPROPERTY()
    ERelationship RelationshipTowardsCriminal;

    UPROPERTY()
    ERelationshipRelativeRank RelativeRankTowardsCriminal;

    UPROPERTY()
    ERelationshipHostility HostilityTowardsCriminal;

    UPROPERTY()
    bool bCriminalIsInPartyWithWitness;


    // VICTIMS
    UPROPERTY()
    TArray<FCrimeVictimGuildHandle> VictimGuildHandles;

    UPROPERTY()
    TArray<FCrimeVictimPersonHandle> VictimCharacterHandles;

    // DIRECTNESS
    UPROPERTY()
    ECrimeDirectness Directness;
}

struct FCrimeRegisterData
{
    FCrimeRegisterData(FGameplayTag _CrimeType)
    {
        CrimeType = _CrimeType;
    }

    UPROPERTY()
    bool bIsValid = false;

    UPROPERTY()
    FGameplayTag CrimeType;

    UPROPERTY()
    FGameplayTag AreaTag;

    UPROPERTY()
    FGameplayTag CrimeEntryData;

    UPROPERTY()
    FInGameTime TimeCommitted;

    UPROPERTY()
    ECrimeAffectedEntitySource AffectedEntitySource;

    UPROPERTY()
    TSubclassOf<UInteractiveObjectDefinition> InteractiveObjectDefinitionClass;

    UPROPERTY()
    TSubclassOf<UItemDefinition> ItemDefinitionClass;

    UPROPERTY()
    AGothicCharacterState CriminalCharacterState;

    UPROPERTY()
    AGothicCharacterState TrueCriminalCharacterState;

    UPROPERTY()
    TArray<AGothicCharacterState> VictimCharacterStates;

    UPROPERTY()
    FGameplayTagContainer VictimGuilds;
}

// struct FCrimeVictimGuildHandle
// {
//     UPROPERTY()
//     FGameplayTag Guild;

//     UPROPERTY()
//     ERelationship RelationshipTowardsGuild;

//     UPROPERTY()
//     ERelationshipRelativeRank RelativeRankTowardsGuild;

//     UPROPERTY()
//     ERelationshipHostility HostilityTowardsGuild;
// }

// struct FCrimeVictimPersonHandle
// {
//     UPROPERTY()
//     FName VictimGlobalID;

//     UPROPERTY()
//     ERelationship RelationshipTowardsPerson;

//     UPROPERTY()
//     ERelationshipRelativeRank RelativeRankTowardsPerson;

//     UPROPERTY()
//     ERelationshipHostility HostilityTowardsPerson;
// }

UCLASS(Abstract)
class UCrimeSeverityModifier
{
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
    ERelationship GetRelationshipTowardsVictim(FCrimeEntry CrimeEntry)
    {
        TArray<ERelationship> Relationships;

        for (auto CrimeVictimCharacterHandle : CrimeEntry.VictimCharacterHandles)
        {
            Relationships.Add(CrimeVictimCharacterHandle.RelationshipTowardsPerson);
        }

        for (auto CrimeVictimGuildHandle : CrimeEntry.VictimGuildHandles)
        {
            Relationships.Add(CrimeVictimGuildHandle.RelationshipTowardsGuild);
        }

        return GetBestRelationship(Relationships);
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipRelativeRank GetRelativeRankTowardsVictim(FCrimeEntry CrimeEntry)
    {
        TArray<ERelationshipRelativeRank> RelativeRanks;

        for (auto CrimeVictimCharacterHandle : CrimeEntry.VictimCharacterHandles)
        {
            RelativeRanks.Add(CrimeVictimCharacterHandle.RelativeRankTowardsPerson);
        }

        for (auto CrimeVictimGuildHandle : CrimeEntry.VictimGuildHandles)
        {
            RelativeRanks.Add(CrimeVictimGuildHandle.RelativeRankTowardsGuild);
        }

        return GetBestRelativeRank(RelativeRanks);
    }
}

UCLASS(Abstract)
class UCrimeSeverityMultiplicativeModifier : UCrimeSeverityModifier
{
    UFUNCTION(BlueprintCallable)
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry)
    {
        return 0.0f;
    }
}

UCLASS(Abstract)
class UCrimeSeverityAdditiveModifier : UCrimeSeverityModifier
{
    UFUNCTION(BlueprintCallable)
    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry)
    {
        return 0.0f;
    }
}

UCLASS(Abstract)
class UCrimeSeverityAdditiveModifier_Relationship : UCrimeSeverityAdditiveModifier
{
    TMap<ERelationship, float> Severities;

    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        float Result = 0.0f;
        Severities.Find(GetRelationship(CrimeEntry), Result);

        return Result;
    }

    UFUNCTION(BlueprintCallable)
    ERelationship GetRelationship(FCrimeEntry CrimeEntry)
    {
        return ERelationship::Unknown;
    }
}

/** Adds a modifier based on the relationship of the perceiver towards the victim */
UCLASS(Abstract)
class UCrimeSeverityAdditiveModifier_RelationshipTowardsVictim : UCrimeSeverityAdditiveModifier_Relationship
{
    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!CrimeEntry.VictimCharacterHandles.IsEmpty() && CrimeEntry.Directness == ECrimeDirectness::Direct)
            return 0.0f;

        return Super::AdditiveSeverity(Witness, CrimeEntry);    
    }

    ERelationship GetRelationship(FCrimeEntry CrimeEntry) override
    {
        return GetRelationshipTowardsVictim(CrimeEntry);
    }
}

UCLASS(Abstract)
class UCrimeSeverityMultiplicativeModifier_Relationship : UCrimeSeverityMultiplicativeModifier
{
    TMap<ERelationship, float> SeverityMultipliers;

    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        float Result = 0.0f;
        SeverityMultipliers.Find(GetRelationship(CrimeEntry), Result);

        return Result;
    }

    UFUNCTION(BlueprintCallable)
    ERelationship GetRelationship(FCrimeEntry CrimeEntry)
    {
        return ERelationship::Unknown;
    }
}

UCLASS(Abstract)
class UCrimeSeverityAdditiveModifier_RelativeRank : UCrimeSeverityAdditiveModifier
{
    TMap<ERelationshipRelativeRank, float> Severities;

    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        float Result = 0.0f;
        Severities.Find(GetRelativeRank(CrimeEntry), Result);

        return Result;
    }

    UFUNCTION(BlueprintCallable)
    ERelationshipRelativeRank GetRelativeRank(FCrimeEntry CrimeEntry)
    {
        return ERelationshipRelativeRank::Unknown;
    }
}

////////////////////////////////////
// Crime Severity modifiers
////////////////////////////////////

/** Adds a modifier based on how removed the perceiver is from the crime */
UCLASS()
class UCrimeSeverityModifier_Add_VictimIsSelfPersonally : UCrimeSeverityAdditiveModifier
{
    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!CrimeEntry.VictimCharacterHandles.IsEmpty() && CrimeEntry.Directness == ECrimeDirectness::Direct)
            return 1.0f;

        return 0.0f; 
    }
}

/** Adds a modifier based on how removed the perceiver is from the crime */
UCLASS()
class UCrimeSeverityModifier_Add_CrimeDirectness : UCrimeSeverityAdditiveModifier
{
    TMap<ECrimeDirectness, float> Severities;
    default Severities.Add(ECrimeDirectness::None, 0.0f);
    default Severities.Add(ECrimeDirectness::Indirect, 0.5f);
    default Severities.Add(ECrimeDirectness::Direct, 1.0f);

    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        float Result = 0.0f;
        Severities.Find(CrimeEntry.Directness, Result);

        return Result;
    }
}

/** Adds a modifier based on the relationship of the perceiver towards the criminal */
UCLASS()
class UCrimeSeverityModifier_Add_RelationshipTowardsCriminal : UCrimeSeverityAdditiveModifier_Relationship
{
    default Severities.Add(ERelationship::Friend, -1.0f);
    default Severities.Add(ERelationship::Neutral, 0.0f);
    default Severities.Add(ERelationship::Angry, 0.2f);
    default Severities.Add(ERelationship::Hostile, 0.5f);
    default Severities.Add(ERelationship::Enemy, 1.0f);

    ERelationship GetRelationship(FCrimeEntry CrimeEntry) override
    {
        return CrimeEntry.RelationshipTowardsCriminal;
    }
}

/** Adds a modifier based on the relationship of the perceiver towards the criminal */
UCLASS()
class UCrimeSeverityModifier_Add_RelationshipTowardsCriminal_NoFriend : UCrimeSeverityModifier_Add_RelationshipTowardsCriminal
{
    default Severities.Add(ERelationship::Friend, 0.0f);
}

/** Adds a modifier based on the relationship of the perceiver towards the victim */
UCLASS()
class UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good : UCrimeSeverityAdditiveModifier_RelationshipTowardsVictim
{
    default Severities.Add(ERelationship::Friend, 1.0f);
}

UCLASS()
class UCrimeSeverityModifier_Add_Protect : UCrimeSeverityAdditiveModifier
{
    float AdditiveSeverity(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!CrimeEntry.VictimCharacterHandles.IsEmpty() && CrimeEntry.Directness == ECrimeDirectness::Direct)
            return 0.0f;
        
        AGothicCharacterState CriminalCharacterState = AGothicCharacterState::FindByGlobalId(CrimeEntry.CriminalGlobalID);
        bool bCriminalIsCreature = IsValid(CriminalCharacterState) && CriminalCharacterState.IsCreature();

        for (auto VictimHandle : CrimeEntry.VictimCharacterHandles)
        {
            if (VictimHandle.RelationshipTowardsPerson == ERelationship::Friend)
                continue;

            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                return 1.0f;

            if (CrimeEntry.HostilityTowardsCriminal == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                continue;

            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::Help)
                return 1.0f;

            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                return 1.0f;

            if (CrimeEntry.HostilityTowardsCriminal == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                continue;
            
            AGothicCharacterState VictimCharacterState = AGothicCharacterState::FindByGlobalId(VictimHandle.VictimGlobalID);
            if (IsValid(VictimCharacterState) && VictimCharacterState.Guild.IsValid() && CrimeEntry.CriminalGuild.IsValid() && 
                !VictimCharacterState.Guild.MatchesTag(CrimeEntry.CriminalGuild) &&
                VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild)
                return 1.0f;

            if (bCriminalIsCreature && VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromCreature)
                return 1.0f;

            if (CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
                continue;

            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromNonFriendly)
                return 1.0f;
        }

        for (auto GuildHandle : CrimeEntry.VictimGuildHandles)
        {
            if (GuildHandle.RelationshipTowardsGuild == ERelationship::Friend)
                continue;

            if (CrimeEntry.HostilityTowardsCriminal == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                continue;

            if (GuildHandle.HostilityTowardsGuild == ERelationshipHostility::Help)
                return 1.0f;

            if (CrimeEntry.HostilityTowardsCriminal == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                continue;

            if (!GuildHandle.Guild.MatchesTag(CrimeEntry.CriminalGuild) &&
                GuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromDifferentGuild)
                return 1.0f;

            if (bCriminalIsCreature && GuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromCreature)
                return 1.0f;

            if (CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
                continue;

            if (GuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromNonFriendly)
                return 1.0f;
        }

        return 0.0f; 
    }
}

/** Adds a modifier based on the relationship of the perceiver towards the victim */
UCLASS()
class UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Bad : UCrimeSeverityAdditiveModifier_RelationshipTowardsVictim
{
    default Severities.Add(ERelationship::Enemy, -1.0f);
    default Severities.Add(ERelationship::Hostile, -0.5f);
}

UCLASS()
class UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_Reverse : UCrimeSeverityMultiplicativeModifier_Relationship
{
    default SeverityMultipliers.Add(ERelationship::Friend, 1.0f);
    default SeverityMultipliers.Add(ERelationship::Neutral, 1.0f);
    default SeverityMultipliers.Add(ERelationship::Angry, 0.0f);
    default SeverityMultipliers.Add(ERelationship::Hostile, -0.5f);
    default SeverityMultipliers.Add(ERelationship::Enemy, -0.8f);

    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!CrimeEntry.VictimCharacterHandles.IsEmpty() && CrimeEntry.Directness == ECrimeDirectness::Direct)
            return 1.0f;

        return Super::SeverityMultiplier(Witness, CrimeEntry);
    }

    ERelationship GetRelationship(FCrimeEntry CrimeEntry) override
    {
        return GetRelationshipTowardsVictim(CrimeEntry);
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_OnlyRelevantToEnforcers : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!IsValid(Witness) || !Witness.IsEnforcerOrLeaderRole())
            return 0.0f;

        return 1.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected : UCrimeSeverityMultiplicativeModifier_Relationship
{
    default SeverityMultipliers.Add(ERelationship::Friend, 1.0f);
    default SeverityMultipliers.Add(ERelationship::Neutral, 0.0f);
    default SeverityMultipliers.Add(ERelationship::Angry, 0.0f);
    default SeverityMultipliers.Add(ERelationship::Hostile, 0.0f);
    default SeverityMultipliers.Add(ERelationship::Enemy, 0.0f);

    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!CrimeEntry.VictimCharacterHandles.IsEmpty() && CrimeEntry.Directness == ECrimeDirectness::Direct)
            return 1.0f;

        // Old Camp guards do not respond when Gor Hanis or Kharim are the criminals (Scatty's gladiators)
        if (IsValid(Witness) &&
            (Witness.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp_Guard) ||
             Witness.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp_Shadow)))
        {
            AGothicCharacterState CriminalState = AGothicCharacterState::FindByGlobalId(CrimeEntry.CriminalGlobalID);
            if (IsValid(CriminalState) &&
                (CriminalState.CharacterUniqueName == n"SC_TPL_GorHanis_1422" || CriminalState.CharacterUniqueName == n"OC_SLD_Kharim_729"))
                return 0.0f;
        }

        // When both instigator and victim are friendly to the witness, and instigator is AI (not player), no crime
        AGothicCharacterState CriminalState = AGothicCharacterState::FindByGlobalId(CrimeEntry.CriminalGlobalID);
        if (IsValid(CriminalState) && !CriminalState.HasGameplayTag(GameplayTag::Character_Player) &&
            CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
        {
            bool bAllVictimsFriendly = true;
            for (auto VictimHandle : CrimeEntry.VictimCharacterHandles)
            {
                if (VictimHandle.RelationshipTowardsPerson != ERelationship::Friend)
                {
                    bAllVictimsFriendly = false;
                    break;
                }
            }
            if (bAllVictimsFriendly)
            {
                for (auto GuildHandle : CrimeEntry.VictimGuildHandles)
                {
                    if (GuildHandle.RelationshipTowardsGuild != ERelationship::Friend)
                    {
                        bAllVictimsFriendly = false;
                        break;
                    }
                }
            }
            if (bAllVictimsFriendly && (CrimeEntry.VictimCharacterHandles.Num() > 0 || CrimeEntry.VictimGuildHandles.Num() > 0))
                return 0.0f;
        }

        for (auto VictimHandle : CrimeEntry.VictimCharacterHandles)
        {
            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::Help)
                return 1.0f;
            
            auto Victim = AGothicCharacterState::FindByGlobalId(VictimHandle.VictimGlobalID);
            if (!IsValid(Victim))
                continue;
            
            if (!Victim.Guild.MatchesTag(CrimeEntry.CriminalGuild) &&
                VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromDifferentGuild)
                return 1.0f;                

            if (CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
                continue;

            if (VictimHandle.HostilityTowardsPerson == ERelationshipHostility::ProtectFromNonFriendly)
                return 1.0f;
        }

        for (auto GuildHandle : CrimeEntry.VictimGuildHandles)
        {
            if (GuildHandle.HostilityTowardsGuild == ERelationshipHostility::Help)
                return 1.0f;

            if (!GuildHandle.Guild.MatchesTag(CrimeEntry.CriminalGuild) &&
                GuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromDifferentGuild)
                return 1.0f;

            if (CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
                continue;

            if (GuildHandle.HostilityTowardsGuild == ERelationshipHostility::ProtectFromNonFriendly)
                return 1.0f;
        }

        return Super::SeverityMultiplier(Witness, CrimeEntry);
    }

    ERelationship GetRelationship(FCrimeEntry CrimeEntry) override
    {
        return GetRelationshipTowardsVictim(CrimeEntry);
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.RelationshipTowardsCriminal == ERelationship::Friend)
            return 0.0f;

        return 1.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_CriminalIsFriendlySameRank_Nullify : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.RelationshipTowardsCriminal != ERelationship::Friend)
            return 1.0f;

        if (CrimeEntry.RelativeRankTowardsCriminal != ERelationshipRelativeRank::HigherThanMe &&
            CrimeEntry.RelativeRankTowardsCriminal != ERelationshipRelativeRank::Same)
            return 1.0f;

        return 0.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_CriminalOutranksWitness_Nullify : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.RelativeRankTowardsCriminal == ERelationshipRelativeRank::HigherThanMe ||
            CrimeEntry.RelativeRankTowardsCriminal == ERelationshipRelativeRank::Boss)            
            return 0.0f;

        return 1.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.bCriminalIsInPartyWithWitness)
            return 0.0f;

        return 1.0f;
    }
}


UCLASS()
class UCrimeSeverityModifier_Mult_Forgiven : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.bIsForgiven)
            return 0.44f;
            //return 0.25f;

        return 1.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_Suppressed : UCrimeSeverityMultiplicativeModifier
{
    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (CrimeEntry.bIsSuppressed)
            return 0.44f;
            //return 0.35f;

        return 1.0f;
    }
}

UCLASS()
class UCrimeSeverityModifier_Mult_ItemValue : UCrimeSeverityMultiplicativeModifier
{
    const float LowValueClamp = 2.0f;
    const float HighValueClamp = 5.0f;
    const float MinMultiplier = 0.66f;
    const float MaxMultiplier = 1.0f;

    float SeverityMultiplier(AGothicCharacterState Witness, FCrimeEntry CrimeEntry) override
    {
        if (!IsValid(CrimeEntry.ItemDefinitionClass))
            return 1.0f;

        float Value = CrimeEntry.ItemDefinitionClass.DefaultObject.m_Value;
        if (HighValueClamp == 0.0f)
            return MaxMultiplier;

        if (Value < LowValueClamp)
            return MinMultiplier;

        if (Value > HighValueClamp)
            return MaxMultiplier;

        return MinMultiplier + (MaxMultiplier - MinMultiplier) * ((Value - LowValueClamp) / HighValueClamp);
    }
}

/** Adds a modifier based on the relative rank of the perceiver towards the criminal */
UCLASS()
class UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal : UCrimeSeverityAdditiveModifier_RelativeRank
{
    default Severities.Add(ERelationshipRelativeRank::Scum, 1.0f);
    default Severities.Add(ERelationshipRelativeRank::LowerThanMe, 0.5f);
    default Severities.Add(ERelationshipRelativeRank::Same, 0.0f);
    default Severities.Add(ERelationshipRelativeRank::HigherThanMe, -1.0f);
    default Severities.Add(ERelationshipRelativeRank::Boss, -2.0f);

    ERelationshipRelativeRank GetRelativeRank(FCrimeEntry CrimeEntry) override
    {
        return CrimeEntry.RelativeRankTowardsCriminal;
    }
}

/** Adds a modifier based on the relative rank of the perceiver towards the victim */
UCLASS()
class UCrimeSeverityModifier_Add_RelativeRankTowardsVictim : UCrimeSeverityAdditiveModifier_RelativeRank
{
    default Severities.Add(ERelationshipRelativeRank::Scum, -1.0f);
    default Severities.Add(ERelationshipRelativeRank::LowerThanMe, -0.5f);
    default Severities.Add(ERelationshipRelativeRank::Same, 0.0f);
    default Severities.Add(ERelationshipRelativeRank::HigherThanMe, 0.5f);
    default Severities.Add(ERelationshipRelativeRank::Boss, 1.0f);

    ERelationshipRelativeRank GetRelativeRank(FCrimeEntry CrimeEntry) override
    {
        return GetRelativeRankTowardsVictim(CrimeEntry);
    }
}

////////////////////////////////////