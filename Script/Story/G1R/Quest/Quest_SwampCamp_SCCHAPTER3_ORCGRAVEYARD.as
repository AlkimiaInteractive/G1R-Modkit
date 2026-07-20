#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_ORCGRAVEYARD;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORANGAR_1202";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b5), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_ORCGRAVEYARD_COMPLETE);
                DC(int64(0x000000b5), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD GetSwampCamp_SCCHAPTER3_ORCGRAVEYARD() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */