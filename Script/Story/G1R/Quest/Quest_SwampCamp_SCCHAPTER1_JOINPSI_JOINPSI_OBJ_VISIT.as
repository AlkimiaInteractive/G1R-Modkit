#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_UNNAMEDQUEST-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT GetSwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */