#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SnapperGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_SnapperGlossary GetCreaturesGlossary_SnapperGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_SnapperGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SnapperGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */