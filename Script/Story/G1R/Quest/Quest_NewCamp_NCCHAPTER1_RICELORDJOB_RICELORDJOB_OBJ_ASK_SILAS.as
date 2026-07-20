#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDJOB;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000059), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK.StartQuest();
                DC(int64(0x00000059), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS GetNewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */