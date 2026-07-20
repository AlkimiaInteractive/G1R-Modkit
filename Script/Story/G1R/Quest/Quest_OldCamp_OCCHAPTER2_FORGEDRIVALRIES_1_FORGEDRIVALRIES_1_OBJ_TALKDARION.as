#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION GetOldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */