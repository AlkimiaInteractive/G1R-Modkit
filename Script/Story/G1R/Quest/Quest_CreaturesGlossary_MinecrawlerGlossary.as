#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MinecrawlerGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_MinecrawlerGlossary GetCreaturesGlossary_MinecrawlerGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_MinecrawlerGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MinecrawlerGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */