#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR.HasSucceeded() && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000c), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN.StartQuest();
                DC(int64(0x0000000c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED GetSwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_GETWEED::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */