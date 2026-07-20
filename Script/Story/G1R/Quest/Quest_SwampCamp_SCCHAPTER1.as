#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1 : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1 GetSwampCamp_SCCHAPTER1() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */