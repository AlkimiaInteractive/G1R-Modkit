#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_FIGHTER;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_FIGHTER_FIGHTER_OBJ_BRING-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING GetValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING() property
        {
            return Cast<UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_FIGHTER_FIGHTER_OBJ_BRING::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */