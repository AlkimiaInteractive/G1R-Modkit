
UCLASS()
class UCharacterDefinition_Creature_Lizard_Fire : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Lizard_Fire;
	default m_Species = GameplayTag::Species_Creature_Lizard_Fire;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
    default m_AbilitiesEffect = UGE_Lizard_Fire_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Lizard_Fire_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Lizard::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Lizard::StaticClass());

	// Inventory
	// FGameplayTagContainer MeleeSlotItemCategories;
	// default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, MeleeSlotItemCategories, 1);

	default AddToInventory(ULizardJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Lizard_01::StaticClass(), 4, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Firelizard_01::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Firelizard_02::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Firelizard_03::StaticClass(), 1, EInventoryTypes::MainContainer);
    default AddToInventory(UItAt_Firelizard_04::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

     // Other
    default m_CameraConfig = ULizardCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 80);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 80);
    default SetAttributeValue("AttributeSet_Health.Health", 250); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 250);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 60);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 60);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 30);

	default SetAttributeValue("AttributeSet_Oxygen.Oxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.MaxOxygen", 45);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenDepletionRate", 1);
    default SetAttributeValue("AttributeSet_Oxygen.OxygenRecoveryRate", 5);
    default SetAttributeValue("AttributeSet_Oxygen.CriticalLevelPercent", 0.35);

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 200);
	
	// protection[PROT_FLY] = 0;

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Lizard_Fire::StaticClass();
    default m_UniqueName = n"LizardFire";	
}