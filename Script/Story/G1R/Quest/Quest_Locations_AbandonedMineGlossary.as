#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_AbandonedMineGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_AbandonedMineGlossary GetLocations_AbandonedMineGlossary() property
        {
            return Cast<UQuest_Locations_AbandonedMineGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_AbandonedMineGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */