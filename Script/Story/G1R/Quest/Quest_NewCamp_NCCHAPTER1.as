#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1 : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1 GetNewCamp_NCCHAPTER1() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */