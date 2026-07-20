#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                DC(int64(0x00000009), EConversationDebugInfo::Executing);
                Hero.BlockTeleport();
                DC(int64(0x00000009), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER GetSleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_EXPLORESLEEPER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */