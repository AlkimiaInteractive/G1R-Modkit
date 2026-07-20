//////////////////////////////////////////////////////////////////////////////
// Chapter 1
//////////////////////////////////////////////////////////////////////////////

UCLASS()
class ULoadingScreen_ColonyStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/ColonyStart");
    default TipTextID = "StoryLoadingscreen_ColonyStart";

    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}

UCLASS()
class ULoadingScreen_OldCampStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldCampStart");
    default TipTextID = "StoryLoadingscreen_OldCampStart";

    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R

        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldCampList : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldCampList");
    default TipTextID = "StoryLoadingscreen_OldCampList";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R

        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_BRINGLIST::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldCampGomez : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldCampGomez");
    default TipTextID = "StoryLoadingscreen_OldCampGomez";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_OldCampJoined : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/OldCampJoined");
    default TipTextID = "StoryLoadingscreen_OldCampJoined";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER1_JOINOC::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_NewCampStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/NewCampStart");
    default TipTextID = "StoryLoadingscreen_NewCampStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER1_JOINNC::StaticClass(),EQuestState::Running, EQuestState::Succeeded) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_NewCampConvoy : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/NewCampConvoy");
    default TipTextID = "StoryLoadingscreen_NewCampConvoy";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_CONVOY::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_NewCampJoined : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/NewCampJoined");
    default TipTextID = "StoryLoadingscreen_NewCampJoined";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER1_JOINNC::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_SwampCampStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SwampCampStart");
    default TipTextID = "StoryLoadingscreen_SwampCampStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER1_JOINPSI::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_SwampCampJoined : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SwampCampJoined");
    default TipTextID = "StoryLoadingscreen_SwampCampJoined";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER1_JOINPSI::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}