#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION GetSwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */