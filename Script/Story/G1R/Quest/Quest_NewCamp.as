#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp : UG1RQuest
        {
            default Questline = UQuestline_G1R_NewCamp;
        }
        
        
        UQuest_NewCamp GetNewCamp() property
        {
            return Cast<UQuest_NewCamp>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */