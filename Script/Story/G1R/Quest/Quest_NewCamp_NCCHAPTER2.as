#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2 GetNewCamp_NCCHAPTER2() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */