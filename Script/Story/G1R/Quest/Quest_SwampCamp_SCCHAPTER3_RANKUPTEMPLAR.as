#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_RANKUPTEMPLAR-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_RANKUPTEMPLAR-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_RANKUPTEMPLAR;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORANGAR_1202";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000cb), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_RANKUPTEMPLAR_COMPLETE);
                DC(int64(0x000000cb), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR GetSwampCamp_SCCHAPTER3_RANKUPTEMPLAR() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_RANKUPTEMPLAR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */