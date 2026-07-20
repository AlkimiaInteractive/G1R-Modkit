
UCLASS()
class UCharacterDefinition_Creature_ShadowBeast : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_ShadowBeast;
	default m_Species = GameplayTag::Species_Creature_Shadowbeast;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_ShadowBeast_AI::StaticClass();
    default m_OnPlayerEffect = UGE_ShadowBeast_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Shadowbeast::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_ShadowBeast::StaticClass());
    
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UShadowBeastWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItFo_Muttonraw::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_03::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_04::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UShadowBeastCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 30.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 40);
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 110);
    default SetAttributeValue("AttributeSet_Health.Health", 400); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 400);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 180);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 180);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 80);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 80);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// // protection[PROT_FLY] = 100;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 400);

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_ShadowBeast::StaticClass();
    default m_UniqueName = n"ShadowBeast";
}

UCLASS()
class UCharacterDefinition_Creature_ShadowBeast_Prime : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_ShadowBeast;
	default m_Species = GameplayTag::Species_Creature_Shadowbeast;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_ShadowBeast_AI::StaticClass();
    default m_OnPlayerEffect = UGE_ShadowBeast_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Shadowbeast_Prime::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_ShadowBeast::StaticClass());
    
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UShadowBeastWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItFo_Muttonraw::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_05::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_03::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_04::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UShadowBeastCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 30.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	default SetAttributeValue("AttributeSet_LevelProgression.Level", 40);
	default SetAttributeValue("AttributeSet_Strength.Strength", 160);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 800); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 800);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 200);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_ShadowBeastPrime::StaticClass();
    default m_UniqueName = n"ShadowBeastPrime";
}

UCLASS()
class UCharacterDefinition_Creature_ShadowBeast_Frost : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_ShadowBeast;
	default m_Species = GameplayTag::Species_Creature_Shadowbeast;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_ShadowBeast_AI::StaticClass();
    default m_OnPlayerEffect = UGE_ShadowBeast_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Shadowbeast::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_ShadowBeast::StaticClass());
    
	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UShadowBeastWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItFo_Muttonraw::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_06::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_03::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Shadow_04::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UShadowBeastCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 30.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	default SetAttributeValue("AttributeSet_LevelProgression.Level", 40);
	default SetAttributeValue("AttributeSet_Strength.Strength", 160);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 150);
    default SetAttributeValue("AttributeSet_Health.Health", 800); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 800);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 200);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 400);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_ShadowBeastPrime::StaticClass();
    default m_UniqueName = n"ShadowBeastFrost";
}

UCLASS()
class UCharacterDefinition_Creature_ShadowBeast_Cave : UCharacterDefinition_Creature_ShadowBeast
{
    default m_UniqueName = n"ShadowBeastCave";
}

UCLASS()
class UCharacterDefinition_Creature_ShadowBeast_Forest : UCharacterDefinition_Creature_ShadowBeast
{
    default m_UniqueName = n"ShadowBeastForest";
}