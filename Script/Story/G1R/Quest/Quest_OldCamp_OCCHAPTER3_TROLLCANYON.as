#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TROLLCANYON : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TROLLCANYON-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_TROLLCANYON;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"OC_KDF_MILTEN";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_TROLLCANYON_COMPLETE);
                DC(int64(0x000000e6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TROLLCANYON GetOldCamp_OCCHAPTER3_TROLLCANYON() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TROLLCANYON>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TROLLCANYON::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */