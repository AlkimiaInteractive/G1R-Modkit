#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Crawler_02, 15, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000ec), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER.StartQuest();
                DC(int64(0x000000ec), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT GetNewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_COLLECT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */