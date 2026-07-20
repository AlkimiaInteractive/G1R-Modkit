#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_DEALERJOB : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_DEALERJOB-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_DEALERJOB-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_DEALERJOB;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_NOV_BAALISIDRO_1333";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000037), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_DEALERJOB_COMPLETE);
                DC(int64(0x00000037), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_DEALERJOB GetNewCamp_NCCHAPTER1_DEALERJOB() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_DEALERJOB>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_DEALERJOB::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */