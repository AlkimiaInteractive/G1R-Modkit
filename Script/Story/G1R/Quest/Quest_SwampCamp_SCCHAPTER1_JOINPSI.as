#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_JOINPSI : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_JOINPSI-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_JOINPSI;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000004b), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_JOINPSI_COMPLETE);
                DC(int64(0x0000004b), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_JOINPSI GetSwampCamp_SCCHAPTER1_JOINPSI() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_JOINPSI>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_JOINPSI::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */