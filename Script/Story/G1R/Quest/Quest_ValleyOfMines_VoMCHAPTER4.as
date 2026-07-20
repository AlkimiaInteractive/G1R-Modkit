#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4 GetValleyOfMines_VoMCHAPTER4() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */