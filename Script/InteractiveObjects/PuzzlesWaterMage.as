
UENUM()
enum EWaterMagePuzzleState
{
	NotStarted,
	Waiting,
	Active,
	Solved
};

UENUM()
enum EWaterMageInternal
{
	NotStarted,
	FontFilling,
	FirstDucFilling,
    FillingPool,
    SecondDuctFilling,
    FinalSiwtchPosA,
    FinalSiwtchPosB,
	Solved,
    Reset,
    Finished
};

class AWaterPuzzle_Manager : AActor
{
    // Set the actor's replicates property to default to true,
    // so its declared replicated properties work.
    default bReplicates = true;
	
	UPROPERTY(EditInstanceOnly)
	EWaterMagePuzzleState PuzzleState = EWaterMagePuzzleState::NotStarted;
	UPROPERTY(EditInstanceOnly)
	bool bIsInitialized = false;
    UPROPERTY()
    EWaterMageInternal InternalState;
    UPROPERTY()
    bool bIsServer = false;

    UFUNCTION()
    void SetInternalState(EWaterMageInternal newState)
    {
        InternalState = newState;
    }

	UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        bIsInitialized = false;
        if(!HasAuthority())
        {
            bIsServer = false;
            //SetActorTickEnabled(false);
            //return;
        }
        bIsServer = true;
    }

    UFUNCTION()
    void FinishPuzzleSuccessfully()
    {
        if (PuzzleState != EWaterMagePuzzleState::Solved)
        {
            PuzzleState = EWaterMagePuzzleState::Solved;
            SavePuzzleState();
        }
        #ifdef WITH_STORY_G1R
		if (G1R::Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL != nullptr 
			&& G1R::Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.HasBeenStarted())
		{
            G1R::Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.SucceedQuest();
		}
#endif /* #if WITH_STORY_G1R */
    }

	UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (!bIsServer)
        {
            return;
        }
        
        if (!bIsInitialized)
        {
            bIsInitialized = true;
            LoadPuzzleState();
            return;
        }

        switch (PuzzleState)
        {
            case EWaterMagePuzzleState::NotStarted:
            case EWaterMagePuzzleState::Waiting:
                CheckIfQuestHasStarted();
                break;
            case EWaterMagePuzzleState::Active:
                //CheckTorchesLit();
                break;
            case EWaterMagePuzzleState::Solved:
                // Do nothing, puzzle is solved
                break;
        }
    }

	UFUNCTION()
    void SavePuzzleState()
    {
        float32 stateToSave = 0.0f;
        switch (PuzzleState)
        {
            case EWaterMagePuzzleState::NotStarted:
            case EWaterMagePuzzleState::Waiting:
                stateToSave = 0.0f;
                break;
            case EWaterMagePuzzleState::Active:
                stateToSave = 1.0f;
                break;
            case EWaterMagePuzzleState::Solved:
                stateToSave = 2.0f;
                break;
        }
        AG1RGameState::SaveWorldFloatData(World, n"WaterMagesPuzzleManager_On", stateToSave);
    }

	UFUNCTION()
    void CheckIfQuestHasStarted()
    {
#ifdef WITH_STORY_G1R
		if (G1R::Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL != nullptr 
			&& G1R::Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.HasBeenStarted())
		{
			PuzzleState = EWaterMagePuzzleState::Active;
            SavePuzzleState();
            InitPuzzleState(PuzzleState);
		}
#endif /* #if WITH_STORY_G1R */
    }

	UFUNCTION()
    void LoadPuzzleState()
    {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, n"WaterMagesPuzzleManager_On", savedState);
        if(savedState<0.9f)//0.0f
        {
            PuzzleState = EWaterMagePuzzleState::Waiting;
        }
        else if(savedState<1.9f)//1.0f
        {
            PuzzleState = EWaterMagePuzzleState::Active;
        }
        else//2.0f
        {
            PuzzleState = EWaterMagePuzzleState::Solved;
        }
        InitPuzzleState(PuzzleState);
    }

	UFUNCTION()
    void InitPuzzleState(EWaterMagePuzzleState newState)
    {
        switch (newState)
        {
            case EWaterMagePuzzleState::NotStarted:
            case EWaterMagePuzzleState::Waiting:
                break;
            case EWaterMagePuzzleState::Active:
				OverridableFunctionPuzzleStarted();
                break;
            case EWaterMagePuzzleState::Solved:
                OverridableFunctionPuzzleSucessfullySolved();
                break;
        }
    }

	UFUNCTION(BlueprintEvent)
    void OverridableFunctionPuzzleStarted()
    {
        Print("This will only print if not overridden from a child BP.");
    }

    UFUNCTION(BlueprintEvent)
    void OverridableFunctionPuzzleSucessfullySolved()
    {
        Print("This will only print if not overridden from a child BP.");
    }
    
}

UCLASS()
class UWaterPuzzleFinishLever_ExtraData: UTriggerExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = -10;
    default m_CallFunctionEnd = n"WaterPuzzleFinishLeverActivateEnd";
    default m_CallFunctionStart = n"WaterPuzzleFinishLeverActivateStart";
};

UCLASS()
class UWaterPuzzleFinishLever: UDefaultInteractive
{
	default m_OptionalObject = UWaterPuzzleFinishLever_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Lever_Ground;
	default m_UniqueName = n"WaterPuzzleFinishLever";	
};

UCLASS()
class UWaterPuzzleResetLever_ExtraData: UTriggerExtraData
{
	default m_NumSteps = 4;
	default m_DefaultStep = -10;
    default m_CallFunctionEnd = n"WaterPuzzleResetLeverActivateEnd";
    default m_CallFunctionStart = n"WaterPuzzleResetLeverActivateStart";
};

UCLASS()
class UWaterPuzzleResetLever: UDefaultInteractive
{
	default m_OptionalObject = UWaterPuzzleResetLever_ExtraData::StaticClass();
	default m_DefaultInteraction = GameplayTag::Action_Lever_Ground;
	default m_UniqueName = n"WaterPuzzleResetLever";	
};

UCLASS()
class UWaterPuzzleSwitch_Component : UGenericLever_Component
{
}