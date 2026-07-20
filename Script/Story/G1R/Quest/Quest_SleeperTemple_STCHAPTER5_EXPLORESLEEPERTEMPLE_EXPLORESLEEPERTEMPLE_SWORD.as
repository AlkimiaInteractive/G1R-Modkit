#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_SWORD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000012), EConversationDebugInfo::Executing);
                if (ensure(IsValid(G1R))) { G1R.DeactivateStoryDataLayer("SleeperTempleEntranceBarrier"); }
                DC(int64(0x00000012), EConversationDebugInfo::Done);
                DC(int64(0x00000013), EConversationDebugInfo::Executing);
                Hero.UnblockTeleport();
                DC(int64(0x00000013), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Sword);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_SWORD GetSleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_SWORD() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_SWORD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_SWORD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */