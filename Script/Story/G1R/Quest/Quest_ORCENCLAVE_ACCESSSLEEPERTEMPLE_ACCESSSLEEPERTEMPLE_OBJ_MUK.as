#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_MUK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */