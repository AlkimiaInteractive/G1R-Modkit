#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER1 : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines;
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER1 GetValleyOfMines_VoMCHAPTER1() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */