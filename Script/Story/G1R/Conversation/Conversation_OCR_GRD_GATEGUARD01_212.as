#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD01_212 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD01_212";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD01_212 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD01_212";
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
        
        
        class UChoiceGrd212Abblitzen : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d70f7);
            default Caption = LocText("INFO_GRD_212_ABBLITZEN_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xadbed018f42d70f8), G1R.Thorus_Permission_Exterior == 0);
                }
                
                return G1R.Thorus_Permission_Exterior == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xadbed018f42d70f9), EConversationDebugInfo::Executing);
                // I want to go in there.
                Hero.AI.Say(LocText("INFO_GRD_212_ABBLITZEN_15_00"));
                DC(int64(0xadbed018f42d70f9), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70fa), EConversationDebugInfo::Executing);
                
                // And I want to get out of this fuckin' Colony.
                GateGuard.AI.Say(LocText("INFO_GRD_212_ABBLITZEN_13_01"));
                DC(int64(0xadbed018f42d70fa), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70fb), EConversationDebugInfo::Executing);
                // I'm so tired of spendin' all day tellin' idiots like you ...
                GateGuard.AI.Say(LocText("INFO_GRD_212_ABBLITZEN_13_02"));
                DC(int64(0xadbed018f42d70fb), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70fc), EConversationDebugInfo::Executing);
                
                // You COULD just let me through ... 
                Hero.AI.Say(LocText("INFO_GRD_212_ABBLITZEN_15_03"));
                DC(int64(0xadbed018f42d70fc), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70fd), EConversationDebugInfo::Executing);
                
                // That's up to Thorus to decide. 
                GateGuard.AI.Say(LocText("INFO_GRD_212_ABBLITZEN_13_04"));
                DC(int64(0xadbed018f42d70fd), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70fe), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d70fe), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd212Exit : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d70f5);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xadbed018f42d70f6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d70f6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd212Firstin : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d70ff);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd212Firstin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xadbed018f42d7100), G1R.Thorus_Permission_Exterior != 0);
                    DB(int64(0xedcdbb88635c44a7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (G1R.Thorus_Permission_Exterior == 0)
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xadbed018f42d7101), EConversationDebugInfo::Executing);
                // Stop!
                GateGuard.AI.Say(LocText("INFO_GRD_212_FIRSTIN_13_00"));
                DC(int64(0xadbed018f42d7101), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d7102), EConversationDebugInfo::Executing);
                
                // Relax. I spoke to Thorus - he says I can go in.
                Hero.AI.Say(LocText("INFO_GRD_212_FIRSTIN_15_01"));
                DC(int64(0xadbed018f42d7102), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d7103), EConversationDebugInfo::Executing);
                
                // Hmm ... he really did, didn't he? Fine. But I'll ...
                GateGuard.AI.Say(LocText("INFO_GRD_212_FIRSTIN_13_02"));
                DC(int64(0xadbed018f42d7103), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d7104), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d7104), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd212Firstwarn : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d70d8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xadbed018f42d70d9), G1R.GuardPassageWarning_OC == 0);
                    DB(int64(0xadbed018f42d70da), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xadbed018f42d70db), GateGuard != nullptr && !GateGuard.IsFriendlyTowards(Hero));
                    DB(int64(0xadbed018f42d70dc), GateGuard != nullptr && GateGuard.IsAtPreferredLocation(500.0f));
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
                DC(int64(0xadbed018f42d70dd), EConversationDebugInfo::Executing);
                // Stop it right there.
                GateGuard.AI.Say(LocText("INFO_GRD_212_FIRSTWARN_INFO_13_01"));
                DC(int64(0xadbed018f42d70dd), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70de), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("INFO_GRD_212_FIRSTWARN_INFO_15_02"));
                DC(int64(0xadbed018f42d70de), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70df), EConversationDebugInfo::Executing);
                
                // Ain't no one gettin' in here without permission. Now, ...
                GateGuard.AI.Say(LocText("INFO_GRD_212_FIRSTWARN_INFO_13_03"));
                DC(int64(0xadbed018f42d70df), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd969e6c7), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 1;
                DC(int64(0x79929a2cd969e6c7), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d70e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd212Lastwarn : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d70e1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint", 250.0f, int64(0xadbed018f42d70e1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xadbed018f42d70e2), G1R.GuardPassageWarning_OC == 1);
                    DB(int64(0xadbed018f42d70e3), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xadbed018f42d70e4), GateGuard != nullptr && !GateGuard.IsFriendlyTowards(Hero));
                    DB(int64(0xadbed018f42d70e6), GateGuard != nullptr && GateGuard.IsAtPreferredLocation(500.0f));
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
                DC(int64(0xadbed018f42d70e7), EConversationDebugInfo::Executing);
                // Don't test me, lad. I mean it. 
                GateGuard.AI.Say(LocText("INFO_GRD_212_LASTWARN_13_01"));
                DC(int64(0xadbed018f42d70e7), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd969e6cf), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 2;
                DC(int64(0x79929a2cd969e6cf), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d70e8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d70e8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd212Passgate : UTopic_Hero__OCR_GRD_GATEGUARD01_212
        {
            default DebugId = int64(0xadbed018f42d7105);
            default Caption = LocText("INFO_GRD_212_PASSGATE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xadbed018f42d7106), G1R.Thorus_Permission_Exterior != 0);
                }
                
                return G1R.Thorus_Permission_Exterior != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xadbed018f42d7107), EConversationDebugInfo::Executing);
                // Am I still allowed to go in?
                Hero.AI.Say(LocText("INFO_GRD_212_PASSGATE_15_00"));
                DC(int64(0xadbed018f42d7107), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d7108), EConversationDebugInfo::Executing);
                
                // Ask me one more time and you ain't no more.
                GateGuard.AI.Say(LocText("INFO_GRD_212_PASSGATE_13_01"));
                DC(int64(0xadbed018f42d7108), EConversationDebugInfo::Done);
                DC(int64(0xadbed018f42d7109), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xadbed018f42d7109), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */