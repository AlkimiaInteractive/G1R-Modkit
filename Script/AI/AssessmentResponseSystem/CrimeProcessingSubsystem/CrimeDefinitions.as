////////////////////////////////////
// Crime type definitions
////////////////////////////////////

// enum ECrimeAffectedEntitySource
// {
//     Area,
//     Item,
//     Interactable,
//     Event
// }

/**
 * Shape parameters for the age-decay curve. The curve is a sigmoid blend between a
 * linear plateau (early life of the memory) and an exponential tail (late life).
 */
USTRUCT()
struct FCrimeAgeDecayParams
{
    /** Center of the logistic blend in [0, 1]. Clamped to (0.001, 0.999) at evaluation. */
    float Shoulder = 0.5f;

    /** Logistic steepness; higher = sharper transition at the shoulder. */
    float BlendSharpness = 24.0f;

    /** Exponential decay strength of the tail past the shoulder. */
    float TailExponent = 4.0f;

    /** Plateau linear-drift coefficient: plateau(u) = max(0, 1 - EarlyLinearStrength * u). */
    float EarlyLinearStrength = 1.0f;
}

/**
 * Convenience preset: a near-linear curve.
 */
FCrimeAgeDecayParams MakeLinearAgeDecayParams()
{
    FCrimeAgeDecayParams P;
    P.Shoulder = 0.999f;
    P.BlendSharpness = 24.0f;
    P.TailExponent = 0.0f;
    P.EarlyLinearStrength = 1.0f;
    return P;
}

/**
 * Age decay multiplier for u = age/duration in [0, 1). Caller handles u >= 1 via hard expiry.
 */
float ComputeAgeSeverityMultiplier(float NormalizedAge01, FCrimeAgeDecayParams Params)
{
    const float E = 2.718281828459045f;
    float Shoulder = Math::Clamp(Params.Shoulder, 1e-3f, 1.0f - 1e-3f);
    float PlateauMult = Math::Max(0.0f, 1.0f - Params.EarlyLinearStrength * NormalizedAge01);
    float TailDenom = Math::Max(1e-4f, 1.0f - Shoulder);
    float ExcessPastShoulder = Math::Max(0.0f, NormalizedAge01 - Shoulder);
    float ShoulderPlateauValue = Math::Max(0.0f, 1.0f - Params.EarlyLinearStrength * Shoulder);
    float TailMult = ShoulderPlateauValue * Math::Pow(E, -Params.TailExponent * ExcessPastShoulder / TailDenom);
    float Sigma = 1.0f / (1.0f + Math::Pow(E, -Params.BlendSharpness * (NormalizedAge01 - Shoulder)));
    return Math::Max(0.0f, (1.0f - Sigma) * PlateauMult + Sigma * TailMult);
}


UCLASS(Abstract)
class UCrimeDefinition
{
    FGameplayTag CrimeType;
    FGameplayTag CrimeUniquenessTag;
    FGameplayTagContainer MemoryHandlingTags;
    FInGameTime BaseDuration;

    ECrimeDurationType DurationType;
    ECrimeRegistrationMode RegistrationMode;

    float MaximumSeverityWhenForgiven = 4.0f;
    float MaximumSeverityWhenSuppressed = 6.0f;

    ECrimeAffectedEntitySource AffectedEntitySource = ECrimeAffectedEntitySource::Event;

    bool bIsUniquePerVictim = false;
    bool bIsForgivable = true;
    bool bIsSuppressable = true;
    bool bIsForgivableWithoutKnowledge = true;
    bool bAutoForgiveOnEnd = false;
    bool bInvalidWithinPettyFight = false;
    bool bInvalidWithinTrainingFight = false;
    bool bPlayerOnly = false;

    TMap<TSubclassOf<UCrimeSeverityAdditiveModifier>, float> SeverityModifierWeights;
    TMap<TSubclassOf<UCrimeSeverityMultiplicativeModifier>, float> SeverityMultiplierWeights;

    /** When true, AgeDecayOverride replaces the subsystem's DefaultCrimeAgeDecayParams for this crime type. */
    bool bOverrideAgeDecay = false;

    /** Per-crime age decay shape; only consulted when bOverrideAgeDecay is true. */
    FCrimeAgeDecayParams AgeDecayOverride;

    UFUNCTION()
    FInGameTime GetDuration(FCrimeEntry CrimeEntry) const
    {
        return BaseDuration;
    }

    /**
     * Resolve the age-decay shape for this crime. Falls back to the subsystem default
     * when no override is requested.
     */
    UFUNCTION()
    FCrimeAgeDecayParams GetAgeDecayParams(const UCrimeProcessingSubsystem CrimeSubsystem) const
    {
        if (bOverrideAgeDecay)
            return AgeDecayOverride;

        if (IsValid(CrimeSubsystem))
            return CrimeSubsystem.DefaultCrimeAgeDecayParams;

        return FCrimeAgeDecayParams();
    }
}

enum ECrimeDurationType
{
    Continuous,
    Instant,
    Count
}

enum ECrimeRegistrationMode
{
    FromCriminal,
    FromWitness,
    FromVictim,
    FromEvent,
    Count
}

UCLASS()
class UCrimeDefinition_Murder : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Murder;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_SingleEntryPerVictim);
    default BaseDuration = FInGameTime::FromDays(1.0f);

    default bIsUniquePerVictim = true;
    default CrimeUniquenessTag = GameplayTag::Crime_Murder;
    default bIsForgivableWithoutKnowledge = false;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_CrimeDirectness, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 10.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 10.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Bad, 8.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_Reverse, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Assault_Weapon : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Assault_Weapon;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_SingleEntryPerVictim);
    default BaseDuration = FInGameTime::FromHours(21.0f);

    default bIsUniquePerVictim = true;
    default CrimeUniquenessTag = GameplayTag::Crime_Assault;
    default bIsForgivableWithoutKnowledge = false;
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_Reverse, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Assault_Fists : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Assault_Fists;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_SingleEntryPerVictim);
    default BaseDuration = FInGameTime::FromHours(21.0f);

    default bIsUniquePerVictim = true;
    default CrimeUniquenessTag = GameplayTag::Crime_Assault;
    default bIsForgivableWithoutKnowledge = false;
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 8.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_Reverse, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_ThreateningWeaponDrawn : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_ThreateningWeaponDrawn;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;
    default AffectedEntitySource = ECrimeAffectedEntitySource::Area;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_FistsDrawn : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_FistsDrawn;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;
    default AffectedEntitySource = ECrimeAffectedEntitySource::Area;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Bad, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_DirectThreat_Weapon : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_DirectThreat_Weapon;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(2.0f);
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.75f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_DirectThreat_Fists : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_DirectThreat_Fists;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(2.0f);
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Bad, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.75f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendly_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_ThreateningWeaponTooClose : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_ThreateningWeaponTooClose;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_FistsTooClose : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_FistsTooClose;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);
    default bInvalidWithinPettyFight = true;
    default bInvalidWithinTrainingFight = true;

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_DirectThreat_Weapon : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_DirectThreat_Weapon;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_DirectThreat_Fists : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_DirectThreat_Fists;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_WeaponDrawn : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_WeaponDrawn;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_FistsDrawn : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_FistsDrawn;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_Trespassing : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_Trespassing;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromMinutes(10.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_Lockpicking : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_Lockpicking;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_IgnoredWarning_Interaction : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_IgnoredWarning_Interaction;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(2.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_BlockingPath : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_BlockingPath;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default BaseDuration = FInGameTime::FromHours(1.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 0.25f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsFriendlySameRank_Nullify, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalOutranksWitness_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Pickpocket_Success : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Pickpocket_Success;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(30.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 4.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    //default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Pickpocket_Fail : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Pickpocket_Fail;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(5.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    //default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

class UCrimeDefinition_Theft : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Theft;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(30.0f);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 5.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_CrimeDirectness, 0.5f);
    // default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 4.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 4.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 2.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_ItemValue, 1.0f);

    /// Theft of a generic item
    /**
       Duration based on value, 
       never demand return of the item, 
       loot multiple of the value off the thief when defeated
     */

    float MaximumDuration = 72.0f;
    float MinimumDuration = 12.0f;
    float HighCutoffValue = 250.0f;
    float LowCutoffValue = 10.0f; 

    default AffectedEntitySource = ECrimeAffectedEntitySource::Item;

    FInGameTime GetDuration(FCrimeEntry CrimeEntry) const override
    {
        const UItemDefinition ItemDefinition = CrimeEntry.ItemDefinitionClass.DefaultObject;
        if (!IsValid(ItemDefinition))
            return FInGameTime::FromHours(MinimumDuration);

        if (ItemDefinition.m_Value >= HighCutoffValue)
            return FInGameTime::FromHours(MaximumDuration);

        if (ItemDefinition.m_Value <= LowCutoffValue)
            return FInGameTime::FromHours(MinimumDuration);
        
        float ValueRatio = Math::Loge(ItemDefinition.m_Value / LowCutoffValue) / Math::Loge(HighCutoffValue / LowCutoffValue);
        float FinalDuration = MinimumDuration + (MaximumDuration - MinimumDuration) * ValueRatio;
        return FInGameTime::FromHours(FinalDuration);
    }
}

UCLASS()
class UCrimeDefinition_Interaction : UCrimeDefinition
{
    /// Interact with an interactable in general
    /**
     * Warning state, attack on high severity
     */

    default CrimeType = GameplayTag::Crime_Interaction;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default bAutoForgiveOnEnd = true;

    default BaseDuration = FInGameTime::FromHours(5.0f);

    default AffectedEntitySource = ECrimeAffectedEntitySource::Interactable;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 4.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_CrimeDirectness, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 4.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 4.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_OnlyRelevantToEnforcers, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Lockpicking : UCrimeDefinition
{
    /// Use of lockpicks to break into an owned locked chest
    /**
     * Warning state, attack on high severity
     */

    default CrimeType = GameplayTag::Crime_Lockpicking;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default bAutoForgiveOnEnd = true;

    default BaseDuration = FInGameTime::FromHours(5.0f);

    default AffectedEntitySource = ECrimeAffectedEntitySource::Interactable;

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 4.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_CrimeDirectness, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 4.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 4.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Crime_Trespassing : UCrimeDefinition
{
    /// Trespassing on a restricted region volume
    default CrimeType = GameplayTag::Crime_Trespassing;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default bAutoForgiveOnEnd = true;

    default BaseDuration = FInGameTime::FromHours(2.0f);
    default AffectedEntitySource = ECrimeAffectedEntitySource::Area;

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

UCLASS()
class UCrimeDefinition_Creeping : UCrimeDefinition
{
    /// Crouching inside a settlement area, treated as suspicious behaviour.
    default CrimeType = GameplayTag::Crime_Creeping;
    default DurationType = ECrimeDurationType::Continuous;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim;

    default bAutoForgiveOnEnd = true;

    default BaseDuration = FInGameTime::FromHours(1.0f);
    default AffectedEntitySource = ECrimeAffectedEntitySource::Event;

    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_NoSyncronizing_BlockEverything);

    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_VictimIsSelfPersonally, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsCriminal, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelationshipTowardsVictim_Good, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_Protect, 1.0f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsCriminal, 0.5f);
    default SeverityModifierWeights.Add(UCrimeSeverityModifier_Add_RelativeRankTowardsVictim, 0.5f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Forgiven, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_Suppressed, 1.0f);
}

////////////////////////////////////

UCLASS()
class UCrimeDefinition_DefeatedAgain : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_DefeatedAgain;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default bPlayerOnly = true;
    default BaseDuration = FInGameTime::FromHours(2.0f);
}

UCLASS()
class UCrimeDefinition_Defeated : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Defeated;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal;

    default BaseDuration = FInGameTime::FromHours(48.0f);
}

///////////////////////////////////
// ANTI CRIMES
///////////////////////////////////

UCLASS()
class UCrimeDefinition_AntiCrime_Defeated_Self : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Anti_Defeated_Self;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromVictim; // Victim is the forgiver / the loser

    default BaseDuration = FInGameTime::FromHours(48.0f);
}

UCLASS()
class UCrimeDefinition_AntiCrime_Defeated_Other : UCrimeDefinition
{
    default CrimeType = GameplayTag::Crime_Anti_Defeated_Other;
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromCriminal; // Victim is the forgiver / the winner

    default BaseDuration = FInGameTime::FromHours(48.0f);
}