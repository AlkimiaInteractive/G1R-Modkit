UCLASS()
class UStartBloodPuzzleLever_ExtraData: UTriggerExtraData
{
	default m_SaveData = false;
};

UCLASS()
class UStartBloodPuzzleLever: UDefaultInteractive
{
	default m_DefaultInteraction = GameplayTag::Action_Lever_OrcLever;
	default m_UniqueName = n"StartBloodPuzzleLever";
	default m_OptionalObject = UStartBloodPuzzleLever_ExtraData::StaticClass();
};

UCLASS()
class UBloodPuzzleSwitch_03_ExtraData: UDoorInteractiveExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = 2;
};

UCLASS()
class UBloodPuzzleSwitch_03: UDefaultInteractive
{
	default m_OptionalObject = UBloodPuzzleSwitch_03_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_BloodPuzzleSwitch;
	default m_UniqueName = n"BloodPuzzleSwitch_03";
};

UCLASS()
class UBloodPuzzleSwitch_02_ExtraData: UDoorInteractiveExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = 1;
};

UCLASS()
class UBloodPuzzleSwitch_02: UDefaultInteractive
{
	default m_OptionalObject = UBloodPuzzleSwitch_02_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_BloodPuzzleSwitch;
	default m_UniqueName = n"BloodPuzzleSwitch_02";
};

UCLASS()
class UBloodPuzzleSwitch_01_ExtraData: UDoorInteractiveExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = -10;
};

UCLASS()
class UBloodPuzzleSwitch_01: UDefaultInteractive
{
	default m_OptionalObject = UBloodPuzzleSwitch_01_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_BloodPuzzleSwitch;
	default m_UniqueName = n"BloodPuzzleSwitch_01";	
};

UCLASS()
class UBloodPuzzleSwitch_Component : UBloodPuzzleSwitchBase_Component
{
	UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
		auto inetractiveActor = Cast<AInteractiveObjectActor>(GetOwner());
		const UInteractiveObjectDefinition interactDefinition = inetractiveActor.GetInteractiveObjectDefinition();
		UDoorInteractiveExtraData doorExtraData = Cast<UDoorInteractiveExtraData>(interactDefinition.m_OptionalObject.Get().GetDefaultObject());

		auto name = interactDefinition.m_UniqueName;

		float32 currentValue = 0;
		const bool isDone = AG1RGameState::GetWorldFloatData(GetWorld(), name, currentValue);

		if (!isDone)
		{
			currentValue = doorExtraData.m_DefaultStep;
		}

		auto animInstance = Cast<UDoorAnimInstance>(inetractiveActor.GetAnimInstance());
		animInstance.m_ForceState = int(currentValue);
		animInstance.m_State = int(currentValue);
		animInstance.m_CurrentState = int(currentValue);
	}
}

class ABloodPuzzleManagerActor : APuzzleBloodFontManager
{
	default m_StartPuzzleName = n"StartBloodPuzzleLever";
	default m_SwitchName_03 = n"BloodPuzzleSwitch_03";
	default m_SwitchName_02 = n"BloodPuzzleSwitch_02";
	default m_SwitchName_01 = n"BloodPuzzleSwitch_01";
}