#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3 GetSwampCamp_SCCHAPTER3() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */