#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_OrcdogGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_OrcdogGlossary GetCreaturesGlossary_OrcdogGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_OrcdogGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_OrcdogGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */