#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_PAY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */