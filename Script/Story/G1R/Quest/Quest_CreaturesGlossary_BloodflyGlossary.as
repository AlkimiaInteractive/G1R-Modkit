#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodflyGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_BloodflyGlossary GetCreaturesGlossary_BloodflyGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodflyGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodflyGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */