#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2 GetSwampCamp_SCCHAPTER2() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */