#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_NewCampGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_NewCampGlossary GetLocations_NewCampGlossary() property
        {
            return Cast<UQuest_Locations_NewCampGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_NewCampGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */