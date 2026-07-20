#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4 GetNewCamp_NCCHAPTER4() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */