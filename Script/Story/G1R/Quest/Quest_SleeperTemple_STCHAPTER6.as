#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER6 : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER6 GetSleeperTemple_STCHAPTER6() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER6>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER6::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */