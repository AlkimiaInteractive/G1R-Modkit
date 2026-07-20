#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SwampsharkGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_SwampsharkGlossary GetCreaturesGlossary_SwampsharkGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_SwampsharkGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SwampsharkGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */