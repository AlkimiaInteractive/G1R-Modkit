#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireGolemGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_FireGolemGlossary GetCreaturesGlossary_FireGolemGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_FireGolemGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireGolemGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */