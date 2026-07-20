#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000fd), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_PROTECT.StartQuest();
                DC(int64(0x000000fd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO GetOldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_MEETKIRGO::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */