#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a9), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_YBERIONDEAD.StartQuest();
                DC(int64(0x000000a9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GREAT_INVOCATION, Document::UDocumentSegment_CH2_GREAT_INVOCATION_AfterInvocation);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE GetSwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */