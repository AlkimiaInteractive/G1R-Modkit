#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_SPREADJOINTS-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_SPREADJOINTS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_SPREADJOINTS;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_NOV_BAALKAGAN_1332";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000073), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_SPREADJOINTS_COMPLETE);
                DC(int64(0x00000073), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS GetNewCamp_NCCHAPTER1_SPREADJOINTS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */