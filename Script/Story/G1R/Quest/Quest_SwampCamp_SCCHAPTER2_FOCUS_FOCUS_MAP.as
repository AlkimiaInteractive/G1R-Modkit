#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FOCUS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP GetSwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */