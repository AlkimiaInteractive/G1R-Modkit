#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER2_GREAT_INVOCATION-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_GREAT_INVOCATION-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_GREAT_INVOCATION;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"SC_GUR_YBERION_1200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ac), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_GREATINVOCATION_COMPLETE);
                DC(int64(0x000000ac), EConversationDebugInfo::Done);
                DC(int64(0x000000ad), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.CanUpgradeNoviceArmor = 1; }
                DC(int64(0x000000ad), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION GetSwampCamp_SCCHAPTER2_GREAT_INVOCATION() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_GREAT_INVOCATION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */