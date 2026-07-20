
UCLASS()
class UCharacterDefinition_Creature_Demon_Lord : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Demon_Lord;
    default m_Species = GameplayTag::Species_Creature_Demon;

    default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Demon_Lord_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Demon_Lord_Player::StaticClass();
    default m_PerceptionSettings = UG1RPerceptionAgentSettings_Demon::StaticClass();

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(UDemonLordWeapon::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	// Other
    default m_CameraConfig = UDemonCamera::StaticClass();

    // Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 150);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 120);
    default SetAttributeValue("AttributeSet_Health.Health", 1200); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 1200);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 180);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 180);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 90);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 37);
	// protection[PROT_FLY] = 1000;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Demon_Lord::StaticClass();
    default m_UniqueName = n"DemonLord";
}

UCLASS()
class UCharacterDefinition_Creature_XardasDemon : UCharacterDefinition_Human
{
	//default m_MutableAsset = "MO_Demon";
}