#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_URIZIEL;
            default bExternalStartTrigger = true;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC GetSleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */