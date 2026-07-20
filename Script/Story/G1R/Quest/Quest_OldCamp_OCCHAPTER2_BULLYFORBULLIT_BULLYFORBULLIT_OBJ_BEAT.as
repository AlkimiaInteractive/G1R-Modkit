#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OCR_GRD_BULLIT_203");
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetBullit() const property { return GetCharacter(n"OCR_GRD_BULLIT_203"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead()) || (Hero != nullptr && Hero.HasDefeatedAfterTime(Bullit, G1R.DefeatBully));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ba), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM.StartQuest();
                DC(int64(0x000000ba), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BULLYFORBULLIT, Document::UDocumentSegment_CH2_BULLYFORBULLIT_Beated);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT GetOldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_BEAT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */