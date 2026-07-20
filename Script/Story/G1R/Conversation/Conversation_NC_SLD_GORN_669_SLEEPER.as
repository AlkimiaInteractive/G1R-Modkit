#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_GORN_669_SLEEPER : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_GORN_669_SLEEPER";
        }
        
        
        class UTopic_Hero__NC_SLD_GORN_669_SLEEPER : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_GORN_669_SLEEPER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorn_669() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGorn669160485 : UTopic_Hero__NC_SLD_GORN_669_SLEEPER
        {
            default DebugId = int64(0x2d38cda5253afa76);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_GornSleeper", 2000.0f, int64(0x2d38cda5253afa76));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_141053"), int64(0x2d38cda5253afa76));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x87f786aaa3fce023), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x2d38cda5253afa79), G1R.Gorn_Ignite == 0);
                DB(int64(0x2d38cda5253afa7e), G1R.Gorn_Ignite == 1);
                DB(int64(0x2d38cda5253afa7f), G1R.Gorn_Ignite == 2);
                
                if (G1R.Gorn_Ignite == 0)
                {
                    DC(int64(0x2d38cda5253afa81), EConversationDebugInfo::Executing);
                    // You think the ore's gonna protect you?
                    Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_143140_2238"));
                    DC(int64(0x2d38cda5253afa81), EConversationDebugInfo::Done);
                    DC(int64(0xee7be66843932df9), EConversationDebugInfo::Executing);
                    // Oh, no. It's not. It's protecting ME. You? You got ...
                    Gorn_669.AI.Say(LocText("TEXT_WIP_JJFVYDC_20250317_122329"));
                    DC(int64(0xee7be66843932df9), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afa97), EConversationDebugInfo::Done);
                }
                else if (G1R.Gorn_Ignite == 1)
                {
                    DC(int64(0x2d38cda5253afa83), EConversationDebugInfo::Executing);
                    // Where are you going? Tired already?
                    Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_143145_1924"));
                    DC(int64(0x2d38cda5253afa83), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afa9d), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afa9d), EConversationDebugInfo::Done);
                }
                else if (G1R.Gorn_Ignite == 2)
                {
                    DC(int64(0x2d38cda5253afa87), EConversationDebugInfo::Executing);
                    // Stop running, you coward! Come back.
                    Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_143149_2785"));
                    DC(int64(0x2d38cda5253afa87), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afaa3), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite += 1;
                    DC(int64(0x2d38cda5253afaa3), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x2d38cda5253afa8c), EConversationDebugInfo::Executing);
                    // You can run - but you can't hide!
                    Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_143153_3436"));
                    DC(int64(0x2d38cda5253afa8c), EConversationDebugInfo::Done);
                    DC(int64(0x2d38cda5253afaa9), EConversationDebugInfo::Executing);
                    G1R.Gorn_Ignite = 0;
                    DC(int64(0x2d38cda5253afaa9), EConversationDebugInfo::Done);
                }
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Executing);
                G1R.Gorn_Timer_Battle = FInGameTime::Now();
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorn669160578 : UTopic_Hero__NC_SLD_GORN_669_SLEEPER
        {
            default DebugId = int64(0x412739e3ae59ec5e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGorn669160578);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_GornSleeper", 2000.0f, int64(0x412739e3ae59ec5e));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BNXNLPG_20250219_141053"), int64(0x412739e3ae59ec5e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x87f786aaa3fce023), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x412739e3ae59ec5d), EConversationDebugInfo::Executing);
                // Been wondering when you'd show up. Took your sweet time ...
                Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_135219_651"));
                DC(int64(0x412739e3ae59ec5d), EConversationDebugInfo::Done);
                DC(int64(0x412739e3ae59ec69), EConversationDebugInfo::Executing);
                // Nobody's in a hurry to arrive at their own funeral, eh?
                Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_141452"));
                DC(int64(0x412739e3ae59ec69), EConversationDebugInfo::Done);
                DC(int64(0x412739e3ae59ec6a), EConversationDebugInfo::Executing);
                // But enough talking. Let's get this over with.
                Gorn_669.AI.Say(LocText("TEXT_WIP_BNXNLPG_20250219_141459"));
                DC(int64(0x412739e3ae59ec6a), EConversationDebugInfo::Done);
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Executing);
                G1R.Gorn_Timer_Battle = FInGameTime::Now();
                DC(int64(0x206a4a5bbeb0203a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */