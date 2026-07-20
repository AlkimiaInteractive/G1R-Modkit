#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORTRESS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_FORTRESS;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_NOV_LESTER";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c1), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FORTRESS_COMPLETE);
                DC(int64(0x000000c1), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORTRESS GetSwampCamp_SCCHAPTER3_FORTRESS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORTRESS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORTRESS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */