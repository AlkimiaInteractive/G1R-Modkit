#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_BOOK;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Book_Focus, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000080), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN.StartQuest();
                DC(int64(0x00000080), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE GetSwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */