#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Crime : UG1RQuest
        {
            default ParentQuestClass = UQuest_Tutorials;
        }
        
        
        UQuest_Tutorials_Tut_Crime GetTutorials_Tut_Crime() property
        {
            return Cast<UQuest_Tutorials_Tut_Crime>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Crime::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */