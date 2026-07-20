#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER4_BANNEDFROMOC-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_BANNEDFROMOC-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_BANNEDFROMOC;
            default QuestKind = EQuestKind::Main;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000e8), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_BANNEDFROMOC_COMPLETE);
                DC(int64(0x000000e8), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC GetNewCamp_NCCHAPTER4_BANNEDFROMOC() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */