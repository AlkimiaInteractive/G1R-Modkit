
UCLASS()
class UCharacterDefinition_Creature_Goblin_Black : UCharacterDefinition_Creature_Goblin
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Goblin_Black;
	default m_Species = GameplayTag::Species_Creature_Goblin_Black;

	default m_AbilitiesEffect = UGE_Goblin_Black_AI::StaticClass();
	
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);
    default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 12);
	default SetAttributeValue("AttributeSet_Strength.Strength", 50);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 50);
    default SetAttributeValue("AttributeSet_Health.Health", 80); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 80);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 80);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 80);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 40);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 30);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 6);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 6);
	// protection[PROT_FLY] = 0;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 120);
	
	default m_AIAbility = UGameplayAbility_CharacterAI_Goblin_Black::StaticClass();
    default m_UniqueName = n"Goblin_Black";
	
	//default m_CharacterVisualsDefinition = UGoblinBlackCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Goblin_Black_Torch : UCharacterDefinition_Creature_Goblin_Black
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default AddToInventory(UItMw_1H_Torch_Gob::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	//default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::MainContainer); 

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Goblin_Black_Mace : UCharacterDefinition_Creature_Goblin_Black
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default AddToInventory(UItMw_1H_Mace_Nailmace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}