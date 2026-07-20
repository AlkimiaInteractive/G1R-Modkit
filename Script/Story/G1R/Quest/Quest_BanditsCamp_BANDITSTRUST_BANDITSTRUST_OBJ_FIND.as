#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_BanditsCamp_BANDITSTRUST;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST_BANDITSTRUST_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000001), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.StartQuest();
                DC(int64(0x00000001), EConversationDebugInfo::Done);
                DC(int64(0x00000002), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_BC_BANDITSTRUST_FIND);
                DC(int64(0x00000002), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND GetBanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */