#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_GUR_MADCORKALOM_1212 : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_GUR_MADCORKALOM_1212";
        }
        
        
        class UTopic_Hero__ST_GUR_MADCORKALOM_1212 : UG1RDialogTopic
        {
            default ForCharacter = n"ST_GUR_MADCORKALOM_1212";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMadCorKalom() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetTestCharacter() const property
            {
                return GetCharacter(n"AITESTCHARACTER");
            }
            
            AGothicCharacterState GetAM_JUVENILETROLL_01() const property
            {
                return GetCharacter(n"AM_JUVENILETROLL_01");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGur1212MadcorkalomTalk2sc : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0x88dc2a4220e8ecd0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceGur1212MadcorkalomTalk2sc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8fd276570b57c0e4), MadCorKalom != nullptr && MadCorKalom.HasAssignedDailyRoutine(UDailyRoutine_ST_GUR_MadCorKalom_1212_Start));
                }
                
                return MadCorKalom != nullptr && MadCorKalom.HasAssignedDailyRoutine(UDailyRoutine_ST_GUR_MadCorKalom_1212_Start);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped MadCorKalom.AI.SetWalkMode(NPC_WALK)");
                DC(int64(0x88dc2a4220e8ecd2), EConversationDebugInfo::Executing);
                MadCorKalom.AI.GotoCharacter(Hero, 200.0f);
                DC(int64(0x88dc2a4220e8ecd2), EConversationDebugInfo::Done);
                DC(int64(0x88dc2a4220e8ecd3), EConversationDebugInfo::Executing);
                // Have you come to submit?
                MadCorKalom.AI.Say(LocText("GUR_1212_MADCORKALOM_TALK2SC_10_01"));
                DC(int64(0x88dc2a4220e8ecd3), EConversationDebugInfo::Done);
                DC(int64(0x88dc2a4220e8ecd6), EConversationDebugInfo::Executing);
                
                // Are you serious?
                Hero.AI.Say(LocText("GUR_1212_MADCORKALOM_TALK2SC_15_04"));
                DC(int64(0x88dc2a4220e8ecd6), EConversationDebugInfo::Done);
                DC(int64(0x88dc2a4220e8ecd7), EConversationDebugInfo::Executing);
                
                // (snorts) Not really. Some part of me was hoping you'd ...
                MadCorKalom.AI.Say(LocText("GUR_1212_MADCORKALOM_TALK2SC_10_05"));
                DC(int64(0x88dc2a4220e8ecd7), EConversationDebugInfo::Done);
                DC(int64(0x88dc2a4220e8ecd8), EConversationDebugInfo::Executing);
                // But maybe that was just because I liked the idea of a ...
                MadCorKalom.AI.Say(LocText("GUR_1212_MADCORKALOM_TALK2SC_10_06"));
                DC(int64(0x88dc2a4220e8ecd8), EConversationDebugInfo::Done);
                DB(int64(0xb3c216ffb4972ad5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xb3c216ffb4972ae4), EConversationDebugInfo::Executing);
                    // It was, after all, not too long ago that we served the ...
                    MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144452_41"));
                    DC(int64(0xb3c216ffb4972ae4), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb3c216ffb4972ae6), EConversationDebugInfo::Executing);
                    // You do, after all, get things done.
                    MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144454_2083"));
                    DC(int64(0xb3c216ffb4972ae6), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UMadCorKalom_108099,
                    UMadCorKalom_108119,
                    UMadCorKalom_108310
                );
            }
        }
        
        
        class UMadCorKalom_108099 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972b08);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_144525_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108099);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972b09), EConversationDebugInfo::Executing);
                // What happened to the novices?
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144525_2238"));
                DC(int64(0xb3c216ffb4972b09), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b1d), EConversationDebugInfo::Executing);
                
                // Listen to him, all shocked. These men gave their minds ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144548"));
                DC(int64(0xb3c216ffb4972b1d), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b38), EConversationDebugInfo::Executing);
                
                // The "final sacrifice." 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144619"));
                DC(int64(0xb3c216ffb4972b38), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b39), EConversationDebugInfo::Executing);
                
                // That's right. But they will live on. In the era of fire ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144623"));
                DC(int64(0xb3c216ffb4972b39), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b0b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb3c216ffb4972b0b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UMadCorKalom_108119 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972b0c);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_144725");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108119);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972b5b), EConversationDebugInfo::Executing);
                // The Sleeper won't spare you. He's using you, as a tool ...
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144725"));
                DC(int64(0xb3c216ffb4972b5b), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b5c), EConversationDebugInfo::Executing);
                
                // Is that so? I wonder who told you that. Was it that ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144725_3286"));
                DC(int64(0xb3c216ffb4972b5c), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b78), EConversationDebugInfo::Executing);
                // The Sleeper chose us, chose ME as his avatar in this ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144914"));
                DC(int64(0xb3c216ffb4972b78), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b93), EConversationDebugInfo::Executing);
                // You're right, he WILL kill when he wakes, but not those ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145113"));
                DC(int64(0xb3c216ffb4972b93), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ba1), EConversationDebugInfo::Executing);
                // It will be beautiful. 
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145119"));
                DC(int64(0xb3c216ffb4972ba1), EConversationDebugInfo::Done);
                Subdialog(
                    UMadCorKalom_108455,
                    UMadCorKalom_108475,
                    UMadCorKalom_108512
                );
            }
        }
        
        
        class UMadCorKalom_108310 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972b47);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_144641_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108310);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972b48), EConversationDebugInfo::Executing);
                // Let's end this. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144641_3436"));
                DC(int64(0xb3c216ffb4972b48), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972c1d), EConversationDebugInfo::Executing);
                
                // Witness His Glory!
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145321"));
                DC(int64(0xb3c216ffb4972c1d), EConversationDebugInfo::Done);
                DC(int64(0xcf4bd5c5eed112e2), EConversationDebugInfo::Executing);
                MadCorKalom.AI.WaitSeconds(2);
                DC(int64(0xcf4bd5c5eed112e2), EConversationDebugInfo::Done);
                DC(int64(0xcf4bd5c5eed112e4), EConversationDebugInfo::Executing);
                MadCorKalom.AI.StartAttackingImmediately(Hero);
                DC(int64(0xcf4bd5c5eed112e4), EConversationDebugInfo::Done);
                DC(int64(0x1fe4a8a81e9e4870), EConversationDebugInfo::Executing);
                MadCorKalom.ExchangeDailyRoutineToClass(UDailyRoutine_Empty);
                DC(int64(0x1fe4a8a81e9e4870), EConversationDebugInfo::Done);
                DC(int64(0x1e645fec5961fa40), EConversationDebugInfo::Executing);
                G1R.NovicesSleeper_Mumbling = FInGameTime::Now();
                DC(int64(0x1e645fec5961fa40), EConversationDebugInfo::Done);
                DC(int64(0xcf4bd5c5eed112e5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xcf4bd5c5eed112e5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UMadCorKalom_108455 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972ba3);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_144525_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108455);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972b0d), EConversationDebugInfo::Executing);
                // All I'm seeing is a crazy old man. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144525_2785"));
                DC(int64(0xb3c216ffb4972b0d), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b4b), EConversationDebugInfo::Executing);
                
                // No. I am His Chosen. 
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_144649"));
                DC(int64(0xb3c216ffb4972b4b), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972b0f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xb3c216ffb4972b0f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UMadCorKalom_108475 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972ba7);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_145123_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108475);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972ba8), EConversationDebugInfo::Executing);
                // I'm hearing a lot of "Me" in all this. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145123_3984"));
                DC(int64(0xb3c216ffb4972ba8), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972bc6), EConversationDebugInfo::Executing);
                // Are you sure you aren't just bitter that the Sleeper ...
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145210"));
                DC(int64(0xb3c216ffb4972bc6), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972bc7), EConversationDebugInfo::Executing);
                
                // Y'Berion was just a fool whose mind happened to be there ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145211"));
                DC(int64(0xb3c216ffb4972bc7), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972bd5), EConversationDebugInfo::Executing);
                // He never had in him. He was too soft, too doubtful, and ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145218"));
                DC(int64(0xb3c216ffb4972bd5), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972bf0), EConversationDebugInfo::Executing);
                // It finally separated the true believers from the ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145232"));
                DC(int64(0xb3c216ffb4972bf0), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972baa), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xb3c216ffb4972baa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UMadCorKalom_108512 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xb3c216ffb4972bf1);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_145236_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UMadCorKalom_108512);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972bf2), EConversationDebugInfo::Executing);
                // Oh You love hearing yourself talk, don't you?
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145236_1609"));
                DC(int64(0xb3c216ffb4972bf2), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972c02), EConversationDebugInfo::Executing);
                
                // (snorts) Insults. How predictable. 
                MadCorKalom.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_145244"));
                DC(int64(0xb3c216ffb4972c02), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972bf4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xb3c216ffb4972bf4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMadcorkalom : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xbe02f4a44b2db05c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceMadcorkalom);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899705), G1R.PlaceholderCondition == 1);
                }
                
                return G1R.PlaceholderCondition == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x229671ad4e32b253), EConversationDebugInfo::Executing);
                // Sleeper, come forth and let your radiance deliver us ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_133826"));
                DC(int64(0x229671ad4e32b253), EConversationDebugInfo::Done);
                DC(int64(0xbe02f4a44b2db05b), EConversationDebugInfo::Executing);
                // Hear the beating of the hearts - their mighty chorus! ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_133856"));
                DC(int64(0xbe02f4a44b2db05b), EConversationDebugInfo::Done);
                DC(int64(0xbe02f4a44b2db060), EConversationDebugInfo::Executing);
                // Take all that you desire! For our sacrifice shall be the ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_133921"));
                DC(int64(0xbe02f4a44b2db060), EConversationDebugInfo::Done);
                DC(int64(0xbe02f4a44b2db061), EConversationDebugInfo::Executing);
                // All bow before your will, for you are unchallenged, o ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_134212"));
                DC(int64(0xbe02f4a44b2db061), EConversationDebugInfo::Done);
                DC(int64(0xbe02f4a44b2db062), EConversationDebugInfo::Executing);
                // With you, the world shall be forged anew, reshaped in ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_134226"));
                DC(int64(0xbe02f4a44b2db062), EConversationDebugInfo::Done);
                DC(int64(0xbe02f4a44b2db063), EConversationDebugInfo::Executing);
                // The world awaits your coming! Rise, o Sleeper, and reign ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_134337"));
                DC(int64(0xbe02f4a44b2db063), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMadcorkalom161636 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xeacbec300a6e3177);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMadcorkalom161636);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899701), TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day));
                }
                
                return TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e3176), EConversationDebugInfo::Executing);
                // Your suffering sings to me.
                MadCorKalom.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_115938_94"));
                DC(int64(0xeacbec300a6e3176), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMadcorkalom161652 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xeacbec300a6e317b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMadcorkalom161652);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899701), TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day));
                }
                
                return TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e317a), EConversationDebugInfo::Executing);
                // If I can't break your mind, I'll break your body
                MadCorKalom.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_115941_2332"));
                DC(int64(0xeacbec300a6e317a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMadcorkalom161668 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xeacbec300a6e317f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMadcorkalom161668);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899701), TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day));
                }
                
                return TestCharacter != nullptr && TestCharacter.HasDefeatedBeforeTime(AM_JUVENILETROLL_01, G1R.BaalParvez_GotoSC_Day);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeacbec300a6e317e), EConversationDebugInfo::Executing);
                // Drown in my nightmare!
                MadCorKalom.AI.Say(LocText("TEXT_WIP_LKQRRTG_20250220_115943_3511"));
                DC(int64(0xeacbec300a6e317e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMadcorkalom221631 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0xf972da21012f44e5);
            default Caption = LocText("TEXT_WIP_ANXNLPG_20250218_135226_3984");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMadcorkalom221631);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899705), G1R.PlaceholderCondition == 1);
                }
                
                return G1R.PlaceholderCondition == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf972da21012f44e4), EConversationDebugInfo::Executing);
                // You're still here?
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_135226_3984"));
                DC(int64(0xf972da21012f44e4), EConversationDebugInfo::Done);
                DC(int64(0xf972da21012f44e7), EConversationDebugInfo::Executing);
                // Well, not to worry, it won't take much longer and the ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_135425"));
                DC(int64(0xf972da21012f44e7), EConversationDebugInfo::Done);
                DC(int64(0xf972da21012f44e8), EConversationDebugInfo::Executing);
                // And there He will permeate your subconscious and ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_135441"));
                DC(int64(0xf972da21012f44e8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UmadcorkalomST1 : UTopic_Hero__ST_GUR_MADCORKALOM_1212
        {
            default DebugId = int64(0x57a8ddfd8a50c961);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UmadcorkalomST1);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21bfe02ff1899705), G1R.PlaceholderCondition == 1);
                }
                
                return G1R.PlaceholderCondition == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57a8ddfd8a50c960), EConversationDebugInfo::Executing);
                // Sleeper, hear us who call out your name in prayer!
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_124724_3436"));
                DC(int64(0x57a8ddfd8a50c960), EConversationDebugInfo::Done);
                DC(int64(0x57a8ddfd8a50c983), EConversationDebugInfo::Executing);
                // Your faithful stand before you, bringing their offering ...
                MadCorKalom.AI.Say(LocText("TEXT_WIP_ANXNLPG_20250218_133648"));
                DC(int64(0x57a8ddfd8a50c983), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */