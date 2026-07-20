#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonFireGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_DemonFireGlossary GetCreaturesGlossary_DemonFireGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonFireGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonFireGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */