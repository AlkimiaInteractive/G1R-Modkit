#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_LOG_RUNNING : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine;
        }
        
        
        UQuest_OldMine_LOG_RUNNING GetOldMine_LOG_RUNNING() property
        {
            return Cast<UQuest_OldMine_LOG_RUNNING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_LOG_RUNNING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */