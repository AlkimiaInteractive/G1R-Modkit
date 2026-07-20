#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_SYRARECIPE;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Scroll_SyraRecipe, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ac), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE.StartQuest();
                DC(int64(0x000000ac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_SYRARECIPE, Document::UDocumentSegment_CH2_SYRARECIPE_GetRecipe);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE GetOldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_GETRECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */