#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK GetValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE_PATHTOORCENCLAVE_OBJ_MEETURSHAK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */