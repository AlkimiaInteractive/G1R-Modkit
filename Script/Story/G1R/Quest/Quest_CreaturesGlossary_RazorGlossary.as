#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_RazorGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_RazorGlossary GetCreaturesGlossary_RazorGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_RazorGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_RazorGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */