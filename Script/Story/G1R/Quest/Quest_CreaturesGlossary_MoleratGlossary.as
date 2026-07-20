#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MoleratGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_MoleratGlossary GetCreaturesGlossary_MoleratGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_MoleratGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MoleratGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */