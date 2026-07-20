#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD02_213 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD02_213";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD02_213 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD02_213";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGateGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetOCR_GRD_GATEGUARD01_212() const property
            {
                return GetCharacter(n"OCR_GRD_GATEGUARD01_212");
            }
        }
        
        
        class UChoiceGrd213Abblitzen : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf9251);
            default Caption = LocText("TEXT_CHOICE_GRD_213_ABBLITZEN");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf9252), G1R.Thorus_Permission_Exterior == 0);
                }
                
                return G1R.Thorus_Permission_Exterior == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf9253), EConversationDebugInfo::Executing);
                // You should try out some things to get some excitement ...
                Hero.AI.Say(LocText("INFO_GRD_213_ABBLITZEN_15_00"));
                DC(int64(0xa73d565299bf9253), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf9254), EConversationDebugInfo::Executing);
                
                // Excitement, eh? Why not. Been a while since I messed up ...
                GateGuard.AI.Say(LocText("INFO_GRD_213_ABBLITZEN_07_01"));
                DC(int64(0xa73d565299bf9254), EConversationDebugInfo::Done);
                DC(int64(0x9be750cb04bcee94), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x9be750cb04bcee94), EConversationDebugInfo::Done);
                DC(int64(0x9be750cb04bcee95), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9be750cb04bcee95), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213Attack : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf9240);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint", 100.0f, int64(0xa73d565299bf9240));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf9241), G1R.GuardPassageWarning_OC == 2);
                    DB(int64(0xa73d565299bf9242), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xa73d565299bf9243), GateGuard != nullptr && !GateGuard.IsFriendlyTowards(Hero));
                    DB(int64(0xa73d565299bf9245), GateGuard != nullptr && GateGuard.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardPassageWarning_OC != 2)
                    return false;
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                if (GateGuard != nullptr && GateGuard.IsFriendlyTowards(Hero))
                    return false;
                
                if (GateGuard != nullptr && !GateGuard.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d1cf82c3432348f), EConversationDebugInfo::Executing);
                // That's it. You had your warning!
                GateGuard.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_143944"));
                DC(int64(0x9d1cf82c3432348f), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd969e700), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x79929a2cd969e700), EConversationDebugInfo::Done);
                DC(int64(0x2f92829763988224), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OCR_GRD_GATEGUARD01_212)) && ensure(IsValid(OCR_GRD_GATEGUARD01_212.AI))) { OCR_GRD_GATEGUARD01_212.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0x2f92829763988224), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf924b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa73d565299bf924b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213Exit : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf924f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf9250), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa73d565299bf9250), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213Firstwarn : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf922f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf9230), G1R.GuardPassageWarning_OC == 0);
                    DB(int64(0xa73d565299bf9231), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xa73d565299bf9232), GateGuard != nullptr && !GateGuard.IsFriendlyTowards(Hero));
                    DB(int64(0xa73d565299bf9233), GateGuard != nullptr && GateGuard.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardPassageWarning_OC != 0)
                    return false;
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                if (GateGuard != nullptr && GateGuard.IsFriendlyTowards(Hero))
                    return false;
                
                if (GateGuard != nullptr && !GateGuard.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf9234), EConversationDebugInfo::Executing);
                // HALT!
                GateGuard.AI.Say(LocText("INFO_GRD_213_FIRSTWARN_INFO_07_01"));
                DC(int64(0xa73d565299bf9234), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf9235), EConversationDebugInfo::Executing);
                
                // What is it?
                Hero.AI.Say(LocText("INFO_GRD_213_FIRSTWARN_INFO_15_02"));
                DC(int64(0xa73d565299bf9235), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf9236), EConversationDebugInfo::Executing);
                
                // You got no business here. Sod off.
                GateGuard.AI.Say(LocText("INFO_GRD_213_FIRSTWARN_INFO_07_03"));
                DC(int64(0xa73d565299bf9236), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd96a047e), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 1;
                DC(int64(0x79929a2cd96a047e), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf9237), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa73d565299bf9237), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213Lastwarn : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf9238);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint", 250.0f, int64(0xa73d565299bf9238));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf9239), G1R.GuardPassageWarning_OC == 1);
                    DB(int64(0xa73d565299bf923a), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xa73d565299bf923b), GateGuard != nullptr && !GateGuard.IsFriendlyTowards(Hero));
                    DB(int64(0xa73d565299bf923d), GateGuard != nullptr && GateGuard.IsAtPreferredLocation(500.0f));
                }
                
                if (G1R.GuardPassageWarning_OC != 1)
                    return false;
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                if (GateGuard != nullptr && GateGuard.IsFriendlyTowards(Hero))
                    return false;
                
                if (GateGuard != nullptr && !GateGuard.IsAtPreferredLocation(500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf923e), EConversationDebugInfo::Executing);
                // Are you deaf? One more step and you're mincemeat.
                GateGuard.AI.Say(LocText("INFO_GRD_213_LASTWARN_07_01"));
                DC(int64(0xa73d565299bf923e), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd96a0480), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 2;
                DC(int64(0x79929a2cd96a0480), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf923f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa73d565299bf923f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213Passgate : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf9256);
            default Caption = LocText("INFO_GRD_213_PASSGATE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf9257), G1R.Thorus_Permission_Exterior != 0);
                }
                
                return G1R.Thorus_Permission_Exterior != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf9258), EConversationDebugInfo::Executing);
                // How's it going? 
                Hero.AI.Say(LocText("INFO_GRD_213_PASSGATE_15_00"));
                DC(int64(0xa73d565299bf9258), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf9259), EConversationDebugInfo::Executing);
                
                // Shut up and go in.
                GateGuard.AI.Say(LocText("INFO_GRD_213_PASSGATE_07_01"));
                DC(int64(0xa73d565299bf9259), EConversationDebugInfo::Done);
                DC(int64(0xa73d565299bf925a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa73d565299bf925a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd213TorwacheWelcome : UTopic_Hero__OCR_GRD_GATEGUARD02_213
        {
            default DebugId = int64(0xa73d565299bf924c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd213TorwacheWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa73d565299bf924d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa73d565299bf924e), EConversationDebugInfo::Executing);
                // Oy, heard you're one of us now? That was fast ... not ...
                GateGuard.AI.Say(LocText("GRD_213_TORWACHE_WELCOME_INFO_07_01"));
                DC(int64(0xa73d565299bf924e), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */