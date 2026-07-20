#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LurkerGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_LurkerGlossary GetCreaturesGlossary_LurkerGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_LurkerGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LurkerGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */