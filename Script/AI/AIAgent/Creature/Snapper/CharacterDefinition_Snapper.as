
UCLASS()
class UCharacterDefinition_Creature_Snapper : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Snapper;
	default m_Species = GameplayTag::Species_Creature_Snapper;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Medium;
    
    default m_AbilitiesEffect = UGE_Snapper_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Snapper_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Snapper::StaticClass();

    default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Snapper::StaticClass());

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(USnapperJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Snapper_01::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Snapper_02::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);


    // Other
    default m_CameraConfig = UScavengerAdultCamera::StaticClass();

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 22);
	default SetAttributeValue("AttributeSet_Strength.Strength", 110);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 80);
    default SetAttributeValue("AttributeSet_Health.Health", 240); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 240);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 40);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 20);
	// protection[PROT_FLY] = 10;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 220);

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

    default m_AIAbility = UGameplayAbility_CharacterAI_Snapper::StaticClass();
    default m_UniqueName = n"Snapper";
}

