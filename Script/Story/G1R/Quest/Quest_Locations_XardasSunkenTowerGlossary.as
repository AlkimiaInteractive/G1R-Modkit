#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasSunkenTowerGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_XardasSunkenTowerGlossary GetLocations_XardasSunkenTowerGlossary() property
        {
            return Cast<UQuest_Locations_XardasSunkenTowerGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasSunkenTowerGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */