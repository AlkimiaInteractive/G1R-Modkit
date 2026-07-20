#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_WHISTLER_BUYMYSWORD-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_WHISTLER_BUYMYSWORD-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_WHISTLER_BUYMYSWORD;
            default QuestGiverCharacterUniqueName = n"OC_STT_WHISTLER_309";
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_WHISTLERSWORD_COMPLETE);
                DC(int64(0x0000005c), EConversationDebugInfo::Done);
                DC(int64(0x0000005d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.OC_Test += 1; }
                DC(int64(0x0000005d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD GetOldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */