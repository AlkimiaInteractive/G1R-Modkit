#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SleeperTempleGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_SleeperTempleGlossary GetLocations_SleeperTempleGlossary() property
        {
            return Cast<UQuest_Locations_SleeperTempleGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SleeperTempleGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */