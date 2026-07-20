#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORTRESS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY GetSwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */