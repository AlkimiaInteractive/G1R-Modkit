#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDJOB;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS.StartQuest();
                DC(int64(0x0000005c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK GetNewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */