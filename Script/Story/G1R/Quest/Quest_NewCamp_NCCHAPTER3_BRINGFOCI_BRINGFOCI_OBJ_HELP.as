#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP GetNewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */