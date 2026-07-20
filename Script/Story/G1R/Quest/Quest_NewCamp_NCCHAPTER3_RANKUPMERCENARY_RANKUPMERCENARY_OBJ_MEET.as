#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000be), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS.StartQuest();
                DC(int64(0x000000be), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET GetNewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */