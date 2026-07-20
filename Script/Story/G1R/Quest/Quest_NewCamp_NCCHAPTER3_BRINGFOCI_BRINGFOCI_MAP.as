#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP GetNewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */