#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SC_NOV_BALOR_1304");
            default InvolvedCharacters.Add(n"SC_NOV_VIRAN_1302");
            default InvolvedCharacters.Add(n"SC_NOV_JORU_1305");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SWAMPCAMP_SCCHAPTER3_KALOMEXPERIMENTS-DESCRIPTION";
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_KALOMEXPERIMENTS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_KALOMEXPERIMENTS;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetBalor() const property { return GetCharacter(n"SC_NOV_BALOR_1304"); }
            AGothicCharacterState GetViran() const property { return GetCharacter(n"SC_NOV_VIRAN_1302"); }
            AGothicCharacterState GetJoru() const property { return GetCharacter(n"SC_NOV_JORU_1305"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Balor != nullptr && Balor.IsEveryoneOfThisKindDead()) || (Viran != nullptr && Viran.IsEveryoneOfThisKindDead()) || (Joru != nullptr && Joru.IsEveryoneOfThisKindDead());
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d3), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_KALOMEXPERIMENTS_COMPLETE);
                DC(int64(0x000000d3), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS GetSwampCamp_SCCHAPTER3_KALOMEXPERIMENTS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */