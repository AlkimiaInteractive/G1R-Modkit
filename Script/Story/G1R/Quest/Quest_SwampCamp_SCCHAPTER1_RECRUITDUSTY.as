#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_VLK_DUSTY_524");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_RECRUITDUSTY;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetDusty() const property { return GetCharacter(n"OC_VLK_DUSTY_524"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Dusty != nullptr && Dusty.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000036), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_RECRUITDUSTY_COMPLETE);
                DC(int64(0x00000036), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY GetSwampCamp_SCCHAPTER1_RECRUITDUSTY() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */