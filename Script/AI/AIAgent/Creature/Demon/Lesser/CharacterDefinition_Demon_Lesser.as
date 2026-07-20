
UCLASS()
class UCharacterDefinition_Creature_Demon_Lesser : UCharacterDefinition_Creature
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Demon_Lesser;
	default m_Species = GameplayTag::Species_Creature_Demon;

	default m_CharacterSizeGroup = GameplayTag::Character_Size_Big;
    
    default m_AbilitiesEffect = UGE_Demon_Lesser_AI::StaticClass();
    default m_OnPlayerEffect = UGE_Demon_Lesser_Player::StaticClass();
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Demon::StaticClass();

    // Inventory
	// FGameplayTagContainer meleeSlotItemCategories;
	// default meleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Claw);
	// default CreateInventory(EInventoryTypes::MeleeSlot, meleeSlotItemCategories, 1);

	default AddToInventory(ULesserDemon::StaticClass(), 1, EInventoryTypes::MeleeSlot);

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
	default SetAttributeValue("AttributeSet_Strength.Strength", 100);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 75);
    default SetAttributeValue("AttributeSet_Health.Health", 500); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 500);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 120);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 120);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 95);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 37);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 37);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 37);
	// protection[PROT_FLY] = 1000;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 500);

	// Hit Space
    default m_HitSpaceParams.m_FrontAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_BackAngleDegrees = 90.0f;
    default m_HitSpaceParams.m_HitBoneSpace = FVector(0, 0, 1);
	//

	default m_AIAbility = UGameplayAbility_CharacterAI_Demon_Lesser::StaticClass();
    default m_UniqueName = n"DemonLesser";

}


UCLASS()
class UCharacterDefinition_Creature_Demon_Lesser_VKasorg : UCharacterDefinition_Creature_Demon_Lesser
{
	default m_PerceptionSettings = UG1RPerceptionAgentSettings_Demon_Lesser_VKasorg;
	//

	default m_AbilitiesEffect = UGE_Demon_Lesser_AI_Kasorg::StaticClass();

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 50);
	default SetAttributeValue("AttributeSet_Strength.Strength", 75);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 75);
    default SetAttributeValue("AttributeSet_Health.Health", 300); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 300);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 80);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 80);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 100);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 100);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 55);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 500);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 35);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 35);
	// protection[PROT_FLY] = 1000;
}