#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_DUM_KINGADVISOR_0 : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_DUM_KINGADVISOR_0";
        }
        
        
        class UTopic_Hero__CUTSCENE_DUM_KINGADVISOR_0 : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_DUM_KINGADVISOR_0";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKingAdvisor() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceKingadvisor587969 : UTopic_Hero__CUTSCENE_DUM_KINGADVISOR_0
        {
            default DebugId = int64(0xafd73db6eab34302);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab34301), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xafd73db6eab34301), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKingadvisor587989 : UTopic_Hero__CUTSCENE_DUM_KINGADVISOR_0
        {
            default DebugId = int64(0xafd73db6eab34307);
            default Caption = LocText("TEXT_WIP_FEIRYVC_20250203_102810_3569");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKingadvisor587989);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab34305), EConversationDebugInfo::Executing);
                // <Text TEXT_WIP_FEIRYVC_20250203_102810_3569 not in ...
                Hero.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102810_3569"));
                DC(int64(0xafd73db6eab34305), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab34306), EConversationDebugInfo::Executing);
                
                // <Text TEXT_WIP_FEIRYVC_20250203_102810_2801 not in ...
                KingAdvisor.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_102810_2801"));
                DC(int64(0xafd73db6eab34306), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */