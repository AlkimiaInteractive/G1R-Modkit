#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_CastleRuinsGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_CastleRuinsGlossary GetLocations_CastleRuinsGlossary() property
        {
            return Cast<UQuest_Locations_CastleRuinsGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_CastleRuinsGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */