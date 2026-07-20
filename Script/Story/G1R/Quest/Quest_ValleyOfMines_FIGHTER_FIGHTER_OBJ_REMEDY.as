#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_REMEDY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_FIGHTER;
            default NameText = "QUEST-VALLEYOFMINES_FIGHTER_FIGHTER_OBJ_REMEDY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Remedy, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000015), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING.StartQuest();
                DC(int64(0x00000015), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIGHTER, Document::UDocumentSegment_CH1_FIGHTER_Return);
            }
        }
        
        
        UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_REMEDY GetValleyOfMines_FIGHTER_FIGHTER_OBJ_REMEDY() property
        {
            return Cast<UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_REMEDY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_REMEDY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */