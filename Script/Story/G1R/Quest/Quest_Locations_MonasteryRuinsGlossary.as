#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_MonasteryRuinsGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_MonasteryRuinsGlossary GetLocations_MonasteryRuinsGlossary() property
        {
            return Cast<UQuest_Locations_MonasteryRuinsGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_MonasteryRuinsGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */