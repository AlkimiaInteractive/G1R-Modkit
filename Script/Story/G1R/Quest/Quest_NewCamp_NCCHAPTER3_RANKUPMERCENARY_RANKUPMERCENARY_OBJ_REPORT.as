#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT GetNewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */