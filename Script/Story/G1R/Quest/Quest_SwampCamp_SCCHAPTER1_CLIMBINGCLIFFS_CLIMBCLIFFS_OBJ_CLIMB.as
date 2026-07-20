#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB GetSwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_CLIMB::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */