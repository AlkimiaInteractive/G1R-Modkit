//////////////////////////////////////////////////////////////////////////////
// Sample Loadingscreen Idea
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class ULoadingScreen_ColonyStartTest : ULoadingScreenBase
{
    default BackgroundImage = TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/Firemages");
    default TipTextID = "StoryLoadingscreen_ColonyStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
                
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
        //QuestRequirements.Add(MakeRequirement( G1R::Quest::UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK::StaticClass(), EQuestState::Failed));
       
        #endif 
    }
}
