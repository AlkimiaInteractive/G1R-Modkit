UCLASS()
class ULoadingScreen_UrizielCharged : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/UrizielCharged");
    default TipTextID = "StoryLoadingscreen_UrizielCharged";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SleeperTemple_STCHAPTER6_SLEEPER::StaticClass(), EQuestState::Running ) );
               
        #endif 
    }
}
