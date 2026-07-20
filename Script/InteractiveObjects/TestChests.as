UCLASS()
class UIO_TESTMAP_CHEST_LOCKPICKING : UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Health_Perma_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Haste_01::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_Strong_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default m_UniqueName = n"IO_TESTMAP_CHEST_LOCKPICKING";
    default m_Lock = n"Test_Lock_Difficulty_1_01";
    default m_LockDifficulty = 1;
}

UCLASS()
class UIO_TESTMAP_CHEST_OPEN : UIoChestDefault
{
    default AddToInventory(UItFo_Potion_Health_02::StaticClass(), 4);
    default AddToInventory(UItFo_Potion_Health_Perma_02::StaticClass(), 1);
    default AddToInventory(UItFo_Potion_Haste_01::StaticClass(), 1);
    default AddToInventory(UItAt_Amulet_Strong_01::StaticClass(), 1);
    default AddToInventory(UItMi_Stuff_Silverware_01::StaticClass(), 1);
    default m_UniqueName = n"IO_TESTMAP_CHEST_OPEN";
}