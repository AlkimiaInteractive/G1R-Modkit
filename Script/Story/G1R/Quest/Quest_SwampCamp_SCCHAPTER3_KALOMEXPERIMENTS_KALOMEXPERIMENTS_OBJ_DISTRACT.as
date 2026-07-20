#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000dd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_GUIDE.StartQuest();
                DC(int64(0x000000dd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT GetSwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */