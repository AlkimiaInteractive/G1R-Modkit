#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT GetSwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */