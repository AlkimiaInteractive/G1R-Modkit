#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_THECHAMPIONBURIAL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OW_OSM_URNAZKROG_2401");
            default InvolvedCharacters.Add(n"OW_OWR_TOCHURNAGG_2403");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ORCENCLAVE;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-ORCENCLAVE_THECHAMPIONBURIAL-DESCRIPTION";
            default NameText = "QUEST-ORCENCLAVE_THECHAMPIONBURIAL-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_THECHAMPIONBURIAL;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OW_OSM_URNAZKROG_2401";
            
            AGothicCharacterState GetUrNazkrog() const property { return GetCharacter(n"OW_OSM_URNAZKROG_2401"); }
            AGothicCharacterState GetToChurnagg() const property { return GetCharacter(n"OW_OWR_TOCHURNAGG_2403"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return (UrNazkrog != nullptr && UrNazkrog.IsEveryoneOfThisKindDead()) || (ToChurnagg != nullptr && ToChurnagg.IsEveryoneOfThisKindDead());
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000024), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OE_THECHAMPIONBURIAL_COMPLETE);
                DC(int64(0x00000024), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ORCENCLAVE_THECHAMPIONBURIAL GetORCENCLAVE_THECHAMPIONBURIAL() property
        {
            return Cast<UQuest_ORCENCLAVE_THECHAMPIONBURIAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_THECHAMPIONBURIAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */