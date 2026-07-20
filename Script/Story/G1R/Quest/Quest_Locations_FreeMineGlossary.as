#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_FreeMineGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_FreeMineGlossary GetLocations_FreeMineGlossary() property
        {
            return Cast<UQuest_Locations_FreeMineGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_FreeMineGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */