

UCLASS(Abstract)
class UIoLootDefault: UDefaultCharacterInteraction
{
	default m_Name = "Loot";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Loot;

};

UCLASS()
class UIoLootRogue02: UIoLootDefault
{
	default m_Name = "Dead Rogue";
    default AddToInventory(UItAt_Meatbug_01::StaticClass());
}

UCLASS()
class UIO_EZ_JORIK: UIoLootDefault
{
	default m_Name = "Dead Rogue";
    default AddToInventory(UItWr_Scroll_Mysteriousnote::StaticClass());
}

UCLASS()
class UIoLootMummy_test: UIoLootDefault
{
	default m_Name = "Mummy";
    default AddToInventory(UItAt_Meatbug_01::StaticClass());
}