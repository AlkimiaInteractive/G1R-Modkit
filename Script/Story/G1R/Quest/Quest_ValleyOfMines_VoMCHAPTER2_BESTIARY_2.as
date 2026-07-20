#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default InvolvedCharacters.Add(n"UL_STT_CAVALORN_336");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER2;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER2_BESTIARY_2-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER2_BESTIARY_2-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_BESTIARY_2;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            AGothicCharacterState GetCavalorn() const property { return GetCharacter(n"UL_STT_CAVALORN_336"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Book_Bestiary_02, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Cavalorn != nullptr && Cavalorn.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000034), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_BESTIARY2_COMPLETE);
                DC(int64(0x00000034), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2 GetValleyOfMines_VoMCHAPTER2_BESTIARY_2() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */