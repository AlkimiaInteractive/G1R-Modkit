#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_MEETYBERION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER2_MEETYBERION-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_MEETYBERION-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_MEETYBERION;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORKALOM_1201";
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000072), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_MEETYBERION_COMPLETE);
                DC(int64(0x00000072), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_MEETYBERION GetSwampCamp_SCCHAPTER2_MEETYBERION() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_MEETYBERION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_MEETYBERION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */