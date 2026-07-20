#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_GORN_699_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_GORN_699_SLEEPER";
        }
        
        
        class UTopic_Hero__NC_SLD_GORN_699_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_GORN_699_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorn_699() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGorn699216397 : UTopic_Hero__NC_SLD_GORN_699_SLEEPER
        {
            default DebugId = int64(0xacb01386257f3999);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGorn699216397);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xacb01386257f3998), EConversationDebugInfo::Executing);
                // Been wondering when you'd show up. Took your sweet time ...
                Gorn_699.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_135219_651"), ForceCameraPreset = n"TWO SHOT EXTRA FULL");
                DC(int64(0xacb01386257f3998), EConversationDebugInfo::Done);
                DC(int64(0xacb01386257f399b), EConversationDebugInfo::Executing);
                // Nobody's in a hurry to arrive at their own funeral, eh?
                Gorn_699.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_141452"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM 500 HIGH");
                DC(int64(0xacb01386257f399b), EConversationDebugInfo::Done);
                DC(int64(0xacb01386257f399c), EConversationDebugInfo::Executing);
                // But enough talking. Let's get this over with.
                Gorn_699.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_141459"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xacb01386257f399c), EConversationDebugInfo::Done);
                DC(int64(0xd15b0d4b62b24d9b), EConversationDebugInfo::Executing);
                Gorn_699.SetRelationshipTowards(Hero, ERelationship::Enemy);
                DC(int64(0xd15b0d4b62b24d9b), EConversationDebugInfo::Done);
                DC(int64(0xd15b0d4b62b24d9d), EConversationDebugInfo::Executing);
                G1R.Gorn_Timer_Battle = FInGameTime::Now();
                DC(int64(0xd15b0d4b62b24d9d), EConversationDebugInfo::Done);
            }
        }
        
        
        class Ugorn_SleeperGornConver : UTopic_Hero__NC_SLD_GORN_699_SLEEPER
        {
            default DebugId = int64(0xacb01386257f39a1);
            default Caption = LocText("TEXT_WIP_WNUMQYJ_20260130_140921_3263");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_141053"), int64(0xacb01386257f39a1));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_143944"), int64(0xacb01386257f39a1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x206a4a5bbeb02032), G1R.Gorn_Timer_Battle.IsValid() && G1R.Gorn_Timer_Battle.IsAtLeastXMinutesAgo(3));
                    DB(int64(0xb4ec969e0f96c538), Hero != nullptr && Hero.CanSenseAnyAliveCharacterOfKind(Gorn_699, 6500.0f));
                }
                
                if (G1R.Gorn_Timer_Battle.IsValid() && !G1R.Gorn_Timer_Battle.IsAtLeastXMinutesAgo(3))
                    return false;
                
                if (Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Gorn_699, 6500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xacb01386257f39a5), G1R.Gorn_Ignite == 0);
                DB(int64(0xacb01386257f39a6), G1R.Gorn_Ignite == 1);
                DB(int64(0xacb01386257f39a7), G1R.Gorn_Ignite == 2);
                
                if (G1R.Gorn_Ignite == 0)
                {
                    DC(int64(0xacb01386257f39a9), EConversationDebugInfo::Executing);
                    // You think the ore's gonna protect you?
                    SayViaGlobalVoice(LocText("NC_SLD_GORN_699_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143140_2238"));
                    DC(int64(0xacb01386257f39a9), EConversationDebugInfo::Done);
                    DC(int64(0xacb01386257f39b3), EConversationDebugInfo::Executing);
                    // Oh, no. It's not. It's protecting ME. You? You got ...
                    SayViaGlobalVoice(LocText("NC_SLD_GORN_699_SLEEPER"), LocText("TEXT_WIP_JJFVYDC_20250317_122329"));
                    DC(int64(0xacb01386257f39b3), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Done);
                }
                else if (G1R.Gorn_Ignite == 1)
                {
                    DC(int64(0xacb01386257f39ab), EConversationDebugInfo::Executing);
                    // Where are you going? Tired already?
                    SayViaGlobalVoice(LocText("NC_SLD_GORN_699_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143145_1924"));
                    DC(int64(0xacb01386257f39ab), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Done);
                }
                else if (G1R.Gorn_Ignite == 2)
                {
                    DC(int64(0xacb01386257f39af), EConversationDebugInfo::Executing);
                    // Stop running, you coward! Come back.
                    SayViaGlobalVoice(LocText("NC_SLD_GORN_699_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143149_2785"));
                    DC(int64(0xacb01386257f39af), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xacb01386257f39b5), EConversationDebugInfo::Executing);
                    // You can run - but you can't hide!
                    SayViaGlobalVoice(LocText("NC_SLD_GORN_699_SLEEPER"), LocText("TEXT_WIP_BNXNLPG_20250219_143153_3436"));
                    DC(int64(0xacb01386257f39b5), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite = 0;
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Done);
                }
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Executing);
                G1R.Gorn_Timer_Battle = FInGameTime::Now();
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */