#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_CONVOY;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT GetNewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_CONVOY_CONVOY_OBJ_MEETINGPOINT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */