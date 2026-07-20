#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS GetNewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */