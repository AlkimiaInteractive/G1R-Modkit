#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine : UG1RQuest
        {
            
        }
        
        
        UQuest_OldMine GetOldMine() property
        {
            return Cast<UQuest_OldMine>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */