
UCLASS()
class UIoChestDefault: UDefaultInteractive
{
	default m_Name = "Chest";
	default m_Icon = "Apfel2DIcon";
	default m_Description = "ApfelDesc";
	default m_DefaultInteraction = GameplayTag::Action_Open_Container;
};

//Examples
UCLASS()
class UIO_EXAMPLE_CHEST_01: UIoChestDefault
{
	default m_UniqueName = n"ExampleChest01";
    default AddToInventory(UItAr_Scroll_FireBolt::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 92);
    default AddToInventory(UItMw_1H_Sword_01::StaticClass(), 1);
    default AddToInventory(UItMw_1H_Axe_Old_01::StaticClass(), 1);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformMeatbug::StaticClass(), 1);
    default AddToInventory(UItKe_Focus_04::StaticClass(), 1);
}

UCLASS()
class UIO_EXAMPLE_CHEST_02: UIoChestDefault
{
	default m_UniqueName = n"ExampleChest02";
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 22);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformScavenger::StaticClass(), 1);
    default AddToInventory(UItAr_Scroll_TransformWolf::StaticClass(), 1);
}

UCLASS()
class UIO_EXAMPLE_CHEST_03: UIoChestDefault
{
	default m_UniqueName = n"ExampleChest03";
    default AddToInventory(UItAr_Scroll_TransformMolerat::StaticClass(), 1);
    default AddToInventory(UItAm_Arrow::StaticClass(), 9);
    default AddToInventory(UItMi_Orenugget::StaticClass(), 82);
    default AddToInventory(UItKe_Lockpick::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Health_01::StaticClass(), 2);
}

UCLASS()
class UIO_EXAMPLE_CHEST_04: UIoChestDefault
{
	default m_UniqueName = n"ExampleChest04";
    default AddToInventory(UItKe_Lockpick::StaticClass(), 100);
}

UCLASS()
class UIO_EXAMPLE_CHEST_MATERIALS: UIoChestDefault
{
	default m_UniqueName = n"ExampleChest01";
    default AddToInventory(UItMi_Orenugget::StaticClass(), 100);
    default AddToInventory(UItMi_Smith_Iron::StaticClass(), 99);
    default AddToInventory(UItMi_Smith_Ironwood::StaticClass(), 99);
    default AddToInventory(UItMi_Smith_Steel::StaticClass(), 99);
    default AddToInventory(UItMi_Smith_Willow::StaticClass(), 99);
    default AddToInventory(UItMi_Smith_Ruby::StaticClass(), 99);
    default AddToInventory(UItMi_Smith_Blade_Sickle::StaticClass(), 1);
}
