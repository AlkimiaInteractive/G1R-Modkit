#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a6), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_FINDFOCUS.StartQuest();
                DC(int64(0x000000a6), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR GetNewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */