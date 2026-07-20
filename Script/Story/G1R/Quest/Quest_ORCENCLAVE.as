#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE : UG1RQuest
        {
            
        }
        
        
        UQuest_ORCENCLAVE GetORCENCLAVE() property
        {
            return Cast<UQuest_ORCENCLAVE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */