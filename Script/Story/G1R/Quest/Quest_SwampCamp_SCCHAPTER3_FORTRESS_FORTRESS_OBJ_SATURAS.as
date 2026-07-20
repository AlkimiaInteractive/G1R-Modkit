#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORTRESS;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS GetSwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */