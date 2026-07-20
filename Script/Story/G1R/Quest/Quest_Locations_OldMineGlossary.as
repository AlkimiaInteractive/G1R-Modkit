#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldMineGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_OldMineGlossary GetLocations_OldMineGlossary() property
        {
            return Cast<UQuest_Locations_OldMineGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldMineGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */