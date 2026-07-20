UCLASS()
class ULoadingScreen_SleeperStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SleeperStart");
    default TipTextID = "StoryLoadingscreen_SleeperStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_RavenSwamp : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/RavenSwamp");
    default TipTextID = "StoryLoadingscreen_RavenSwamp";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER2_GOTOPSI::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_LaresMole : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/LaresMole");
    default TipTextID = "StoryLoadingscreen_LaresMole";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_CaineStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/CaineStart");
    default TipTextID = "StoryLoadingscreen_CaineStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_CaineSearch : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/CaineSearch");
    default TipTextID = "StoryLoadingscreen_CaineSearch";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_CaineReveal : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/CaineReveal");
    default TipTextID = "StoryLoadingscreen_CaineReveal";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_YBerionStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/YBerionStart");
    default TipTextID = "StoryLoadingscreen_YBerionStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_MEETYBERION::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_YBerionQuest : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/YBerionQuest");
    default TipTextID = "StoryLoadingscreen_YBerionQuest";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FOCUS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_YBerionFocus : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/YBerionFocus");
    default TipTextID = "StoryLoadingscreen_YBerionFocus";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_FOCUS::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_YBerionAlmanach : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/YBerionAlmanach");
    default TipTextID = "StoryLoadingscreen_YBerionAlmanach";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_BOOK::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_MiltenAlmanach : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/MiltenAlmanach");
    default TipTextID = "StoryLoadingscreen_MiltenAlmanach";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE::StaticClass(), EQuestState::Failed ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldMineStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldMineStart");
    default TipTextID = "StoryLoadingscreen_OldMineStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldMineNest : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldMineNest");
    default TipTextID = "StoryLoadingscreen_OldMineNest";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_TUNNEL::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldMineQueen : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldMineQueen");
    default TipTextID = "StoryLoadingscreen_OldMineQueen";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_GreatPrayer : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/GreatPrayer");
    default TipTextID = "StoryLoadingscreen_GreatPrayer";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
