#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST GetValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */