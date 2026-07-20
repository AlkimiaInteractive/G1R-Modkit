#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000001a), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE.StartQuest();
                DC(int64(0x0000001a), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND GetSwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */