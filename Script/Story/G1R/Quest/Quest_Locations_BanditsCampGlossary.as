#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_BanditsCampGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations;
        }
        
        
        UQuest_Locations_BanditsCampGlossary GetLocations_BanditsCampGlossary() property
        {
            return Cast<UQuest_Locations_BanditsCampGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_BanditsCampGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */