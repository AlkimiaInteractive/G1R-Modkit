#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_DEALERJOB;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL GetNewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */