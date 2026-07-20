#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_TrollCanyonGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_TrollCanyonGlossary GetLocations_TrollCanyonGlossary() property
        {
            return Cast<UQuest_Locations_TrollCanyonGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_TrollCanyonGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */