#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_VIRAN_BLOODFLIES : UG1RQuest
        {
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
        }
        
        
        UQuest_VIRAN_BLOODFLIES GetVIRAN_BLOODFLIES() property
        {
            return Cast<UQuest_VIRAN_BLOODFLIES>(UQuestSubsystem::Get().GetQuestByClass(UQuest_VIRAN_BLOODFLIES::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */