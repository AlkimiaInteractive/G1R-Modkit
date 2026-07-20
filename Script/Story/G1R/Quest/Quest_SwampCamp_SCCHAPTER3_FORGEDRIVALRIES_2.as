#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_NOV_DARRION_1312");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_FORGEDRIVALRIES_2;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"SC_NOV_DARRION_1312";
            
            AGothicCharacterState GetDarrion() const property { return GetCharacter(n"SC_NOV_DARRION_1312"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Darrion != nullptr && Darrion.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FORGEDRIVALRIES2_COMPLETE);
                DC(int64(0x000000f6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */