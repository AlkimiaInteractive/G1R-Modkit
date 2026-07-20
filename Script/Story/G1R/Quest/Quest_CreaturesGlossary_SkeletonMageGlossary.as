#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonMageGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_SkeletonMageGlossary GetCreaturesGlossary_SkeletonMageGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonMageGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonMageGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */