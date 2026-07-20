#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SwampCampGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_SwampCampGlossary GetLocations_SwampCampGlossary() property
        {
            return Cast<UQuest_Locations_SwampCampGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SwampCampGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */