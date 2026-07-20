#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_GOTOPSI;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a1), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_REPORT.StartQuest();
                DC(int64(0x000000a1), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE GetOldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_FINDCAINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */