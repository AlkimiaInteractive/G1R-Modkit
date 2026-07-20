#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD GetSwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */