UENUM()
enum EFireMagePuzzleState
{
	NotStarted,
	Waiting,
	Active,
	Solved
};

class AFirePuzzle_Manager : AActor
{
    // Set the actor's replicates property to default to true,
    // so its declared replicated properties work.
    default bReplicates = true;
	
	UPROPERTY(EditInstanceOnly)
	EFireMagePuzzleState PuzzleState = EFireMagePuzzleState::NotStarted;
	UPROPERTY(EditInstanceOnly)
	bool bIsInitialized = false;
    UPROPERTY()
    bool bIsServer = false;
    UPROPERTY()
    TArray<FName> ActiveFires;
    default ActiveFires.Add(n"PuzzleFire_FireToComplete_A");
    default ActiveFires.Add(n"PuzzleFire_FireToComplete_B");



	UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        bIsInitialized = false;
        if(!HasAuthority())
        {
            bIsServer = false;
        }
        bIsServer = true;
    }

    UFUNCTION()
    void FinishPuzzleSuccessfully()
    {
        if (PuzzleState != EFireMagePuzzleState::Solved)
        {
            PuzzleState = EFireMagePuzzleState::Solved;
            SavePuzzleState();
            InitPuzzleState(PuzzleState);
        }
// #ifdef WITH_STORY_G1R
// 		if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr 
// 			&& G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasBeenStarted())
// 		{
//             G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.SucceedQuest();
//             G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.StartQuest();
// 		}
// #endif
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
            case EFireMagePuzzleState::NotStarted:
            case EFireMagePuzzleState::Waiting:
                CheckIfQuestHasStarted();
                break;
            case EFireMagePuzzleState::Active:
                //CheckTorchesLit();
                break;
            case EFireMagePuzzleState::Solved:
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
            case EFireMagePuzzleState::NotStarted:
            case EFireMagePuzzleState::Waiting:
                stateToSave = 0.0f;
                break;
            case EFireMagePuzzleState::Active:
                stateToSave = 1.0f;
                break;
            case EFireMagePuzzleState::Solved:
                stateToSave = 2.0f;
                break;
        }
        AG1RGameState::SaveWorldFloatData(World, n"FireMagesPuzzleManager_On", stateToSave);
    }

	UFUNCTION()
    void CheckIfQuestHasStarted()
    {
#ifdef WITH_STORY_G1R
		if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr 
			&& G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasBeenStarted())
		{
			PuzzleState = EFireMagePuzzleState::Active;
            SavePuzzleState();
            InitPuzzleState(PuzzleState);
		}
#endif /* #if WITH_STORY_G1R */
    }

	UFUNCTION()
    void LoadPuzzleState()
    {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, n"FireMagesPuzzleManager_On", savedState);
        if(savedState<0.9f)//0.0f
        {
            PuzzleState = EFireMagePuzzleState::Waiting;
        }
        else if(savedState<1.9f)//1.0f
        {
            PuzzleState = EFireMagePuzzleState::Active;
        }
        else//2.0f
        {
            PuzzleState = EFireMagePuzzleState::Solved;
        }
        InitPuzzleState(PuzzleState);

        // On older savegames, players were somehow able to start these fires in other ways than intended. 
        // If that is the case, just pretend they have done it the normal way.
        if (PuzzleState == EFireMagePuzzleState::Active)
        {
            for (FName FireToCheck : ActiveFires)
            {
                if (IsFireActive(FireToCheck))
                {
                    FireStarted(FireToCheck);
                }
            }
        }
    }

	UFUNCTION()
    void InitPuzzleState(EFireMagePuzzleState newState)
    {
        switch (newState)
        {
            case EFireMagePuzzleState::NotStarted:
            case EFireMagePuzzleState::Waiting:
                break;
            case EFireMagePuzzleState::Active:
				OverridableFunctionPuzzleStarted();
                break;
            case EFireMagePuzzleState::Solved:
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

    UFUNCTION(BlueprintEvent)
    void OverridableFireStarted(FName fireName)
    {
        Print("This will only print if not overridden from a child BP.");
    }

    UFUNCTION()
    void FireStarted(FName fireName)
    {
        if (PuzzleState == EFireMagePuzzleState::Solved)
        {
            bool finished = true;
            #ifdef WITH_STORY_G1R
            if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA != nullptr 
            && G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.HasBeenStarted())
            {
                G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.SucceedQuest();
                finished = false;
            }
#endif /* #if WITH_STORY_G1R */
#ifdef WITH_STORY_G1R
            if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL != nullptr 
                && G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.HasBeenStarted())
            {
                G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.SucceedQuest();
                finished = false;
            }
#endif /* #if WITH_STORY_G1R */
            if (!finished)
            {
                return;
            }
        }
        if (PuzzleState == EFireMagePuzzleState::Solved || PuzzleState == EFireMagePuzzleState::NotStarted)
        {
            return;
        }
        //check if already completed
        
        if (ActiveFires.Contains(fireName))
	    {

            if(fireName.IsEqual(n"PuzzleFire_FireToComplete_A"))
            {
#ifdef WITH_STORY_G1R
                if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA != nullptr 
                && G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.HasBeenStarted())
                {
                    G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.SucceedQuest();
                }
#endif /* #if WITH_STORY_G1R */
            }
            else if(fireName.IsEqual(n"PuzzleFire_FireToComplete_B"))
            {
#ifdef WITH_STORY_G1R
                if (G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL != nullptr 
                    && G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.HasBeenStarted())
                {
                    G1R::Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.SucceedQuest();
                }
#endif /* #if WITH_STORY_G1R */
            }
            AG1RGameState::SaveWorldFloatData(World, fireName, 1.0f);
	    	
	    }
        bool isCompleted = true;
        for(FName fire : ActiveFires)
        {
            float32 savedState = 0.0f;
            bool bLoaded = AG1RGameState::GetWorldFloatData(World, fire, savedState);
            if (!bLoaded || savedState <= 0.5f)
            {
                isCompleted = false;
            }
        }
        if (isCompleted) 
        {
            FinishPuzzleSuccessfully();
        }
    }

    UFUNCTION()
    bool IsFireActive(FName fireName)
    {
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, fireName, savedState);
        if (bLoaded && savedState > 0.5f)
        {
            return true;
        }
        return false;
    }
    
}
