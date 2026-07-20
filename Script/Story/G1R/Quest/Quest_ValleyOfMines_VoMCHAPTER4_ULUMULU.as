#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_ULUMULU;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"UL_OSL_URSHAK_2200";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Staff_Ulumulu, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000065), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_ULUMULU_COMPLETE);
                DC(int64(0x00000065), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU GetValleyOfMines_VoMCHAPTER4_ULUMULU() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */