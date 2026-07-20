#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER3 GetValleyOfMines_VoMCHAPTER3() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */