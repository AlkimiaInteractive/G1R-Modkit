#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU.HasSucceeded() && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITBALOR != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITBALOR.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000da), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_DISTRACT.StartQuest();
                DC(int64(0x000000da), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN GetSwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_MEETVIRAN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */