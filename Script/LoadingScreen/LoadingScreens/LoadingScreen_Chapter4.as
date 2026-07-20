UCLASS()
class ULoadingScreen_FocusSaturas : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusSaturas");
    default TipTextID = "StoryLoadingscreen_FocusSaturas";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_Firemages : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/Firemages");
    default TipTextID = "StoryLoadingscreen_Firemages";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_XardasStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/XardasStart");
    default TipTextID = "StoryLoadingscreen_XardasStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER4_FINDXARDAS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_XardasGatekeeper : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/XardasGatekeeper");
    default TipTextID = "StoryLoadingscreen_XardasGatekeeper";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_XardasQuest : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/XardasQuest");
    default TipTextID = "StoryLoadingscreen_XardasQuest";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_UlumuluStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/UlumuluStart");
    default TipTextID = "StoryLoadingscreen_UlumuluStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_UlumuluTarrok : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/UlumuluTarrok");
    default TipTextID = "StoryLoadingscreen_UlumuluTarrok";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}



