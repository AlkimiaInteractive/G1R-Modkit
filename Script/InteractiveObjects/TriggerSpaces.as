//*************************************//
//           GENERIC CLASSES           //
//*************************************//

//EXAMPLE
UCLASS()
class UTest_Key_A: UItemDefinition
{
    default m_UniqueName = n"LockExampleA";
    default m_Name = "ItKe_Berg_01";
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Key/BP_ItKe_Berg_01_Visual.BP_ItKe_Berg_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Key/BP_ItKe_Berg_01_World.BP_ItKe_Berg_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItKe_Berg_01.T_ItemIcon_ItKe_Berg_01";
    default m_MaxStack = 1;
    default m_Description = "ItKe_Berg_01_description";
    default SetItemType(GameplayTag::Item_Key);
}
UCLASS()
class UTest_Key_B: UItemDefinition
{
    default m_UniqueName = n"LockExampleB";
    default m_Name = "ItKe_Berg_01";
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Key/BP_ItKe_Berg_01_Visual.BP_ItKe_Berg_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Key/BP_ItKe_Berg_01_World.BP_ItKe_Berg_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItKe_Berg_01.T_ItemIcon_ItKe_Berg_01";
    default m_MaxStack = 1;
    default m_Description = "ItKe_Berg_01_description";
    default SetItemType(GameplayTag::Item_Key);
}
UCLASS()
class UExampleDoor_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = false;
};

UCLASS()
class UExampleDoor: UDefaultInteractive
{
	default m_UniqueName = n"Popo";
	default m_OptionalObject = UGenericDoor_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	//default m_Lock = n"Lock01";
	default m_Keys.Add(n"LockExampleA");
	//default m_Keys.Add(n"LockExampleB");
};

// GENERIC TRIGGERS

UCLASS()
class UGenericWinch_ExtraData: UTriggerExtraData
{
	default m_StateName.Add(EWinchState::MoveRight, n"ToRight");
	default m_StateName.Add(EWinchState::MoveLeft, n"ToLeft");
	default m_StateName.Add(EWinchState::MoveFastRight, n"MoveRight");
	default m_StateName.Add(EWinchState::MoveFastLeft, n"MoveLeft");
	default m_StateName.Add(EWinchState::Exit, n"Exit");
	default m_NumSteps = 5;
	default m_DefaultStep = 4;
};

UCLASS()
class UGenericTriggerWinch: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UGenericWinch_ExtraData::StaticClass();
	default m_UniqueName = n"GenericTriggerWinch";
};

UCLASS()
class UGenericTriggerLeverOrc: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"GenericTriggerLeverOrc";
};

UCLASS()
class UGenericTriggerLeverTorch: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever;
	default m_UniqueName = n"GenericTriggerLeverTorch";
};

// GENERIC GATES

UCLASS()
class UGenericGate_ExtraData: UDoorInteractiveExtraData
{
	default m_ConnectedTrigger = n"GenericTriggerWinch"; 	
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 5;
	default m_DefaultStep = 4;
};

UCLASS()
class UGenericGate: UDefaultInteractive
{
	default m_OptionalObject = UGenericGate_ExtraData::StaticClass();
};

// GENERIC DOORS

UCLASS()
class UGenericTriggeredDoor_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"GenericTriggerLeverTorch"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
};

UCLASS()
class UGenericTriggeredDoor: UDefaultInteractive
{
	default m_OptionalObject = UGenericDoor_ExtraData::StaticClass();
};

UCLASS()
class UGenericDoor_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = false;
};

UCLASS()
class UGenericDoor: UDefaultInteractive
{
	default m_OptionalObject = UGenericDoor_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};

UCLASS()
class UGenericDoorSavedState_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UGenericDoorSavedState: UDefaultInteractive
{
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};


UCLASS()
class UFakeHeartLever: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_HearthFake;
	default m_UniqueName = n"FakeHeartLever";
};

UCLASS()
class UGenericDoorNotPlayer_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = false;
};

UCLASS()
class UGenericDoorNotPlayer: UDefaultInteractive
{
	default m_OptionalObject = UGenericDoorNotPlayer_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_UsableByPlayer = false;
};


//************************************//
//           CUSTOM CLASSES           //
//************************************//

//******************************************************************************************************************************************************************************************************************************* */
//******************************************************************************************************************************************************************************************************************************* */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////// DOORS ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////*Bell*///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UPushBell_Door: UGenericDoorSavedState
{
	default m_UniqueName = n"PushBell_Door";
	default m_DefaultInteraction = GameplayTag::Action_Door_Bell;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

///////////////////////////////////////////*ABANDONED MINE*///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAbandonedMine_Fence_Door: UGenericDoorSavedState
{
	default m_UniqueName = n"AbandonedMine_Fence_Door";
	default m_DefaultInteraction = GameplayTag::Action_Door_AbandonedFence;
	default m_Keys.Add(n"ItKe_AbandonedMine_01");
	default m_StartBeforeRotation = true;
};

///////////////////////////////////////////*ANCIENT MONASTERY*///////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAMR_Storage_Room_Door: UDefaultInteractive
{
	default m_UniqueName = n"AMR_Storage_Room_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"AMR_Storage_Room_Lock";
	default m_Keys.Add(n"ItKe_Focus_04");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*BANDITS CAMP*////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UBC_LootCave_Door: UDefaultInteractive
{
	default m_UniqueName = n"BC_LootCave_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"BC_LootCave_Door_Lock";
	default m_Keys.Add(n"ItKe_Quentin_01");
	default m_LockDifficulty = 3;
	default m_bNoRandomLock = true;
};

UCLASS()
class UBC_LootCave_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"BC_LootCave_Door_02";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"BC_LootCave_Door_Lock_02";
	default m_Keys.Add(n"ItKe_Quentin_01");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*BROKEN TOWER*////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UBT_Tower_Door: UDefaultInteractive
{
	default m_UniqueName = n"BT_Tower_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"BT_Tower_Door_Lock";
	default m_Keys.Add(n"ItKe_Tower_01");
	default m_LockDifficulty = 7;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*CAVALORN*////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UCV_Stash_Door: UDefaultInteractive
{
	default m_UniqueName = n"CV_Stash_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"CV_Stash_Door_Lock";
	default m_Keys.Add(n"ItKe_Cavalorn_01");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*EXCHANGE ZONE*////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UEZ_LootCage_Door: UDefaultInteractive
{
	default m_UniqueName = n"EZ_LootCage_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"EZ_LootCage_Door_Lock";
	default m_Keys.Add(n"ItKe_LootCage_01");
	default m_LockDifficulty = 1;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*FREE MINE*///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UFM_AbandonedGallery_Door: UDefaultInteractive
{
	default m_UniqueName = n"FM_AbandonedGallery_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"FM_AbandonedGallery_Door_Lock";
	default m_Keys.Add(n"ItKe_AbandonedGallery_01");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*MOUNTAIN FORTRESS*///////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMF_CellarCages_Door: UDefaultInteractive
{
	default m_UniqueName = n"MF_CellarCages_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"MF_CellarCages_Lock";
	default m_Keys.Add(n"ItKe_CellarCages_01");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

UCLASS()
class UMF_CellarCages_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"MF_CellarCages_Door_02";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"MF_CellarCages_Lock_02";
	default m_Keys.Add(n"ItKe_CellarCages_01");
	default m_LockDifficulty = 4;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*NEW CAMP*/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UNC_RiceLord_Door_01: UDefaultInteractive
{
	default m_UniqueName = n"NC_RiceLord_Door_01";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"NC_RiceLord_Room_Lock_01";
	default m_Keys.Add(n"ItKe_Ricelord_01");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

UCLASS()
class UNC_RiceLord_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"NC_RiceLord_Door_02";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"NC_RiceLord_Room_Lock_02";
	default m_Keys.Add(n"ItKe_Ricelord_01");
	default m_LockDifficulty = 3;
	default m_bNoRandomLock = true;
};

UCLASS()
class UNC_Cave_Lee_Door: UDefaultInteractive
{
	default m_UniqueName = n"NC_Cave_Lee_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"NC_LeeCave_Door_Lock";
	default m_Keys.Add(n"ItKe_LeeDoor");
	default m_LockDifficulty = 4;
	default m_bNoRandomLock = true;
};

UCLASS()
class UNC_Cave_Tavern_Door: UDefaultInteractive
{
	default m_UniqueName = n"NC_Cave_Tavern_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"NC_Cave_Tavern_Door_Lock";
	default m_Keys.Add(n"ItKe_TavernDoor");
	default m_LockDifficulty = 2;
	default m_bNoRandomLock = true;
};

UCLASS()
class UNC_Cave_Tavern_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"NC_Cave_Tavern_Door_02";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"NC_Cave_Tavern_Door_Lock_02";
	default m_Keys.Add(n"ItKe_TavernDoor");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

///////////////////////////////////////////*OLD CAMP*/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOC_Gomez_Room_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Gomez_Room_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Gomez_Room_Lock";
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_Keys.Add(n"ItKe_Gomez_01");
	default m_LockDifficulty = 4;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Cellar_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Cellar_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Cellar_Door_Lock";
	default m_Keys.Add(n"ItKe_Storage_01");
	default m_Keys.Add(n"ItKe_MerchantCellarDoor");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_Keys.Add(n"ItKe_Dungeonkey");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Cellar_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"OC_Cellar_Door_02";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Cellar_Lock_02";
	default m_Keys.Add(n"ItKe_MerchantCellarDoor");
	default m_Keys.Add(n"ItKe_Storage_01");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_Keys.Add(n"ItKe_Dungeonkey");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

UCLASS()
class USantino_Door_ExtraData: UGenericDoor_ExtraData
{
	default m_ConnectedTrigger = n"OC_Santino_Door";
	default m_SaveData = true;
};

UCLASS()
class UOC_Santino_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Santino_Door";
	default m_OptionalObject = USantino_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Santino_Lock";
	default m_Keys.Add(n"ItKe_MerchantCellarDoor");
	default m_LockDifficulty = 5;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Merchant_Secret_Passage_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Merchant_Secret_Passage_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Keys.Add(n"ItKe_MerchantCellarDoor");
};

UCLASS()
class UOC_Prison_Dungeons_Moat_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Moat_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Prison_Dungeons_Moat_Lock";
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 7;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Prison_Dungeons_Cell_04_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_04_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Keys.Add(n"Permalocked");
};

UCLASS()
class UOC_Prison_Dungeons_Cell_05_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_05_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Keys.Add(n"Permalocked");
};

UCLASS()
class UOC_Prison_Dungeons_Cell_06_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_06_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Prison_Dungeons_06_Lock";
	default m_Keys.Add(n"ItKe_Dungeonkey");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 2;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Prison_Dungeons_Cell_09_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_09_Door";
	default m_OptionalObject = UGenericDoor_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Prison_Dungeons_09_Lock";
	default m_Keys.Add(n"ItKe_Dungeonkey");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 7;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Prison_Dungeons_Cell_11_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_11_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Keys.Add(n"Permalocked");
};

UCLASS()
class UOC_Prison_Dungeons_Cell_23_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Prison_Dungeons_Cell_23_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Prison_Dungeons_23_Lock";
	default m_Keys.Add(n"ItKe_Dungeonkey");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 2;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Armory_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Armory_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Armory_Door_Lock";
	default m_Keys.Add(n"ItKe_Smith_01");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Orebaron_Room_01_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Orebaron_Room_01_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Orebaron_Room_01_Lock";
};

UCLASS()
class UOC_Orebaron_Room_02_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Orebaron_Room_02_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Orebaron_Room_02_Lock";
};

UCLASS()
class UOC_Raven_Room_01_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Raven_Room_01_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Raven_Room_01_Lock";
};

UCLASS()
class UOC_Raven_Room_02_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Raven_Room_02_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Raven_Room_02_Lock";
	default m_Keys.Add(n"ItKe_RavenTower");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Mages_Room_01_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Mages_Room_01_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Mages_Room_01_Lock";
	default m_Keys.Add(n"ItKe_FireMagesRoom");
	default m_LockDifficulty = 3;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Mages_Room_02_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Mages_Room_02_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Mages_Room_02_Lock";
	default m_Keys.Add(n"ItKe_FireMagesRoom");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Mages_Room_03_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Mages_Room_03_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Mages_Room_03_Lock";
	default m_Keys.Add(n"ItKe_FireMagesRoom");
	default m_LockDifficulty = 3;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Guards_Cell_01_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Guards_Cell_01_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Guards_Cell_01_Lock";
};

UCLASS()
class UOC_Guards_Cell_02_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Guards_Cell_02_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Guards_Cell_02_Lock";
};

UCLASS()
class UOC_Forge_Loot_Room_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Forge_Loot_Room_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Forge_Loot_Room_Lock";
};

UCLASS()
class UOC_Castle_Guards_Kitchen_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Castle_Guards_Kitchen_Door";
	default m_OptionalObject = UGenericDoor_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};

UCLASS()
class UOC_Fisk_Storage_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Fisk_Storage_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Fisk_Storage_Door_Lock";
	default m_Keys.Add(n"ItKe_FiskStorage");
	default m_LockDifficulty = 7;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Fisk_Hut_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Fisk_Hut_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Fisk_Hut_Door_Lock";
	default m_LockDifficulty = 4;
	default m_bNoRandomLock = true;
};

UCLASS()
class UOC_Cell12_Bandit_Door: UDefaultInteractive
{
	default m_UniqueName = n"OC_Cell12_Bandit_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"OC_Cell12_Bandit_Door_Lock";
	default m_Keys.Add(n"ItKe_BanditCell");
	default m_Keys.Add(n"ItKe_GomezCastleMaster");
	default m_LockDifficulty = 2;
	default m_bNoRandomLock = true;
};

//////////////////////////////////////////////////*SHIPWRECK*///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class USW_Captain_Ship_Door: UDefaultInteractive
{
	default m_UniqueName = n"SW_Captain_Ship_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"SW_Captain_Ship_Door_Lock";
	default m_Keys.Add(n"ItKe_CaptainShip");
	default m_LockDifficulty = 6;
	default m_bNoRandomLock = true;
};

//////////////////////////////////////////////////*SUNKEN TOWER*////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class USNT_LootCage_Door: UDefaultInteractive
{
	default m_UniqueName = n"SNT_LootCage_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"SNT_LootCage_Door_Lock";
	default m_Keys.Add(n"ItKe_Sunkentower");
    default m_LockDifficulty = 1;
	default m_bNoRandomLock = true;
};

//////////////////////////////////////////////////*XARDAS TOWER*////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UXT_ExperimentalChamber_Door: UDefaultInteractive
{
	default m_UniqueName = n"XT_ExperimentalChamber_Door";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"XT_ExperimentalChamber_Door_Lock";
	default m_LockDifficulty = 1;
	default m_bNoRandomLock = true;
};







//******************************************************************************************************************************************************************************************************************************* */
//******************************************************************************************************************************************************************************************************************************* */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////// PUZZLES //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////*ABANDONED MINE ORC EMBED WINCH*/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UMainDoorOrcEmbedTriggerWinch: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Activate_MachineOrc;
	default m_UniqueName = n"MainDoorOrcEmbedTriggerWinch";
	default m_ActiveUntilEvent = n"MainDoorOrcEmbedTriggerWinch";
	default m_RequiredUniqueObject = n"ItMs_Winch";
};

UCLASS()
class UAM_Hub_Winch_ExtraData: UGenericWinch_ExtraData
{
	default m_DefaultStep = 0;
};

UCLASS()
class UAM_Hub_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoor_Abandoned_Mine_Door_Puzzle";
	default m_DisabledUntilEvent = n"MainDoorOrcEmbedTriggerWinch";
	default m_OptionalObject = UAM_Hub_Winch_ExtraData::StaticClass();
};

UCLASS()
class UAM_Hub_Gate_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoor_Abandoned_Mine_Door_Puzzle"; 
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UAM_Hub_Gate: UGenericGate
{
	default m_OptionalObject = UAM_Hub_Gate_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*ABANDONED MINE ORC ULU TALISMAN DOOR*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UAbandonedMine_UluTalisman_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"AbandonedMine_UluTalisman_Door"; 
};

UCLASS()
class UAbandonedMine_UluTalisman_Door: UDefaultInteractive
{
	default m_ObjectInteractAngle = 180.0f;
	default m_UniqueName = n"AbandonedMine_UluTalisman_Door";
	default m_OptionalObject = UAbandonedMine_UluTalisman_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_AbandonedDoor;
	//default m_Lock = n"Lock_AbandonedMine_UluTalisman_Door";
	default m_Keys.Add(n"ItAt_Amulet_Ulu_Talisman");
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

///////////////////////////////////////////*ANCIENT MONASTERY GATE*/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDooAncientMonastery_Winch_ExtraData: UGenericWinch_ExtraData
{
	//default m_BackToStart = true;
	default m_DefaultStep = 0;
};

UCLASS()
class UMainDooAncientMonastery_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDooAncientMonastery";
	default m_OptionalObject = UMainDooAncientMonastery_Winch_ExtraData::StaticClass();
};

UCLASS()
class UMainDooAncientMonastery_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDooAncientMonastery";
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UMainDooAncientMonastery_Gate: UGenericGate
{
	default m_OptionalObject = UMainDooAncientMonastery_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*ANCIENT MONASTERY LEVER WALL*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UARM_LeverWall_Trigger_01: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_Wall;
	default m_UniqueName = n"ARM_Lever_01";
};

UCLASS()
class UARM_Fence_Door_01_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"ARM_Lever_01"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UARM_Fence_Door_01_: UDefaultInteractive
{
	default m_OptionalObject = UARM_Fence_Door_01_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};

///////////////////////////////////////////*ANCIENT MONASTERY COLUMN*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UARM_Column_Egg_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UARM_Column_Egg_Interactable: UDefaultInteractive
{
	default m_OptionalObject = UARM_Column_Egg_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Column_Egg;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

///////////////////////////////////////////*FREE MINE ENTRANCE*/////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDoorEntranceFreeMine_Winch_ExtraData: UGenericWinch_ExtraData
{
	//default m_BackToStart = true;
	default m_DefaultStep = 0;
};

UCLASS()
class UMainDoorEntranceFreeMine_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorEntranceFreeMine";
	default m_OptionalObject = UMainDoorEntranceFreeMine_Winch_ExtraData::StaticClass();
};

UCLASS()
class UMainDoorEntranceFreeMineGate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorEntranceFreeMine";
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UMainDoorEntranceFreeMineGate: UGenericGate
{
	default m_OptionalObject = UMainDoorEntranceFreeMineGate_ExtraData::StaticClass();
};

UCLASS()
class UFM_Winch_Gate: UDefaultInteractive
{
	default m_UniqueName = n"FM_Winch_Gate";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Keys.Add(n"ItKe_Freemine");
};

///////////////////////////////////////////*GOBLIN CAVE DOOR*////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UGoblinDoorCave_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UGoblinDoorCave: UDefaultInteractive
{
	default m_UniqueName = n"GoblinDoorCave";
	default m_OptionalObject = UGoblinDoorCave_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_GoblinCave;
};

///////////////////////////////////////////*OLD CAMP ENTRANCE GATE*/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDoorEntranceOldCamp_Winch_ExtraData: UTriggerExtraData
{
	default m_StateName.Add(EWinchState::MoveLeft, n"ToRight");
	default m_StateName.Add(EWinchState::MoveRight, n"ToLeft");
	default m_StateName.Add(EWinchState::MoveFastLeft, n"MoveRight");
	default m_StateName.Add(EWinchState::MoveFastRight, n"MoveLeft");
	default m_StateName.Add(EWinchState::Exit, n"Exit");
	default m_NumSteps = 5;
	default m_DefaultStep = 4;
	default m_InverseInput = true;
};

UCLASS()
class UMainDoorEntranceOldCamp_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorEntranceOldCamp";
	default m_OptionalObject = UMainDoorEntranceOldCamp_Winch_ExtraData::StaticClass();
};

UCLASS()
class UMainDoorEntranceOldCamp_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorEntranceOldCamp"; 
};

UCLASS()
class UMainDoorEntranceOldCamp_Gate: UGenericGate
{
	default m_OptionalObject = UMainDoorEntranceOldCamp_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*OLD CAMP CASTLE GATE*///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDoorCastleOldCamp_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorCastleOldCamp";
};

UCLASS()
class UMainDoorCastleOldCamp_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorCastleOldCamp"; 
};

UCLASS()
class UMainDoorCastleOldCamp_Gate: UGenericGate
{
	default m_OptionalObject = UMainDoorCastleOldCamp_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*OLD CAMP SOUTH GATE*////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDoorSouthGateOldCamp_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorSouthGateOldCamp";
};

UCLASS()
class UMainDoorSouthGateOldCamp_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorSouthGateOldCamp"; 
};

UCLASS()
class UMainDoorSouthGateOldCamp_Gate: UGenericGate
{
	default m_OptionalObject = UMainDoorSouthGateOldCamp_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*OLD CAMP CASTLE SECRET DOOR*////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOldCampDungeonSecretDoorTrigger: UGenericTriggerLeverTorch
{
	default m_UniqueName = n"OldCampDungeonSecretDoorTrigger";
};

UCLASS()
class UOldCampDungeonSecretDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"OldCampDungeonSecretDoorTrigger";
};

UCLASS()
class UOldCampDungeonSecretDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = UOldCampDungeonSecretDoor_ExtraData::StaticClass();
};


///////////////////////////////////////////*OLD CAMP TOWER SECRET DOOR*////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOldCampTowerSecretDoorTrigger: UGenericTriggerLeverTorch
{
	default m_UniqueName = n"OldCampTowerSecretDoorTrigger";
};

UCLASS()
class UOldCampTowerSecretDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"OldCampTowerSecretDoorTrigger";
};

UCLASS()
class UOldCampTowerSecretDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = UOldCampTowerSecretDoor_ExtraData::StaticClass();
};

///////////////////////////////////////////*OLD CAMP MERCHANT SECRET DOOR*////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOldCampMerchantSecretDoorTrigger: UGenericTriggerLeverTorch
{
	default m_UniqueName = n"OldCampMerchantSecretDoorTrigger";
};

UCLASS()
class UOldCampMerchantSecretDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"OldCampMerchantSecretDoorTrigger";
};

UCLASS()
class UOldCampMerchantSecretDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = UOldCampMerchantSecretDoor_ExtraData::StaticClass();
};

///////////////////////////////////////////*ORC GRAVEYARD FENCES*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

// FENCE 01
class UCementeryFence01_Trigger: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"CementeryFence01";
};

UCLASS()
class UCementeryFence01_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementeryFence01"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementeryFence01_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementeryFence01_Door_ExtraData::StaticClass();
};



/// FENCE 02
class UCementeryFence02_Trigger: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"CementeryFence02";
};

UCLASS()
class UCementeryFence02_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementeryFence02"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementeryFence02_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementeryFence02_Door_ExtraData::StaticClass();
};

/// FENCE 03
UCLASS()
class UCementeryFence03_Trigger: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"CementeryFence03";
};

UCLASS()
class UCementeryFence03_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementeryFence03"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementeryFence03_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementeryFence03_Door_ExtraData::StaticClass();
};

/// FENCE 04
UCLASS()
class UCementeryFence04_Trigger: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"CementeryFence04";
};

UCLASS()
class UCementeryFence04_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementeryFence04"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementeryFence04_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementeryFence04_Door_ExtraData::StaticClass();
};

/// FENCE 05
UCLASS()
class UCementeryFence05_Trigger: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"CementeryFence05";
};

UCLASS()
class UCementeryFence05_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementeryFence05"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementeryFence05_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementeryFence05_Door_ExtraData::StaticClass();
};

///////////////////////////////////////////*ORC GRAVEYARD FOCUS*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_FocusStone: UItemDefinition
{
    default m_UniqueName = n"OG_FocusStone";
    default m_Name = "OG_FocusStone";
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_01_Visual.BP_ItMs_Focus_01_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Misc/BP_ItMs_Focus_01_World.BP_ItMs_Focus_01_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItKe_Berg_01.T_ItemIcon_ItKe_Berg_01";
    default m_MaxStack = 1;
	default m_RequiredToPick = UItAt_Amulet_Ulu_Talisman::StaticClass();
	default m_EventWhenPickUp = GameplayTag::Message_FocusStone_Disable;
	default AddItemSpec(GameplayTag::Item_Property_UnEquipBeforePick);
    default SetItemType(GameplayTag::Item_Key);
};

UCLASS()
class UOG_Focus_Test_Key: UItemDefinition
{
    default m_UniqueName = n"OG_Focus_Test_Key";
    default m_Name = "ItKe_Berg_01";
    default m_Value = 0;
    default m_ItemVisual = n"Blueprint'/Game/Items/Key/BP_ItKe_FocusStone_Visual.BP_ItKe_FocusStone_Visual_C'";
    default m_ItemVisualWorld = n"Blueprint'/Game/Items/Key/BP_ItKe_FocusStone_World.BP_ItKe_FocusStone_World_C'";
    default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItKe_Berg_01.T_ItemIcon_ItKe_Berg_01";
    default m_MaxStack = 1;
    default m_Description = "ItKe_Berg_01_description";
    default SetItemType(GameplayTag::Item_Key);
};

UCLASS()
class UOG_MainTomb_Gate_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_NpcSaveData = true;
	default m_ConnectedTrigger = n"OG_MainTomb_Gate"; 
};

UCLASS()
class UOG_MainTomb_Gate: UDefaultInteractive
{
	default m_UniqueName = n"OG_MainTomb_Gate";
	default m_OptionalObject = UOG_MainTomb_Gate_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_Keys.Add(n"ItMs_Focus_01");
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	//default m_Keys.Add(n"LockExampleB");
};

///////////////////////////////////////////*ORC GRAVEYARD LEVER*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_OrcLever_Activate: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Activate_OrcLever;
	default m_UniqueName = n"OG_OrcLever_Activate";
	default m_ActiveUntilEvent = n"OG_OrcLever_Activate";
	default m_RequiredUniqueObject = n"ItKe_GraveyardLever";
};

UCLASS()
class UTestOrcLever_Trigger: UGenericTriggerLeverTorch
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_DisabledUntilEvent = n"OG_OrcLever_Activate";
	default m_UniqueName = n"CementerySecondKey_Fence";
};

UCLASS()
class UCementerySecondKey_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"CementerySecondKey_Fence"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UCementerySecondKey_Door: UDefaultInteractive
{
	default m_OptionalObject = UCementerySecondKey_Door_ExtraData::StaticClass();
};

///////////////////////////////////////////*MOUNTAIN FORTRESS BOOKSHELVE*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_MountainFortress_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"UOG_MountainFortress_Door";
	default m_PuzzleOrder.Add(n"UGenericTriggerBookShelve");
	default m_PuzzleOrder.Add(n"UGenericTriggerBookShelveB");
	default m_PuzzleOrder.Add(n"UGenericTriggerBookShelveC");
};

UCLASS()
class UOG_MountainFortress_Door: UDefaultInteractive
{
	default m_UniqueName = n"UOG_MountainFortress_Door";
	default m_OptionalObject = UOG_MountainFortress_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	//default m_Keys.Add(n"LockExampleB");
};

UCLASS()
class UGenericTriggerBookShelve_ExtraData: UTriggerExtraData
{
	default m_SendTrigger.Add(n"UOG_MountainFortress_Door");
};
UCLASS()
class UGenericTriggerBookShelve: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_BookShelf;
	default m_UniqueName = n"UGenericTriggerBookShelve";
	default m_OptionalObject = UGenericTriggerBookShelve_ExtraData::StaticClass();
};
UCLASS()
class UGenericTriggerBookShelveB: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_BookShelf;
	default m_UniqueName = n"UGenericTriggerBookShelveB";
	default m_OptionalObject = UGenericTriggerBookShelve_ExtraData::StaticClass();
};
UCLASS()
class UGenericTriggerBookShelveC: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_BookShelf;
	default m_UniqueName = n"UGenericTriggerBookShelveC";
	default m_OptionalObject = UGenericTriggerBookShelve_ExtraData::StaticClass();
};

///////////////////////////////////////////*NEW CAMP*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

//// Main Gate Entrance
UCLASS()
class UMainDoorEntranceNewCamp_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorEntranceNewCamp";
};

UCLASS()
class UMainDoorEntranceNewCamp_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorEntranceNewCamp"; 
};

UCLASS()
class UMainDoorEntranceNewCamp_Gate: UGenericGate
{
	default m_OptionalObject = UMainDoorEntranceNewCamp_Gate_ExtraData::StaticClass();
};

//Ore Mountain Gate
class UOreMountainNewCamp_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"GateOreMountainNewCamp";
};

UCLASS()
class UOreMountainNewCamp_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"GateOreMountainNewCamp";
};

UCLASS()
class UOreMountainNewCamp_Gate: UGenericGate
{
	default m_OptionalObject = UOreMountainNewCamp_Gate_ExtraData::StaticClass();
};


///////////////////////////////////////////*TROLL PUZZLE*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UTrollPuzzle_Winch_ExtraData: UGenericWinch_ExtraData
{
	default m_BackToStart = true;
	default m_DefaultStep = 0;
};

UCLASS()
class UTrollPuzzle_Winch: UGenericTriggerWinch
{
	default m_OptionalObject = UTrollPuzzle_Winch_ExtraData::StaticClass();
	default m_UniqueName = n"TrollPuzzle";
};

UCLASS()
class UTrollPuzzle_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"TrollPuzzle";
	default m_PuzzleTriggers = 2;
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UTrollPuzzle_Gate: UGenericGate
{
	default m_OptionalObject = UTrollPuzzle_Gate_ExtraData::StaticClass();
};

UCLASS()
class UTrollPuzzle_Lever: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_Mantain;
	default m_UniqueName = n"TrollPuzzle";
	default m_OptionalObject = UTrollPuzzle_Lever_ExtraData::StaticClass();
};

UCLASS()
class UTrollPuzzle_Lever_ExtraData: UTriggerExtraData
{
	default m_SaveData = true;
	default m_SendTrigger.Add(n"TrollPuzzle");
};



///////////////////////////////////////////*ORC SECRET DOOR*///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOrc_Secret_Door_ExtraData: UGenericDoorSavedState_ExtraData
{
  default m_NpcSaveData = true;
}

UCLASS()
class UOrc_Secret_Door: UGenericDoorSavedState
{ 
  default m_UniqueName = n"Orc_Secret_Door";
  default m_DefaultInteraction = GameplayTag::Action_Door_OrcSecretDoor;
  default m_UsableByPlayer = false;
  default m_OptionalObject = UOrc_Secret_Door_ExtraData::StaticClass();
};

UCLASS()
class UOT_Inner_TriggeredDoor_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"OT_Inner_Door"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UOT_Inner_TriggeredDoor: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_UniqueName = n"OT_Inner_Door";
	default m_OptionalObject = UOT_Inner_TriggeredDoor_ExtraData::StaticClass();
}

///////////////////////////////////////////*ORC DOOR*///////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOT_Enter_TriggeredDoor_ExtraData: UDoorInteractiveExtraData
{
	default m_OpenMultiple = false;
	default m_ConnectedTrigger = n"OT_Enter_Door"; 
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UOT_Enter_TriggeredDoor: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_UniqueName = n"OT_Enter_Door";
	default m_OptionalObject = UOT_Enter_TriggeredDoor_ExtraData::StaticClass();
}

///////////////////////////////////////////*Stonehenge Entrance Door*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UStonehenge_Entrance_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Stonehenge_Entrance_Door"; 
};

UCLASS()
class UStonehenge_Entrance_Door: UDefaultInteractive
{
	default m_UniqueName = n"Stonehenge_Entrance_Door";
	default m_OptionalObject = UStonehenge_Entrance_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	//default m_Lock = n"Lock_AbandonedMine_UluTalisman_Door";
	//default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

///////////////////////////////////////////*Statue Puzzle*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UStone_Adanos_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMove;
	default m_NumSteps = 6;
	default m_DefaultStep = 5;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Stone_Adanos";
	default m_SendTrigger = n"Stone_Cryptex";
};

UCLASS()
class UStone_Adanos: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Adanos";
	default m_OptionalObject = UStone_Adanos_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Statue;
};

UCLASS()
class UStone_Beliar_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMove;
	default m_NumSteps = 6;
	default m_DefaultStep = 1;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Stone_Beliar";
	default m_SendTrigger = n"Stone_Cryptex";
};

UCLASS()
class UStone_Beliar: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Beliar";
	default m_OptionalObject = UStone_Beliar_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Statue;
};

UCLASS()
class UStone_Innos_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMove;
	default m_NumSteps = 6;
	default m_DefaultStep = 5;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Stone_Innos"; 
	default m_SendTrigger = n"Stone_Cryptex";
};

UCLASS()
class UStone_Innos: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Innos";
	default m_OptionalObject = UStone_Innos_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Statue;
};

UCLASS()
class UStone_Cryptex_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Stone_Cryptex"; 
	default m_PuzzlePositions.Add(n"Stone_Adanos",1);
	default m_PuzzlePositions.Add(n"Stone_Beliar",5);
	default m_PuzzlePositions.Add(n"Stone_Innos" ,0);
};

UCLASS()
class UStone_Cryptex: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Cryptex";
	default m_OptionalObject = UStone_Cryptex_ExtraData::StaticClass();
};

///////////////////////////////////////////*Lava Extractor*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class ULava_Extractor_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMove;
	default m_NumSteps = 9;
	default m_DefaultStep = 0;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Lava_Extractor";
};

UCLASS()
class ULava_Extractor: UDefaultInteractive
{
	default m_UniqueName = n"Lava_Extractor";
	default m_OptionalObject = ULava_Extractor_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_LavaExtractor;
};

UCLASS()
class ULava_ExtractorMecha_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 9;
	default m_DefaultStep = 0;
	default m_SaveData = false;
	default m_ConnectedTrigger = n"Lava_Extractor";
};

UCLASS()
class ULava_ExtractorMecha: UDefaultInteractive
{
	default m_UniqueName = n"Lava_Extractor";
	default m_OptionalObject = ULava_ExtractorMecha_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_LavaExtractor;
};

///////////////////////////////////////////*Cryptex*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UCryptex_Code_A_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 8;
	default m_DefaultStep = 1;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Cryptex_Code_A"; 
};

UCLASS()
class UCryptex_Code_A: UDefaultInteractive
{
	default m_UniqueName = n"Cryptex_Code_A";
	default m_OptionalObject = UCryptex_Code_A_ExtraData::StaticClass();
};

UCLASS()
class UCryptex_Code_B_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 8;
	default m_DefaultStep = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Cryptex_Code_B"; 
};

UCLASS()
class UCryptex_Code_B: UDefaultInteractive
{
	default m_UniqueName = n"Cryptex_Code_B";
	default m_OptionalObject = UCryptex_Code_B_ExtraData::StaticClass();
};

UCLASS()
class UCryptex_Code_C_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 8;
	default m_DefaultStep = 3;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Cryptex_Code_C"; 
};

UCLASS()
class UCryptex_Code_C: UDefaultInteractive
{
	default m_UniqueName = n"Cryptex_Code_C";
	default m_OptionalObject = UCryptex_Code_C_ExtraData::StaticClass();
};

UCLASS()
class UCryptex_Winch_A_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 8;
	default m_DefaultStep = 1;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Cryptex_Door");
};

UCLASS()
class UCryptex_Winch_A: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UCryptex_Winch_A_ExtraData::StaticClass();
	default m_UniqueName = n"Cryptex_Code_A";
};

UCLASS()
class UCryptex_Winch_B_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 8;
	default m_DefaultStep = 2;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Cryptex_Door");
};

UCLASS()
class UCryptex_Winch_B: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UCryptex_Winch_B_ExtraData::StaticClass();
	default m_UniqueName = n"Cryptex_Code_B";
};

UCLASS()
class UCryptex_Winch_C_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 8;
	default m_DefaultStep = 3;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Cryptex_Door");
};

UCLASS()
class UCryptex_Winch_C: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UCryptex_Winch_C_ExtraData::StaticClass();
	default m_UniqueName = n"Cryptex_Code_C";
};

UCLASS()
class UCryptex_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Cryptex_Door"; 
	default m_PuzzlePositions.Add(n"Cryptex_Code_A",0);
	default m_PuzzlePositions.Add(n"Cryptex_Code_B",0);
	default m_PuzzlePositions.Add(n"Cryptex_Code_C",0);
};

UCLASS()
class UCryptex_Door: UDefaultInteractive
{
	default m_UniqueName = n"Cryptex_Door";
	default m_OptionalObject = UCryptex_Door_ExtraData::StaticClass();
};

/////////////////////////////////////////// *Varrag Platform 03* /////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UVarrag_Platform_03_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 4;
	default m_DefaultStep = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Varrag_Platform_03"; 
};

UCLASS()
class UVarrag_Platform_03: UDefaultInteractive
{
	default m_UniqueName = n"Varrag_Platform_03";
	default m_OptionalObject = UVarrag_Platform_03_ExtraData::StaticClass();
};

UCLASS()
class UVarrag_Platform_Winch_03_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = 2;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Varrag_Platform_03");
	default m_DisableOnEvent = n"SleeperVarragKasorgChamberDoor";
};

UCLASS()
class UVarrag_Platform_Winch_03: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UVarrag_Platform_Winch_03_ExtraData::StaticClass();
	default m_UniqueName = n"Varrag_Platform_03";
};

/////////////////////////////////////////// *Varrag Platform 02* /////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UVarrag_Platform_02_A_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 3;
	default m_DefaultStep = 1;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Varrag_Platform_Winch_02_A"; 
};

UCLASS()
class UVarrag_Platform_02_A: UDefaultInteractive
{
	default m_UniqueName = n"Varrag_Platform_Winch_02_A";
	default m_OptionalObject = UVarrag_Platform_02_A_ExtraData::StaticClass();
};

UCLASS()
class UVarrag_Platform_Winch_02_A_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 3;
	default m_DefaultStep = 1;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Varrag_Platform_Winch_02_A");
	default m_DisableOnEvent = n"SleeperVarragKasorgChamberDoor";
};

UCLASS()
class UVarrag_Platform_Winch_02_A: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UVarrag_Platform_Winch_02_A_ExtraData::StaticClass();
	default m_UniqueName = n"Varrag_Platform_Winch_02_A";
};

UCLASS()
class UVarrag_Platform_02_B_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 3;
	default m_DefaultStep = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Varrag_Platform_Winch_02_B"; 
};

UCLASS()
class UVarrag_Platform_02_B: UDefaultInteractive
{
	default m_UniqueName = n"Varrag_Platform_Winch_02_B";
	default m_OptionalObject = UVarrag_Platform_02_B_ExtraData::StaticClass();
};

UCLASS()
class UVarrag_Platform_Winch_02_B_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 3;
	default m_DefaultStep = 2;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Varrag_Platform_Winch_02_B");
	default m_DisableOnEvent = n"SleeperVarragKasorgChamberDoor";
};

UCLASS()
class UVarrag_Platform_Winch_02_B: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UVarrag_Platform_Winch_02_B_ExtraData::StaticClass();
	default m_UniqueName = n"Varrag_Platform_Winch_02_B";
};
////////////////////

UCLASS()
class UVarrag_Platform_02_C_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 3;
	default m_DefaultStep = 1;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"Varrag_Platform_Winch_02_C"; 
};

UCLASS()
class UVarrag_Platform_02_C: UDefaultInteractive
{
	default m_UniqueName = n"Varrag_Platform_Winch_02_C";
	default m_OptionalObject = UVarrag_Platform_02_C_ExtraData::StaticClass();
};

UCLASS()
class UVarrag_Platform_Winch_02_C_ExtraData: UGenericWinch_ExtraData
{
	default m_NumSteps = 3;
	default m_DefaultStep = 1;
	default m_Loop = true;
	default m_SendTrigger.Add(n"Varrag_Platform_Winch_02_C");
	default m_DisableOnEvent = n"SleeperVarragKasorgChamberDoor";
};

UCLASS()
class UVarrag_Platform_Winch_02_C: UGenericTriggerWinch
{
	default m_DefaultInteraction = GameplayTag::Action_Trigger_Winch;
	default m_OptionalObject = UVarrag_Platform_Winch_02_C_ExtraData::StaticClass();
	default m_UniqueName = n"Varrag_Platform_Winch_02_C";
};

UCLASS()
class USleeperVarragKasorgChamberDoor_ExtraData: UGenericTriggeredDoor_ExtraData
{
	default m_ConnectedTrigger = n"SleeperVarragKasorgChamberDoor"; 
	default m_DefaultStep = 1;
};

UCLASS()
class USleeperVarragKasorgChamberDoor: UGenericTriggeredDoor
{
	default m_OptionalObject = USleeperVarragKasorgChamberDoor_ExtraData::StaticClass();
	default m_UniqueName = n"SleeperVarragKasorgChamberDoor";
};

///////////////////////////////////////////*Missing Winch*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////// MISSING WINCH PUZZLE - SWITCH ORDER MODE
/*UCLASS()
class UOG_MissingWinch_Good_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Good_Door";
	default m_PuzzleOrder.Add(n"MissingWinchLeverOrc_A");
	default m_PuzzleOrder.Add(n"MissingWinchLeverOrc_B");
};

UCLASS()
class UOG_MissingWinch_Good_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Good_Door";
	default m_OptionalObject = UOG_MissingWinch_Good_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UOG_MissingWinch_Bad_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Bad_Door";
	default m_PuzzleOrder.Add(n"MissingWinchLeverOrc_B");
	default m_PuzzleOrder.Add(n"MissingWinchLeverOrc_A");
};

UCLASS()
class UOG_MissingWinch_Bad_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Bad_Door";
	default m_OptionalObject = UOG_MissingWinch_Bad_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UGenericTriggerMissingWinch_ExtraData: UTriggerExtraData
{
	default m_SendTrigger.Add(n"OG_MissingWinch_Good_Door");
	default m_SendTrigger.Add(n"OG_MissingWinch_Bad_Door");
};

UCLASS()
class UMissingWinchLeverOrc_A: UDefaultInteractive
{
	default m_OptionalObject = UGenericTriggerMissingWinch_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"MissingWinchLeverOrc_A";
};

UCLASS()
class UMissingWinchLeverOrc_B: UDefaultInteractive
{
	default m_OptionalObject = UGenericTriggerMissingWinch_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"MissingWinchLeverOrc_B";
};*/

/////////// MISSING WINCH PUZZLE - SWITCH DIRECT MODE
UCLASS()
class UOG_MissingWinch_Good_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Good_Door";
};

UCLASS()
class UOG_MissingWinch_Good_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Good_Door";
	default m_OptionalObject = UOG_MissingWinch_Good_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

class UOG_MissingWinch_Bad_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Bad_Door";
};

UCLASS()
class UOG_MissingWinch_Bad_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Bad_Door";
	default m_OptionalObject = UOG_MissingWinch_Bad_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UMissingWinchLeverOrc_A: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_MissingWinch_Good_Door";
};

UCLASS()
class UMissingWinchLeverOrc_B: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_MissingWinch_Bad_Door";
};

///////////////////////////////////////////*Missing Winch ROOM - fence door 01*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_MissingWinch_Room_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Room_Door";
};

UCLASS()
class UOG_MissingWinch_Room_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Room_Door";
	default m_OptionalObject = UOG_MissingWinch_Room_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UMissingWinch_Room_LeverOrc: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_MissingWinch_Room_Door";
};

///////////////////////////////////////////*Missing Winch ROOM - fence door 02*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_MissingWinch_Room_Door_02_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Room_Door_02";
};

UCLASS()
class UOG_MissingWinch_Room_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Room_Door_02";
	default m_OptionalObject = UOG_MissingWinch_Room_Door_02_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UMissingWinch_Room_02_LeverOrc: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_MissingWinch_Room_Door_02";
};


///////////////////////////////////////////*Missing Winch ROOM EXIT PATH- fence door*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_MissingWinch_Exit_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_MissingWinch_Exit_Door";
};

UCLASS()
class UOG_MissingWinch_Exit_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_MissingWinch_Exit_Door";
	default m_OptionalObject = UOG_MissingWinch_Exit_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Focus;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};

UCLASS()
class UMissingWinch_Exit_LeverOrc: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_MissingWinch_Exit_Door";
};

//////////////////////////////////////////*Combat Room*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UOG_CombatRoom_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"OG_CombatRoom"; 
	default m_DefaultStep = 1;
};

UCLASS()
class UOG_CombatRoom: UDefaultInteractive
{
	default m_UniqueName = n"OG_CombatRoom";
	default m_OptionalObject = UOG_CombatRoom_ExtraData::StaticClass();
};

//////////////////////////////////////////*Double Gate*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UST_DoubleGate_ExtraData_Winch: UGenericWinch_ExtraData
{
	default m_DefaultStep = 0;
};

UCLASS()
class UST_DoubleGate_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"ST_DoubleGate";
	default m_OptionalObject = UST_DoubleGate_ExtraData_Winch::StaticClass();
};

UCLASS()
class UST_DoubleGate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"ST_DoubleGate"; 
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UST_DoubleGate: UGenericGate
{
	default m_OptionalObject = UST_DoubleGate_ExtraData::StaticClass();
};

//////////////////////////////////////////*Stronhold Entrance*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UST_Entrance_ExtraData_Winch: UGenericWinch_ExtraData
{
	default m_DefaultStep = 0;
};

UCLASS()
class UST_Entrance_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"ST_Entrance";
	default m_OptionalObject = UST_Entrance_ExtraData_Winch::StaticClass();
};

UCLASS()
class UST_Entrance_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"ST_Entrance"; 
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UST_Entrance: UGenericGate
{
	default m_OptionalObject = UST_Entrance_ExtraData::StaticClass();
};

///////////////////////////////////////////*SUNKEN 02 DOOR*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class USunkenTower_Door_02_Altar_A_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"SunkenTower_Door_02_Altar_A"; 
	default m_SendTrigger = n"SunkenTower_Door_02";
};

UCLASS()
class USunkenTower_Door_02_Altar_A: UDefaultInteractive
{
	default m_UniqueName = n"SunkenTower_Door_02_Altar_A";
	default m_OptionalObject = USunkenTower_Door_02_Altar_A_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_SunkenAltar;
	default m_Keys.Add(n"ItMs_SunkenTowerStone_01");
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	default m_ConsumeKeys = true;
};

UCLASS()
class USunkenTower_Door_02_Altar_B_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"SunkenTower_Door_02_Altar_B"; 
	default m_SendTrigger = n"SunkenTower_Door_02"; 
};

UCLASS()
class USunkenTower_Door_02_Altar_B: UDefaultInteractive
{
	default m_UniqueName = n"SunkenTower_Door_02_Altar_B";
	default m_OptionalObject = USunkenTower_Door_02_Altar_B_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_SunkenAltar;
	default m_Keys.Add(n"ItMs_SunkenTowerStone_02");
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	default m_ConsumeKeys = true;
};

UCLASS()
class USunkenTower_Door_02_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"SunkenTower_Door_02"; 

	default m_PuzzlePositions.Add(n"SunkenTower_Door_02_Altar_B",1);
	default m_PuzzlePositions.Add(n"SunkenTower_Door_02_Altar_A",1);
};

UCLASS()
class USunkenTower_Door_02: UDefaultInteractive
{
	default m_UniqueName = n"SunkenTower_Door_02";
	default m_OptionalObject = USunkenTower_Door_02_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_SunkenAltar;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	default m_ConsumeKeys = true;
};

///////////////////////////////////////////*SUNKEN 01 DOOR*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class USunkenTower_Door_01_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::JustMoveTriggered;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_ConnectedTrigger = n"SunkenTower_Door_01"; 
};

UCLASS()
class USunkenTower_Door_01: UDefaultInteractive
{
	default m_UniqueName = n"SunkenTower_Door_01";
	default m_OptionalObject = USunkenTower_Door_01_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_SunkenAltar;
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
	default m_ConsumeKeys = true;
};

///////////////////////////////////////////*TortureMachine*/////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/// A
UCLASS()
class UTortureMachineWinchLeverOrc_A: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_TortureMachine_A_Door";
	default m_ExtraTags.Add(n"IsIncremental");
};

UCLASS()
class UOG_TortureMachine_A_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 6;
	default m_SaveData = false;
	default m_ConnectedTrigger = n"OG_TortureMachine_A_Door";
	default m_GetAnimStep = true;
};

UCLASS()
class UOG_TortureMachine_A_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_TortureMachine_A_Door";
	default m_OptionalObject = UOG_TortureMachine_A_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};

/// B
UCLASS()
class UTortureMachineWinchLeverOrc_B_Activate: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Activate_OrcLever;
	default m_UniqueName = n"OG_TortureMachine_B_Door";
	default m_ExtraTags.Add(n"IsIncremental");
	default m_ActiveUntilEvent = n"OG_TortureMachine_Activate";
	default m_RequiredUniqueObject = n"ItKe_GraveyardLever";
};
UCLASS()
class UTortureMachineWinchLeverOrc_B: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"OG_TortureMachine_B_Door";
	default m_DisabledUntilEvent = n"OG_TortureMachine_Activate";
	default m_ExtraTags.Add(n"IsIncremental");
};

UCLASS()
class UOG_TortureMachine_B_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Triggered;
	default m_NumSteps = 6;
	default m_SaveData = false;
	default m_ConnectedTrigger = n"OG_TortureMachine_B_Door";
	default m_GetAnimStep = true;
};

UCLASS()
class UOG_TortureMachine_B_Door: UDefaultInteractive
{
	default m_UniqueName = n"OG_TortureMachine_B_Door";
	default m_OptionalObject = UOG_TortureMachine_B_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
};

///////////////////////////////////////////*INNOS TEMPLE GATE*/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UMainDoor_InnosTemple_Winch_ExtraData: UGenericWinch_ExtraData
{
	//default m_BackToStart = true;
	default m_DefaultStep = 0;
};

UCLASS()
class UMainDoor_InnosTemple_Winch: UGenericTriggerWinch
{
	default m_UniqueName = n"MainDoorInnosTemple";
	default m_OptionalObject = UMainDoor_InnosTemple_Winch_ExtraData::StaticClass();
};

UCLASS()
class UMainDoor_InnosTemple_Gate_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"MainDoorInnosTemple";
	default m_DefaultStep = 0;
	default m_SaveData = true;
};

UCLASS()
class UMainDoor_InnosTemple_Gate: UGenericGate
{
	default m_OptionalObject = UMainDoor_InnosTemple_Gate_ExtraData::StaticClass();
};

///////////////////////////////////////////*INNOS TEMPLE DOORS*/////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////

UCLASS()
class UHC_InnosTemple_Door_01: UDefaultInteractive
{
	default m_UniqueName = n"HC_InnosTemple_Door_01";
	default m_OptionalObject = UGenericDoorSavedState_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door;
	default m_Lock = n"HC_InnosTemple_Door_01_Lock";
};