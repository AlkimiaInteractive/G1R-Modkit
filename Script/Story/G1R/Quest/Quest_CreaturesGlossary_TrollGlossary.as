#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_TrollGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_TrollGlossary GetCreaturesGlossary_TrollGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_TrollGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_TrollGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */