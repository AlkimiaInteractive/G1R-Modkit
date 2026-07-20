#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT GetOldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */