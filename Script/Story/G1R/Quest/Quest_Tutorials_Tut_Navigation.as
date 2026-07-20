#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Navigation : UG1RQuest
        {
            default ParentQuestClass = UQuest_Tutorials;
        }
        
        
        UQuest_Tutorials_Tut_Navigation GetTutorials_Tut_Navigation() property
        {
            return Cast<UQuest_Tutorials_Tut_Navigation>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Navigation::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */