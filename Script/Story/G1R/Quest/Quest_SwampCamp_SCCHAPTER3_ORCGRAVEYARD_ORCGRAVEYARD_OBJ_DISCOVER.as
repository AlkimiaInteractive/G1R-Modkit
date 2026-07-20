#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER GetSwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */