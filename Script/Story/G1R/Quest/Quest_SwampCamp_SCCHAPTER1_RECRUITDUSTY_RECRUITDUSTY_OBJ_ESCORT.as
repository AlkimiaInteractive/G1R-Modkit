#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT GetSwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_ESCORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */