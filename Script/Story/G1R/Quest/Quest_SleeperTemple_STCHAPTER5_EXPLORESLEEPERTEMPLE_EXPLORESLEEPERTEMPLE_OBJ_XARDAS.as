#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_ST_EXPLORESLEEPERTEMPLE_URIZIEL);
                DC(int64(0x0000000d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS GetSleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_EXPLORESLEEPERTEMPLE_EXPLORESLEEPERTEMPLE_OBJ_XARDAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */