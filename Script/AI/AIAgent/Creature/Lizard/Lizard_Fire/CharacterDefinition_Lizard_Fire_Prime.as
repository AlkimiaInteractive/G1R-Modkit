UCLASS()
class UCharacterDefinition_Creature_Lizard_Fire_Prime : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Lizard_Fire;
	default m_Species = GameplayTag::Species_Creature_Lizard;

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
    default AddToInventory(UItAt_Firelizard_05::StaticClass(), 1, EInventoryTypes::MainContainer);
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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 60);
	default SetAttributeValue("AttributeSet_Strength.Strength", 120);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 100);
    default SetAttributeValue("AttributeSet_Health.Health", 700); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 700);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 400);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 400);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 70);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 70);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 65);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 9999);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 50);
	// protection[PROT_FLY] = 0;
	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 1000);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Lizard_Fire_Prime::StaticClass();
    default m_UniqueName = n"LizardFirePrime";	
}