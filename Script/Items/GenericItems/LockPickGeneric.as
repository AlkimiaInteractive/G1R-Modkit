////////////////////////////////////////////////////////////////////////
//******************ANCIENT MONASTERY RUINS************************** */
////////////////////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UAM_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"AM_Chest_04_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, 1);

    default AddConnection(2, 1, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(5, 2, -1);
}

UCLASS()
class UFM_Chest_Digginggallery_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FM_Chest_Digginggallery_02_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, -3);

    default AddConnection(2, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 1, -1);
}

////////////////////////////////////////////////////////////////////////
//******************ANCIENT MONASTERY RUINS************************** */
////////////////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UAMR_Storage_Room_Lock: UGothicLockConfig
{
    default m_UniqueName = n"AMR_Storage_Room_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 0);

    default AddConnection(3, 4, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 0, 1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UAMR_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"AMR_Chest_04_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -1);
    default AddPiece(5, -1);

    default AddConnection(2, 5, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 3, 1);
}

//////////////////////////////////////////////////////////////
//******************BANDITS CAMP************************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UBC_LootCave_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_LootCave_Door_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, 0);
    default AddPiece(5, 2);

    default AddConnection(3, 4, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class UBC_LootCave_Door_Lock_02: UGothicLockConfig
{
    default m_UniqueName = n"BC_LootCave_Door_Lock_02";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, -1);

    default AddConnection(4, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 1, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UBC_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -1);

    default AddConnection(0, 2, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UBC_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(4, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class UBC_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_03_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 1);
    default AddPiece(4, -3);

    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class UBC_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_04_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, 3);

    default AddConnection(2, 4, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UBC_Chest_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_05_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 0);

    default AddConnection(0, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 1, -1);
}

UCLASS()
class UBC_Chest_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_07_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, 3);

    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class UBC_Chest_08_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_08_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, -3);

    default AddConnection(0, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UBC_Chest_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_09_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(4, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 0, 1);
}

UCLASS()
class UBC_Chest_10_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_10_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, 0);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 0, 1);
}

UCLASS()
class UBC_Chest_11_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_11_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(0, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UBC_Chest_12_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_12_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(2, 4, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(2, 5, -1);
}

UCLASS()
class UBC_Chest_13_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_13_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 0);

    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UBC_Chest_14_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_14_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, -1);
    default AddPiece(5, 3);

    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UBC_Chest_15_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_15_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, -2);

    default AddConnection(0, 3, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 4, -1);
}

UCLASS()
class UBC_Chest_16_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_16_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, -1);
    default AddPiece(5, -3);

    default AddConnection(3, 5, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 1, -1);
}

UCLASS()
class UBC_Chest_17_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_17_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, 1);

    default AddConnection(4, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UBC_Chest_18_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_18_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(3, 2, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UBC_Chest_19_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_19_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(5, 1, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(5, 2, -1);
}

UCLASS()
class UBC_Chest_20_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_20_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, -3);

    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 5, -1);
}

UCLASS()
class UBC_Chest_22_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_22_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -3);
    default AddPiece(6, -2);

    default AddConnection(4, 2, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(6, 1, -1);
    default AddConnection(4, 6, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UBC_Chest_23_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BC_Chest_23_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(3, 0, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(4, 3, 1);
}

//////////////////////////////////////////////////////////////
//******************BROKEN TOWER************************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UBT_Tower_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BT_Tower_Door_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(1, 3, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(4, 2, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UBT_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BT_Chest_01_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -1);
    default AddPiece(5, -2);

    default AddConnection(2, 5, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UBT_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"BT_Chest_02_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, 3);

    default AddConnection(2, 3, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(2, 0, 1);
}

//////////////////////////////////////////////////////////////
//******************CASTLE RUINS*************************** */
/////////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UCR_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CR_Chest_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, -2);
    default AddPiece(5, 3);

    default AddConnection(2, 5, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 4, 1);
}

UCLASS()
class UCR_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CR_Chest_02_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddPiece(5, -2);

    default AddConnection(1, 0, 1);
    default AddConnection(2, 5, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(1, 5, -1);
}

//////////////////////////////////////////////////////////////
//******************CAVALORN******************************* */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UCV_Stash_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Stash_Door_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddPiece(5, 1);

    default AddConnection(4, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 5, 1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UCV_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Chest_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, 0);

    default AddConnection(2, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(2, 5, 1);
}

UCLASS()
class UCV_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Chest_02_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(3, 5, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UCV_Chest_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Chest_07_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, 3);
    default AddPiece(5, 0);

    default AddConnection(3, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UCV_Chest_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Chest_09_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);

    default AddConnection(4, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UCV_Chest_10_Lock: UGothicLockConfig
{
    default m_UniqueName = n"CV_Chest_10_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, 1);
    default AddPiece(6, 2);

    default AddConnection(4, 3, -1);
    default AddConnection(3, 6, -1);
    default AddConnection(2, 6, 1);
    default AddConnection(6, 0, 1);
    default AddConnection(6, 5, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(4, 6, 1);
    default AddConnection(5, 0, 1);
}

//////////////////////////////////////////////////////////////
//******************EAST FOREST**************************** */
/////////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UEF_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"EF_Chest_03_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, 0);

    default AddConnection(0, 5, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UEF_Chest_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"EF_Chest_05_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(5, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(1, 0, 1);
}

//////////////////////////////////////////////////////////////
//******************EXCHANGE ZONE************************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UEZ_LootCage_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"EZ_LootCage_Door_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    
    default AddConnection(3, 1, 1);
    default AddConnection(0, 3, 1);
}

//////////////////////////////////////////////////////////////
//******************FREE MINE****************************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UFM_AbandonedGallery_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FM_AbandonedGallery_Door_Lock";
    
    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 1);
    default AddPiece(4, 1);

    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 1, 1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UFM_Chest_Furnace_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FM_Chest_Furnace_01_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, 0);
    default AddPiece(5, 2);

    default AddConnection(3, 0, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(5, 4, 1);
}

UCLASS()
class UFM_Chest_Furnace_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FM_Chest_Furnace_02_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(2, 4, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UFM_Chest_Gallery_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FM_Chest_Gallery_01_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UFME_Chest_Gate_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_Gate_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, -3);

    default AddConnection(4, 3, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UFME_Chest_Mercenary13_765_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_Mercenary13_765_01_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);

    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UFME_Chest_Mercenary13_765_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_Mercenary13_765_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, 1);
    default AddPiece(4, 1);

    default AddConnection(1, 4, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UFME_Chest_EmptyHut_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_EmptyHut_02_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -3);

    default AddConnection(1, 4, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UFME_Chest_Swiney_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_Swiney_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddPiece(4, -1);

    default AddConnection(1, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UFME_Chest_EmptyHut_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_EmptyHut_04_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 0);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 0, 1);
}

UCLASS()
class UFME_Chest_EmptyHut_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_EmptyHut_05_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 2);

    default AddConnection(4, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UFME_Chest_ControlAccess_Lock: UGothicLockConfig
{
    default m_UniqueName = n"FME_Chest_ControlAccess_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(4, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(5, 3, -1);
}

//////////////////////////////////////////////////////////////
//******************ILEGAL WEED MIXERS********************* */
/////////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UIWML_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"IWML_Chest_01_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(3, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UIWML_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"IWML_Chest_02_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, -1);

    default AddConnection(1, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UIWML_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"IWML_Chest_03_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -1);

    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(3, 5, -1);
}

UCLASS()
class UIWML_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"IWML_Chest_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(4, 0, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UIWML_Chest_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"IWML_Chest_05_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -2);

    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(4, 0, -1);
}

//////////////////////////////////////////////////////////////
//******************MOUNTAIN FORTRESS********************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UMF_CellarCages_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_CellarCages_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, -2);
    default AddPiece(5, -2);

    default AddConnection(5, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 3, 1);
}

UCLASS()
class UMF_CellarCages_Lock_02: UGothicLockConfig
{
    default m_UniqueName = n"MF_CellarCages_Lock_02";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(1, 0, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 0, -1);
}

//////////////////////CHESTS/////////////////////////////

UCLASS()
class UMF_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_Chest_01_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 0);

    default AddConnection(4, 2, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UMF_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_Chest_04_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(5, 3, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UMF_Chest_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_Chest_07_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, -1);
    default AddPiece(5, -3);

    default AddConnection(2, 3, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 4, -1);
}

UCLASS()
class UMF_Chest_08_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_Chest_08_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(0, 2, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class UMF_Chest_12_Lock: UGothicLockConfig
{
    default m_UniqueName = n"MF_Chest_12_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(1, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(0, 4, 1);
}

//////////////////////////////////////////////////////////////
//******************NEW CAMP****************************** */
/////////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UNC_RiceLord_Room_Lock_01: UGothicLockConfig
{
    default m_UniqueName = n"NC_RiceLord_Room_Lock_01";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, 1);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class UNC_RiceLord_Room_Lock_02: UGothicLockConfig
{
    default m_UniqueName = n"NC_RiceLord_Room_Lock_02";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -1);
    default AddPiece(5, -2);

    default AddConnection(1, 5, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UNC_LeeCave_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_LeeCave_Door_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(1, 4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UNC_Cave_Tavern_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Cave_Tavern_Door_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(3, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UNC_Cave_Tavern_Door_Lock_02: UGothicLockConfig
{
    default m_UniqueName = n"NC_Cave_Tavern_Door_Lock_02";

    default AddPiece(0, 1);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(2, 1, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UNC_Chest_Ricelord_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Ricelord_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, -2);

    default AddConnection(3, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UNC_Chest_GateInterior_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_GateInterior_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 3);
    default AddPiece(5, 1);

    default AddConnection(0, 1, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(5, 3, -1);
}

UCLASS()
class UNC_Chest_GateInterior_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_GateInterior_02_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, 0);
    default AddPiece(5, 1);

    default AddConnection(2, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UNC_Chest_Distillery_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Distillery_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, -2);
    default AddPiece(5, 3);

    default AddConnection(5, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UNC_Chest_Jeremiah_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Jeremiah_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(3, 4, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UNC_Chest_Silas_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Silas_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(0, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, 1);
}

UCLASS()
class UNC_Chest_Lares_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Lares_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 3);
    default AddPiece(5, 1);

    default AddConnection(0, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UNC_Chest_Rogue01_800_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue01_800_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddPiece(4, 1);
    default AddPiece(5, 2);

    default AddConnection(1, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, 1);
}

UCLASS()
class UNC_Chest_Wolf_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Wolf_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, 1);

    default AddConnection(1, 4, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UNC_Chest_Bruce_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Bruce_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(1, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(5, 2, 1);
}

UCLASS()
class UNC_Chest_Wedge_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Wedge_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, -2);

    default AddConnection(3, 4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(5, 4, -1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UNC_Chest_Cipher_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Cipher_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, 1);
    default AddPiece(5, 0);

    default AddConnection(2, 5, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 5, -1);
}

UCLASS()
class UNC_Chest_Rogue10_820_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue10_820_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(0, 4, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UNC_Chest_Sharky_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Sharky_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(5, 2, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 5, -1);
}

UCLASS()
class UNC_Chest_Rogue08_816_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue08_816_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);

    default AddConnection(0, 4, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UNC_Chest_Rogue23_838_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue23_838_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 1);
    default AddPiece(5, 0);

    default AddConnection(2, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class UNC_Chest_Rogue11_821_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue11_821_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 0);

    default AddConnection(2, 1, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UNC_Chest_Rogue03_806_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue03_806_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, -1);
    default AddPiece(5, 3);

    default AddConnection(1, 5, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(5, 2, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 3, 1);
}

UCLASS()
class UNC_Chest_Rogue06_811_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue06_811_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, 2);

    default AddConnection(4, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class UNC_Chest_Butch_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Butch_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);

    default AddConnection(1, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UNC_Chest_Homer_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Homer_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, -2);
    default AddPiece(4, 0);
    default AddPiece(5, -1);

    default AddConnection(0, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(5, 4, -1);
}

UCLASS()
class UNC_Chest_Mercenary07_710_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary07_710_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, -1);
    default AddPiece(4, -2);

    default AddConnection(0, 2, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class UNC_Chest_Gorn_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Gorn_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(4, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UNC_Chest_Blade_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Blade_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(3, 5, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UNC_Chest_Mercenary06_708_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary06_708_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 1);

    default AddConnection(1, 2, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UNC_Chest_Mercenary02_703_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary02_703_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 1);

    default AddConnection(3, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class UNC_Chest_Mercenary03_705_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary03_705_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, -2);

    default AddConnection(3, 0, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class UNC_Chest_Mercenary04_706_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary04_706_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, 0);

    default AddConnection(4, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UNC_Chest_Mercenary17_735_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Mercenary17_735_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, -3);

    default AddConnection(1, 0, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UNC_Chest_Cord_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Cord_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(3, 1, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class UNC_Chest_Orik_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Orik_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddPiece(4, -3);

    default AddConnection(4, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class UNC_Chest_Lee_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Lee_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, 0);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(0, 3, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UNC_Chest_Saturas_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Saturas_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, 0);
    default AddPiece(4, -1);
    default AddPiece(5, -3);

    default AddConnection(0, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UNC_Chest_Nefarius_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Nefarius_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddPiece(4, 2);

    default AddConnection(2, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UNC_Chest_Riordian_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Riordian_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(1, 0, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class UNC_Chest_Merdarion_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Merdarion_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 0);
    default AddPiece(4, 3);

    default AddConnection(1, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UNC_Chest_Cronos_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Cronos_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(2, 1, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 2, -1);
}

UCLASS()
class UNC_Chest_Myxir_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Myxir_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(4, 1, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(3, 5, -1);
}

UCLASS()
class UNC_Chest_Buster_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Buster_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, -2);

    default AddConnection(3, 2, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(5, 2, 1);
    default AddConnection(5, 3, -1);
}

UCLASS()
class UNC_Chest_Cellar_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Cellar_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddPiece(4, 1);

    default AddConnection(0, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UNC_Chest_Lefty_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Lefty_01_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddPiece(4, 0);
    default AddPiece(5, 0);

    default AddConnection(0, 2, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 4, 1);
}

UCLASS()
class UNC_Chest_Lefty_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Lefty_02_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);

    default AddConnection(4, 3, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 0, 1);
}

UCLASS()
class UNC_Chest_Rogue05_810_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue05_810_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 2);

    default AddConnection(1, 4, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UNC_Chest_Rogue07_815_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue07_815_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, 2);

    default AddConnection(4, 3, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UNC_Chest_Rogue09_817_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue09_817_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, 2);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(5, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class UNC_Chest_Rogue13_823_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue13_823_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(3, 4, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UNC_Chest_Rogue22_837_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Rogue22_837_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(3, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 4, -1);
}

UCLASS()
class UNC_Chest_Sunken_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Sunken_01_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, -1);

    default AddConnection(4, 0, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UNC_Chest_Sunken_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Sunken_02_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, -2);

    default AddConnection(0, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, -1);
}

UCLASS()
class UNC_Chest_Torlof_Lock: UGothicLockConfig
{
    default m_UniqueName = n"NC_Chest_Torlof_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(4, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, 1);
}

//////////////////////////////////////////////////////////
//******************ORC ARENA********************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UOA_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OA_Chest_01_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(0, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 5, -1);
}

UCLASS()
class UOA_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OA_Chest_02_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(5, 0, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 5, -1);
}

UCLASS()
class UOA_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OA_Chest_03_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(4, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UOA_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OA_Chest_04_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddPiece(5, 1);

    default AddConnection(2, 1, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 2, -1);
}

//////////////////////////////////////////////////////////
//******************OLD CAMP************************** */
////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UOC_Gomez_Room_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Gomez_Room_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, -1);
    default AddPiece(5, -3);

    default AddConnection(1, 0, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 5, -1);
}

UCLASS()
class UOC_Orebaron_Room_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Orebaron_Room_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, 1);

    default AddConnection(0, 1, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UOC_Orebaron_Room_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Orebaron_Room_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -2);

    default AddConnection(4, 3, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class UOC_Raven_Room_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Raven_Room_01_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, -2);
    
    default AddConnection(1, 0, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UOC_Raven_Room_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Raven_Room_02_Lock";
    
    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -2);
    default AddPiece(5, 3);

    default AddConnection(3, 0, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class UOC_Mages_Room_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Mages_Room_01_Lock";
    default m_UniqueName = n"Test_Lock_85_07";
    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, -1);
    default AddPiece(4, 3);
    default AddPiece(5, -3);

    default AddConnection(0, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Mages_Room_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Mages_Room_02_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, -1);
    default AddPiece(3, -2);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(5, 3, -1);
}

UCLASS()
class UOC_Mages_Room_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Mages_Room_03_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(3, 4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class UOC_Guards_Cell_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Guards_Cell_01_Lock";
    // IO_OC_Chest_Canteen_17 - 51 ore
    // IO_OC_Chest_BALAM - Locked  

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(3, 1, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(4, 5, 1);
}

UCLASS()
class UOC_Guards_Cell_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Guards_Cell_02_Lock";
    // IO_OC_Chest_Canteen_18 - 44 ore
    // IO_OC_Chest_Guar232 - Locked

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, -2);
    default AddPiece(4, -1);
    default AddPiece(5, 3);

    default AddConnection(0, 2, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UOC_Forge_Loot_Room_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Forge_Loot_Room_Lock";
    // IO_OC_CHEST_FORGE_03 - DELETED LOCK - 408 ore
    // IO_OC_CHEST_FORGE_04 - Locked

    
    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 2);
    default AddPiece(5, 1);

    default AddConnection(2, 4, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class UOC_Cellar_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Cellar_Door_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(0, 3, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(0, 4, -1);
}

UCLASS()
class UOC_Cellar_Lock_02: UGothicLockConfig
{
    default m_UniqueName = n"OC_Cellar_Lock_02";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, 1);

    default AddConnection(0, 3, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Prison_Dungeons_Moat_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Prison_Dungeons_Moat_Lock";
    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, 3);
    default AddPiece(5, -3);

    default AddConnection(4, 1, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UOC_Prison_Dungeons_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Prison_Dungeons_06_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(1, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UOC_Prison_Dungeons_23_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Prison_Dungeons_23_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UOC_Prison_Dungeons_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Prison_Dungeons_09_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(1, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Armory_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Armory_Door_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(2, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UOC_Santino_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Santino_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 2);

    default AddConnection(4, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UOC_Fisk_Hut_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Fisk_Hut_Door_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 5, 1);
}

UCLASS()
class UOC_Fisk_Storage_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Fisk_Storage_Door_Lock";
    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(1, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class UOC_Cell12_Bandit_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Cell12_Bandit_Door_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 2);
    default AddPiece(6, 3);
    
    default AddConnection(1, 6, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(6, 0, -1);
    default AddConnection(6, 2, -1);
}

//////////////////////CHESTS/////////////////////////////

UCLASS()
class UOC_Chest_Armory_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Armory_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, 0);

    default AddConnection(3, 4, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class UOC_Chest_Armory_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Armory_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -1);

    default AddConnection(3, 2, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UOC_Chest_Armory_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Armory_03_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(3, 2, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Armory_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Armory_04_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(3, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, 1);
}


UCLASS()
class UOC_Chest_Arto_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Arto_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(1, 5, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(5, 4, -1);
}

UCLASS()
class UOC_Chest_Balam_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Balam_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(1, 0, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UOC_Chest_Bloodwyn_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Bloodwyn_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 1, 1);
}

UCLASS()
class UOC_Chest_Bullit_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Bullit_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, -1);

    default AddConnection(4, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Chest_Corristo_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Corristo_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, -2);

    default AddConnection(0, 3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UOC_Chest_Damarok_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Damarok_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(0, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(5, 4, 1);
}

UCLASS()
class UOC_Chest_Drago_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Drago_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(2, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Fletcher_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fletcher_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -1);

    default AddConnection(1, 2, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class UOC_Chest_Forge_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Forge_01_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 2);

    default AddConnection(2, 0, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Forge_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Forge_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(5, 0, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UOC_Chest_Forge_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Forge_04_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(5, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(2, 4, 1);
}

UCLASS()
class UOC_Chest_Gomez_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Gomez_01_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(4, 2, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UOC_Chest_CUTTER_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_CUTTER_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 0);

    default AddConnection(3, 1, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UOC_Chest_Guard226_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard226_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, -2);
    default AddPiece(4, 2);

    default AddConnection(2, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class UOC_Chest_Guard228_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard228_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, 2);

    default AddConnection(4, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UOC_Chest_Guard229_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard229_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);

    default AddConnection(1, 3, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class UOC_Chest_Guard232_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard232_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, 2);

    default AddConnection(3, 0, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(5, 4, -1);
}

UCLASS()
class UOC_Chest_Guard240_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard240_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, -1);

    default AddConnection(1, 0, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 4, -1);
}

UCLASS()
class UOC_Chest_Guard242_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard242_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, 0);

    default AddConnection(0, 1, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UOC_Chest_Jackal_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Jackal_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(2, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(5, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 5, 1);
}

UCLASS()
class UOC_Chest_Kitchen_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Kitchen_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, -2);

    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 1, -1);
}

UCLASS()
class UOC_Chest_Omid_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Omid_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(2, 5, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(1, 4, -1);
}

UCLASS()
class UOC_Chest_Ruins_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Ruins_01_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddPiece(5, -1);

    default AddConnection(5, 4, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(1, 5, -1);
}

UCLASS()
class UOC_Chest_Ruins_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Ruins_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(2, 1, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Scar_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Scar_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 2);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(4, 0, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 0, 1);
}

UCLASS()
class UOC_Chest_Scorpio_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Scorpio_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class UOC_Chest_Stone_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Stone_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, 2);

    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Tower_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_01_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(2, 0, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(5, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class UOC_Chest_Tower_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 1);
    default AddPiece(4, 1);
    default AddPiece(5, 0);

    default AddConnection(5, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(5, 1, 1);
}

UCLASS()
class UOC_Chest_Tower_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_03_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, -1);
    default AddPiece(5, 3);

    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UOC_Chest_Tower_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_05_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(3, 2, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UOC_Chest_Tower_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_06_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, 3);

    default AddConnection(4, 1, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class UOC_Chest_Tower_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_07_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, -3);

    default AddConnection(2, 0, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UOC_Chest_Tower_08_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_08_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 2);
    default AddPiece(5, -2);

    default AddConnection(0, 3, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 2, -1);
}

UCLASS()
class UOC_Chest_Tower_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_09_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 3);
    default AddPiece(6, 0);

    default AddConnection(2, 1, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(5, 4, 1);
    default AddConnection(6, 0, -1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UOC_Chest_BaalParvez_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_BaalParvez_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, -3);
    default AddPiece(5, -3);

    default AddConnection(2, 3, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(5, 1, -1);
}

UCLASS()
class UOC_Chest_Diego_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Diego_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(4, 1, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Digger501_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger501_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -2);
    default AddPiece(4, -3);

    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Digger502_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger502_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, -1);

    default AddConnection(2, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class UOC_Chest_Digger503_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger503_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, -1);

    default AddConnection(4, 1, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Digger504_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger504_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(1, 0, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UOC_Chest_Digger505_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger505_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class UOC_Chest_Digger506_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger506_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(2, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(2, 5, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UOC_Chest_Digger507_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger507_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(4, 3, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(1, 5, 1);
}

UCLASS()
class UOC_Chest_Digger508_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger508_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(0, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UOC_Chest_Digger509_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger509_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(4, 0, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 4, -1);
}

UCLASS()
class UOC_Chest_Digger510_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger510_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 1);
    default AddPiece(2, 0);
    default AddPiece(3, -1);
    default AddPiece(4, -2);
    default AddPiece(5, 0);

    default AddConnection(4, 0, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Digger512_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger512_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Digger513_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger513_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, -2);
    default AddPiece(5, -2);

    default AddConnection(0, 4, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Digger514_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger514_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -1);

    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 0, 1);
}

UCLASS()
class UOC_Chest_Digger515_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger515_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -3);

    default AddConnection(3, 4, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UOC_Chest_Digger516_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger516_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, -3);

    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UOC_Chest_Digger517_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger517_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(0, 2, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class UOC_Chest_Digger519_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger519_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, -2);

    default AddConnection(0, 1, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class UOC_Chest_Digger521_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger521_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, 1);

    default AddConnection(3, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 4, -1);
}

UCLASS()
class UOC_Chest_Digger522_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger522_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class UOC_Chest_Digger523_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger523_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 0);

    default AddConnection(4, 1, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UOC_Chest_Digger526_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger526_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 0);
    default AddPiece(4, -3);

    default AddConnection(4, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class UOC_Chest_Digger527_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger527_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -1);

    default AddConnection(0, 3, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class UOC_Chest_Digger528_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger528_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, 0);
    default AddPiece(5, -3);

    default AddConnection(2, 0, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class UOC_Chest_Digger529_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger529_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(3, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UOC_Chest_Digger531_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger531_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, -2);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(1, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(5, 0, 1);
}

UCLASS()
class UOC_Chest_Digger532_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger532_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 1);

    default AddConnection(0, 1, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class UOC_Chest_Digger533_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger533_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);

    default AddConnection(3, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class UOC_Chest_Digger535_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger535_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, -1);

    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UOC_Chest_Digger553_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger553_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);

    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UOC_Chest_Digger554_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger554_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, 3);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Digger555_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger555_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, 0);

    default AddConnection(0, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, 1);
}

UCLASS()
class UOC_Chest_Digger556_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger556_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, -2);

    default AddConnection(1, 2, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class UOC_Chest_Digger557_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger557_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UOC_Chest_Digger560_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger560_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -2);
    default AddPiece(4, 0);

    default AddConnection(3, 1, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, 1);
}

UCLASS()
class UOC_Chest_Digger561_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger561_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 0);
    default AddPiece(4, 0);

    default AddConnection(2, 4, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 3, 1);
}

UCLASS()
class UOC_Chest_Digger565_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger565_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddPiece(5, -2);

    default AddConnection(4, 2, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(5, 0, -1);
}

UCLASS()
class UOC_Chest_Digger575_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger575_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, -1);

    default AddConnection(5, 4, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UOC_Chest_Digger576_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger576_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddPiece(5, -3);

    default AddConnection(0, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Digger577_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger577_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, -2);
    default AddPiece(4, -3);

    default AddConnection(2, 0, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UOC_Chest_Dusty_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Dusty_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, -1);
    default AddPiece(4, -2);

    default AddConnection(0, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class UOC_Chest_Fingers_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fingers_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, 1);
    default AddPiece(5, 2);

    default AddConnection(3, 2, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(5, 1, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Chest_Fisk_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_01_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 3);
    default AddPiece(2, -1);
    default AddPiece(3, -1);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(5, 1, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(5, 2, 1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UOC_Chest_Fisk_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_02_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, -3);

    default AddConnection(2, 1, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UOC_Chest_Fisk_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_03_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(3, 0, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Fisk_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, -2);

    default AddConnection(0, 3, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UOC_Chest_Fisk_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_05_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(5, 4, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 5, 1);
}

UCLASS()
class UOC_Chest_Fisk_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_06_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(3, 5, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(5, 1, 1);
}

UCLASS()
class UOC_Chest_Fisk_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_07_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(1, 4, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UOC_Chest_Fisk_08_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Fisk_08_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UOC_Chest_GorHanis_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_GorHanis_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -2);

    default AddConnection(4, 1, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 1, -1);
}

UCLASS()
class UOC_Chest_Gravo_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Gravo_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(4, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 4, 1);
}

UCLASS()
class UOC_Chest_Grim_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Grim_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -2);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, 1);

    default AddConnection(3, 1, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(5, 4, -1);
    default AddConnection(5, 1, -1);
}

UCLASS()
class UOC_Chest_Guy_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guy_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 2);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, 0);
    default AddPiece(6, 0);

    default AddConnection(1, 2, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(6, 0, 1);
    default AddConnection(6, 2, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class UOC_Chest_Huno_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Huno_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, 3);
    default AddPiece(5, 0);

    default AddConnection(1, 5, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 4, 1);
}

UCLASS()
class UOC_Chest_Jesse_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Jesse_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -2);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 1);

    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 1, -1);
}

UCLASS()
class UOC_Chest_Kharim_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Kharim_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(0, 1, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Chest_Kirgo_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Kirgo_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -1);
    default AddPiece(2, 0);
    default AddPiece(3, -2);
    default AddPiece(4, -1);
    default AddPiece(5, 3);
    default AddPiece(6, -3);

    default AddConnection(6, 0, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(6, 3, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(6, 5, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(5, 2, -1);
}

UCLASS()
class UOC_Chest_Kyle_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Kyle_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(5, 2, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 1, 1);
}

UCLASS()
class UOC_Chest_Mordrag_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Mordrag_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, 1);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(0, 4, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Mud_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Mud_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, -1);

    default AddConnection(4, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class UOC_Chest_Scatty_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Scatty_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class UOC_Chest_Shadow304_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow304_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(1, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UOC_Chest_Shadow306_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow306_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);
    default AddPiece(6, 2);

    default AddConnection(3, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(6, 0, 1);
    default AddConnection(6, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 6, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UOC_Chest_Shadow310_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow310_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(3, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 0, 1);
}

UCLASS()
class UOC_Chest_Shadow313_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow313_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(4, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 0, 1);
}

UCLASS()
class UOC_Chest_Shadow314_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow314_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -3);

    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class UOC_Chest_Shadow316_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow316_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, 3);

    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UOC_Chest_Shadow318_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow318_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);

    default AddConnection(2, 1, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 0, 1);
}

UCLASS()
class UOC_Chest_Shadow319_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow319_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 1);
    default AddPiece(5, -2);

    default AddConnection(5, 1, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UOC_Chest_Shadow322_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow322_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(1, 0, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class UOC_Chest_Shadow328_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow328_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 2);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(1, 2, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UOC_Chest_Shadow330_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Shadow330_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 0);

    default AddConnection(3, 2, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UOC_Chest_Sly_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Sly_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(0, 5, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 2, -1);
}

UCLASS()
class UOC_Chest_Snaf_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Snaf_01_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(0, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Snaf_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Snaf_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -1);
    default AddPiece(5, -1);

    default AddConnection(2, 5, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class UOC_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_01_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);
    default AddPiece(5, -3);

    default AddConnection(3, 4, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(5, 1, 1);
}

UCLASS()
class UOC_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, -2);
    default AddPiece(3, 1);
    default AddPiece(4, -2);

    default AddConnection(0, 2, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UOC_Chest_Bettingowner_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Bettingowner_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, -1);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(1, 0, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UOC_Chest_Dexter_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Dexter_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);

    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 3, -1);
}

UCLASS()
class UOC_Chest_Digger578_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Digger578_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);

    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UOC_Chest_Graham_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Graham_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, -3);
    default AddPiece(5, -1);

    default AddConnection(4, 1, -1);
    default AddConnection(2, 5, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UOC_Chest_Guard206_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard206_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 1);

    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UOC_Chest_Guard209_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard209_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 2);
    default AddPiece(2, -1);
    default AddPiece(3, 0);
    default AddPiece(4, 3);

    default AddConnection(3, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UOC_Chest_Guard221_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard221_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, 1);
    default AddPiece(5, -2);

    default AddConnection(1, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UOC_Chest_Guard239_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard239_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, 0);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(0, 2, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(2, 5, 1);
    default AddConnection(1, 5, -1);
}

UCLASS()
class UOC_Chest_Guard241_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard241_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 3);
    default AddPiece(5, 2);

    default AddConnection(2, 1, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UOC_Chest_Guard252_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard252_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, 3);

    default AddConnection(4, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 0, -1);
}

UCLASS()
class UOC_Chest_Guard253_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard253_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 1);

    default AddConnection(2, 0, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Chest_Herek_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Herek_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 0);

    default AddConnection(0, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOC_Chest_Milten_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Milten_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class UOC_Chest_Rodriguez_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Rodriguez_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);

    default AddConnection(0, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class UOC_Chest_Skip_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Skip_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, 0);
    default AddPiece(5, -3);

    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(3, 5, 1);
}

UCLASS()
class UOC_Chest_Torrez_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Torrez_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, -3);
    default AddPiece(5, 3);

    default AddConnection(0, 5, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(2, 1, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 1, 1);
}

UCLASS()
class UOC_Chest_Whistler_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Whistler_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, 1);

    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UOC_Chest_Guard220_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard220_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 2);

    default AddConnection(2, 1, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 0, -1);
}

//////////////////////////////////////////////////////////
//******************OLD MINE************************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UOM_Chest_Aaron_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Aaron_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, 2);
    default AddPiece(5, 1);

    default AddConnection(2, 0, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 1, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class UOM_Chest_Alberto_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Alberto_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(1, 4, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOM_Chest_Alberto_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Alberto_03_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 1);

    default AddConnection(2, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UOM_Chest_Alberto_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Alberto_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(2, 1, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(3, 0, 1);
}

UCLASS()
class UOM_Chest_Alberto_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Alberto_05_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, 0);

    default AddConnection(4, 2, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class UOM_Chest_Santino_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Santino_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -2);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, -3);

    default AddConnection(4, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class UOM_Chest_Santino_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Santino_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddPiece(4, -3);

    default AddConnection(2, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UOM_Chest_Santino_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Santino_03_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, 0);
    default AddPiece(4, -1);

    default AddConnection(0, 1, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOM_Chest_Ulbert_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Ulbert_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, -1);

    default AddConnection(1, 4, 1);
    default AddConnection(2, 1, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 2, -1);
}

UCLASS()
class UOM_Chest_Ulbert_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OM_Chest_Ulbert_02_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, 0);
    default AddPiece(5, -2);

    default AddConnection(4, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class UOC_Chest_Guard230_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Guard230_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, 0);
    default AddPiece(3, 2);
    default AddPiece(4, 2);
    default AddPiece(5, 3);

    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UOC_Chest_Tower_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Tower_04_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(0, 1, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 0, -1);
}

UCLASS()
class UOC_Chest_Raven_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Raven_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, 3);
    default AddPiece(6, 1);

    default AddConnection(5, 3, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 6, -1);
    default AddConnection(0, 5, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(4, 5, 1);
}

UCLASS()
class UOC_Chest_Bartholo_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Bartholo_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, 3);

    default AddConnection(1, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UOC_Chest_Thorus_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Thorus_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -1);
    default AddPiece(2, -1);
    default AddPiece(3, -2);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(5, 4, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(5, 3, -1);
}

UCLASS()
class UOC_Chest_Throne_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OC_Chest_Throne_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, -3);

    default AddConnection(1, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 2, 1);
}

UCLASS()
class UOCS_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OCS_Chest_04_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -2);
    default AddPiece(2, 1);
    default AddPiece(3, 1);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 2, -1);
}

//////////////////////////////////////////////////////////
//******************ORC GRAVEYARRD******************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UOG_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OG_Chest_01_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(5, 3, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 0, -1);
}

//////////////////////////////////////////////////////////
//******************ORC ENCLAVE*********************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UOtown_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"Otown_Chest_01_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 0);
    default AddPiece(5, -1);

    default AddConnection(2, 5, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(5, 1, -1);
}

UCLASS()
class UOtown_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"Otown_Chest_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, -3);
    default AddPiece(5, 1);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 5, 1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 5, 1);
}

UCLASS()
class UOtown_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"Otown_Chest_03_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, -2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(0, 1, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(5, 4, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UOtown_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"Otown_Chest_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 0);
    default AddPiece(2, 3);
    default AddPiece(3, 2);
    default AddPiece(4, 3);
    default AddPiece(5, 1);

    default AddConnection(2, 1, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(5, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(3, 4, 1);
}

UCLASS()
class UOTT_Chest_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OTT_Chest_05_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, -1);

    default AddConnection(0, 4, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 4, 1);
}

UCLASS()
class UOTT_Chest_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OTT_Chest_06_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, -2);

    default AddConnection(2, 0, 1);
    default AddConnection(4, 3, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(3, 0, -1);
}

UCLASS()
class UOTT_Chest_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"OTT_Chest_09_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, 2);
    default AddPiece(5, -1);

    default AddConnection(3, 1, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(5, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 5, -1);
}

//////////////////////////////////////////////////////////
//******************SUNKEN TOWER********************** */
////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class USNT_LootCage_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SNT_LootCage_Door_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -2);

    default AddConnection(3, 4, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(3, 1, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class USNT_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SNT_Chest_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddPiece(5, 2);

    default AddConnection(2, 4, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(1, 4, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class USNT_Chest_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SNT_Chest_06_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 0);
    default AddPiece(3, -3);
    default AddPiece(4, -1);
    default AddPiece(5, 2);

    default AddConnection(5, 2, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 4, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class USNT_Chest_09_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SNT_Chest_09_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, 1);
    default AddPiece(2, -2);
    default AddPiece(3, -3);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(1, 4, -1);
    default AddConnection(5, 0, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 4, 1);
}

//////////////////////////////////////////////////////////
//******************SHIPWRECK********************** */
////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class USW_Captain_Ship_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SW_Captain_Ship_Door_Lock";
    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, 1);
    default AddPiece(3, -3);
    default AddPiece(4, -2);
    
    default AddConnection(3, 0, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 1, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class USW_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SW_Chest_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 1);
    default AddPiece(4, -2);
    default AddPiece(5, -3);

    default AddConnection(4, 3, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 5, 1);
    default AddConnection(4, 5, -1);
}

UCLASS()
class USW_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SW_Chest_02_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(0, 1, 1);
    default AddConnection(4, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class USW_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SW_Chest_03_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, -3);

    default AddConnection(2, 3, -1);
    default AddConnection(4, 2, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(4, 3, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class USW_Chest_07_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SW_Chest_07_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 3);

    default AddConnection(1, 0, 1);
    default AddConnection(0, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 2, 1);
}

//////////////////////////////////////////////////////////
//******************SLEEPER TEMPLE********************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class UTST_Chest_Forge_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Forge_01_Lock";
    default AddPiece(0, 0);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, 0);
    default AddConnection(1, 3, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 4, 1);
    default AddConnection(4, 1, 1);
}

UCLASS()
class UTST_Chest_Lava_Stronghold_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Lava_Stronghold_01_Lock";
    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddConnection(1, 0, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 3, 1);
}

UCLASS()
class UTST_Chest_Slave_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Slave_01_Lock";
    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(3, 2, -1);
}

UCLASS()
class UTST_Chest_WinchRoom_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_WinchRoom_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, 2);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, 1);
    
    default AddConnection(0, 5, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(5, 1, -1);
    default AddConnection(5, 4, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(5, 2, 1);
}

UCLASS()
class UTST_Chest_WinchRoom_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_WinchRoom_02_Lock";
    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(2, 0, -1);
}

UCLASS()
class UTST_Chest_WinchRoom_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_WinchRoom_03_Lock";
    default AddPiece(0, -2);
    default AddPiece(1, 2);
    default AddPiece(2, -1);
    default AddPiece(3, 2);
    default AddConnection(0, 3, -1);
    default AddConnection(1, 0, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, -1);
}

UCLASS()
class UTST_Chest_Sleeper_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Sleeper_01_Lock";
    default AddPiece(0, -2);
    default AddPiece(1, 3);
    default AddPiece(2, 3);
    default AddPiece(3, -3);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class UTST_Chest_Sleeper_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Sleeper_02_Lock";
    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 1);
    default AddPiece(5, -2);
    default AddConnection(1, 5, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(3, 4, -1);
}

UCLASS()
class UTST_Chest_Lava_Stronghold_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"TST_Chest_Lava_Stronghold_02_Lock";
    default AddPiece(0, -2);
    default AddPiece(1, 0);
    default AddPiece(2, 0);
    default AddPiece(3, 3);
    default AddPiece(4, 2);
    default AddConnection(4, 3, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(4, 0, -1);
}

//////////////////////////////////////////////////////////
//******************SWAMP CAMP********************** */
////////////////////////////////////////////////////////

//////////////////////CHEST/////////////////////////////

UCLASS()
class USC_Chest_CorKalom_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_CorKalom_01_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -3);

    default AddConnection(2, 1, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class USC_Chest_Natalia_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Natalia_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, 3);
    default AddPiece(2, 2);
    default AddPiece(3, -2);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(5, 0, 1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(3, 5, -1);
    default AddConnection(4, 3, 1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 2, 1);
}

UCLASS()
class USC_Chest_Yberion_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Yberion_Lock";

    default AddPiece(0, 0);
    default AddPiece(1, -3);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, -1);

    default AddConnection(1, 3, 1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 2, -1);
    default AddConnection(0, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class USC_Chest_Chani_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Chani_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, -1);
    default AddPiece(2, -3);
    default AddPiece(3, 2);
    default AddPiece(4, 3);

    default AddConnection(1, 4, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 1, 1);
    default AddConnection(2, 3, 1);
}

UCLASS()
class USC_Chest_Blacksmith_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Blacksmith_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, 3);
    default AddPiece(4, -2);
    default AddPiece(5, 2);

    default AddConnection(5, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 5, -1);
    default AddConnection(1, 2, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 3, -1);
    default AddConnection(5, 4, 1);
}

UCLASS()
class USC_Chest_BaalCadar_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_BaalCadar_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 1);
    default AddPiece(4, -1);

    default AddConnection(2, 0, -1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(1, 2, -1);
    default AddConnection(3, 1, -1);
}

UCLASS()
class USC_Chest_BaalNamib_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_BaalNamib_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 0);
    default AddPiece(2, -1);
    default AddPiece(3, -3);
    default AddPiece(4, 3);
    default AddPiece(5, -3);

    default AddConnection(4, 1, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(1, 4, -1);
    default AddConnection(4, 5, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(2, 5, 1);
}

UCLASS()
class USC_Chest_BaalOrun_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_BaalOrun_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, -3);
    default AddPiece(3, 0);
    default AddPiece(4, 1);
    default AddPiece(5, -2);

    default AddConnection(0, 2, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(2, 4, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(1, 5, -1);
    default AddConnection(4, 1, -1);
}

UCLASS()
class USC_Chest_BaalTondral_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_BaalTondral_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, 3);

    default AddConnection(0, 4, -1);
    default AddConnection(4, 2, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class USC_Chest_CorAngar_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_CorAngar_Lock";

    default AddPiece(0, -1);
    default AddPiece(1, -2);
    default AddPiece(2, -2);
    default AddPiece(3, 2);
    default AddPiece(4, 3);
    default AddPiece(5, 3);

    default AddConnection(1, 4, -1);
    default AddConnection(5, 2, 1);
    default AddConnection(3, 4, -1);
    default AddConnection(2, 5, -1);
    default AddConnection(0, 4, 1);
    default AddConnection(1, 5, 1);
    default AddConnection(2, 4, 1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 1, 1);
}

UCLASS()
class USC_Chest_CorKalom_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_CorKalom_03_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, 1);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, 0);

    default AddConnection(4, 3, 1);
    default AddConnection(0, 2, 1);
    default AddConnection(2, 4, -1);
    default AddConnection(2, 1, -1);
    default AddConnection(4, 1, -1);
    default AddConnection(3, 0, -1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class USC_Chest_Fortuno_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Fortuno_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, 3);
    default AddPiece(4, -3);
    default AddPiece(5, -2);
    default AddPiece(6, 0);

    default AddConnection(5, 1, 1);
    default AddConnection(3, 0, -1);
    default AddConnection(0, 5, 1);
    default AddConnection(3, 5, 1);
    default AddConnection(2, 0, -1);
    default AddConnection(2, 3, -1);
    default AddConnection(6, 2, 1);
    default AddConnection(3, 2, 1);
}

UCLASS()
class USC_Chest_Nyras_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Nyras_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -3);
    default AddPiece(2, 1);
    default AddPiece(3, 0);
    default AddPiece(4, -3);
    default AddPiece(5, -1);

    default AddConnection(1, 4, -1);
    default AddConnection(5, 0, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(5, 3, -1);
    default AddConnection(3, 0, 1);
    default AddConnection(2, 3, -1);
    default AddConnection(1, 3, -1);
}

UCLASS()
class USC_Chest_Viran_Lock: UGothicLockConfig
{
    default m_UniqueName = n"SC_Chest_Viran_Lock";

    default AddPiece(0, 1);
    default AddPiece(1, -3);
    default AddPiece(2, 2);
    default AddPiece(3, 3);
    default AddPiece(4, 1);
    default AddPiece(5, 3);

    default AddConnection(5, 4, 1);
    default AddConnection(2, 5, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 4, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(4, 3, 1);
    default AddConnection(5, 3, 1);
}

//////////////////////////////////////////////////////////
//******************XARDAS TOWER********************** */
////////////////////////////////////////////////////////

//////////////////////DOORS/////////////////////////////

UCLASS()
class UXT_ExperimentalChamber_Door_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_ExperimentalChamber_Door_Lock";

    default AddPiece(0, 2);
    default AddPiece(1, 1);
    default AddPiece(2, 3);
    default AddPiece(3, 0);
    default AddPiece(4, 1);

    default AddConnection(0, 1, 1);
    default AddConnection(0, 2, -1);
    default AddConnection(4, 0, -1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 2, -1);
    default AddConnection(4, 2, -1);
}

//////////////////////CHEST/////////////////////////////

UCLASS()
class UXT_Chest_01_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_01_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 1);
    default AddPiece(2, 2);
    default AddPiece(3, 0);
    default AddPiece(4, 3);
    default AddPiece(5, -1);

    default AddConnection(2, 5, -1);
    default AddConnection(4, 0, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 0, -1);
    default AddConnection(3, 1, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(4, 5, -1);
    default AddConnection(5, 3, 1);
    default AddConnection(0, 3, -1);
    default AddConnection(0, 2, 1);
}

UCLASS()
class UXT_Chest_02_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_02_Lock";

    default AddPiece(0, -2);
    default AddPiece(1, 1);
    default AddPiece(2, -3);
    default AddPiece(3, -2);
    default AddPiece(4, 2);
    default AddPiece(5, -3);

    default AddConnection(4, 5, 1);
    default AddConnection(5, 1, 1);
    default AddConnection(5, 2, -1);
    default AddConnection(0, 2, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(4, 2, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(3, 2, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(4, 3, -1);
}

UCLASS()
class UXT_Chest_03_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_03_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, 3);
    default AddPiece(2, 1);
    default AddPiece(3, 2);
    default AddPiece(4, 0);
    default AddPiece(5, 3);

    default AddConnection(1, 0, 1);
    default AddConnection(0, 5, 1);
    default AddConnection(3, 2, 1);
    default AddConnection(0, 1, 1);
    default AddConnection(1, 3, 1);
    default AddConnection(3, 1, -1);
    default AddConnection(1, 4, -1);
    default AddConnection(2, 4, 1);
}

UCLASS()
class UXT_Chest_04_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_04_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, -2);
    default AddPiece(3, -1);
    default AddPiece(4, -3);
    default AddPiece(5, 2);

    default AddConnection(4, 1, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(1, 5, -1);
    default AddConnection(3, 4, -1);
    default AddConnection(0, 1, 1);
    default AddConnection(5, 3, 1);
    default AddConnection(3, 5, -1);
    default AddConnection(5, 2, -1);
    default AddConnection(3, 2, -1);
    default AddConnection(0, 3, 1);
}

UCLASS()
class UXT_Chest_05_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_05_Lock";

    default AddPiece(0, -3);
    default AddPiece(1, -1);
    default AddPiece(2, 2);
    default AddPiece(3, -1);
    default AddPiece(4, -3);
    default AddPiece(5, -2);

    default AddConnection(5, 2, 1);
    default AddConnection(2, 0, 1);
    default AddConnection(0, 5, -1);
    default AddConnection(5, 3, -1);
    default AddConnection(2, 3, 1);
    default AddConnection(1, 3, -1);
    default AddConnection(0, 1, -1);
    default AddConnection(1, 0, 1);
    default AddConnection(4, 3, 1);
}

UCLASS()
class UXT_Chest_06_Lock: UGothicLockConfig
{
    default m_UniqueName = n"XT_Chest_06_Lock";

    default AddPiece(0, 3);
    default AddPiece(1, 2);
    default AddPiece(2, 3);
    default AddPiece(3, -1);
    default AddPiece(4, 1);
    default AddPiece(5, -3);

    default AddConnection(2, 1, 1);
    default AddConnection(5, 2, 1);
    default AddConnection(4, 5, 1);
    default AddConnection(1, 0, 1);
    default AddConnection(3, 0, 1);
    default AddConnection(0, 1, -1);
    default AddConnection(0, 2, 1);
    default AddConnection(0, 4, -1);
    default AddConnection(0, 5, 1);
}
