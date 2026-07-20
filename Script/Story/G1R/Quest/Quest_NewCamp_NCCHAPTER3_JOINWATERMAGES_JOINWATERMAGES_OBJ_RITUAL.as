#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000d1), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN.StartQuest();
                DC(int64(0x000000d1), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL GetNewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */