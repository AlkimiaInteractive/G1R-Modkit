#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_JOINNC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK GetNewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_BRINGLISTBACK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */