#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonLordGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_DemonLordGlossary GetCreaturesGlossary_DemonLordGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonLordGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonLordGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */