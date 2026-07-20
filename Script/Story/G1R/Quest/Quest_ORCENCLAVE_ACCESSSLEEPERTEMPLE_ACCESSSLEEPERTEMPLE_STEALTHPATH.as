#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH GetORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH() property
        {
            return Cast<UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */