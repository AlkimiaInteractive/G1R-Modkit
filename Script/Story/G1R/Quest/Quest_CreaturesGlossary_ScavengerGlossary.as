#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ScavengerGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_ScavengerGlossary GetCreaturesGlossary_ScavengerGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_ScavengerGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ScavengerGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */