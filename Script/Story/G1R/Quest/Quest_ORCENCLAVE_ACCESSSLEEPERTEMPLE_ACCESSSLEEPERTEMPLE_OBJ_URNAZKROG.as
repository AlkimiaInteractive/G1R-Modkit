#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_URNAZKROG::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */