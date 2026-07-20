#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_GOD_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_GOD_SLEEPER";
        }
        
        
        class UTopic_Hero__ST_GOD_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"ST_GOD_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSleeper() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHARPY_SLEEPER() const property
            {
                return GetCharacter(n"HARPY_SLEEPER");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGorn_699() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699_SLEEPER");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN_SLEEPER");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO_SLEEPER");
            }
            
            AGothicCharacterState GetORC_SLEEPER() const property
            {
                return GetCharacter(n"ORC_SLEEPER");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER_SLEEPER");
            }
            
            AGothicCharacterState GetMadCorKalom() const property
            {
                return GetCharacter(n"ST_GUR_MADCORKALOM_1212");
            }
            
            AGothicCharacterState GetMud() const property
            {
                return GetCharacter(n"ST_VLK_MUD_SLEEPER");
            }
            
            AGothicCharacterState GetXardas_404() const property
            {
                return GetCharacter(n"XT_DMB_XARDAS_404_SLEEPER");
            }
        }
        
        
        class UChoiceSleeper160307_0 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec17);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSleeper160307);
            
            default Rules.HideIfKnows(UChoiceSleeper160307_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x412739e3ae59ec1a), G1R.PlaceholderCondition == 1);
                }
                
                return G1R.PlaceholderCondition == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec16), EConversationDebugInfo::Executing);
                // I am that which stirs in the abyss.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_113821_2995"));
                DC(int64(0x412739e3ae59ec16), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper160307_1 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSleeper160307_0);
            default Rules.HideIfKnows(UChoiceSleeper160307_1);
            default DebugId = int64(0x412739e3ae59ec17);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec1b), EConversationDebugInfo::Executing);
                // Your gods, they slumber.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_114051"));
                DC(int64(0x412739e3ae59ec1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper160307_2 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSleeper160307_1);
            default Rules.HideIfKnows(UChoiceSleeper160307_2);
            default DebugId = int64(0x412739e3ae59ec17);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec1c), EConversationDebugInfo::Executing);
                // Their dreams are untroubled while you suffer in waking.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_114103"));
                DC(int64(0x412739e3ae59ec1c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper160307 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSleeper160307_2);
            default Rules.HideIfKnows(UChoiceSleeper160307);
            default DebugId = int64(0x412739e3ae59ec17);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec1d), EConversationDebugInfo::Executing);
                // And alone you will perish.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_114105"));
                DC(int64(0x412739e3ae59ec1d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper161534_0 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e3158);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSleeper161534);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LKQRRTG_20250220_105707"), int64(0xeacbec300a6e3158));
            default Rules.HideIfKnows(UChoiceSleeper161534_0);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3157), EConversationDebugInfo::Executing);
                // Nothing binds me now.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_110522_491"));
                DC(int64(0xeacbec300a6e3157), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper161534 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSleeper161534_0);
            default Rules.HideIfKnows(UChoiceSleeper161534);
            default DebugId = int64(0xeacbec300a6e3158);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3161), EConversationDebugInfo::Executing);
                // You are but a whisper before a tempest.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_111002"));
                DC(int64(0xeacbec300a6e3161), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper161559_0 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e3164);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSleeper161559);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_113419_1769"), int64(0xeacbec300a6e3164));
            default Rules.HideIfKnows(UChoiceSleeper161559_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeacbec300a6e3167), Hero != nullptr && Hero.HasDefeated(MadCorKalom));
                }
                
                return Hero != nullptr && Hero.HasDefeated(MadCorKalom);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3163), EConversationDebugInfo::Executing);
                // Your world is mine. It is unfolding. Right this moment.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_111021_3750"));
                DC(int64(0xeacbec300a6e3163), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSleeper161559 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSleeper161559_0);
            default Rules.HideIfKnows(UChoiceSleeper161559);
            default DebugId = int64(0xeacbec300a6e3164);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3168), EConversationDebugInfo::Executing);
                // I am here.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_111113"));
                DC(int64(0xeacbec300a6e3168), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperDiegoEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xb4ec969e0f96c52d);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_115955_2316");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperDiegoEnd);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JJFVYDC_20250317_115007"), int64(0xb4ec969e0f96c52d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4ec969e0f96c516), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Diego, 5000.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Diego, 5000.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4ec969e0f96c52c), EConversationDebugInfo::Executing);
                // Those who walked beside you ... where are they now?
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_115955_2316"));
                DC(int64(0xb4ec969e0f96c52c), EConversationDebugInfo::Done);
                DC(int64(0xb4ec969e0f96c52f), EConversationDebugInfo::Executing);
                // All will fade ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_123050_3346"));
                DC(int64(0xb4ec969e0f96c52f), EConversationDebugInfo::Done);
                DC(int64(0xb4ec969e0f96c530), EConversationDebugInfo::Executing);
                // You are but a whisper ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_123432"));
                DC(int64(0xb4ec969e0f96c530), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperGornEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x2d38cda5253afab4);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_143852_3286");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperGornEnd);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_141459"), int64(0x2d38cda5253afab4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4ec969e0f96c53d), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Gorn_699, 6500.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Gorn_699, 6500.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d38cda5253afab3), EConversationDebugInfo::Executing);
                // Look upon yourself ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143852_3286"));
                DC(int64(0x2d38cda5253afab3), EConversationDebugInfo::Done);
                DC(int64(0x2d38cda5253afab6), EConversationDebugInfo::Executing);
                // A battle lost, a warrior broken ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143944"));
                DC(int64(0x2d38cda5253afab6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperGornStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec62);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_140830_31");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperGornStart);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_141459"), int64(0x412739e3ae59ec62));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec61), EConversationDebugInfo::Executing);
                // Your struggle was in vain.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_140830_31"));
                DC(int64(0x412739e3ae59ec61), EConversationDebugInfo::Done);
                DC(int64(0x412739e3ae59ec64), EConversationDebugInfo::Executing);
                // For all paths lead to me.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_141053"));
                DC(int64(0x412739e3ae59ec64), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperHarpyTower01 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x57a8ddfd8a50c9a0);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_142532");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperHarpyTower01);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccfaf2bb4d814fee), EConversationDebugInfo::Executing);
                // Step forth, and be unmade.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_142532"));
                DC(int64(0xccfaf2bb4d814fee), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperHarpyTower02 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xccfaf2bb4d814ff2);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_142611_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperHarpyTower02);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SleeperTower_Hallway_01", 500.0f, int64(0xccfaf2bb4d814ff2));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccfaf2bb4d814ff1), EConversationDebugInfo::Executing);
                // You will turn to dust ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_142611_41"));
                DC(int64(0xccfaf2bb4d814ff1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperHarpyTower03 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xccfaf2bb4d814ff7);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_143116_2238");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperHarpyTower03);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SleeperTower_Hallway_02", 800.0f, int64(0xccfaf2bb4d814ff7));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccfaf2bb4d814ff6), EConversationDebugInfo::Executing);
                // You are but a whisper ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_143116_2238"));
                DC(int64(0xccfaf2bb4d814ff6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperHarpyTower04 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xccfaf2bb4d814ffc);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_143425_2785");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperHarpyTower04);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_SleeperTower_Hallway_03", 500.0f, int64(0xccfaf2bb4d814ffc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccfaf2bb4d814ffb), EConversationDebugInfo::Executing);
                // Flee and you will find me waiting ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_143425_2785"));
                DC(int64(0xccfaf2bb4d814ffb), EConversationDebugInfo::Done);
                DC(int64(0x275f225acf6dd99a), EConversationDebugInfo::Executing);
                // This was but the beginning ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_143459_3286"));
                DC(int64(0x275f225acf6dd99a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperHarpyTowerTransit : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xccfaf2bb4d815007);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_144507_2386");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperHarpyTowerTransit);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff189974a), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(HARPY_SLEEPER, 5000.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(HARPY_SLEEPER, 5000.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccfaf2bb4d815006), EConversationDebugInfo::Executing);
                // Now you are here ... and now you are not.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_144507_2386"));
                DC(int64(0xccfaf2bb4d815006), EConversationDebugInfo::Done);
                DC(int64(0xccfaf2bb4d815009), EConversationDebugInfo::Executing);
                // Awake or asleep - a dream is a dream ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_144607"));
                DC(int64(0xccfaf2bb4d815009), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperLesterEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e310c);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_091529_2238");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperLesterEnd);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LKQRRTG_20250220_091450"), int64(0xeacbec300a6e310c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4ec969e0f96c516), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Lester, 5000.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Lester, 5000.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e310b), EConversationDebugInfo::Executing);
                // Walk on, and you will find there is no light.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_091529_2238"));
                DC(int64(0xeacbec300a6e310b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperLesterStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e30fe);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_090914_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperLesterStart);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LKQRRTG_20250220_091450"), int64(0xeacbec300a6e30fe));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e30fd), EConversationDebugInfo::Executing);
                // You are bound, yet never still.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_090914_41"));
                DC(int64(0xeacbec300a6e30fd), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e3100), EConversationDebugInfo::Executing);
                // You will forever wander, yet never be free.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_091019"));
                DC(int64(0xeacbec300a6e3100), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMiltenEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x9d34a033a2cb5e76);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_151929_686");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMiltenEnd);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_151423_2785"), int64(0x9d34a033a2cb5e76));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4ec969e0f96c53d), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Milten, 5500.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Milten, 5500.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d34a033a2cb5e75), EConversationDebugInfo::Executing);
                // Such a pitiful, hopeful flame ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_151929_686"));
                DC(int64(0x9d34a033a2cb5e75), EConversationDebugInfo::Done);
                DC(int64(0x9d34a033a2cb5e78), EConversationDebugInfo::Executing);
                // But the ashes are cold, and the night is long.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_152010"));
                DC(int64(0x9d34a033a2cb5e78), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMiltenStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x2d38cda5253afabc);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_145816");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMiltenStart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d38cda5253afabe), EConversationDebugInfo::Executing);
                // Strive, and all will suffer.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_145816"));
                DC(int64(0x2d38cda5253afabe), EConversationDebugInfo::Done);
                DC(int64(0x2d38cda5253afabb), EConversationDebugInfo::Executing);
                // Yield, and your end will be swift.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_145634_2386"));
                DC(int64(0x2d38cda5253afabb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMine02 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x47965116290602d2);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_105731_2238");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperMineStart);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMine02);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ebe2), EConversationDebugInfo::Executing);
                // The darkness is patient ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_105731_2238"));
                DC(int64(0x412739e3ae59ebe2), EConversationDebugInfo::Done);
                DC(int64(0x744aaf5d8aaf3d1d), EConversationDebugInfo::Executing);
                // Yield unto it ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_105736_2785"));
                DC(int64(0x744aaf5d8aaf3d1d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMine03 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ebeb);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_105740_3286");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperMine02);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMine03);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x56f01b002abcbe88), Hero != nullptr && Hero.HasDefeated(Mud));
                }
                
                return Hero != nullptr && Hero.HasDefeated(Mud);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ebea), EConversationDebugInfo::Executing);
                // Your thoughts, your form - it all will wither ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_105740_3286"));
                DC(int64(0x412739e3ae59ebea), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMineEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ebf9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMineEnd);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ebf8), EConversationDebugInfo::Executing);
                // Not enough ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_111443_2386"));
                DC(int64(0x412739e3ae59ebf8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperMineStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x391fb0307ccf705e);
            default Caption = LocText("TEXT_WIP_BNXNLPG_20250219_105538_41");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperMineStart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x391fb0307ccf705d), EConversationDebugInfo::Executing);
                // Your suffering will not cease ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_105538_41"));
                DC(int64(0x391fb0307ccf705d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsConver01 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x1e92bdffed94859e);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161533_1924");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsStart);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsConver01);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e92bdffed9485a5), G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2));
                }
                
                return G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a2933b), EConversationDebugInfo::Executing);
                // Your will is brittle ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161533_1924"));
                DC(int64(0xdd4294c6e1a2933b), EConversationDebugInfo::Done);
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert_Timer = FInGameTime::Now();
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsConver02 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xdd4294c6e1a29353);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161538_2785");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsConver01);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsConver02);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e92bdffed9485a5), G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2));
                }
                
                return G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a29352), EConversationDebugInfo::Executing);
                // More ... more!
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161538_2785"));
                DC(int64(0xdd4294c6e1a29352), EConversationDebugInfo::Done);
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert_Timer = FInGameTime::Now();
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsConver03 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xdd4294c6e1a29358);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161545_3436");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsConver02);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsConver03);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e92bdffed9485a5), G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2));
                }
                
                return G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a29357), EConversationDebugInfo::Executing);
                // The night is without dawn ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161545_3436"));
                DC(int64(0xdd4294c6e1a29357), EConversationDebugInfo::Done);
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert_Timer = FInGameTime::Now();
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsConver04 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xdd4294c6e1a2935d);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161551_3286");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsConver03);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsConver04);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e92bdffed9485a5), G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2));
                }
                
                return G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a2935c), EConversationDebugInfo::Executing);
                // Your strength is waning ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161551_3286"));
                DC(int64(0xdd4294c6e1a2935c), EConversationDebugInfo::Done);
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert_Timer = FInGameTime::Now();
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsConver05 : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xdd4294c6e1a29362);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161600_686");
            default PriorityRank = 3;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsConver04);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsConver05);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e92bdffed9485a5), G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2));
                }
                
                return G1R.Orcs_Desert_Timer.IsValid() && G1R.Orcs_Desert_Timer.IsAtLeastXMinutesAgo(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a29361), EConversationDebugInfo::Executing);
                // You will not prevail ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161600_686"));
                DC(int64(0xdd4294c6e1a29361), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0x1e92bdffed94864a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Sleeper_SleeperOrcsConver05);
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsEnd);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff189974a), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(ORC_SLEEPER, 5000.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(ORC_SLEEPER, 5000.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e92bdffed948649), EConversationDebugInfo::Executing);
                // I listen ... I watch ... I wait ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_162346_2386"));
                DC(int64(0x1e92bdffed948649), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperOrcsStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xdd4294c6e1a29333);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_161526_2238");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperOrcsStart);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd4294c6e1a29332), EConversationDebugInfo::Executing);
                // Your mind trembles ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_ANXNLPG_20250218_161526_2238"));
                DC(int64(0xdd4294c6e1a29332), EConversationDebugInfo::Done);
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert_Timer = FInGameTime::Now();
                DC(int64(0x1e92bdffed948633), EConversationDebugInfo::Done);
                DC(int64(0xdd4294c6e1a29338), EConversationDebugInfo::Executing);
                G1R.Orcs_Desert = 0;
                DC(int64(0xdd4294c6e1a29338), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperXardasEnd : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e312a);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_104907_3984");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperXardasEnd);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LKQRRTG_20250220_115342_153"), int64(0xeacbec300a6e312a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4ec969e0f96c516), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Xardas_404, 5000.0f));
                }
                
                return Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Xardas_404, 5000.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3129), EConversationDebugInfo::Executing);
                // You resist ... but to what end?
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_104907_3984"));
                DC(int64(0xeacbec300a6e3129), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e312f), EConversationDebugInfo::Executing);
                // Yield unto me.
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_105507"));
                DC(int64(0xeacbec300a6e312f), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389496), EConversationDebugInfo::Executing);
                // All have fallen ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_105608_3569"));
                DC(int64(0x11254e7091389496), EConversationDebugInfo::Done);
                DC(int64(0x11254e7091389497), EConversationDebugInfo::Executing);
                // Into the abyss, eternally ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_105707"));
                DC(int64(0x11254e7091389497), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Sleeper_SleeperXardasStart : UTopic_Hero__ST_GOD_SLEEPER
        {
            default DebugId = int64(0xeacbec300a6e311b);
            default Caption = LocText("TEXT_WIP_LKQRRTG_20250220_103825_686");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UTopic_Sleeper_SleeperXardasStart);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JJFVYDC_20250317_132859"), int64(0xeacbec300a6e311b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e311a), EConversationDebugInfo::Executing);
                // Look upon the face of your ruin ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_103825_686"));
                DC(int64(0xeacbec300a6e311a), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e311d), EConversationDebugInfo::Executing);
                // It was he who did this ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_103911"));
                DC(int64(0xeacbec300a6e311d), EConversationDebugInfo::Done);
                DC(int64(0xeacbec300a6e311e), EConversationDebugInfo::Executing);
                // For he knew that you would fail ...
                SayViaGlobalVoice(LocText("ST_GOD_SLEEPER"), LocText("TEXT_WIP_LKQRRTG_20250220_103917"));
                DC(int64(0xeacbec300a6e311e), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */