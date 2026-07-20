
UCLASS()
class UCharacterDefinition_Creature_Swampshark : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_SwampShark;
    default m_Species = GameplayTag::Species_Creature_Swampshark;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
	default m_Blood = UCreatureBlood_Purple::StaticClass();

    default m_AbilitiesEffect = UGE_Swampshark_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Swampshark_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Swampshark::StaticClass();

	default m_CueData.Add(GameplayTag::GameplayCue_State_Transformed, UCueVisualConfig_Transformed_Swampshark::StaticClass());

    default m_AIAbility = UGameplayAbility_CharacterAI_Swampshark::StaticClass();
    default m_UniqueName = n"Swampshark";

	// Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Jaw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(USwampsharkJaw::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItAt_Swampshark_01::StaticClass(), 1, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Swampshark_02::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UItAt_Swampshark_03::StaticClass(), 2, EInventoryTypes::MainContainer);
	default AddToInventory(UHumanFist_NoWeapon_Swimming::StaticClass(), 1);
    default AddToInventory(UHumanFist_NoWeapon_WaterWalking::StaticClass(), 1);

    // Other
    default m_CameraConfig = USwampsharkCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//
	
	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 40);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 140);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 200);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 200);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 130);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 130);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 110);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 40);
	// protection[PROT_FLY] = 9999;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 400);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//
}


UCLASS()
class UCharacterDefinition_Creature_Swampshark_Named : UCharacterDefinition_Creature_Swampshark
{
    default m_UniqueName = n"SwampsharkNamed";
}