
UCLASS()
class UCharacterDefinition_Creature_Wolf : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Wolf_Normal;
	default m_Species = GameplayTag::Species_Creature_Wolf;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
   	default m_AbilitiesEffect = UGE_Wolf_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Wolf_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Wolf::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Wolf::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UWolfJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Wolf_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Wolf_02::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Wolf_03::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);
	
	// Other
    default m_CameraConfig = UWolfCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 9);
	default SetAttributeValue("AttributeSet_Strength.Strength", 40);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 40);
    default SetAttributeValue("AttributeSet_Health.Health", 80); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 80);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 30);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 30);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 20);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 90);

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(1, 0, 0);
	//

    default m_AIAbility = UGameplayAbility_CharacterAI_Wolf::StaticClass();
    default m_UniqueName = n"Wolf";
}


UCLASS()
class UCharacterDefinition_Creature_Wolf_Alpha : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Wolf_Alpha;
	default m_Species = GameplayTag::Species_Creature_Wolf;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
   	default m_AbilitiesEffect = UGE_Wolf_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Wolf_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Wolf_Alpha::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Wolf::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UWolfJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Wolf_01::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Wolf_02::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Wolf_03::StaticClass(), 4, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);
	
	// Other
    default m_CameraConfig = UWolfCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 29);
	default SetAttributeValue("AttributeSet_Strength.Strength", 110);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 40);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 130);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 130);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 30);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 25);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 290);

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(1, 0, 0);
	//

    default m_AIAbility = UGameplayAbility_CharacterAI_Wolf_Alpha::StaticClass();
    default m_UniqueName = n"Tundra Wolf";
}