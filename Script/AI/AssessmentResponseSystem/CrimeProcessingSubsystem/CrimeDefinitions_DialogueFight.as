UCLASS(Abstract)
class UCrimeDefinition_DialogueFight : UCrimeDefinition
{
    default DurationType = ECrimeDurationType::Instant;
    default RegistrationMode = ECrimeRegistrationMode::FromEvent;

    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_SingleEntryPerVictim);    
    default BaseDuration = FInGameTime::FromHours(2.0f);

    default bIsUniquePerVictim = true;
    default CrimeUniquenessTag = GameplayTag::Crime_Dialogue_RealFight;

    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_RelationshipTowardsVictim_NullifyOnNonFriendlyNonProtected, 1.0f);
    default SeverityMultiplierWeights.Add(UCrimeSeverityModifier_Mult_CriminalIsPartyMember_Nullify, 1.0f);
}

UCLASS(Abstract)
class UCrimeDefinition_DialogueRealFight : UCrimeDefinition_DialogueFight
{
    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_NoSyncronizing_BlockPathwaysOnly);
}

////// REAL FIGHT | FISTS | LOOT
UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_Loot_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_Loot_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_Loot_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_Loot_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_Loot_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// REAL FIGHT | FISTS | NO POST ACTIONS
UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_NoPostActions_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_NoPostActions_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// REAL FIGHT | FISTS | TO DEATH
UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_ToDeath_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_ToDeath_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_ToDeath_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Fists_ToDeath_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Fists_ToDeath_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsForgivable = false;
    default bIsSuppressable = false;
}

////// REAL FIGHT | WEAPON | LOOT
UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_Loot_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_Loot_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_Loot_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_Loot_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_Loot_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// REAL FIGHT | WEAPON | NO POST ACTIONS
UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_NoPostActions_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_NoPostActions_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// REAL FIGHT | WEAPON | TO DEATH
UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_RegularDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_MinimalDuration : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_UntilDefeated : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialogueRealFight_Weapon_ToDeath_Permanent : UCrimeDefinition_DialogueRealFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_RealFight_Weapon_ToDeath_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsForgivable = false;
    default bIsSuppressable = false;
}

UCLASS(Abstract)
class UCrimeDefinition_DialoguePettyFight : UCrimeDefinition_DialogueFight
{
    default MemoryHandlingTags.AddTag(GameplayTag::Memory_Crime_NoSyncronizing_BlockEverything);
}

////// PETTY FIGHT | FISTS | LOOT
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_Loot_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_Loot_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_Loot_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_Loot_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_Loot_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// PETTY FIGHT | FISTS | NO POST ACTIONS
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_NoPostActions_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_NoPostActions_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// PETTY FIGHT | FISTS | TO DEATH
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Fists_ToDeath_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Fists_ToDeath_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsForgivable = false;
    default bIsSuppressable = false;
}

////// PETTY FIGHT | WEAPON | LOOT
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_Loot_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_Loot_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_Loot_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_Loot_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_Loot_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// PETTY FIGHT | WEAPON | NO POST ACTIONS
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_NoPostActions_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_NoPostActions_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsSuppressable = false;
}

////// PETTY FIGHT | WEAPON | TO DEATH
UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_RegularDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_RegularDuration;
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_MinimalDuration : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_MinimalDuration;
    default BaseDuration = FInGameTime::FromMinutes(10.0f);
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_UntilDefeated : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_UntilDefeated;
    default BaseDuration = FInGameTime::Infinite();
}

UCLASS()
class UCrimeDefinition_DialoguePettyFight_Weapon_ToDeath_Permanent : UCrimeDefinition_DialoguePettyFight
{
    default CrimeType = GameplayTag::Crime_Dialogue_PettyFight_Weapon_ToDeath_Permanent;
    default BaseDuration = FInGameTime::Infinite();
    default bIsForgivable = false;
    default bIsSuppressable = false;
}