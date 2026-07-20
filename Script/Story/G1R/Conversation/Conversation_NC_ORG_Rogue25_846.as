#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE25_846 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE25_846";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE25_846 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE25_846";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetThug() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetLefty() const property
            {
                return GetCharacter(n"NC_ORG_LEFTY_844");
            }
        }
        
        
        class UChoice846Exit : UTopic_Hero__NC_ORG_ROGUE25_846
        {
            default DebugId = int64(0x87ec198c0e328da6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x87ec198c0e328da7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x87ec198c0e328da7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoice846Hello : UTopic_Hero__NC_ORG_ROGUE25_846
        {
            default DebugId = int64(0x87ec198c0e328da8);
            default Caption = LocText("DIA_846_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoice846Hello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x87ec198c0e328da9), EConversationDebugInfo::Executing);
                // What's your job?
                Hero.AI.Say(LocText("DIA_846_HELLO_15_00"));
                DC(int64(0x87ec198c0e328da9), EConversationDebugInfo::Done);
                DC(int64(0x6ccca6f0111f8179), EConversationDebugInfo::Executing);
                
                // None of your business. 
                Thug.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_145346"));
                DC(int64(0x6ccca6f0111f8179), EConversationDebugInfo::Done);
                DB(int64(0x87ec198c0e328dac), Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead());
                
                if (Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x87ec198c0e328dad), EConversationDebugInfo::Executing);
                    // Talk to Lefty if you need something. 
                    Thug.AI.Say(LocText("DIA_846_HELLO_07_02"));
                    DC(int64(0x87ec198c0e328dad), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_846_hello_exit_1");
                    DC(int64(0xc890e89589b095b8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc890e89589b095b8), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_846_hello_exit_2");
                    DC(int64(0xc890e89589b095b7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc890e89589b095b7), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */