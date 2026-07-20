#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_STT_FISK_311");
            default InvolvedCharacters.Add(n"NC_ORG_SHARKY_843");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_FISKNEWDEALER-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FISKNEWDEALER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_FISKNEWDEALER;
            default QuestGiverCharacterUniqueName = n"OC_STT_FISK_311";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetFisk() const property { return GetCharacter(n"OC_STT_FISK_311"); }
            AGothicCharacterState GetSharky() const property { return GetCharacter(n"NC_ORG_SHARKY_843"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Fisk != nullptr && Fisk.IsEveryoneOfThisKindDead()) || (Sharky != nullptr && Sharky.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000014), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FISKNEWDEALER_COMPLETE);
                DC(int64(0x00000014), EConversationDebugInfo::Done);
                DC(int64(0x00000015), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x00000015), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER GetOldCamp_OCCHAPTER1_FISKNEWDEALER() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */