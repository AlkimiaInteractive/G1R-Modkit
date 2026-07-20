#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple : UG1RQuest
        {
            
        }
        
        
        UQuest_SleeperTemple GetSleeperTemple() property
        {
            return Cast<UQuest_SleeperTemple>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */