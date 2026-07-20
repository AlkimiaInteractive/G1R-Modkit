#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_SNIPESDEAL;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000007), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.StartQuest();
                DC(int64(0x00000007), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE GetOldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */