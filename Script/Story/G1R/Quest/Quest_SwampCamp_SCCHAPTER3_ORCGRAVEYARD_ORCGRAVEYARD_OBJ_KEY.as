#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY GetSwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */