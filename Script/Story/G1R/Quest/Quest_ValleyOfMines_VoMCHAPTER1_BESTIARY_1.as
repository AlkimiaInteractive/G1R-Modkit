#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default InvolvedCharacters.Add(n"UL_STT_CAVALORN_336");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER1;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER1_BESTIARY_1-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER1_BESTIARY_1-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_BESTIARY_1;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            AGothicCharacterState GetCavalorn() const property { return GetCharacter(n"UL_STT_CAVALORN_336"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItWr_Book_Bestiary_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Cavalorn != nullptr && Cavalorn.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000022), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_BESTIARY1_COMPLETE);
                DC(int64(0x00000022), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1 GetValleyOfMines_VoMCHAPTER1_BESTIARY_1() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */