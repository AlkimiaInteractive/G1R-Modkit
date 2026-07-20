#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_STT_DEXTER_329");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_KALOMSRECIPE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_KALOMSRECIPE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_KALOMSRECIPE;
            default QuestGiverCharacterUniqueName = n"OC_STT_DEXTER_329";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetDexter() const property { return GetCharacter(n"OC_STT_DEXTER_329"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Dexter != nullptr && Dexter.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_KALOMSRECIPE_COMPLETE);
                DC(int64(0x0000001d), EConversationDebugInfo::Done);
                DC(int64(0x0000001e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x0000001e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE GetOldCamp_OCCHAPTER1_KALOMSRECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_KALOMSRECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */