#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST GetValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */