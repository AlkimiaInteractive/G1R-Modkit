#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND GetValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN_FINDORCSHAMAN_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */