#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FINDORCSHAMAN-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FINDORCSHAMAN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_FINDORCSHAMAN;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"XT_DMB_XARDAS_404";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000059), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_FINDORCSHAMAN_COMPLETE);
                DC(int64(0x00000059), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN GetValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */