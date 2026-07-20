#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_WAITSTONECRAFT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */