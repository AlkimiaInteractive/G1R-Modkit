#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_SCAVENGERRAIDER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"UL_STT_COHSEL_337");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-VALLEYOFMINES_SCAVENGERRAIDER-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_SCAVENGERRAIDER-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_SCAVENGERRAIDER;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"UL_STT_COHSEL_337";
            
            AGothicCharacterState GetCohsel() const property { return GetCharacter(n"UL_STT_COHSEL_337"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Cohsel != nullptr && Cohsel.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_SCAVENGERRAIDER_COMPLETE);
                DC(int64(0x0000000e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_SCAVENGERRAIDER GetValleyOfMines_SCAVENGERRAIDER() property
        {
            return Cast<UQuest_ValleyOfMines_SCAVENGERRAIDER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_SCAVENGERRAIDER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */