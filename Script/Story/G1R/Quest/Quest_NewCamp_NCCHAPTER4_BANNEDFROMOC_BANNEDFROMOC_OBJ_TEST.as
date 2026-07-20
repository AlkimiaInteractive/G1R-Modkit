#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST GetNewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */