#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES GetValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */