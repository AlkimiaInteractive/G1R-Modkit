#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ae), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_SATURAS.StartQuest();
                DC(int64(0x000000ae), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT GetNewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */