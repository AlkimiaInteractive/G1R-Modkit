#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a3), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_DOOR.StartQuest();
                DC(int64(0x000000a3), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE GetNewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_RAVINE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */