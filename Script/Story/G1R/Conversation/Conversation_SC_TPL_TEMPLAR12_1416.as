#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR12_1416 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR12_1416";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR12_1416 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR12_1416";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTpl1416TorwacheExit : UTopic_Hero__SC_TPL_TEMPLAR12_1416
        {
            default DebugId = int64(0xe9eb6749067b581b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe9eb6749067b581c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe9eb6749067b581c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1416TorwacheLife : UTopic_Hero__SC_TPL_TEMPLAR12_1416
        {
            default DebugId = int64(0xe9eb6749067b581d);
            default Caption = LocText("DIA_TPL_1416_TORWACHE_LIFE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe9eb6749067b581e), EConversationDebugInfo::Executing);
                // What's it like as a templar?
                Hero.AI.Say(LocText("DIA_TPL_1416_TORWACHE_LIFE_15_00"));
                DC(int64(0xe9eb6749067b581e), EConversationDebugInfo::Done);
                DC(int64(0xe9eb6749067b581f), EConversationDebugInfo::Executing);
                
                // Hard, but rewarding. We keep this camp safe, and in ...
                Templar.AI.Say(LocText("DIA_TPL_1416_TORWACHE_LIFE_08_01"));
                DC(int64(0xe9eb6749067b581f), EConversationDebugInfo::Done);
                DC(int64(0xe9eb6749067b5820), EConversationDebugInfo::Executing);
                // It's more than just a job - it's a new existence. I'm no ...
                Templar.AI.Say(LocText("DIA_TPL_1416_TORWACHE_LIFE_08_02"));
                DC(int64(0xe9eb6749067b5820), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */