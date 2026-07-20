#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_RICELORDJOB;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL GetNewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORTRL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */