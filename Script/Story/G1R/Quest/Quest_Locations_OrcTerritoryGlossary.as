#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcTerritoryGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_OrcTerritoryGlossary GetLocations_OrcTerritoryGlossary() property
        {
            return Cast<UQuest_Locations_OrcTerritoryGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcTerritoryGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */