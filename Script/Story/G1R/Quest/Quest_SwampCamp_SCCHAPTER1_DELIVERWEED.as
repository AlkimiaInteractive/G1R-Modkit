#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_GUR_BAALORUN_1209");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_DELIVERWEED;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_GUR_BAALORUN_1209";
            
            AGothicCharacterState GetBaalOrun() const property { return GetCharacter(n"SC_GUR_BAALORUN_1209"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (BaalOrun != nullptr && BaalOrun.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000011), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DELIVERWEED_COMPLETE);
                DC(int64(0x00000011), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED GetSwampCamp_SCCHAPTER1_DELIVERWEED() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */