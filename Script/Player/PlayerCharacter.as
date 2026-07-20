UCLASS(Abstract)
class UPlayerCharacterVisualsDefinition : UArmorVisualsDefinition
{
    default m_MutableAsset = "MO_Player";
    default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";

    default m_CharacterVisualFeatures = UVisualFeatures_Player::StaticClass(); 
}

UCLASS()
class UPlayerOneCharacterVisualsDefinition : UPlayerCharacterVisualsDefinition
{
    UPROPERTY()
    FString Clothes = "NH_BaseCloth";

    UPROPERTY()
    FString Hair = "Hair_05";
}

UCLASS()
class UPlayerTwoCharacterVisualsDefinition : UPlayerCharacterVisualsDefinition
{
    UPROPERTY()
    FString Clothes = "Shadow";
}

UCLASS()
class UPlayerThreeCharacterVisualsDefinition : UPlayerCharacterVisualsDefinition
{
    UPROPERTY()
    FString Clothes = "LightNovice";
}

UCLASS()
class UPlayerFourCharacterVisualsDefinition : UPlayerCharacterVisualsDefinition
{
    UPROPERTY()
    FString Clothes = "Templar";
}

UCLASS()
class UPlayerFiveCharacterVisualsDefinition : UPlayerCharacterVisualsDefinition
{
    UPROPERTY()
    FString Clothes = "HeavyMercenary";
}

UCLASS()
class UCommonPlayerDefinition : UCharacterDefinition
{

    default m_CharacterType = GameplayTag::AIAgent_Human;
    default m_Species = GameplayTag::Species_Human;
    /*default m_MutableAsset = "MO_Characters";
    default m_MutableAssetPath = "/Game/Assets/Characters/Humans/Mutables/";
    default m_GTOAssetPath = "/Game/Assets/Characters/GTO/";*/
    
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Human_HighPriority::StaticClass();
    default m_CharacterSizeGroup = GameplayTag::Character_Size_Humanoid;

    default m_InitialGuildEffect = UGE_Guild_None::StaticClass();

    default SetAttributeValue("AttributeSet_Health.Health", 40); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 40);
    default SetAttributeValue("AttributeSet_Health.RecoveryRatePerHourOfSleep", 0.125f);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 0);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 0);
    default SetAttributeValue("AttributeSet_Mana.Mana", 5);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 5);
    default SetAttributeValue("AttributeSet_Mana.RecoveryRatePerHourOfSleep", 0.125f);
    default SetAttributeValue("AttributeSet_Movement.SpeedModifier", 1);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 10);
    default SetAttributeValue("AttributeSet_Strength.Strength", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.Toughness", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.MinToughness", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.MaxToughness", 120);
    default SetAttributeValue("AttributeSet_LevelProgression.MaxLevel", 36);
    default SetAttributeValue("AttributeSet_LevelProgression.PowerCurve", 0.75f);
    default SetAttributeValue("AttributeSet_LevelProgression.MaxEncumbranceLevel", 3);
    default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45); 
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);
    default SetAttributeValueForTag("AttributeSet_Oxygen.Oxygen", 150, GameplayTag::Skill_Diving_Trained); 
    default SetAttributeValueForTag("AttributeSet_Oxygen.MaxOxygen", 150, GameplayTag::Skill_Diving_Trained); 
    default SetAttributeValueForTag("AttributeSet_Oxygen.OxygenRecoveryRate", 15, GameplayTag::Skill_Diving_Trained);
    default SetAttributeValue("AttributeSet_Sleep.SleepTime", 8);
    default SetAttributeValue("AttributeSet_Sleep.MaxSleepTime", 8);
    default SetAttributeValue("AttributeSet_Sleep.SleepTimeRecoveryAmount", 0.5f);
    default SetAttributeValue("AttributeSet_Sleep.SleepTimeRecoveryPeriod", 1);
    default SetAttributeValue("AttributeSet_Sleep.MaxRestTime", 24);

    default SetAttributeValue("AttributeSet_Lockpicking.LockpickDurability",        0);
    default SetAttributeValue("AttributeSet_Lockpicking.LockpickPrecision",         0);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickDurability",  2, GameplayTag::Skill_Lockpicking_Untrained);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickPrecision",   0, GameplayTag::Skill_Lockpicking_Untrained);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickDurability",  4, GameplayTag::Skill_Lockpicking_Trained);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickPrecision",   1, GameplayTag::Skill_Lockpicking_Trained);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickDurability",  6, GameplayTag::Skill_Lockpicking_Master);
    default SetAttributeValueForTag("AttributeSet_Lockpicking.LockpickPrecision",   2, GameplayTag::Skill_Lockpicking_Master);
    default SetAttributeValue("AttributeSet_Pickpocketing.PickPocketing", -30);
    default SetAttributeValueForTag("AttributeSet_Pickpocketing.PickPocketing", -30,  GameplayTag::Skill_Pickpocketing_Untrained);
    default SetAttributeValueForTag("AttributeSet_Pickpocketing.PickPocketing", -10, GameplayTag::Skill_Pickpocketing_Trained);
    default SetAttributeValueForTag("AttributeSet_Pickpocketing.PickPocketing", 10, GameplayTag::Skill_Pickpocketing_Master);

    default SetAttributeValue("AttributeSet_Alcohol.Alcohol", 0); 
    default SetAttributeValue("AttributeSet_Alcohol.MaxAlcohol", 200);
    default SetAttributeValue("AttributeSet_Alcohol.AlcoholDepletionRate", 1);

    default SetAttributeValue("AttributeSet_Swampweed.Swampweed", 0); 
    default SetAttributeValue("AttributeSet_Swampweed.MaxSwampweed", 200);
    default SetAttributeValue("AttributeSet_Swampweed.SwampweedDepletionRate", 1);

    default m_CueData.Add(GameplayTag::Debuff_Sleep, UCueVisualConfig_Sleep_Human::StaticClass());
    default m_CueData.Add(GameplayTag::Debuff_Charm, UCueVisualConfig_Charm_Human::StaticClass());
    default m_CueData.Add(GameplayTag::Debuff_Electrified, UCueVisualConfig_Electrified_Human::StaticClass());
    default m_CueData.Add(GameplayTag::GameplayCue_Debuff_Pyrokinesis, UCueVisualConfig_Pyrokinesis_Human::StaticClass());
    //default m_CueData.Add(GameplayTag::Debuff_Unconscious, UCueVisualConfig_Control_Human::StaticClass());
    default m_CueData.Add(GameplayTag::GameplayCue_State_CasterTransformed, UCueVisualConfig_Transformed_Human::StaticClass());

    default m_KnownRecipes.Add(UReFo_Mutton_01::StaticClass());
    default m_KnownRecipes.Add(UReFo_Grilledscavenger::StaticClass());

    FGameplayTagContainer meleeSlotItemCategories;
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Axe);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Staff);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Fist);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Tail);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_PickaxeDemo);
    default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Orc_TwoHand);
    default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

    FGameplayTagContainer rangedSlotItemCategories;
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Bow);
    default rangedSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Crossbow);
    default CreateInventory(EInventoryTypes::RangedSlot, rangedSlotItemCategories, 1);

    FGameplayTagContainer quickSlotItemCategories;
    default quickSlotItemCategories.AddTag(GameplayTag::Item);
    default CreateInventory(EInventoryTypes::QuickItems, quickSlotItemCategories, 10);

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

   
    default AddToInventory(UHumanFist_NoWeapon::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventory(UHumanFist_NoWeapon_Climbing::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    //default AddToInventory(UItKe_Lockpick::StaticClass(), 10);

    default m_AbilitiesEffect = UGE_Player_Definition::StaticClass();

    //default m_Skills.Add(UGE_Skill_Hunting_Skin_Trained::StaticClass());
    //default m_Skills.Add(UGE_Skill_Hunting_Teeth_Trained::StaticClass());

    //default m_Skills.Add(UGE_Skill_Wallclimbing::StaticClass());

    default m_Skills.Add(UGE_Skill_Picklock_Untrained::StaticClass());
    //default m_Skills.Add(UGE_Skill_Picklock_Skilled::StaticClass()); 
    //default m_Skills.Add(UGE_Skill_Picklock_Master::StaticClass());

    default m_Skills.Add(UGE_Skill_Pickpocket_Untrained::StaticClass());
    //default m_Skills.Add(UGE_Skill_Pickpocket_Skilled::StaticClass()); 
    //default m_Skills.Add(UGE_Skill_Pickpocket_Master::StaticClass());

    default m_Skills.Add(UGE_Skill_Orcish_Untrained::StaticClass());

    default m_Skills.Add(UGE_Skill_Ranged_Bow_Untrained::StaticClass());
    default m_Skills.Add(UGE_Skill_Ranged_Crossbow_Untrained::StaticClass());
    default m_Skills.Add(UGE_Skill_Mage_Circle_Untrained::StaticClass());

    default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 2.0f;
    default m_SuperArmorParams.m_StartRegenerateSc = 2.0f;
    default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
    default m_OnParriedDamageMultiplier = 1.5f;

    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);

    default m_Blood = UPlayerBloodConfig::StaticClass();
}

UCLASS()
class UG1RPlayer : UCommonPlayerDefinition
{
    default m_UniqueName = n"hero";

    //default m_MutableAsset = "MO_Player";

    default m_CharacterVisualsDefinition = UPlayerOneCharacterVisualsDefinition::StaticClass();
    default m_VoiceLinesOf.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice01_Hero));

    // default AddToInventory(UGrd_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);
    // default AddToInventory(UCrw_Armor_H::StaticClass());
    // default AddToInventory(UDmb_Armor_M::StaticClass());
    // default AddToInventory(UEbr_Armor_H_01::StaticClass());
    // default AddToInventory(UEbr_Armor_H_02::StaticClass());
    // default AddToInventory(UEbr_Armor_M::StaticClass());
    // default AddToInventory(UGrd_Armor::StaticClass());
    // default AddToInventory(UGur_Armor_H::StaticClass());
    // default AddToInventory(UGur_Armor_M::StaticClass());
    // default AddToInventory(UKdf_Armor_H::StaticClass());
    // default AddToInventory(UKdf_Armor_L::StaticClass());
    // default AddToInventory(UKdw_Armor_H::StaticClass());
    // default AddToInventory(UKdw_Armor_L::StaticClass());
    // default AddToInventory(ULaw_Armor::StaticClass());
    // default AddToInventory(UNov_Armor::StaticClass());
    default AddToInventory(UItWr_Scroll_Letter_01::StaticClass());
    // default AddToInventory(UOre_Armor_H::StaticClass());
    // default AddToInventory(UOre_Armor_M::StaticClass());
    // default AddToInventory(UOrg_Armor::StaticClass());
    // default AddToInventory(URyl_Armor::StaticClass());
    // default AddToInventory(USfb_Armor_L::StaticClass());
    // default AddToInventory(USld_Armor::StaticClass());
    // default AddToInventory(UStt_Armor::StaticClass());
    // default AddToInventory(UTpl_Armor::StaticClass());
    // default AddToInventory(UVlk_Armor_L::StaticClass());
    // default AddToInventory(UVlk_Armor_M::StaticClass());

    ///QA PRESET
    //default AddToInventory(UQA_Armor::StaticClass());
    //default AddToInventory(UItRw_Bow_QA::StaticClass());
    //default AddToInventory(UItMw_1H_Sword_QA::StaticClass());
    //default AddToInventory(UItAm_Arrow::StaticClass(), 50, EInventoryTypes::MainContainer); 
    //END OF QA PRESET
}



UCLASS()
class UGR2Player : UCommonPlayerDefinition
{
    default m_UniqueName = n"heroTwo";

    default m_CharacterVisualsDefinition = UPlayerTwoCharacterVisualsDefinition::StaticClass();

    default SetAttributeValue("AttributeSet_Health.Health", 4000); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 4000);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 10);
    default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 15);
    default SetAttributeValue("AttributeSet_Strength.Strength", 15);

    default AddToInventory(UKdw_Armor_H::StaticClass(),1,EInventoryTypes::ArmorSlot);
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);

    default AddToInventory(USword2H_TestWeapon_Short::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 3, EInventoryTypes::QuickItems); //6
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 3, EInventoryTypes::QuickItems); //7
    default AddToInventory(UItAr_Rune_IceWave::StaticClass(), 1, EInventoryTypes::QuickItems); //8
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1, EInventoryTypes::QuickItems); //9
    default AddToInventory(UItAr_Rune_BallLightning::StaticClass(), 1, EInventoryTypes::QuickItems); //0
    default AddToInventory(UItAm_Arrow::StaticClass(), 50);
    default AddToInventory(UItAr_Rune_FireBolt::StaticClass());

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
}

UCLASS()
class UGR3Player : UCommonPlayerDefinition
{
    default m_UniqueName = n"heroThree";    
    default m_CharacterVisualsDefinition = UPlayerThreeCharacterVisualsDefinition::StaticClass();

    
    default SetAttributeValue("AttributeSet_Health.Health", 4000); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 4000);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 10);
    default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 15);
    default SetAttributeValue("AttributeSet_Strength.Strength", 15);

    default AddToInventory(UStt_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);

    default AddToInventory(USword2H_TestWeapon_Short::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 3, EInventoryTypes::QuickItems); //6
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 3, EInventoryTypes::QuickItems); //7
    default AddToInventory(UItAr_Rune_IceWave::StaticClass(), 1, EInventoryTypes::QuickItems); //8
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1, EInventoryTypes::QuickItems); //9
    default AddToInventory(UItAr_Rune_BallLightning::StaticClass(), 1, EInventoryTypes::QuickItems); //0
    default AddToInventory(UItAm_Arrow::StaticClass(), 50);
    default AddToInventory(UItAr_Rune_FireBolt::StaticClass());

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
}

UCLASS()
class UGR4Player : UCommonPlayerDefinition
{
    default m_UniqueName = n"heroFour";
    default m_CharacterVisualsDefinition = UPlayerFourCharacterVisualsDefinition::StaticClass();

    
    default SetAttributeValue("AttributeSet_Health.Health", 4000); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 4000);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 10);
    default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 15);
    default SetAttributeValue("AttributeSet_Strength.Strength", 15);

    default AddToInventory(USld_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);

    default AddToInventory(USword2H_TestWeapon_Short::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 3, EInventoryTypes::QuickItems); //6
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 3, EInventoryTypes::QuickItems); //7
    default AddToInventory(UItAr_Rune_IceWave::StaticClass(), 1, EInventoryTypes::QuickItems); //8
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1, EInventoryTypes::QuickItems); //9
    default AddToInventory(UItAr_Rune_BallLightning::StaticClass(), 1, EInventoryTypes::QuickItems); //0
    default AddToInventory(UItAm_Arrow::StaticClass(), 50);
    default AddToInventory(UItAr_Rune_FireBolt::StaticClass());

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
}

UCLASS()
class UGR5Player : UCommonPlayerDefinition
{
    default m_UniqueName = n"heroFive";
    default m_CharacterVisualsDefinition = UPlayerFiveCharacterVisualsDefinition::StaticClass();

    default SetAttributeValue("AttributeSet_Health.Health", 4000); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 4000);
    default SetAttributeValue("AttributeSet_LevelProgression.Level", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.Experience", 10);
    default SetAttributeValue("AttributeSet_LevelProgression.SkillPoints", 10);
    default SetAttributeValue("AttributeSet_Mana.Mana", 500);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 500);
    default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 15);
    default SetAttributeValue("AttributeSet_Strength.Strength", 15);

    default AddToInventory(UNov_Armor::StaticClass(),1,EInventoryTypes::ArmorSlot);
    
    default AddToInventory(UItRw_Bow_Small_01::StaticClass(), 1, EInventoryTypes::RangedSlot);

    default AddToInventory(USword2H_TestWeapon_Short::StaticClass(), 1, EInventoryTypes::QuickItems); //4
    default AddToInventory(UItAr_Rune_FireBall::StaticClass(), 1, EInventoryTypes::QuickItems); //5
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 3, EInventoryTypes::QuickItems); //6
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 3, EInventoryTypes::QuickItems); //7
    default AddToInventory(UItAr_Rune_IceWave::StaticClass(), 1, EInventoryTypes::QuickItems); //8
    default AddToInventory(UItAr_Rune_IceBlock::StaticClass(), 1, EInventoryTypes::QuickItems); //9
    default AddToInventory(UItAr_Rune_BallLightning::StaticClass(), 1, EInventoryTypes::QuickItems); //0
    default AddToInventory(UItAm_Arrow::StaticClass(), 50);
    default AddToInventory(UItAr_Rune_FireBolt::StaticClass());

    default m_Skills.Add(UGE_Skill_Melee_OneHanded_Master::StaticClass());
    default m_Skills.Add(UGE_Skill_Melee_TwoHanded_Master::StaticClass());
}