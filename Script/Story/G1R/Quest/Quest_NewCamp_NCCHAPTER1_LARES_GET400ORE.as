#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_GET400ORE-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_GET400ORE-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_LARES_GET400ORE;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_ORG_LARES_801";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000002c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_GET400ORE_COMPLETE);
                DC(int64(0x0000002c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE GetNewCamp_NCCHAPTER1_LARES_GET400ORE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */