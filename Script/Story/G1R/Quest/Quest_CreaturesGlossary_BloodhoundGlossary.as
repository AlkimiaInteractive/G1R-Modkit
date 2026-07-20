#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodhoundGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_BloodhoundGlossary GetCreaturesGlossary_BloodhoundGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodhoundGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodhoundGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */