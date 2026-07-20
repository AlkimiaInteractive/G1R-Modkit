#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5 : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5 GetSleeperTemple_STCHAPTER5() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */