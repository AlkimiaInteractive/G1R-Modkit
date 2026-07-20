#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_STORAGESHED;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000016), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE.StartQuest();
                DC(int64(0x00000016), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY GetOldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */