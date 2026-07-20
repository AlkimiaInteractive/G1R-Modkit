UCLASS()
class UCharacterDefinition_Creature_Goblin_TrollTest : UCharacterDefinition_Creature_Goblin_Green
{
	default MeleeSlotItemCategories.AddTag(GameplayTag::Item_Weapon_Mace_OneHand);

	default AddToInventory(UItMw_1H_Mace_Club_01::StaticClass(), 1, EInventoryTypes::MeleeSlot);

	//default m_CharacterVisualsDefinition = UGoblinGreenCharacterVisualsDefinition::StaticClass();

    default m_AIAbility = UGameplayAbility_CharacterAI_Goblin_TrollTest::StaticClass();
}