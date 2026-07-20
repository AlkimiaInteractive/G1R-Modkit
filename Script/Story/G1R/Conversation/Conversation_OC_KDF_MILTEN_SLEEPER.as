#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_MILTEN_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_MILTEN_SLEEPER";
        }
        
        
        class UTopic_Hero__OC_KDF_MILTEN_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_MILTEN_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMilten() const property
            {
                return Self;
            }
        }
        
        
        class UTopic_Milten_SleeperMilten01 : UTopic_Hero__OC_KDF_MILTEN_SLEEPER
        {
            default DebugId = int64(0x2d38cda5253afacc);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_151408_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Milten_SleeperMilten01);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfbb7eb0ac3dbc508), EConversationDebugInfo::Executing);
                // Oh ... you. The traitor. I was sure you were gone ...
                SayViaGlobalVoice(LocText("OC_KDF_MILTEN_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151408_41"));
                DC(int64(0xfbb7eb0ac3dbc508), EConversationDebugInfo::Done);
                DC(int64(0xfbb7eb0ac3dbc509), EConversationDebugInfo::Executing);
                // It ends today. This is your undoing!
                SayViaGlobalVoice(LocText("OC_KDF_MILTEN_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151412_2083"));
                DC(int64(0xfbb7eb0ac3dbc509), EConversationDebugInfo::Done);
                DC(int64(0x43bf652dea9dad82), EConversationDebugInfo::Executing);
                G1R.Milten_Sleeper_Battle = 0;
                DC(int64(0x43bf652dea9dad82), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_SleeperMilten02 : UTopic_Hero__OC_KDF_MILTEN_SLEEPER
        {
            default DebugId = int64(0xfbb7eb0ac3dbc4fe);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_151416_2238");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_SleeperMilten01);
            default Rules.HideIfKnows(UTopic_Milten_SleeperMilten02);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfbb7eb0ac3dbc50b), G1R.Milten_Sleeper_Battle == 0);
                    DB(int64(0xfbb7eb0ac3dbc50c), Milten != nullptr && Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier));
                }
                
                if (G1R.Milten_Sleeper_Battle != 0)
                    return false;
                
                if (Milten != nullptr && !Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfbb7eb0ac3dbc4fd), EConversationDebugInfo::Executing);
                // The Darkness of the Void - it laughs at the flames you ...
                SayViaGlobalVoice(LocText("OC_KDF_MILTEN_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151416_2238"));
                DC(int64(0xfbb7eb0ac3dbc4fd), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Executing);
                Milten.AI.WaitSeconds(5);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Executing);
                G1R.Milten_Sleeper_Battle += 1;
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_SleeperMilten03 : UTopic_Hero__OC_KDF_MILTEN_SLEEPER
        {
            default DebugId = int64(0xfbb7eb0ac3dbc502);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_151419_1924");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_SleeperMilten02);
            default Rules.HideIfKnows(UTopic_Milten_SleeperMilten03);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfbb7eb0ac3dbc50b), G1R.Milten_Sleeper_Battle == 1);
                    DB(int64(0xfbb7eb0ac3dbc50c), Milten != nullptr && Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier));
                }
                
                if (G1R.Milten_Sleeper_Battle != 1)
                    return false;
                
                if (Milten != nullptr && !Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfbb7eb0ac3dbc501), EConversationDebugInfo::Executing);
                // The abyss smiles as it waits for you.
                SayViaGlobalVoice(LocText("OC_KDF_MILTEN_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151419_1924"));
                DC(int64(0xfbb7eb0ac3dbc501), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Executing);
                Milten.AI.WaitSeconds(8);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Executing);
                G1R.Milten_Sleeper_Battle += 1;
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Milten_SleeperMilten04 : UTopic_Hero__OC_KDF_MILTEN_SLEEPER
        {
            default DebugId = int64(0xfbb7eb0ac3dbc506);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_151423_2785");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Milten_SleeperMilten03);
            default Rules.HideIfKnows(UTopic_Milten_SleeperMilten04);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfbb7eb0ac3dbc50b), G1R.Milten_Sleeper_Battle == 2);
                    DB(int64(0xfbb7eb0ac3dbc50c), Milten != nullptr && Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier));
                }
                
                if (G1R.Milten_Sleeper_Battle != 2)
                    return false;
                
                if (Milten != nullptr && !Milten.HasDebuff(GameplayTag::Debuff_Milten_Brazier))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfbb7eb0ac3dbc505), EConversationDebugInfo::Executing);
                // Your cries will fade in the abyss ... ever down ... and ...
                SayViaGlobalVoice(LocText("OC_KDF_MILTEN_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151423_2785"));
                DC(int64(0xfbb7eb0ac3dbc505), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Executing);
                Milten.AI.WaitSeconds(5);
                DC(int64(0x11254e7091389485), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Executing);
                G1R.Milten_Sleeper_Battle += 1;
                DC(int64(0x11254e7091389487), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */