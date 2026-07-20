#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldCampGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_OldCampGlossary GetLocations_OldCampGlossary() property
        {
            return Cast<UQuest_Locations_OldCampGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldCampGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */