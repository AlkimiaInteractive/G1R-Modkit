#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_WOC_VELAYA_108");
            default InvolvedCharacters.Add(n"OC_WOC_SYRA_109");
            default InvolvedCharacters.Add(n"OC_WOC_SERAPHIA_110");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_DREAMEDLAND-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_DREAMEDLAND-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_DREAMEDLAND;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_WOC_SYRA_109";
            
            AGothicCharacterState GetVelaya() const property { return GetCharacter(n"OC_WOC_VELAYA_108"); }
            AGothicCharacterState GetSyra() const property { return GetCharacter(n"OC_WOC_SYRA_109"); }
            AGothicCharacterState GetSeraphia() const property { return GetCharacter(n"OC_WOC_SERAPHIA_110"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (Velaya != nullptr && Velaya.IsEveryoneOfThisKindDead()) || (Syra != nullptr && Syra.IsEveryoneOfThisKindDead()) || (Seraphia != nullptr && Seraphia.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000f0), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_DREAMEDLAND_COMPLETE);
                DC(int64(0x000000f0), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND GetOldCamp_OCCHAPTER3_DREAMEDLAND() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_DREAMEDLAND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */