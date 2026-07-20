#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_BanditsCamp_BANDITSTRUST;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST_BANDITSTRUST_OBJ_KEY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItKe_BanditCell, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000000c), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK.StartQuest();
                DC(int64(0x0000000c), EConversationDebugInfo::Done);
                DC(int64(0x0000000d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSTRUST_KEY);
                DC(int64(0x0000000d), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY GetBanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */