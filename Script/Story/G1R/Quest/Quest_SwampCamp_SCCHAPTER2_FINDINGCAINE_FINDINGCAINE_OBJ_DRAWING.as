#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000066), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ABANDONMINE.StartQuest();
                DC(int64(0x00000066), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING GetSwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */