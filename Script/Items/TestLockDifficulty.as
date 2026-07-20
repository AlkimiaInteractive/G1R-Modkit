UCLASS()
class Test_Lock_Difficulty_1_01: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_01";
    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, -1);
    default AddPiece(3, 2);
    // default AddConnection(2, 3, -1);
    // default AddConnection(2, 1, -1);
    // default AddConnection(1, 0, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_1_01: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_01";
    default m_Lock = n"Test_Lock_Difficulty_1_01";
}

UCLASS()
class Test_Lock_Difficulty_1_02: UGothicLockConfig  // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_02";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 1);
    default AddPiece(3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_02: UIoChestDefault  // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_02";
    default m_Lock = n"Test_Lock_Difficulty_1_02";
}

UCLASS()
class Test_Lock_Difficulty_1_03: UGothicLockConfig // DONE
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_03";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_1_03: UIoChestDefault // DONE
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_03";
    default m_Lock = n"Test_Lock_Difficulty_1_03";
}

UCLASS()
class Test_Lock_Difficulty_1_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_04";
    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 0);
    default AddPiece(4, -2);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_1_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_04";
    default m_Lock = n"Test_Lock_Difficulty_1_04";
}

UCLASS()
class Test_Lock_Difficulty_1_05: UGothicLockConfig
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_05";
    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_05: UIoChestDefault
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_05";
    default m_Lock = n"Test_Lock_Difficulty_1_05";
}

UCLASS()
class Test_Lock_Difficulty_1_06: UGothicLockConfig
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_06";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_06: UIoChestDefault
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_06";
    default m_Lock = n"Test_Lock_Difficulty_1_06";
}

UCLASS()
class Test_Lock_Difficulty_1_07: UGothicLockConfig
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_07";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_07: UIoChestDefault
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_07";
    default m_Lock = n"Test_Lock_Difficulty_1_07";
}

UCLASS()
class Test_Lock_Difficulty_1_08: UGothicLockConfig
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_08";
    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddConnection(2, 0, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_08: UIoChestDefault
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_08";
    default m_Lock = n"Test_Lock_Difficulty_1_08";
}

UCLASS()
class Test_Lock_Difficulty_1_09: UGothicLockConfig // DONE
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_09";
    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 0);
    default AddPiece(4, -2);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_1_09: UIoChestDefault //DONE
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_09";
    default m_Lock = n"Test_Lock_Difficulty_1_09";
}

UCLASS()
class Test_Lock_Difficulty_1_10: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_1_10";
    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(1, 3, 1);
}

UCLASS()
class Test_Chest_Difficulty_1_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_1_10";
    default m_Lock = n"Test_Lock_Difficulty_1_10";
}

UCLASS()
class Test_Lock_Difficulty_2_01: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_01";
    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_01: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_01";
    default m_Lock = n"Test_Lock_Difficulty_2_01";
}

UCLASS()
class Test_Lock_Difficulty_2_02: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_02";
    default AddPiece(0, -2);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddConnection(1, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_02: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_02";
    default m_Lock = n"Test_Lock_Difficulty_2_02";
}

UCLASS()
class Test_Lock_Difficulty_2_03: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_03";
    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddPiece(4, -3);
    default AddPiece(5, -3);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_2_03: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_03";
    default m_Lock = n"Test_Lock_Difficulty_2_03";
}

UCLASS()
class Test_Lock_Difficulty_2_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_04";
    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddPiece(5, 2);
    default AddPiece(6, 3);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_2_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_04";
    default m_Lock = n"Test_Lock_Difficulty_2_04";
}

UCLASS()
class Test_Lock_Difficulty_2_05: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_05";
    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_05";
    default m_Lock = n"Test_Lock_Difficulty_2_05";
}

UCLASS()
class Test_Lock_Difficulty_2_06: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_06";
    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 2);
    default AddPiece(5, 2);
    default AddPiece(6, 0);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 6, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_06: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_06";
    default m_Lock = n"Test_Lock_Difficulty_2_06";
}

UCLASS()
class Test_Lock_Difficulty_2_07: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_07";
    default AddPiece(0, 1);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_07: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_07";
    default m_Lock = n"Test_Lock_Difficulty_2_07";
}

UCLASS()
class Test_Lock_Difficulty_2_08: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_08";
    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_2_08: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_08";
    default m_Lock = n"Test_Lock_Difficulty_2_08";
}

UCLASS()
class Test_Lock_Difficulty_2_09: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_09";
    default AddPiece(0, 0);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, 0);
    default AddPiece(4, 0);
    default AddPiece(5, 0);
    default AddPiece(6, 0);
    default AddConnection(5, 0, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_09: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_09";
    default m_Lock = n"Test_Lock_Difficulty_2_09";
}

UCLASS()
class Test_Lock_Difficulty_2_10: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_2_10";
    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, 3);
    default AddConnection(1, 3, 1);
    default AddConnection(5, 1, -1);
}

UCLASS()
class Test_Chest_Difficulty_2_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_2_10";
    default m_Lock = n"Test_Lock_Difficulty_2_10";
}

UCLASS()
class Test_Lock_Difficulty_3_01: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_01";
    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_01: UIoChestDefault  //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_01";
    default m_Lock = n"Test_Lock_Difficulty_3_01";
}

UCLASS()
class Test_Lock_Difficulty_3_02: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_02";
    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_02: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_02";
    default m_Lock = n"Test_Lock_Difficulty_3_02";
}

UCLASS()
class Test_Lock_Difficulty_3_03: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_03";
    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -1);
    default AddPiece(6, 0);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 6, -1);
    default AddConnection(6, 2, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_03: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_03";
    default m_Lock = n"Test_Lock_Difficulty_3_03";
}

UCLASS()
class Test_Lock_Difficulty_3_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_04";
    default AddPiece(0, 2);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_3_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_04";
    default m_Lock = n"Test_Lock_Difficulty_3_04";
}

UCLASS()
class Test_Lock_Difficulty_3_05: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_05";
    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_3_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_05";
    default m_Lock = n"Test_Lock_Difficulty_3_05";
}

UCLASS()
class Test_Lock_Difficulty_3_06: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_06";
    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 0);
    default AddPiece(3, -2);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_06: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_06";
    default m_Lock = n"Test_Lock_Difficulty_3_06";
}

UCLASS()
class Test_Lock_Difficulty_3_07: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_07";
    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_3_07: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_07";
    default m_Lock = n"Test_Lock_Difficulty_3_07";
}

UCLASS()
class Test_Lock_Difficulty_3_08: UGothicLockConfig  // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_08";
    default AddPiece(0, 2);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, -2);
    default AddPiece(5, 3);
    default AddPiece(6, 2);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 6, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(6, 0, 1);
    default AddConnection(2, 5, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_08: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_08";
    default m_Lock = n"Test_Lock_Difficulty_3_08";
}

UCLASS()
class Test_Lock_Difficulty_3_09: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_09";
    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddConnection(3, 1, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_09: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_09";
    default m_Lock = n"Test_Lock_Difficulty_3_09";
}

UCLASS()
class Test_Lock_Difficulty_3_10: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_3_10";
    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, 1);
    default AddPiece(4, 1);
    default AddPiece(5, -3);
    default AddPiece(6, 1);
    default AddConnection(4, 6, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 6, -1);
}

UCLASS()
class Test_Chest_Difficulty_3_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_3_10";
    default m_Lock = n"Test_Lock_Difficulty_3_10";
}

UCLASS()
class Test_Lock_Difficulty_4_01: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_01";
    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -1);
    default AddPiece(3, 1);
    default AddPiece(4, 1);
    default AddPiece(5, -3);
    default AddConnection(2, 5, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_4_01: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_01";
    default m_Lock = n"Test_Lock_Difficulty_4_01";
}

UCLASS()
class Test_Lock_Difficulty_4_02: UGothicLockConfig  // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_02";
    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_4_02: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_02";
    default m_Lock = n"Test_Lock_Difficulty_4_02";
}

UCLASS()
class Test_Lock_Difficulty_4_03: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_03";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 0);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, -2);
    default AddConnection(2, 5, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_4_03: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_03";
    default m_Lock = n"Test_Lock_Difficulty_4_03";
}

UCLASS()
class Test_Lock_Difficulty_4_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_04";
    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_4_04: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_04";
    default m_Lock = n"Test_Lock_Difficulty_4_04";
}

UCLASS()
class Test_Lock_Difficulty_4_05: UGothicLockConfig  //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_05";
    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddPiece(5, 0);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_4_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_05";
    default m_Lock = n"Test_Lock_Difficulty_4_05";
}

UCLASS()
class Test_Lock_Difficulty_4_06: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_06";
    default AddPiece(0, -1);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, 3);
    default AddPiece(6, -1);
    default AddConnection(4, 6, 1);
    default AddConnection(2, 6, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 5, 1);
}

UCLASS()
class Test_Chest_Difficulty_4_06: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_06";
    default m_Lock = n"Test_Lock_Difficulty_4_06";
}

UCLASS()
class Test_Lock_Difficulty_4_07: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_07";
    default AddPiece(0, -1);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -2);
    default AddPiece(4, -2);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_4_07: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_07";
    default m_Lock = n"Test_Lock_Difficulty_4_07";
}

UCLASS()
class Test_Lock_Difficulty_4_08: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_08";
    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, -1);
    default AddPiece(5, -3);
    default AddConnection(1, 4, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(2, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_4_08: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_08";
    default m_Lock = n"Test_Lock_Difficulty_4_08";
}

UCLASS()
class Test_Lock_Difficulty_4_09: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_09";
    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_4_09: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_09";
    default m_Lock = n"Test_Lock_Difficulty_4_09";
}

UCLASS()
class Test_Lock_Difficulty_4_10: UGothicLockConfig  //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_4_10";
    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -1);
    default AddPiece(3, -1);
    default AddPiece(4, 3);
    default AddPiece(5, -2);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class Test_Chest_Difficulty_4_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_4_10";
    default m_Lock = n"Test_Lock_Difficulty_4_10";
}

UCLASS()
class Test_Lock_Difficulty_5_01: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_01";
    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, -3);
    default AddPiece(5, 0);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(0, 5, 1);
}

UCLASS()
class Test_Chest_Difficulty_5_01: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_01";
    default m_Lock = n"Test_Lock_Difficulty_5_01";
}

UCLASS()
class Test_Lock_Difficulty_5_02: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_02";
    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, -3);
    default AddConnection(5, 0, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 5, -1);
}

UCLASS()
class Test_Chest_Difficulty_5_02: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_02";
    default m_Lock = n"Test_Lock_Difficulty_5_02";
}

UCLASS()
class Test_Lock_Difficulty_5_03: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_03";
    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 3);
    default AddConnection(5, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(1, 4, -1);
}

UCLASS()
class Test_Chest_Difficulty_5_03: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_03";
    default m_Lock = n"Test_Lock_Difficulty_5_03";
}

UCLASS()
class Test_Lock_Difficulty_5_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_04";
    default AddPiece(0, 1);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, 0);
    default AddPiece(5, -2);
    default AddPiece(6, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(5, 6, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(5, 4, -1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_5_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_04";
    default m_Lock = n"Test_Lock_Difficulty_5_04";
}

UCLASS()
class Test_Lock_Difficulty_5_05: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_05";
    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, -3);
    default AddPiece(6, 2);
    default AddConnection(3, 2, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 6, -1);
    default AddConnection(5, 6, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(5, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_5_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_05";
    default m_Lock = n"Test_Lock_Difficulty_5_05";
}

UCLASS()
class Test_Lock_Difficulty_5_06: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_06";
    default AddPiece(0, 2);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -2);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_5_06: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_06";
    default m_Lock = n"Test_Lock_Difficulty_5_06";
}

UCLASS()
class Test_Lock_Difficulty_5_07: UGothicLockConfig  //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_07";
    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, -1);
}

UCLASS()
class Test_Chest_Difficulty_5_07: UIoChestDefault  //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_07";
    default m_Lock = n"Test_Lock_Difficulty_5_07";
}

UCLASS()
class Test_Lock_Difficulty_5_08: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_08";
    default AddPiece(0, -1);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 2);
    default AddPiece(5, -3);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(2, 5, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_5_08: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_08";
    default m_Lock = n"Test_Lock_Difficulty_5_08";
}

UCLASS()
class Test_Lock_Difficulty_5_09: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_09";
    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 0);
    default AddConnection(1, 3, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_5_09: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_09";
    default m_Lock = n"Test_Lock_Difficulty_5_09";
}

UCLASS()
class Test_Lock_Difficulty_5_10: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_5_10";
    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(4, 0, 1);
}

UCLASS()
class Test_Chest_Difficulty_5_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_5_10";
    default m_Lock = n"Test_Lock_Difficulty_5_10";
}

UCLASS()
class Test_Lock_Difficulty_6_01: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_01";
    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, -2);
    default AddConnection(3, 4, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_6_01: UIoChestDefault // USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_01";
    default m_Lock = n"Test_Lock_Difficulty_6_01";
}

UCLASS()
class Test_Lock_Difficulty_6_02: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_02";
    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 0);
    default AddPiece(5, -3);
    default AddPiece(6, -2);
    default AddConnection(0, 6, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(6, 0, -1);
    default AddConnection(6, 4, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(5, 6, -1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_02: UIoChestDefault  //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_02";
    default m_Lock = n"Test_Lock_Difficulty_6_02";
}

UCLASS()
class Test_Lock_Difficulty_6_03: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_03";
    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_03: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_03";
    default m_Lock = n"Test_Lock_Difficulty_6_03";
}

UCLASS()
class Test_Lock_Difficulty_6_04: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_04";
    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, 0);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 1, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_04";
    default m_Lock = n"Test_Lock_Difficulty_6_04";
}

UCLASS()
class Test_Lock_Difficulty_6_05: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_05";
    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_6_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_05";
    default m_Lock = n"Test_Lock_Difficulty_6_05";
}

UCLASS()
class Test_Lock_Difficulty_6_06: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_06";
    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, -3);
    default AddPiece(5, -3);
    default AddPiece(6, 2);
    default AddConnection(6, 5, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(1, 5, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_06: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_06";
    default m_Lock = n"Test_Lock_Difficulty_6_06";
}

UCLASS()
class Test_Lock_Difficulty_6_07: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_07";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, -3);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_6_07: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_07";
    default m_Lock = n"Test_Lock_Difficulty_6_07";
}

UCLASS()
class Test_Lock_Difficulty_6_08: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_08";
    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, 2);
    default AddPiece(5, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(2, 5, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_08: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_08";
    default m_Lock = n"Test_Lock_Difficulty_6_08";
}

UCLASS()
class Test_Lock_Difficulty_6_09: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_09";
    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class Test_Chest_Difficulty_6_09: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_09";
    default m_Lock = n"Test_Lock_Difficulty_6_09";
}

UCLASS()
class Test_Lock_Difficulty_6_10: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_6_10";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, 2);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_6_10: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_6_10";
    default m_Lock = n"Test_Lock_Difficulty_6_10";
}

UCLASS()
class Test_Lock_Difficulty_7_01: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_01";
    default AddPiece(0, 0);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, 0);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_01: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_01";
    default m_Lock = n"Test_Lock_Difficulty_7_01";
}

UCLASS()
class Test_Lock_Difficulty_7_02: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_02";
    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_02: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_02";
    default m_Lock = n"Test_Lock_Difficulty_7_02";
}

UCLASS()
class Test_Lock_Difficulty_7_03: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_03";
    default AddPiece(0, -1);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_03: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_03";
    default m_Lock = n"Test_Lock_Difficulty_7_03";
}

UCLASS()
class Test_Lock_Difficulty_7_04: UGothicLockConfig // USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_04";
    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 3);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_04: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_04";
    default m_Lock = n"Test_Lock_Difficulty_7_04";
}

UCLASS()
class Test_Lock_Difficulty_7_05: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_05";
    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_05: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_05";
    default m_Lock = n"Test_Lock_Difficulty_7_05";
}

UCLASS()
class Test_Lock_Difficulty_7_06: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_06";
    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_06: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_06";
    default m_Lock = n"Test_Lock_Difficulty_7_06";
}

UCLASS()
class Test_Lock_Difficulty_7_07: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_07";
    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, 3);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_07: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_07";
    default m_Lock = n"Test_Lock_Difficulty_7_07";
}

UCLASS()
class Test_Lock_Difficulty_7_08: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_08";
    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class Test_Chest_Difficulty_7_08: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_08";
    default m_Lock = n"Test_Lock_Difficulty_7_08";
}

UCLASS()
class Test_Lock_Difficulty_7_09: UGothicLockConfig //USED
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_09";
    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);
    default AddPiece(6, 3);
    default AddConnection(1, 6, -1);
    default AddConnection(3, 6, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(2, 6, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_09: UIoChestDefault //USED
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_09";
    default m_Lock = n"Test_Lock_Difficulty_7_09";
}

UCLASS()
class Test_Lock_Difficulty_7_10: UGothicLockConfig  //DONE
{
    default m_UniqueName = n"Test_Lock_Difficulty_7_10";
    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -1);
    default AddPiece(4, -2);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class Test_Chest_Difficulty_7_10: UIoChestDefault // DONE
{
    default m_UniqueName = n"Test_Chest_Difficulty_7_10";
    default m_Lock = n"Test_Lock_Difficulty_7_10";
}

