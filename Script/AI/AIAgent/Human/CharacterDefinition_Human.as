
// UCLASS()
// class UHumanCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     //default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/Clothes/OC_Guard/MediumGuard/MO_MediumGuard.MO_MediumGuard'";
//     //default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/Clothes/OC_Guard/LightGuard/MO_LightGuard.MO_LightGuard'";
//     //default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/Clothes/OC_Shadow/Shadow/MO_Shadow.MO_Shadow'";

//     //default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/TierA/MO_AllCharacters.MO_AllCharacters'";
//     //default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/Clothes/MO_AllClothes.MO_AllClothes'";
//     default m_CustomizableObject = n"CustomizableObject'/Game/Assets/Characters/Humans/TierA/NH/MO_NH_Head.MO_NH_Head'";
// }

// This is the base class of all human character definition to have at least a minimal setup
UCLASS(abstract)
class UCharacterDefinition_Human : UCharacterDefinition
{
    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_Species = GameplayTag::Species_Human;
    /*default m_MutableAsset = "MO_Characters";
    default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";
    default m_PreBakedSKsPath = "/Game/Assets/Characters/Humans/Prebaked/";*/

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;
    default m_Blood = UHumanBlood::StaticClass();

 	//default m_CharacterVisualsDefinition = UHumanCharacterVisualsDefinition::StaticClass();
    
    default m_AbilitiesEffect = UGE_Human_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Human_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human::StaticClass();
	
    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();

    // Initial character attributes values
    default SetAttributeValue("AttributeSet_Health.Health", 100);
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 100);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 60);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 60);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 1);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
    default SetAttributeValue("AttributeSet_Mana.Mana", 999);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 999);
    default SetAttributeValue("AttributeSet_Movement.SpeedModifier", 1);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 25);
    default SetAttributeValue("AttributeSet_Strength.Strength", 1);
    default SetAttributeValue("AttributeSet_Pickpocketing.PickPocketing", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.XPExecutedBounty", 50);
    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 50);

    default SetAttributeValue("AttributeSet_Alcohol.Alcohol", 0); 
    default SetAttributeValue("AttributeSet_Alcohol.MaxAlcohol", 200);
    default SetAttributeValue("AttributeSet_Alcohol.AlcoholDepletionRate", 1);

    default SetAttributeValue("AttributeSet_Swampweed.Swampweed", 0); 
    default SetAttributeValue("AttributeSet_Swampweed.MaxSwampweed", 200);
    default SetAttributeValue("AttributeSet_Swampweed.SwampweedDepletionRate", 1);

    default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

    // Debuffs visuals
    //default m_CueData.Add(GameplayTag::GameplayCue_Debuff_Sleep, UCueVisualConfig_Sleep_Human::StaticClass());
    default m_CueData.Add(GameplayTag::Debuff_Sleep, UCueVisualConfig_Sleep_Human::StaticClass());
    default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    default m_CueData.Add(GameplayTag::Debuff_Electrified, UCueVisualConfig_Electrified_Human::StaticClass());
    default m_CueData.Add(GameplayTag::GameplayCue_Debuff_Pyrokinesis, UCueVisualConfig_Pyrokinesis_Human::StaticClass());
    
    // Inventory
    FGameplayTagContainer meleeSlotItemCategories;
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Axe);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Orc);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Staff);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Fist);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_WatchFight);
    default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    FGameplayTagContainer rangedSlotItemCategories;
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Bow);
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default CreateInventory(EInventoryTypes::RangedSlot, rangedSlotItemCategories, 1);
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1);
    default AddToInventory(UWatchFightWeapon::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // FGameplayTagContainer armorSlotItemCategories;
    // default armorSlotItemCategories.AddTag(GameplayTag::Item_Armor);
    // default CreateInventory(EInventoryTypes::ArmorSlot, armorSlotItemCategories, 1);

   // default AddToInventory(UTemplar_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);

    // default AddToInventory(UItMw_1H_Sword_04::StaticClass(), 1);
    // default AddToInventory(USword2H_TestWeapon_Short::StaticClass(), 1);
    // default AddToInventory(UMace1H_TestWeapon_Short::StaticClass(), 1);

    // Other
    default m_CameraConfig = UDefaultCamera::StaticClass();

    // Skills
    //default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    //default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Bow_Untrained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Untrained::StaticClass());

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

    default m_AIAbility = UGameplayAbility_CharacterAI_Human::StaticClass();
    default m_UniqueName = n"Human";

    default m_Mood = GameplayTag::Expression_Neutral;

    // Default pouch actor class for humans.
    default m_PouchActorClass = n"Blueprint'/Game/InteractiveObjects/Pouch/BP_Pouch.BP_Pouch_C'";
}