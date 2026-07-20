#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ONCHAPTER2 : UG1RQuest
        {
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.IsInChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000018), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnChapterRespawn");
                DC(int64(0x00000018), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ONCHAPTER2 GetONCHAPTER2() property
        {
            return Cast<UQuest_ONCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ONCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */