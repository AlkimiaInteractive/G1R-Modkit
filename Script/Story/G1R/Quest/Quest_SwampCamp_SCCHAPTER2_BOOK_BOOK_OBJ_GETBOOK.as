#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_BOOK;
            default bExternalFailTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestFailed() 
            {
                DC(int64(0x0000007d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE.StartQuest();
                DC(int64(0x0000007d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK GetSwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_GETBOOK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */