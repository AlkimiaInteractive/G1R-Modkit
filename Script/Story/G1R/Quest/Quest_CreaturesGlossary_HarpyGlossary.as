#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_HarpyGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_HarpyGlossary GetCreaturesGlossary_HarpyGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_HarpyGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_HarpyGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */