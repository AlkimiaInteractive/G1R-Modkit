#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_URIZIEL;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000003), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.StartQuest();
                DC(int64(0x00000003), EConversationDebugInfo::Done);
                DC(int64(0x00000004), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_ST_URIZIEL_COMPLETE);
                DC(int64(0x00000004), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE GetSleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */