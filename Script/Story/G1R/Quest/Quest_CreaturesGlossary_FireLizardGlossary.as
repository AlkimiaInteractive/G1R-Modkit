#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireLizardGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_FireLizardGlossary GetCreaturesGlossary_FireLizardGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_FireLizardGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireLizardGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */