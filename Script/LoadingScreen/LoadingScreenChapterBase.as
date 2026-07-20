//////////////////////////////////////////////////////////////////////////////
// Loading Screen Base
//////////////////////////////////////////////////////////////////////////////

USTRUCT()
struct FQuestRequirement{
    TSubclassOf< UQuest> QuestClass;
   // EQuestState RequiredState;
   TArray< EQuestState > RequiredStates;
}

UCLASS()
class ULoadingScreenBase : UObject
{
    UPROPERTY() TSoftObjectPtr<UTexture2D> BackgroundImage;
    UPROPERTY() FText TipTextID;

    UPROPERTY() TArray<FQuestRequirement> QuestRequirements;
    UPROPERTY() ELoadingScreenType ScreenType = ELoadingScreenType::StoryRecap;

    default InitializeQuestRequirements();
	
	UFUNCTION( BlueprintCallable )
	ELoadingScreenType GetCurrentLoadingScreenType()
	{
		ULoadingScreenHelperSubsystem LoadingScreenHelper = ULoadingScreenHelperSubsystem::Get();
		
        if ( !IsValid( LoadingScreenHelper ) )
            return ELoadingScreenType::Default;
			
		return LoadingScreenHelper.GetCurrentLoadingScreenType();
	}
	
    UFUNCTION( BlueprintCallable )
    bool IsRelevant() 
    { 
       bool CorrectScreenType = GetCurrentLoadingScreenType() == ScreenType;

       if( CorrectScreenType == false || ScreenType != ELoadingScreenType::StoryRecap )
       {
            return CorrectScreenType;
       }

       ULoadingScreenHelperSubsystem LoadingScreenHelper = ULoadingScreenHelperSubsystem::Get();
       if( !IsValid( LoadingScreenHelper )){
           return false; 
       }

       bool QuestRelevant = true;

       for( FQuestRequirement Req : QuestRequirements )
       {
           if( !LoadingScreenHelper.IsQuestInState( Req.QuestClass, Req.RequiredStates ) )
           {
               QuestRelevant = false;
               break;
           }
       }

        return QuestRelevant;
    };

    // Method used to setup the Loading Screen Chapter specific data
    UFUNCTION( BlueprintCallable )
    bool SetupLoadingscreenSettings( FALoadingScreenSettings_Overwrite& _LoadingScreenSettings)
    { 
       _LoadingScreenSettings.ScreenSettings.TipWidget.TipSwapTime = 8.f;
       
        // prepare the tip text
        _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Reset();

        if( !TipTextID.IsEmpty() ){
            _LoadingScreenSettings.ScreenSettings.TipWidget.TipText.Add( TipTextID );
        }

        // Controll if the Loadingscreen should autocomplete or not. Both values are important !
        _LoadingScreenSettings.ScreenSettings.bAutoCompleteWhenLoadingCompletes = false;
        _LoadingScreenSettings.ScreenSettings.bWaitForManualStop = true;

        
        // Depending on if you extend or want a clean slate, don't forget to reset the array of the Images 
        _LoadingScreenSettings.ScreenSettings.Background.StoryImages.Reset();

        // Example for setting a simple Background image, you can add as many images as you want, it will choose one at random
        _LoadingScreenSettings.ScreenSettings.Background.StoryImages.Add(BackgroundImage);


        //Since we are setting up multiple screens for the recap, some of the settings will be overwritten, we save a copy on the dedicated lists so we do not loose the information
        if( ScreenType == ELoadingScreenType::StoryRecap )
        {
            FTipSettings TipSettings = _LoadingScreenSettings.ScreenSettings.TipWidget;
            _LoadingScreenSettings.ScreenSettings.StoryRecapTipWidgets.Add(TipSettings);

            FBackgroundSettings BackgroundSettings = _LoadingScreenSettings.ScreenSettings.Background;
            _LoadingScreenSettings.ScreenSettings.StoryRecapBackgrounds.Add(BackgroundSettings);
        }

        return true;
    };
    
    // Method any Story Recap loading screen needs to override to add quest state requirements to check if it will be relevant or not
    void InitializeQuestRequirements (){ }

    // Helper function to initilize quest requirements
    // If multiple Quest states are provided, the requiement is considered fulfilled if the quest is in ANY of the given states
    FQuestRequirement MakeRequirement( TSubclassOf< UQuest> _QuestClass, EQuestState _RequiredState, EQuestState _AlternativeState1 = EQuestState::None,  EQuestState _AlternativeState2 = EQuestState::None,  EQuestState _AlternativeState3 = EQuestState::None,  ){
        
        FQuestRequirement Result;
        Result.QuestClass = _QuestClass;

        TArray< EQuestState > RequiredStates;
        RequiredStates.Add(_RequiredState);

        if(_AlternativeState1 != EQuestState::None){
            RequiredStates.Add(_AlternativeState1);
        }
        if(_AlternativeState2 != EQuestState::None){
            RequiredStates.Add(_AlternativeState1);
        }
        if(_AlternativeState3 != EQuestState::None){
            RequiredStates.Add(_AlternativeState1);
        }

        Result.RequiredStates = RequiredStates;
        return Result;
    }
}
