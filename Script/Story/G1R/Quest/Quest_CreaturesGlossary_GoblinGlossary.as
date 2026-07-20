#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_GoblinGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_GoblinGlossary GetCreaturesGlossary_GoblinGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_GoblinGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_GoblinGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */