#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORTRESS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS.StartQuest();
                DC(int64(0x000000c4), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT GetSwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */