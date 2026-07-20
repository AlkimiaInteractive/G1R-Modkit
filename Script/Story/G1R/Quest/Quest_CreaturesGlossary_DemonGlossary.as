#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_DemonGlossary GetCreaturesGlossary_DemonGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */