#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS GetSwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */