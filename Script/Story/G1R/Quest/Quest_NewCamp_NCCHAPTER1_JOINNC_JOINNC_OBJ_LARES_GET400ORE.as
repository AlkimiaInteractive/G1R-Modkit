#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_JOINNC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE GetNewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_JOINNC_JOINNC_OBJ_LARES_GET400ORE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */