#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_BRINGLISTBACK-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_BRINGLISTBACK-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_LARES_BRINGLISTBACK;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_ORG_LARES_801";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                DC(int64(0x00000025), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BRINGLISTBACK_GIVELIST);
                DC(int64(0x00000025), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK GetNewCamp_NCCHAPTER1_LARES_BRINGLISTBACK() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */