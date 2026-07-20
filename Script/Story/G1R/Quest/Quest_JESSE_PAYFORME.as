#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_JESSE_PAYFORME : UG1RQuest
        {
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_JESSE_PAYFORME GetJESSE_PAYFORME() property
        {
            return Cast<UQuest_JESSE_PAYFORME>(UQuestSubsystem::Get().GetQuestByClass(UQuest_JESSE_PAYFORME::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */