#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTAMULET;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000002), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND.StartQuest();
                DC(int64(0x00000002), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN GetOldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_JOIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */