#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_VLK_SNAF_581");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_SNAFSRECIPE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_SNAFSRECIPE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_SNAFSRECIPE;
            default QuestGiverCharacterUniqueName = n"OC_VLK_SNAF_581";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetSnaf() const property { return GetCharacter(n"OC_VLK_SNAF_581"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Snaf != nullptr && Snaf.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000063), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_SNAFSRECIPE_COMPLETE);
                DC(int64(0x00000063), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE GetOldCamp_OCCHAPTER1_SNAFSRECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_SNAFSRECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */