#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FINDINGCAINE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_FINDINGCAINE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_GUR_CORKALOM_1201";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000068), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FINDINGCAINE_COMPLETE);
                DC(int64(0x00000068), EConversationDebugInfo::Done);
                DC(int64(0x00000069), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.CanUpgradeNoviceArmor = 1; }
                DC(int64(0x00000069), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE GetSwampCamp_SCCHAPTER2_FINDINGCAINE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FINDINGCAINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */