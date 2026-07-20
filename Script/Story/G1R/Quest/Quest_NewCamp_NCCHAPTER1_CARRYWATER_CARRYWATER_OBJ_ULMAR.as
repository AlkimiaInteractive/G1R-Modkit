#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CARRYWATER;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR GetNewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */