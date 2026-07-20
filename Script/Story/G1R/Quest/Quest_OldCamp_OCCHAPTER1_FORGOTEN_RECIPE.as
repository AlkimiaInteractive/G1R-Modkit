#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default InvolvedCharacters.Add(n"OC_VLK_SNAF_581");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_FORGOTEN_RECIPE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FORGOTEN_RECIPE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_FORGOTENRECIPE;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            AGothicCharacterState GetSnaf() const property { return GetCharacter(n"OC_VLK_SNAF_581"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Scroll_OldRecipe, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Snaf != nullptr && Snaf.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000033), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGOTTENRECIPE_COMPLETE);
                DC(int64(0x00000033), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE GetOldCamp_OCCHAPTER1_FORGOTEN_RECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FORGOTEN_RECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */