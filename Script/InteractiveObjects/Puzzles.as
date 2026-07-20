/// ORC GRAVEYARD

UCLASS()
class AGraveyard_Entrance_Pulley_AS : AInteractiveGasObjectActor
{
	UFUNCTION(BlueprintOverride)
    bool CanReceiveImpact() const
    {
		bool returnData = true;
		#ifdef WITH_STORY_G1R

        if(G1R::Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD  != nullptr &&
            G1R::Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning())
        {
            returnData = true;
        }
		else
		{
			returnData = false;
		}
        #endif

        return returnData; 
    }
}

UCLASS()
class UOrc_Graveyard_Entrance_Pulley: UDefaultInteractive
{
	default m_OptionalObject = UOrc_Graveyard_Entrance_Pulley_ExtraData::StaticClass();
};

UCLASS()
class UOrc_Graveyard_Entrance_Pulley_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Impact;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_LoadOnlyIfGlobal = n"Orc_Graveyard_Entrance_PuzzleEnded";
	default m_SendTrigger = n"Orc_Graveyard_Entrance";
};

UCLASS()
class UOrc_Graveyard_Entrance_Jaw_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"Orc_Graveyard_Entrance";
	default m_PuzzleTriggers = 2;
	default m_DefaultStep = 0;
	default m_NumSteps = 1;
	default m_SaveData = true;
};

UCLASS()
class UOrc_Graveyard_Entrance_Jaw: UGenericGate
{
	default m_OptionalObject = UOrc_Graveyard_Entrance_Jaw_ExtraData::StaticClass();
};

/// END ORC GRAGEYARD

UCLASS()
class UOrcGraveyard_Puzzle_Door_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Interactable;
	default m_NumSteps = 2;
	default m_SaveData = true;
};

UCLASS()
class UOrcGraveyard_Puzzle_Door: UDefaultInteractive
{
	default m_UniqueName = n"OrcGraveyard_Puzzle_Door";
	default m_OptionalObject = UOrcGraveyard_Puzzle_Door_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Door_Orc;
	// default m_PuzzleKeys.Add(n"ItKe_OrcGraveyardPiece_01");
	// default m_PuzzleKeys.Add(n"ItKe_OrcGraveyardPiece_02");
	default m_Keys.Add(n"ItKe_OrcGraveyard");
	default m_CameraTarget = EInteractiveCameraTarget::Yes;
};


//END ORC PUZZLE DOOR

//STONEHENGE DOOR

//ARROWDOOR1

//// Bases
UCLASS()
class UStonehenge_Door_Button_Base: UDefaultInteractive
{
	default m_OptionalObject = UStonehenge_Door_Button_Base_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_Base: UGenericGate
{
	default m_OptionalObject = UStonehenge_Door_Base_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_Button_Base_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Impact;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_SendTrigger = n"Stonehenge_Door";
};

UCLASS()
class UStonehenge_Door_Base_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"Stonehenge_Door";
	default m_PuzzleTriggers = 1;
	default m_DefaultStep = 0;
	default m_SaveData = true;
	default m_NumSteps = 2;
};

//// Content

////// Door 01
UCLASS()
class UStonehenge_Door_Button_01: UStonehenge_Door_Button_Base
{
	default m_OptionalObject = UStonehenge_Door_Button_01_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_01: UStonehenge_Door_Base
{
	default m_OptionalObject = UStonehenge_Door_01_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_Button_01_ExtraData: UStonehenge_Door_Button_Base_ExtraData
{
	default m_SendTrigger = n"Stonehenge_Door_01";
};

UCLASS()
class UStonehenge_Door_01_ExtraData: UStonehenge_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"Stonehenge_Door_01";
};

////// Door 02
UCLASS()
class UStonehenge_Door_Button_02: UStonehenge_Door_Button_Base
{
	default m_OptionalObject = UStonehenge_Door_Button_02_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_02: UStonehenge_Door_Base
{
	default m_OptionalObject = UStonehenge_Door_02_ExtraData::StaticClass();
};

UCLASS()
class UStonehenge_Door_Button_02_ExtraData: UStonehenge_Door_Button_Base_ExtraData
{
	default m_SendTrigger = n"Stonehenge_Door_02";
};

UCLASS()
class UStonehenge_Door_02_ExtraData: UStonehenge_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"Stonehenge_Door_02";
};

//SLEEPERS TEMPLE

//ARROW DOORS - SECOND SUBZONE

//VARRAG HASHOR DOOR

//// Bases
UCLASS()
class UST_Varrag_Hashor_Door_Button_Base: UDefaultInteractive
{
	default m_OptionalObject = UST_Varrag_Hashor_Door_Button_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Hashor_Door_Base: UGenericGate
{
	default m_OptionalObject = UST_Varrag_Hashor_Door_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Hashor_Door_Button_Base_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Impact;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_SendTrigger = n"ST_Varrag_Hashor_Door";
};

UCLASS()
class UST_Varrag_Hashor_Door_Base_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"ST_Varrag_Hashor_Door";
	default m_PuzzleTriggers = 1;
	default m_DefaultStep = 0;
	default m_SaveData = true;
	default m_NumSteps = 2;
};

////// 
UCLASS()
class UST_Varrag_Hashor_Door_Button_01: UST_Varrag_Hashor_Door_Button_Base
{
	default m_OptionalObject = UST_Varrag_Hashor_Door_Button_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Hashor_Door_01: UST_Varrag_Hashor_Door_Base
{
	default m_OptionalObject = UST_Varrag_Hashor_Door_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Hashor_Door_Button_01_ExtraData: UST_Varrag_Hashor_Door_Button_Base_ExtraData
{
	default m_SendTrigger = n"ST_Varrag_Hashor_Door_01";
};

UCLASS()
class UST_Varrag_Hashor_Door_01_ExtraData: UST_Varrag_Hashor_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"ST_Varrag_Hashor_Door_01";
};

//VARRAG UNHILQT DOOR

//// Bases
UCLASS()
class UST_Varrag_Unhilqt_Door_Button_Base: UDefaultInteractive
{
	default m_OptionalObject = UST_Varrag_Unhilqt_Door_Button_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Unhilqt_Door_Base: UGenericGate
{
	default m_OptionalObject = UST_Varrag_Unhilqt_Door_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Unhilqt_Door_Button_Base_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Impact;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_SendTrigger = n"ST_Varrag_Unhilqt_Door";
};

UCLASS()
class UST_Varrag_Unhilqt_Door_Base_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"ST_Varrag_Unhilqt_Door";
	default m_PuzzleTriggers = 1;
	default m_DefaultStep = 0;
	default m_SaveData = true;
	default m_NumSteps = 2;
};

////// 
UCLASS()
class UST_Varrag_Unhilqt_Door_Button_01: UST_Varrag_Unhilqt_Door_Button_Base
{
	default m_OptionalObject = UST_Varrag_Unhilqt_Door_Button_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Unhilqt_Door_01: UST_Varrag_Unhilqt_Door_Base
{
	default m_OptionalObject = UST_Varrag_Unhilqt_Door_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Varrag_Unhilqt_Door_Button_01_ExtraData: UST_Varrag_Unhilqt_Door_Button_Base_ExtraData
{
	default m_SendTrigger = n"ST_Varrag_Unhilqt_Door_01";
};

UCLASS()
class UST_Varrag_Unhilqt_Door_01_ExtraData: UST_Varrag_Unhilqt_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"ST_Varrag_Unhilqt_Door_01";
};

//Puzzle Blood Arrow Switch

//// Bases

UCLASS()
class UST_Blood_Puzzle_Door_Button_Base: UDefaultInteractive
{
	default m_OptionalObject = UST_Blood_Puzzle_Door_Button_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Blood_Puzzle_Door_Base: UGenericGate
{
	default m_OptionalObject = UST_Blood_Puzzle_Door_Base_ExtraData::StaticClass();
};

UCLASS()
class UST_Blood_Puzzle_Door_Button_Base_ExtraData: UDoorInteractiveExtraData
{
	default m_DoorType = EDoorType::Impact;
	default m_NumSteps = 2;
	default m_SaveData = true;
	default m_SendTrigger = n"ST_Blood_Puzzle_Door";
};

UCLASS()
class UST_Blood_Puzzle_Door_Base_ExtraData: UGenericGate_ExtraData
{
	default m_ConnectedTrigger = n"ST_Blood_Puzzle_Door";
	default m_PuzzleTriggers = 1;
	default m_DefaultStep = 0;
	default m_SaveData = true;
	default m_NumSteps = 2;
};

///////////

UCLASS()
class UST_Blood_Puzzle_Door_Button_01: UST_Blood_Puzzle_Door_Button_Base
{
	default m_OptionalObject = UST_Blood_Puzzle_Door_Button_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Blood_Puzzle_Door_01: UST_Blood_Puzzle_Door_Base
{
	default m_OptionalObject = UST_Blood_Puzzle_Door_01_ExtraData::StaticClass();
};

UCLASS()
class UST_Blood_Puzzle_Door_Button_01_ExtraData: UST_Blood_Puzzle_Door_Button_Base_ExtraData
{
	default m_SendTrigger = n"ST_Blood_Puzzle_Door_01";
};

UCLASS()
class UST_Blood_Puzzle_Door_01_ExtraData: UST_Blood_Puzzle_Door_Base_ExtraData
{
	default m_ConnectedTrigger = n"ST_Blood_Puzzle_Door_01";
};

