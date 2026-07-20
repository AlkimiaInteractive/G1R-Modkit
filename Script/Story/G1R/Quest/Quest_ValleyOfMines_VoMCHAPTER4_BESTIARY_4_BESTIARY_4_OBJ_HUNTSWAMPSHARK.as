#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK GetValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */