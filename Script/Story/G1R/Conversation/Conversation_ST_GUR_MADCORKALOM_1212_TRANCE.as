#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_GUR_MADCORKALOM_1212_TRANCE : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_GUR_MADCORKALOM_1212_TRANCE";
        }
        
        
        class UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE : UG1RDialogTopic
        {
            default ForCharacter = n"ST_GUR_MADCORKALOM_1212_TRANCE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMadCorKalom() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetSleeper() const property
            {
                return GetCharacter(n"ST_GOD_SLEEPER");
            }
        }
        
        
        class UChoiceMadcorkalom221525 : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f44ca);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f44c9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf972da21012f44c9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST1 : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f44d7);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_152320_2386");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f44d6), EConversationDebugInfo::Executing);
                // Why do you try to resist? Can't you see you're too weak?
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_ANXNLPG_20250218_152320_2386"));
                DC(int64(0xf972da21012f44d6), EConversationDebugInfo::Done);
                DC(int64(0xf972da21012f44d9), EConversationDebugInfo::Executing);
                // His dreams have broken far greater minds than yours!
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_ANXNLPG_20250218_154418"));
                DC(int64(0xf972da21012f44d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST1stHeart : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f44f3);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_154800_1609");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST1stHeart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f44f2), EConversationDebugInfo::Executing);
                // The anchors - no! You FOOL! You have no idea what you're ...
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_ANXNLPG_20250218_154800_1609"));
                DC(int64(0xf972da21012f44f2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST2 : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f44fd);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_164134_686");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST2);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ANXNLPG_20250218_154800_1609"), int64(0xf972da21012f44fd));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f44fc), EConversationDebugInfo::Executing);
                // He chose me to break His chains! Come forth, o Sleeper!
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_ANXNLPG_20250218_164134_686"));
                DC(int64(0xf972da21012f44fc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST2ndHeart : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f4501);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_164201_3984");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST2ndHeart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f4500), EConversationDebugInfo::Executing);
                // You wretched worm! You will be the next offering!
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_ANXNLPG_20250218_164201_3984"));
                DC(int64(0xf972da21012f4500), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST3 : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f450c);
            default Caption = LocText("TEXT_WIP_VDGJUJG_20250318_145116_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST3);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ANXNLPG_20250218_164201_3984"), int64(0xf972da21012f450c));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f450b), EConversationDebugInfo::Executing);
                // You are dust in the storm! And I will summon the storm ...
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_VDGJUJG_20250318_145116_41"));
                DC(int64(0xf972da21012f450b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST3rdHeart : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f4510);
            default Caption = LocText("TEXT_WIP_VDGJUJG_20250318_145312_2238");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST3rdHeart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f450f), EConversationDebugInfo::Executing);
                // Give up! Your defiance is futile - I will break your ...
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_VDGJUJG_20250318_145312_2238"));
                DC(int64(0xf972da21012f450f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST4 : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f451a);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_112220_1609");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST4);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f4519), EConversationDebugInfo::Executing);
                // The path is laid before me! None stand beside me - only ...
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_BNXNLPG_20250219_112220_1609"));
                DC(int64(0xf972da21012f4519), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomST4Sleeper : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0x675574ff840cfef5);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_113309");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomST4Sleeper);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x675574ff840cfef7), EConversationDebugInfo::Executing);
                
                // The path is laid before me! None stand beside me - only ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_113309"));
                DC(int64(0x675574ff840cfef7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomSTLastHeart : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0xf972da21012f451e);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_113419_1769");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomSTLastHeart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f4527), EConversationDebugInfo::Executing);
                
                // Your mind shall be unmade in the abyss of the eternal ...
                SayViaGlobalVoice(LocText("ST_GUR_MADCORKALOM_1212_TRANCE"), LocText("TEXT_WIP_BNXNLPG_20250219_113419_1769"));
                DC(int64(0xf972da21012f4527), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_MadCorKalom_madcorkalomSTLastHeartSl : UTopic_Hero__ST_GUR_MADCORKALOM_1212_TRANCE
        {
            default DebugId = int64(0x675574ff840cfeef);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_113742");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_MadCorKalom_madcorkalomSTLastHeartSl);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x675574ff840cfef2), EConversationDebugInfo::Executing);
                
                // Your mind shall be unmade in the abyss of the eternal ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_113742"));
                DC(int64(0x675574ff840cfef2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */