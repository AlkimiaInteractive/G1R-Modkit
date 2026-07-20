#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Perception : UG1RQuest
        {
            default ParentQuestClass = UQuest_Tutorials;
        }
        
        
        UQuest_Tutorials_Tut_Perception GetTutorials_Tut_Perception() property
        {
            return Cast<UQuest_Tutorials_Tut_Perception>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Perception::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */