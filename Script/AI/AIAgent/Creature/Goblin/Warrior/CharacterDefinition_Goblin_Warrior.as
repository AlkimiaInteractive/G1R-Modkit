
UCLASS()
class UCharacterDefinition_Creature_Goblin_Warrior : UCharacterDefinition_Creature_Goblin
{
	default m_CharacterType = GameplayTag::AIAgent_Creature_Goblin_Warrior;
	default m_Species = GameplayTag::Species_Creature_Goblin_Warrior;

	default m_AbilitiesEffect = UGE_Goblin_Warrior_AI::StaticClass();

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
	default SetAttributeValue("AttributeSet_LevelProgression.Level", 15);
	default SetAttributeValue("AttributeSet_Strength.Strength", 90);
	default SetAttributeValue("AttributeSet_Dexterity.Dexterity", 20);
    default SetAttributeValue("AttributeSet_Health.Health", 105); 
    default SetAttributeValue("AttributeSet_Health.MaxHealth", 105);
    default SetAttributeValue("AttributeSet_Armor.SuperArmor", 100);
    default SetAttributeValue("AttributeSet_Armor.MaxSuperArmor", 100);
	default SetAttributeValue("AttributeSet_Mana.Mana", 0);
    default SetAttributeValue("AttributeSet_Mana.MaxMana", 0);

	default SetAttributeValue("AttributeSet_Armor.Resistance_Blunt", 50);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Edge", 50);	
	default SetAttributeValue("AttributeSet_Armor.Resistance_Point", 40);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Fire", 20);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Energy", 15);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Ice", 10);
	default SetAttributeValue("AttributeSet_Armor.Resistance_Wind", 10);
	// protection[PROT_FLY] = 0;

	default SetAttributeValue("AttributeSet_LevelProgression.XPKillOrDefeatBounty", 150);

	default AddToInventory(UItMw_1H_Mace_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	default m_AIAbility = UGameplayAbility_CharacterAI_GoblinWarrior::StaticClass();
    default m_UniqueName = n"GoblinWarrior";
	//default m_CharacterVisualsDefinition = UGoblinWarriorCharacterVisualsDefinition::StaticClass();
}

// UCLASS()
// class UGoblinWarriorCharacterVisualsDefinition : UArmorVisualsDefinition
// {

//     UPROPERTY()
//     FString Body = "MO_BodyBlackGoblin_01";
	
// 	UPROPERTY()
//     FString Clothes = "MO_WarriorGoblin";

// 	// UFUNCTION(BlueprintOverride)
// 	// void Initialize()
//     // {
// 	// 	Clothes = "MO_WarriorGoblin";

// 	// 	switch (Math::Rand() % 3)
// 	// 	{
// 	// 	case 0:
// 	// 		Body = "MO_BodyBlackGoblin_01";
// 	// 		break;
// 	// 	case 1:
// 	// 		Body = "MO_BodyBlackGoblin_02";
// 	// 		break;
// 	// 	case 2:
// 	// 		Body = "MO_BodyBlackGoblin_03";
// 	// 		break;
// 	// 	}
// 	// }
// }