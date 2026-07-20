#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_FreeMine : UG1RQuest
        {
            
        }
        
        
        UQuest_FreeMine GetFreeMine() property
        {
            return Cast<UQuest_FreeMine>(UQuestSubsystem::Get().GetQuestByClass(UQuest_FreeMine::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */