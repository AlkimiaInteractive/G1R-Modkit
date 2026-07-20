#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP GetOldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */