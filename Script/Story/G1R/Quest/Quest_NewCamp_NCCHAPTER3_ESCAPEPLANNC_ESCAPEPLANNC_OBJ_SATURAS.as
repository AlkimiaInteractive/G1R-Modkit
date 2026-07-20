#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS GetNewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */