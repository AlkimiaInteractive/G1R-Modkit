#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_GOTOPSI;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT GetOldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */