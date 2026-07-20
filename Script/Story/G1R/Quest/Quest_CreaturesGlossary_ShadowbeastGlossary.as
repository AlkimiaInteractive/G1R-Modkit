#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ShadowbeastGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_ShadowbeastGlossary GetCreaturesGlossary_ShadowbeastGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_ShadowbeastGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ShadowbeastGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */