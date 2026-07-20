#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE GetValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */