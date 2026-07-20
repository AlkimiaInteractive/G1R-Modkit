#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials : UG1RQuest
        {
            
        }
        
        
        UQuest_Tutorials GetTutorials() property
        {
            return Cast<UQuest_Tutorials>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */