#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS GetOldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */