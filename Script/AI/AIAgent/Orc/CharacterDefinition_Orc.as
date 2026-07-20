




// This is the base class of all human character definition to have at least a minimal setup
UCLASS(Abstract)
class UCharacterDefinition_Orc : UCharacterDefinition
{
	default m_CharacterType = GameplayTag::AIAgent_Orc;
    default m_Species = GameplayTag::Species_Orc;
    
    default m_CharacterSizeGroup = GameplayTag::Character_Size_Orc;
    
    default m_AbilitiesEffect = UGE_Orc_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Orc_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human::StaticClass();

    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();

    /*default m_MutableAsset = "MO_OrcM";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Man/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Orcs/Prebaked/";*/


    // Other
    default m_CameraConfig = UOrcCamera::StaticClass();
	
    // Initial character attributes values
    default SetAttributeValue("AttributeSet_Health.Health", 100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 1);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
    default SetAttributeValue("AttributeSet_Mana.Mana", 25);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 25);
    default SetAttributeValue("AttributeSet_Movement.SpeedModifier", 1);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 25);
    default SetAttributeValue("AttributeSet_Strength.Strength", 100);
    default SetAttributeValue("AttributeSet_Pickpocketing.PickPocketing", 0);

    default SetAttributeValue("AttributeSet_Alcohol.Alcohol", 0); 
    default SetAttributeValue("AttributeSet_Alcohol.MaxAlcohol", 200);
    default SetAttributeValue("AttributeSet_Alcohol.AlcoholDepletionRate", 1);

    default SetAttributeValue("AttributeSet_Swampweed.Swampweed", 0); 
    default SetAttributeValue("AttributeSet_Swampweed.MaxSwampweed", 200);
    default SetAttributeValue("AttributeSet_Swampweed.SwampweedDepletionRate", 1);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 150);
       
    // Inventory
    FGameplayTagContainer meleeSlotItemCategories;
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Axe);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Orc);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Staff);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Fist);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_PickaxeDemo);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Tail);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Foot);
    default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    FGameplayTagContainer rangedSlotItemCategories;
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Bow);
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default CreateInventory(EInventoryTypes::RangedSlot, rangedSlotItemCategories, 1);

    FGameplayTagContainer armorSlotItemCategories;
    default armorSlotItemCategories.AddTag(GameplayTag::Item_Armor);
    default CreateInventory(EInventoryTypes::ArmorSlot, armorSlotItemCategories, 1);

    FGameplayTagContainer ringLeftSlotItemCategories;
    default ringLeftSlotItemCategories.AddTag(GameplayTag::Item_Ring);
    default CreateInventory(EInventoryTypes::RingLeft, ringLeftSlotItemCategories, 1);

    FGameplayTagContainer ringRightSlotItemCategories;
    default ringRightSlotItemCategories.AddTag(GameplayTag::Item_Ring);
    default CreateInventory(EInventoryTypes::RingRight, ringRightSlotItemCategories, 1);

    FGameplayTagContainer amuletSlotItemCategories;
    default amuletSlotItemCategories.AddTag(GameplayTag::Item_Amulet);
    default CreateInventory(EInventoryTypes::RingRight, amuletSlotItemCategories, 1);

    //default AddToInventory(UItRw_Bow_Diego::StaticClass(), 1, EInventoryTypes::RangedSlot);
    // default AddToInventory(UItMw_2H_Axe_Orc_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);
    default AddToInventory(UWatchFightWeapon::StaticClass(), 1);

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	//

    // Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
    //

    // Skills
    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());

    default m_AIAbility = UGameplayAbility_CharacterAI_Orc::StaticClass();
    default m_UniqueName = n"Orc";
}

UCLASS(Abstract)
class UCharacterDefinition_OrcShaman : UCharacterDefinition_Orc
{
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_OrcShaman::StaticClass();
}


UCLASS(Abstract)
class UCharacterDefinition_OrcFemale : UCharacterDefinition_OrcShaman
{
    /*default m_MutableAsset = "MO_OrcF";
    default m_MutableAssetPath = "/Game/Assets/Characters/Orcs/Mutable/Female/";*/
}

UCLASS(Abstract)
class UCharacterDefinition_OrcWorld : UCharacterDefinition_Orc
{
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_OrcUndead::StaticClass();

    // default m_AbilitiesEffect = UGE_OrcUndead_AI::StaticClass();
    // default m_OnPlayerEffect = UGE_OrcUndead_Player::StaticClass();

    //default m_Species = GameplayTag::Species_Creature_Undead_Orc;
    default m_AIAbility = UGameplayAbility_CharacterAI_UndeadOrc;
}

UCLASS(Abstract)
class UCharacterDefinition_OrcUndead : UCharacterDefinition_Orc
{
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_OrcUndead::StaticClass();

    default m_AbilitiesEffect = UGE_OrcUndead_AI::StaticClass();
    default m_OnPlayerEffect = UGE_OrcUndead_Player::StaticClass();

    default m_Species = GameplayTag::Species_Creature_Undead_Orc;
    default m_AIAbility = UGameplayAbility_CharacterAI_UndeadOrc;
}

UCLASS(Abstract)
class UCharacterDefinition_OrcUndead_Varrag : UCharacterDefinition_OrcUndead
{
    default m_Species = GameplayTag::Species_Creature_Undead_Orc_Varrag;
}