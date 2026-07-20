#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_GOTOPSI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a8), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_LASTREPORT.StartQuest();
                DC(int64(0x000000a8), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE GetOldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_GOTOPSI_GOTOPSI_OBJ_CONFIDENCE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */