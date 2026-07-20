#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_BLOWTHEENTRANCE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine;
            default bExternalStartTrigger = true;
        }
        
        
        UQuest_OldMine_BLOWTHEENTRANCE GetOldMine_BLOWTHEENTRANCE() property
        {
            return Cast<UQuest_OldMine_BLOWTHEENTRANCE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_BLOWTHEENTRANCE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */