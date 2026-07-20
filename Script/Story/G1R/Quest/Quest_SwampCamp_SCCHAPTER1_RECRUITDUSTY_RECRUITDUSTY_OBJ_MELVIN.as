#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000030), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY.StartQuest();
                DC(int64(0x00000030), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN GetSwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */