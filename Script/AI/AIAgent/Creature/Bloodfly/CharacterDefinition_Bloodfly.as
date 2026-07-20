
UCLASS()
class UCharacterDefinition_Creature_Bloodfly : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Bloodfly;
	default m_Species = GameplayTag::Species_Creature_Bloodfly;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Flying;
    default m_Blood = UCreatureBlood_Yellow::StaticClass();

	default m_AbilitiesEffect = UGE_Bloodfly_AI::StaticClass();
	default m_OnPlayerEffect = UGE_Bloodfly_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Bloodfly::StaticClass();
	
	
	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Bloodfly::StaticClass());

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories,1);

	default AddToInventory(UBloodflySting::StaticClass(), 1, EInventoryTypes::MeleeSlot); 
    default AddToInventory(UItAt_Bloodfly_01::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Bloodfly_02::StaticClass(), 1, EInventoryTypes::MainContainer); 
    default AddToInventory(UItAt_Bloodfly_03::StaticClass(), 1, EInventoryTypes::MainContainer);

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 7);
	default SetAttributeValue("AttributeSet_Strength.Strength", 25);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 25);
    default SetAttributeValue("AttributeSet_Health.Health", 50); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 50);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	 default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 12);
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 12);	
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 5);
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 8);
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 15);
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 8);
	 default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 8);

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 50);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
	default m_HitSpaceParams.m_HitBoneName = n"root";
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	// Other
    default m_CameraConfig = UBloodflyCamera::StaticClass();

	default m_AIAbility = UGameplayAbility_CharacterAI_Bloodfly::StaticClass();
    default m_UniqueName = n"Bloodfly";	
}