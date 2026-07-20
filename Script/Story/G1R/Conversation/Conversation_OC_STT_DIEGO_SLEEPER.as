#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_DIEGO_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_DIEGO_SLEEPER";
        }
        
        
        class UTopic_Hero__OC_STT_DIEGO_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_DIEGO_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDiego() const property
            {
                return Self;
            }
        }
        
        
        class UTopic_Diego_SleeperDiego01 : UTopic_Hero__OC_STT_DIEGO_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec26);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_115901_1340");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Diego_SleeperDiego01);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec25), EConversationDebugInfo::Executing);
                // Still alive? Good. I don't care who you are!
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_115901_1340"));
                DC(int64(0x412739e3ae59ec25), EConversationDebugInfo::Done);
                DC(int64(0xee7be66843932dd5), EConversationDebugInfo::Executing);
                // You're just another convict who will die in here!
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_JJFVYDC_20250317_095932"));
                DC(int64(0xee7be66843932dd5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_SleeperDiego02 : UTopic_Hero__OC_STT_DIEGO_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec35);
            default Caption = LocText("TEXT_WIP_JJFVYDC_20250317_101154");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Diego_SleeperDiego01);
            default Rules.HideIfKnows(UTopic_Diego_SleeperDiego02);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xee7be66843932de0), EConversationDebugInfo::Executing);
                // I'll tell you how this'll go. You got involved with ...
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_JJFVYDC_20250317_101154"));
                DC(int64(0xee7be66843932de0), EConversationDebugInfo::Done);
                DC(int64(0x412739e3ae59ec34), EConversationDebugInfo::Executing);
                // Nobody can help you, nobody WILL help you.
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_121038_153"));
                DC(int64(0x412739e3ae59ec34), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_SleeperDiego03 : UTopic_Hero__OC_STT_DIEGO_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec3a);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_121436_94");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Diego_SleeperDiego02);
            default Rules.HideIfKnows(UTopic_Diego_SleeperDiego03);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec39), EConversationDebugInfo::Executing);
                // You think you got to this point all by yourself?
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_121436_94"));
                DC(int64(0x412739e3ae59ec39), EConversationDebugInfo::Done);
                DC(int64(0xee7be66843932de2), EConversationDebugInfo::Executing);
                // You're here because we wanted you to be here!
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_JJFVYDC_20250317_115007"));
                DC(int64(0xee7be66843932de2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Diego_SleeperDiegoSides : UTopic_Hero__OC_STT_DIEGO_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec3f);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_122533_2332");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Diego_SleeperDiegoSides);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec3e), EConversationDebugInfo::Executing);
                // Where are you going? There's no way for you to slip ...
                SayViaGlobalVoice(LocText("OC_STT_DIEGO_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_122533_2332"));
                DC(int64(0x412739e3ae59ec3e), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */