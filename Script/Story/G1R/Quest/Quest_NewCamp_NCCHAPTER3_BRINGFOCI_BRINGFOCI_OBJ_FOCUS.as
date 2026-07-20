#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS GetNewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */