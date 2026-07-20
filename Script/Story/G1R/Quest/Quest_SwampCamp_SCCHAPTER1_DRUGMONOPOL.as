#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER1_DRUGMONOPOL-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DRUGMONOPOL-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_DRUGMONOPOL;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORKALOM_1201";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_DRUGMONOPOL_COMPLETE);
                DC(int64(0x0000001c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL GetSwampCamp_SCCHAPTER1_DRUGMONOPOL() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */