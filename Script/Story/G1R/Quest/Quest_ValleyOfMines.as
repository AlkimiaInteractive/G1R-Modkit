#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines : UG1RQuest
        {
            
        }
        
        
        UQuest_ValleyOfMines GetValleyOfMines() property
        {
            return Cast<UQuest_ValleyOfMines>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */