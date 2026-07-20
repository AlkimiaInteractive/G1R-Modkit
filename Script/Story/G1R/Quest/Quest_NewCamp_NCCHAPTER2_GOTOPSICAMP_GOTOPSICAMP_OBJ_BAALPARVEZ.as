#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ GetNewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP_GOTOPSICAMP_OBJ_BAALPARVEZ::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */