#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS GetSleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_GEMS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */