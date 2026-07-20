UCLASS()
class ULoadingScreen_GreatPrayerQuest : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/GreatPrayerQuest");
    default TipTextID = "StoryLoadingscreen_GreatPrayerQuest";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_GreatPrayerLukor : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/GreatPrayerLukor");
    default TipTextID = "StoryLoadingscreen_GreatPrayerLukor";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_GreatPrayerKalomists : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/GreatPrayerKalomists");
    default TipTextID = "StoryLoadingscreen_GreatPrayerKalomists";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_RETURN::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_SaturasStart : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SaturasStart");
    default TipTextID = "StoryLoadingscreen_SaturasStart";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_SaturasQuest : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/SaturasQuest");
    default TipTextID = "StoryLoadingscreen_SaturasQuest";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER3_BRINGFOCI::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusFriends : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusFriends");
    default TipTextID = "StoryLoadingscreen_FocusFriends";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusTroll : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusTroll");
    default TipTextID = "StoryLoadingscreen_FocusTroll";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusMonastery : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusMonastery");
    default TipTextID = "StoryLoadingscreen_FocusMonastery";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_SATURAS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusFortress : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusFortress");
    default TipTextID = "StoryLoadingscreen_FocusFortress";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusStonehenge : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusStonehenge");
    default TipTextID = "StoryLoadingscreen_FocusStonehenge";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS::StaticClass(), EQuestState::Running, EQuestState::Succeeded ) );
               
        #endif 
    }
}
UCLASS()
class ULoadingScreen_FocusAll : ULoadingScreenBase
{
    default BackgroundImage =   TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/LoadingScreenStoryBeats/FocusAll");
    default TipTextID = "StoryLoadingscreen_FocusAll";
   
    default ScreenType = ELoadingScreenType::StoryRecap;

    void InitializeQuestRequirements () override
    {
        Super::InitializeQuestRequirements();

        #ifdef WITH_STORY_G1R
        
        QuestRequirements.Add( MakeRequirement( G1R::Quest::UQuest_NewCamp_NCCHAPTER3_BRINGFOCI::StaticClass(), EQuestState::Succeeded ) );
               
        #endif 
    }
}