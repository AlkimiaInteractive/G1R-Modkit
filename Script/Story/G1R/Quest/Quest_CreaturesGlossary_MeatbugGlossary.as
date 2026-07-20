#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MeatbugGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_MeatbugGlossary GetCreaturesGlossary_MeatbugGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_MeatbugGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MeatbugGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */