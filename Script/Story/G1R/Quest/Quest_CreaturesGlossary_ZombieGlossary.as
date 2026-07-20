#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ZombieGlossary : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary;
        }
        
        
        UQuest_CreaturesGlossary_ZombieGlossary GetCreaturesGlossary_ZombieGlossary() property
        {
            return Cast<UQuest_CreaturesGlossary_ZombieGlossary>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ZombieGlossary::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */