#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_SNIPESDEAL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OM_VLK_SNIPES_584");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL-DESCRIPTION";
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_SNIPESDEAL;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OM_VLK_SNIPES_584";
            
            AGothicCharacterState GetSnipes() const property { return GetCharacter(n"OM_VLK_SNIPES_584"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Snipes != nullptr && Snipes.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OM_SNIPESDEAL_COMPLETE);
                DC(int64(0x0000000d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_SNIPESDEAL GetOldMine_OMCHAPTER2_SNIPESDEAL() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_SNIPESDEAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_SNIPESDEAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */