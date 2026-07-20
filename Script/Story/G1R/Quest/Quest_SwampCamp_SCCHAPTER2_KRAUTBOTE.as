#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER2_KRAUTBOTE-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_KRAUTBOTE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_KRAUTBOTE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORKALOM_1201";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_KRAUTBOTE_COMPLETE);
                DC(int64(0x0000005e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE GetSwampCamp_SCCHAPTER2_KRAUTBOTE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_KRAUTBOTE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */