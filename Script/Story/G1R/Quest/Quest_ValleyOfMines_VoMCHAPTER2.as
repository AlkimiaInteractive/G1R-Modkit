#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER2 GetValleyOfMines_VoMCHAPTER2() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */