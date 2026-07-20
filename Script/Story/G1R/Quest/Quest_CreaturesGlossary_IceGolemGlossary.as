#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_IceGolemGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_IceGolemGlossary GetCreaturesGlossary_IceGolemGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_IceGolemGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_IceGolemGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */