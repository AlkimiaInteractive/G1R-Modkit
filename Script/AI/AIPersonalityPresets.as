
// Weapon
UCLASS()
class UGothicCharacterPersonality_Archer : UGothicCharacterPersonality
{
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);    
}

UCLASS()
class UGothicCharacterPersonality_Warrior : UGothicCharacterPersonality
{
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);
}

UCLASS()
class UGothicCharacterPersonality_Mage : UGothicCharacterPersonality
{
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);
}

// Brave weapons
UCLASS()
class UGothicCharacterPersonality_Brave_Archer : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Warrior : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Mage : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Archer_Patient : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Patient);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Warrior_Patient : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Patient);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Mage_Patient : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Patient);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);
}


// Bravery
UCLASS()
class UGothicCharacterPersonality_Brave : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Patient : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Patient);
}

UCLASS()
class UGothicCharacterPersonality_Coward : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);
}

// Outcast
UCLASS()
class UGothicCharacterPersonality_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UGothicCharacterPersonality_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);
}

// Brave outcast
UCLASS()
class UGothicCharacterPersonality_Brave_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
}

// Brave weapon outcast
UCLASS()
class UGothicCharacterPersonality_Brave_Archer_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);    
}

UCLASS()
class UGothicCharacterPersonality_Brave_Archer_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Archer_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 1.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);    
}

UCLASS()
class UGothicCharacterPersonality_Brave_Warrior_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Warrior_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Warrior_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.5f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Mage_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Mage_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Brave_Mage_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 1.5f);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
}

// Coward Outcast
UCLASS()
class UGothicCharacterPersonality_Coward_Outcast_All : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_All);
}

UCLASS()
class UGothicCharacterPersonality_Coward_Outcast_OldCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
}

UCLASS()
class UGothicCharacterPersonality_Coward_Outcast_NewCamp : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);

    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
}

UCLASS()
class UGothicCharacterPersonality_NoRanged : UGothicCharacterPersonality
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);

    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Bow, 0.01f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Crossbow, 0.01f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Rune, 0.01f);
    default WeaponPreferenceByType.Add(GameplayTag::Item_Weapon_Scroll, 0.01f);
}

UCLASS()
class UGothicCharacterPersonality_NoRanged_Brave : UGothicCharacterPersonality_NoRanged
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Brave);
}

UCLASS()
class UGothicCharacterPersonality_NoRanged_Coward : UGothicCharacterPersonality_NoRanged
{
    default OwnedPersonalityTags.AddTag(GameplayTag::Character_Personality_Coward);
}