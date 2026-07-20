UCLASS()
class ULoadingScreen_OrcEnclave : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OrcEnclave");
    default TipTextID = "StoryLoadingscreen_OrcEnclave";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_SleeperTemple : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SleeperTemple");
    default TipTextID = "StoryLoadingscreen_SleeperTemple";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_UrizielStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/UrizielStart");
    default TipTextID = "StoryLoadingscreen_UrizielStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_UrizielXardas : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/UrizielXardas");
    default TipTextID = "StoryLoadingscreen_UrizielXardas";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SleeperTemple_STCHAPTER5_URIZIEL::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
