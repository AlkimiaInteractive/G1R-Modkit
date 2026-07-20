UCLASS()
class UCharacterDefinition_Creature_Goblin_Green : UCharacterDefinition_Creature_Goblin
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Goblin_Green;

	default m_AbilitiesEffect = UGE_Goblin_Green_AI::StaticClass();
	
	default m_AIAbility = UGameplayAbility_CharacterAI_Goblin_Green::StaticClass();
    default m_UniqueName = n"Goblin_Green";

	// Super Armor
	//default m_SuperArmorParams.m_ImmunityAfterHitParriedSc = 2.0f;
	default m_SuperArmorParams.m_ImmunityAfterHitStandardSc = 1.0f;
	default m_SuperArmorParams.m_StartRegenerateSc = 5.0f;
	default m_SuperArmorParams.m_HpRegenerateTick = 10.0f;
	default m_OnParriedDamageMultiplier = 1.0f;
	//

	// Character Attributes
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 6);
	default SetAttributeValue("AttributeSet_Strength.Strength", 20);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 20);
    default SetAttributeValue("AttributeSet_Health.Health", 40); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 40);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 20);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 20);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 15);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 13);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 6);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 6);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 6);
	// protection[PROT_FLY] = 0;

	 default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 60);

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Goblin_Green_Sword : UCharacterDefinition_Creature_Goblin_Green
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Sword_OneHand);

	//default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	default AddToInventory(UItMw_1H_Sword_Old_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Goblin_Green_Club : UCharacterDefinition_Creature_Goblin_Green
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default AddToInventory(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}

UCLASS()
class UCharacterDefinition_Creature_Goblin_Green_Torch : UCharacterDefinition_Creature_Goblin_Green
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default AddToInventory(UItMw_1H_Torch_Gob::StaticClass(), 1, EInventoryTypes::MeleeSlot);
	//default AddToInventory(UItMw_1H_Torch::StaticClass(), 1, EInventoryTypes::MainContainer); 

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();
}

// UCLASS()
// class UGoblinGreenCharacterVisualsDefinition : UArmorVisualsDefinition
// {
//     UPROPERTY()
//     FString Body = "MO_NormalGoblin";
	
// 	UPROPERTY()
//     FString Clothes = "MO_BodyGreenGoblin_01";

// }

