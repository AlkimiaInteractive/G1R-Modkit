#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM GetSwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_KALOM::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */