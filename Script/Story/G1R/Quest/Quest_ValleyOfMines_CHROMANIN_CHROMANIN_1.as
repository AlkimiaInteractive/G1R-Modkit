#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_1 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_CHROMANIN;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000001), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_CHROMANIN_1);
                DC(int64(0x00000001), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CHROMANIN, Document::UDocumentSegment_CH1_CHROMANIN_Book1);
            }
        }
        
        
        UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_1 GetValleyOfMines_CHROMANIN_CHROMANIN_1() property
        {
            return Cast<UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */