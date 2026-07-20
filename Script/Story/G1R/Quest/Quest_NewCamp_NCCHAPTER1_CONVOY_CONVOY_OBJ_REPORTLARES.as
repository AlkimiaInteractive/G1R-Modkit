#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CONVOY;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES GetNewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_REPORTLARES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */