#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_TRIALOFFIRE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TRIALOFFIRE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_TRIALOFFIRE;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"OC_KDF_CORRISTO_402";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000118), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_TRIALOFFIRE_COMPLETE);
                DC(int64(0x00000118), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE GetOldCamp_OCCHAPTER3_TRIALOFFIRE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */