
UCLASS()
class UCharacterDefinition_Creature_Molerat : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Molerat;
	default m_Species = GameplayTag::Species_Creature_Molerat;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
	default m_AbilitiesEffect = UGE_Molerat_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Molerat_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Molerat::StaticClass();
    
	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Molerat::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UMoleratJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Muttonraw::StaticClass(), 1, EInventoryTypes::MainContainer);
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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 5);
	default SetAttributeValue("AttributeSet_Strength.Strength", 8);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 8);
    default SetAttributeValue("AttributeSet_Health.Health", 35); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 35);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 15);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 15);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 8);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 8);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 5);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 5);
	// protection[PROT_FLY] = 0;

    default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 40);
	
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

	default m_AIAbility = UGameplayAbility_CharacterAI_Molerat::StaticClass();
    default m_UniqueName = n"Molerat";
}