#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD06_217 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD06_217";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD06_217 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD06_217";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGateGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd217Exit : UTopic_Hero__OCR_GRD_GATEGUARD06_217
        {
            default DebugId = int64(0x6bd9ff7c9c247d5f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6bd9ff7c9c247d60), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6bd9ff7c9c247d60), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd217First : UTopic_Hero__OCR_GRD_GATEGUARD06_217
        {
            default DebugId = int64(0x6bd9ff7c9c247d61);
            default Caption = LocText("DIA_GRD_217_FIRST_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6bd9ff7c9c247d62), EConversationDebugInfo::Executing);
                // Hi.
                Hero.AI.Say(LocText("DIA_GRD_217_FIRST_15_00"));
                DC(int64(0x6bd9ff7c9c247d62), EConversationDebugInfo::Done);
                DC(int64(0x6bd9ff7c9c247d63), EConversationDebugInfo::Executing);
                
                // Move your arse, freshie. In or out, I don't care - just ...
                GateGuard.AI.Say(LocText("DIA_GRD_217_FIRST_06_01"));
                DC(int64(0x6bd9ff7c9c247d63), EConversationDebugInfo::Done);
                DC(int64(0x6bd9ff7c9c247d64), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6bd9ff7c9c247d64), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */