#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_ExchangeZoneGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_ExchangeZoneGlossary GetLocations_ExchangeZoneGlossary() property
        {
            return Cast<UQuest_Locations_ExchangeZoneGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_ExchangeZoneGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */