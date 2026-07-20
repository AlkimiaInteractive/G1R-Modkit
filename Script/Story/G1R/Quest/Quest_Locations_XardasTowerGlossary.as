#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasTowerGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_XardasTowerGlossary GetLocations_XardasTowerGlossary() property
        {
            return Cast<UQuest_Locations_XardasTowerGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasTowerGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */