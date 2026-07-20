#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp : UG1RQuest
        {
            default Questline = UQuestline_G1R_SwampCamp;
        }
        
        
        UQuest_SwampCamp GetSwampCamp() property
        {
            return Cast<UQuest_SwampCamp>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */