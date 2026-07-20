#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_PATHTOORCENCLAVE-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_PATHTOORCENCLAVE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_PATHTOORCENCLAVE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"UL_OSL_URSHAK_2200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000070), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_PATHTOORCENCLAVE_COMPLETE);
                DC(int64(0x00000070), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE GetValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */