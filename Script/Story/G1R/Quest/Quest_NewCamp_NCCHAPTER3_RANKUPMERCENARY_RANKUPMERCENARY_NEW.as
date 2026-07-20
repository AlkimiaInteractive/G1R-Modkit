#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW GetNewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */