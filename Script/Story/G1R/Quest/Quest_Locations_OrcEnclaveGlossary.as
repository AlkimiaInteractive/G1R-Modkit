#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcEnclaveGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_OrcEnclaveGlossary GetLocations_OrcEnclaveGlossary() property
        {
            return Cast<UQuest_Locations_OrcEnclaveGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcEnclaveGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */