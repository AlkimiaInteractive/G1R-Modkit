#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp : UG1RQuest
        {
            
        }
        
        
        UQuest_BanditsCamp GetBanditsCamp() property
        {
            return Cast<UQuest_BanditsCamp>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */