#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDJOB;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000061), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL.StartQuest();
                DC(int64(0x00000061), EConversationDebugInfo::Done);
                DC(int64(0x00000062), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_NC_RICELORDJOB_REPORT);
                DC(int64(0x00000062), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS GetNewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */