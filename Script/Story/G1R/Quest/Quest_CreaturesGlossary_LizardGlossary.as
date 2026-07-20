#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LizardGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_LizardGlossary GetCreaturesGlossary_LizardGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_LizardGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LizardGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */