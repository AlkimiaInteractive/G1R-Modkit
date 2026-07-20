#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT GetNewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_LASTREPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */