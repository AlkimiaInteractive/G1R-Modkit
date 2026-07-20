#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_StonehengeGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_StonehengeGlossary GetLocations_StonehengeGlossary() property
        {
            return Cast<UQuest_Locations_StonehengeGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_StonehengeGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */