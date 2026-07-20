#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE24_845 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE24_845";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE24_845 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE24_845";
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
        
        
        class UChoice845Exit : UTopic_Hero__NC_ORG_ROGUE24_845
        {
            default DebugId = int64(0xa86510467d8933b2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa86510467d8933b3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa86510467d8933b3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoice845Hello : UTopic_Hero__NC_ORG_ROGUE24_845
        {
            default DebugId = int64(0xa86510467d8933b4);
            default Caption = LocText("DIA_845_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoice845Hello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa86510467d8933b5), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("DIA_845_HELLO_15_00"));
                DC(int64(0xa86510467d8933b5), EConversationDebugInfo::Done);
                DC(int64(0xa86510467d8933b6), EConversationDebugInfo::Executing);
                
                // Guardin' stuff. For the Rice Lord.
                Thug.AI.Say(LocText("DIA_845_HELLO_13_01"));
                DC(int64(0xa86510467d8933b6), EConversationDebugInfo::Done);
                DB(int64(0xa86510467d8933b8), Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead());
                
                if (Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0xa86510467d8933b9), EConversationDebugInfo::Executing);
                    // Talk to Lefty if you want somethin'.
                    Thug.AI.Say(LocText("DIA_845_HELLO_13_02"));
                    DC(int64(0xa86510467d8933b9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_845_hello_exit_1");
                    DC(int64(0xc890e89589b095b6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc890e89589b095b6), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_845_hello_exit_2");
                    DC(int64(0x8a6bf8844b35e0da), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x8a6bf8844b35e0da), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */