#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MountainFortressGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_MountainFortressGlossary GetLocations_MountainFortressGlossary() property
        {
            return Cast<UQuest_Locations_MountainFortressGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MountainFortressGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */