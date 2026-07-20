#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CONVOY;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE GetNewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTWEDGE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */