#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000027), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN.StartQuest();
                DC(int64(0x00000027), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK GetSwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */