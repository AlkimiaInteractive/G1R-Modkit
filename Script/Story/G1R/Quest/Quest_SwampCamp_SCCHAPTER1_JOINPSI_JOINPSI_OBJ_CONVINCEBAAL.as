#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_JOINPSI;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Kalom_Counter >= 4;
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL GetSwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CONVINCEBAAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */