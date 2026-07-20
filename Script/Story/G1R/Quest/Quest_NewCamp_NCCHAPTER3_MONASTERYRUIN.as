#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_MONASTERYRUIN;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_SLD_GORN_699";
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a8), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_MONASTERYRUIN_COMPLETE);
                DC(int64(0x000000a8), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN GetNewCamp_NCCHAPTER3_MONASTERYRUIN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */