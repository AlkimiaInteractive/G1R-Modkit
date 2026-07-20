
UCLASS()
class UCharacterDefinition_Creature_Scavenger_Young : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Scavenger_Young;
	default m_Species = GameplayTag::Species_Creature_Scavenger_Young;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Small;
    
    default m_AbilitiesEffect = UGE_Scavenger_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Scavenger_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Scavenger::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Scavenger::StaticClass());


	 // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UScavengerJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItFo_Whitemeat::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Scavenger_01::StaticClass(), 2, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Scavenger_02::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = UScavengerYoungCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 10.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 4);
	default SetAttributeValue("AttributeSet_Strength.Strength", 6);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 6);
    default SetAttributeValue("AttributeSet_Health.Health", 30); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 30);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 12);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 12);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 8);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 8);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 6);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 1);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 1);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 1);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 1);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 40);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Scavenger::StaticClass();
    default m_UniqueName = n"ScavengerYoung";
}