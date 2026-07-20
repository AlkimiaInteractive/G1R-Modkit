#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES GetNewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_REPORTLARES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */