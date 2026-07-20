#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER4;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER4_ESCAPEPLAN-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER4_ESCAPEPLAN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_ESCAPEPLAN;
            default QuestKind = EQuestKind::Side;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000120), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_ESCAPEPLAN_COMPLETE);
                DC(int64(0x00000120), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN GetOldCamp_OCCHAPTER4_ESCAPEPLAN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */