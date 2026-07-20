#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine;
        }
        
        
        UQuest_OldMine_OMCHAPTER2 GetOldMine_OMCHAPTER2() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */