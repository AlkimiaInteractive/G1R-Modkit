#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDJOB : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_RICELORDJOB;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_BAU_RICELORD_900";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005e), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RICELORDJOB_COMPLETE);
                DC(int64(0x0000005e), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDJOB GetNewCamp_NCCHAPTER1_RICELORDJOB() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDJOB>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDJOB::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */