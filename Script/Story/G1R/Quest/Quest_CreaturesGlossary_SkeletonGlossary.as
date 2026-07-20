#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_SkeletonGlossary GetCreaturesGlossary_SkeletonGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */