#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FIREMAGES-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_FIREMAGES;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_KDW_SATURAS_600";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000052), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_FIREMAGES_COMPLETE);
                DC(int64(0x00000052), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES GetValleyOfMines_VoMCHAPTER4_FIREMAGES() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FIREMAGES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */