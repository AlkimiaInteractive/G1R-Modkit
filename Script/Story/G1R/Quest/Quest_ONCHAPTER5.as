#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ONCHAPTER5 : UG1RQuest
        {
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.IsInChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(5);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000015), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnChapterRespawn");
                DC(int64(0x00000015), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ONCHAPTER5 GetONCHAPTER5() property
        {
            return Cast<UQuest_ONCHAPTER5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ONCHAPTER5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */