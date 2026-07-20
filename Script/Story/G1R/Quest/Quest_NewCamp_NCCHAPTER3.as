#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3 GetNewCamp_NCCHAPTER3() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */