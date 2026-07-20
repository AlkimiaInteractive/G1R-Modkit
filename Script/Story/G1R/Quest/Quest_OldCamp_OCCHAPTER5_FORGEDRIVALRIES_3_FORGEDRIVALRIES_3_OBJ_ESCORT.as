#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT GetOldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */