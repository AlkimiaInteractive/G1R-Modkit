#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_STONEHENGE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER3_STONEHENGE-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_STONEHENGE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_STONEHENGE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"OC_STT_DIEGO";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000dd), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_STONEHENGE_COMPLETE);
                DC(int64(0x000000dd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_STONEHENGE GetOldCamp_OCCHAPTER3_STONEHENGE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_STONEHENGE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_STONEHENGE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */