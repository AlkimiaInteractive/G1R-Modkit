#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTAMULET : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OC_VLK_GRIM_580");
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTAMULET-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTAMULET-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_LOSTAMULET;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_VLK_GRIM_580";
            
            AGothicCharacterState GetGrim() const property { return GetCharacter(n"OC_VLK_GRIM_580"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Grim != nullptr && Grim.IsEveryoneOfThisKindDead()) || (/* Skip: was_triggered_by_dialog */ false);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000006), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_LOSTAMULET_COMPLETE);
                DC(int64(0x00000006), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTAMULET GetOldCamp_OCCHAPTER1_LOSTAMULET() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTAMULET>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTAMULET::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */