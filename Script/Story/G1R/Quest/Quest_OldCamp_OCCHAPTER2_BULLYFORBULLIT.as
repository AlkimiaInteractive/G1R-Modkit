#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_WOC_SYRA_109");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER2_BULLYFORBULLIT-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_BULLYFORBULLIT-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_BULLYFORBULLIT;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_WOC_SYRA_109";
            
            AGothicCharacterState GetSyra() const property { return GetCharacter(n"OC_WOC_SYRA_109"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Syra != nullptr && Syra.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000bd), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_BULLYFORBULLIT_COMPLETE);
                DC(int64(0x000000bd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT GetOldCamp_OCCHAPTER2_BULLYFORBULLIT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */