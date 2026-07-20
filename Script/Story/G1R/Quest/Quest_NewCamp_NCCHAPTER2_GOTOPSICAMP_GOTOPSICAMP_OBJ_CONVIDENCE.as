#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000008c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT.StartQuest();
                DC(int64(0x0000008c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE GetNewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_CONVIDENCE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */