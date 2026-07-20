#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000002a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET400ORE_OBJ_REPORT.StartQuest();
                DC(int64(0x0000002a), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED GetNewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */