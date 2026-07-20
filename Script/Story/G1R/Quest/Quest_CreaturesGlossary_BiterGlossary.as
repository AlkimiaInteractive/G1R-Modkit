#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BiterGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_BiterGlossary GetCreaturesGlossary_BiterGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_BiterGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BiterGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */