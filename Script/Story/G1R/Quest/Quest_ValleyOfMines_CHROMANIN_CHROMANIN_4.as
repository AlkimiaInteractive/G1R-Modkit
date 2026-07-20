#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_CHROMANIN;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000007), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_CHROMANIN_4);
                DC(int64(0x00000007), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CHROMANIN, Document::UDocumentSegment_CH1_CHROMANIN_Book4);
            }
        }
        
        
        UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_4 GetValleyOfMines_CHROMANIN_CHROMANIN_4() property
        {
            return Cast<UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */