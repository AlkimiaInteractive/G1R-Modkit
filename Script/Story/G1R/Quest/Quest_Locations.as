#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations : UG1RQuest
        {
            
        }
        
        
        UQuest_Locations GetLocations() property
        {
            return Cast<UQuest_Locations>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */