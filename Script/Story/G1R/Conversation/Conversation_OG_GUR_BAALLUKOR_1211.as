#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OG_GUR_BAALLUKOR_1211 : UConversationCharacterSettings
        {
            default ForCharacter = n"OG_GUR_BAALLUKOR_1211";
        }
        
        
        class UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211 : UG1RDialogTopic
        {
            default ForCharacter = n"OG_GUR_BAALLUKOR_1211";
            default WithCharacter = n"SC_GUR_YBERION_1200";
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
        }
        
        
        class UTopic_Hero__OG_GUR_BAALLUKOR_1211 : UG1RDialogTopic
        {
            default ForCharacter = n"OG_GUR_BAALLUKOR_1211";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
        }
        
        
        class UChoiceBaallukor105182_0 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x796e28a97e785f06);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaallukor105182);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_IVXAWSC_20240410_183449_1769"), int64(0x796e28a97e785f06));
            default Rules.HideIfKnows(UChoiceBaallukor105182_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x69a439859cc6a29b), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785eff), EConversationDebugInfo::Executing);
                // Master ... I don't understand. You ... saw him? In a ...
                if (!BaalLukor.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_115923_41")))
                {
                    BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_115923_41"));
                }
                
                DC(int64(0x796e28a97e785eff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukor105182_1 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor105182_0);
            default Rules.HideIfKnows(UChoiceBaallukor105182_1);
            default DebugId = int64(0x796e28a97e785f06);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785f08), EConversationDebugInfo::Executing);
                
                // Yes, Lukor.
                if (!YBerion.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_115933")))
                {
                    YBerion.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_115933"));
                }
                
                DC(int64(0x796e28a97e785f08), EConversationDebugInfo::Done);
                DB(int64(0x796e28a97e785f18), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x796e28a97e785f1f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x921e899f1d82dc6f), EConversationDebugInfo::Executing);
                    // But he isn't even one of us. 
                    if (!BaalLukor.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_115935")))
                    {
                        BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_115935"));
                    }
                    
                    DC(int64(0x921e899f1d82dc6f), EConversationDebugInfo::Done);
                    DC(int64(0x796e28a97e785f21), EConversationDebugInfo::Executing);
                    // By the Sleeper, he's a shadow!
                    BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120055_2238"));
                    DC(int64(0x796e28a97e785f21), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x921e899f1d82dc70), EConversationDebugInfo::Executing);
                    // But he isn't even one of us. 
                    if (!BaalLukor.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_115935")))
                    {
                        BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_115935"));
                    }
                    
                    DC(int64(0x921e899f1d82dc70), EConversationDebugInfo::Done);
                    DC(int64(0x796e28a97e785f29), EConversationDebugInfo::Executing);
                    // By the Sleeper, he's a bandit! 
                    BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120109_1924"));
                    DC(int64(0x796e28a97e785f29), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x796e28a97e785f33), EConversationDebugInfo::Executing);
                    // By the Sleeper, he's just a novice! 
                    if (!BaalLukor.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_120115_2785")))
                    {
                        BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120115_2785"));
                    }
                    
                    DC(int64(0x796e28a97e785f33), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaallukor105182_2 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor105182_1);
            default Rules.HideIfKnows(UChoiceBaallukor105182_2);
            default DebugId = int64(0x796e28a97e785f06);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785f52), EConversationDebugInfo::Executing);
                // Why don't we give this amulet to one of the templars?
                if (!BaalLukor.HasSaid(LocText("TEXT_WIP_ECJJJUL_20241016_120208")))
                {
                    BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120208"));
                }
                
                DC(int64(0x796e28a97e785f52), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukor105182_3 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor105182_2);
            default Rules.HideIfKnows(UChoiceBaallukor105182_3);
            default DebugId = int64(0x796e28a97e785f06);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785f51), EConversationDebugInfo::Executing);
                
                // Have faith, my friend. This is the Sleeper's will.
                YBerion.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120205"));
                DC(int64(0x796e28a97e785f51), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukor105182_4 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor105182_3);
            default Rules.HideIfKnows(UChoiceBaallukor105182_4);
            default DebugId = int64(0x796e28a97e785f06);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785f47), EConversationDebugInfo::Executing);
                
                // Of course. Forgive me if I spoke out of turn.
                BaalLukor.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120200_3436"));
                DC(int64(0x796e28a97e785f47), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukor105182 : UTopic_SC_GUR_YBERION_1200__OG_GUR_BAALLUKOR_1211
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor105182_4);
            default Rules.HideIfKnows(UChoiceBaallukor105182);
            default DebugId = int64(0x796e28a97e785f06);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x796e28a97e785f61), EConversationDebugInfo::Executing);
                
                // There's nothing to forgive.
                YBerion.AI.Say(LocText("TEXT_WIP_ECJJJUL_20241016_120233"));
                DC(int64(0x796e28a97e785f61), EConversationDebugInfo::Done);
                DC(int64(0x796e28a97e785f68), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x796e28a97e785f68), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor105928 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x40993ccb42646e0e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            default Rules.HideIfKnows(UChoiceBaallukor105928);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b301), Hero != nullptr && Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0));
                    DB(int64(0x40993ccb42646e4e), Hero != nullptr && Hero.IsCloseToCharacter(BaalLukor, 300.0f));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalLukor, 300.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b304), EConversationDebugInfo::Executing);
                // There's a broken piece of the key here!
                Hero.AI.Say(LocText("INFO_BAALLUKOR_SECONDSCROLL_15_01"));
                DC(int64(0x240796094918b304), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b305), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(BaalLukor, UItKe_OrcGraveyardPiece_02, 1);
                DC(int64(0x240796094918b305), EConversationDebugInfo::Done);
                DC(int64(0xea59a806ec60b15e), EConversationDebugInfo::Executing);
                G1R.BaalLukor_KeyPart02 = 1;
                DC(int64(0xea59a806ec60b15e), EConversationDebugInfo::Done);
                DB(int64(0x240796094918b307), G1R.BaalLukor_BringParchment == 1);
                
                if (G1R.BaalLukor_BringParchment == 1)
                {
                    DC(int64(0x240796094918b308), EConversationDebugInfo::Executing);
                    // Let me see ... Oh, Sleeper be praised, that must be the ...
                    BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SECONDSCROLL_13_02"));
                    DC(int64(0x240796094918b308), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b309), EConversationDebugInfo::Executing);
                    G1R.BaalLukor_BringParchment = 2;
                    DC(int64(0x240796094918b309), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b30a), EConversationDebugInfo::Executing);
                    BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                    DC(int64(0x240796094918b30a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baallukor_105928_exit_1");
                }
                else
                {
                    DC(int64(0x240796094918b30b), EConversationDebugInfo::Executing);
                    // Hmm, indeed it does. Looks like some kind of ... key? I ...
                    BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SECONDSCROLL_13_03"));
                    DC(int64(0x240796094918b30b), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b30c), EConversationDebugInfo::Executing);
                    // Maybe this will help us get through the big door in the ...
                    BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SECONDSCROLL_13_04"));
                    DC(int64(0x240796094918b30c), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b30d), EConversationDebugInfo::Executing);
                    BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                    DC(int64(0x240796094918b30d), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b30e), EConversationDebugInfo::Executing);
                    G1R.BaalLukor_BringParchment = 1;
                    DC(int64(0x240796094918b30e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baallukor_105928_exit_2");
                    DC(int64(0x240796094918b30f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x240796094918b30f), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBaallukor144281 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xcf6cde32246c7c14);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaallukor144281);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OG_TOMB", 800.0f, int64(0xcf6cde32246c7c14));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b359), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7c0a), EConversationDebugInfo::Executing);
                // What's this?
                BaalLukor.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_123531_292"));
                DC(int64(0xcf6cde32246c7c0a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukor197143 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xb24b4c3ebc09fe06);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorRunes);
            default Rules.HideIfKnows(UChoiceBaallukor197143);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb24b4c3ebc09fe22), G1R != nullptr && G1R.IsDoorOpen(n"OG_MainTomb_Gate"));
                }
                
                return G1R != nullptr && G1R.IsDoorOpen(n"OG_MainTomb_Gate");
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b320), EConversationDebugInfo::Executing);
                // Sleeper be praised, it worked! I knew it!
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_RUNES_13_06"));
                DC(int64(0x240796094918b320), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec9c), EConversationDebugInfo::Executing);
                
                // I had no idea the focus could do that.
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150321"));
                DC(int64(0xfd99951305c0ec9c), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec9d), EConversationDebugInfo::Executing);
                
                // Fool! Why do you think I took with me? 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150331"));
                DC(int64(0xfd99951305c0ec9d), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec9e), EConversationDebugInfo::Executing);
                // Onwards. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150406"));
                DC(int64(0xfd99951305c0ec9e), EConversationDebugInfo::Done);
                DC(int64(0x235f06f14b3e74a0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x235f06f14b3e74a0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor84850 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xea000d5c695cd273);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBaallukor84850);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfad7fa36d5ead5), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted());
                    DB(int64(0x3eed5775e7b68414), G1R.SwampCampTemple_Permision != 0);
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted())
                    return false;
                
                if (G1R.SwampCampTemple_Permision == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea000d5c695cd272), EConversationDebugInfo::Executing);
                // What in the ... GUARDS!
                BaalLukor.AI.Say(LocText("TEXT_WIP_QWAGUXL_20240315_113847_41"));
                DC(int64(0xea000d5c695cd272), EConversationDebugInfo::Done);
                DC(int64(0x59245830ef758fbd), EConversationDebugInfo::Executing);
                
                // Relax - Cor Kalom sent me. Apparently Y'Berion has been ...
                Hero.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_104341"));
                DC(int64(0x59245830ef758fbd), EConversationDebugInfo::Done);
                DC(int64(0x59245830ef758fbf), EConversationDebugInfo::Executing);
                
                // ... You're that newcomer. Well. Not what I had in mind, ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_104400"));
                DC(int64(0x59245830ef758fbf), EConversationDebugInfo::Done);
                DC(int64(0x377bb2400567514f), EConversationDebugInfo::Executing);
                // There are people in this Brotherhood who have served the ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_201744"));
                DC(int64(0x377bb2400567514f), EConversationDebugInfo::Done);
                DC(int64(0x377bb24005675150), EConversationDebugInfo::Executing);
                // Come.
                BaalLukor.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_201829"));
                DC(int64(0x377bb24005675150), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OG_GUR_BAALLUKOR, Document::UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_Introduction);
                DC(int64(0x59245830ef758fc1), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Guide);
                DC(int64(0x59245830ef758fc1), EConversationDebugInfo::Done);
                DC(int64(0x59245830ef758fc2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x59245830ef758fc2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor91958 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x235f06f14b3e7414);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            default Rules.HideIfKnows(UChoiceBaallukor91958);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x235f06f14b3e7417), G1R.BaalLukor_BringParchment == 2);
                    DB(int64(0x235f06f14b3e7454), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                if (G1R.BaalLukor_BringParchment != 2)
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x235f06f14b3e740c), EConversationDebugInfo::Executing);
                // Now what? 
                Hero.AI.Say(LocText("TEXT_WIP_FLUUHUE_20240419_163909"));
                DC(int64(0x235f06f14b3e740c), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec96), EConversationDebugInfo::Executing);
                
                // Now we see if this opens the door in the main chamber. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_145820"));
                DC(int64(0xfd99951305c0ec96), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec97), EConversationDebugInfo::Executing);
                // We're getting closer and closer, I can feel it. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_145842"));
                DC(int64(0xfd99951305c0ec97), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_Key);
                DC(int64(0x235f06f14b3e741f), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_FirstDoor);
                DC(int64(0x235f06f14b3e741f), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09fdf3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb24b4c3ebc09fdf3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor91996 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x235f06f14b3e742e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor91958);
            default Rules.HideIfKnows(UChoiceBaallukor91996);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OG_CAVE", 200.0f, int64(0x235f06f14b3e742e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x235f06f14b3e745e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x235f06f14b3e7427), EConversationDebugInfo::Executing);
                // This it it. Quick, take the keystone, and see if it ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_FLUUHUE_20240419_164002_2238"));
                DC(int64(0x235f06f14b3e7427), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec98), EConversationDebugInfo::Executing);
                
                // Calm down, I'm on it. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_145950"));
                DC(int64(0xfd99951305c0ec98), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                BaalLukor.AddItemToInventory(UItKe_OrcGraveyard, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x235f06f14b3e7466), EConversationDebugInfo::Executing);
                BaalLukor.AI.GiveItemTo(Hero, UItKe_OrcGraveyard, 1);
                DC(int64(0x235f06f14b3e7466), EConversationDebugInfo::Done);
                DC(int64(0x1d0ed7c96a760dd3), EConversationDebugInfo::Executing);
                BaalLukor.RemoveItemFromInventory(UItKe_OrcGraveyardPiece_01, 1, 0);
                DC(int64(0x1d0ed7c96a760dd3), EConversationDebugInfo::Done);
                DC(int64(0x1d0ed7c96a760dd5), EConversationDebugInfo::Executing);
                BaalLukor.RemoveItemFromInventory(UItKe_OrcGraveyardPiece_02, 1, 0);
                DC(int64(0x1d0ed7c96a760dd5), EConversationDebugInfo::Done);
                DC(int64(0x235f06f14b3e746f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x235f06f14b3e746f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor92243 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x235f06f14b3e746d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor91996);
            default Rules.HideIfKnows(UChoiceBaallukor92243);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb24b4c3ebc09fdcb), G1R != nullptr && G1R.IsDoorOpen(n"OrcGraveyard_Puzzle_Door"));
                }
                
                return G1R != nullptr && G1R.IsDoorOpen(n"OrcGraveyard_Puzzle_Door");
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x235f06f14b3e7444), EConversationDebugInfo::Executing);
                // YES! I knew it! 
                BaalLukor.AI.Say(LocText("TEXT_WIP_FLUUHUE_20240419_164040_2785"));
                DC(int64(0x235f06f14b3e7444), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec99), EConversationDebugInfo::Executing);
                // Can you feel it? His energy, it's here, like an ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150012"));
                DC(int64(0xfd99951305c0ec99), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec9a), EConversationDebugInfo::Executing);
                // Come, let's see what's in there!
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150038"));
                DC(int64(0xfd99951305c0ec9a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_Opened);
                DC(int64(0x235f06f14b3e744d), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                DC(int64(0x235f06f14b3e744d), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09ff9b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY.SucceedQuest();
                DC(int64(0xb24b4c3ebc09ff9b), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09ff9d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER.StartQuest();
                DC(int64(0xb24b4c3ebc09ff9d), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09fde0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb24b4c3ebc09fde0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor92808 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x9c7ad88e45e2db81);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBaallukor92808);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfad7fa36d5eaed), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db7a), EConversationDebugInfo::Executing);
                // I hope you realize what a great honor this is. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_183449_1769"));
                DC(int64(0x9c7ad88e45e2db7a), EConversationDebugInfo::Done);
                DC(int64(0xc499e68af26391d3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc499e68af26391d3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukor94713 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xfd99951305c0eb1d);
            default Caption = LocText("TEXT_WIP_YQBMRVC_20240430_125735");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorMeet);
            default Rules.HideIfKnows(UChoiceBaallukor94713);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfd99951305c0eb15), EConversationDebugInfo::Executing);
                // Are you okay? You sound a bit ... off.
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_125735"));
                DC(int64(0xfd99951305c0eb15), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb16), EConversationDebugInfo::Executing);
                
                // What are you talking about? My mind has never been ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_125735_41"));
                DC(int64(0xfd99951305c0eb16), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorAltar : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b356);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceBaallukorAltar);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OG_TOMB", 100.0f, int64(0x240796094918b356));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b359), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b35e), EConversationDebugInfo::Executing);
                // I ... I don't understand. What's this? 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_01"));
                DC(int64(0x240796094918b35e), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf1), EConversationDebugInfo::Executing);
                
                // Seems like some kind of Orcish mural. Isn't that a ...
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152057"));
                DC(int64(0xb9c18a3ab4993bf1), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf7), EConversationDebugInfo::Executing);
                // Looks to me like those shamans are, uh, I don't know, ...
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152659"), ForceCameraPreset = n"OG LUKOR MURAL");
                DC(int64(0xb9c18a3ab4993bf7), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf2), EConversationDebugInfo::Executing);
                
                // Yes, but ... no, this makes no sense. The Sleeper has ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152112"));
                DC(int64(0xb9c18a3ab4993bf2), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf3), EConversationDebugInfo::Executing);
                
                // Or maybe he does.
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152141"));
                DC(int64(0xb9c18a3ab4993bf3), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf4), EConversationDebugInfo::Executing);
                
                // What are you saying? 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152231"));
                DC(int64(0xb9c18a3ab4993bf4), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bf5), EConversationDebugInfo::Executing);
                
                // That these murals look to me like it was the orcs who ...
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_152303"));
                DC(int64(0xb9c18a3ab4993bf5), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bfb), EConversationDebugInfo::Executing);
                // I mean, just look at it. It's not that subtle. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153249"), ForceCameraPreset = n"OG LUKOR MURAL2");
                DC(int64(0xb9c18a3ab4993bfb), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993bfa), EConversationDebugInfo::Executing);
                
                // N-No. That's a lie, all of it.
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153247"));
                DC(int64(0xb9c18a3ab4993bfa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OG_GUR_BAALLUKOR, Document::UDocumentSegment_Glossary_OG_GUR_BAALLUKOR_Mad);
                DC(int64(0x240796094918b361), EConversationDebugInfo::Executing);
                BaalLukor.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_LukorPray);
                DC(int64(0x240796094918b361), EConversationDebugInfo::Done);
                DC(int64(0xe03088b276bcceeb), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Crazy);
                DC(int64(0xe03088b276bcceeb), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b362), EConversationDebugInfo::Executing);
                // Master? Master, please answer me!
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_02"));
                DC(int64(0x240796094918b362), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b363), EConversationDebugInfo::Executing);
                // I'm your servant, and I answered your summons!
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_03"));
                DC(int64(0x240796094918b363), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b364), EConversationDebugInfo::Executing);
                // Master? Please answer me! ANSWER ME!
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_04"));
                DC(int64(0x240796094918b364), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b366), EConversationDebugInfo::Executing);
                
                // Not again ... 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_15_06"));
                DC(int64(0x240796094918b366), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b367), EConversationDebugInfo::Executing);
                BaalLukor.AI.StandUp();
                DC(int64(0x240796094918b367), EConversationDebugInfo::Done);
                Print("Skipped BaalLukor.AI.WhirlAroundTowards(Hero)");
                DC(int64(0x240796094918b369), EConversationDebugInfo::Executing);
                // YOU. This is YOUR fault. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_07"));
                DC(int64(0x240796094918b369), EConversationDebugInfo::Done);
                DC(int64(0x1d0ed7c96a760d87), EConversationDebugInfo::Executing);
                BaalLukor.AI.DrawCombatWeapon();
                DC(int64(0x1d0ed7c96a760d87), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b36a), EConversationDebugInfo::Executing);
                // You don't belong here, you never did, and that's why the ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_ALTAR_13_08"));
                DC(int64(0x240796094918b36a), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c41), EConversationDebugInfo::Executing);
                // Master Kalom was right, you were a danger from the ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153833"));
                DC(int64(0xb9c18a3ab4993c41), EConversationDebugInfo::Done);
                Subdialog(
                    UBaalLukor_97048,
                    UBaalLukor_96717,
                    UBaalLukor_96737,
                    UBaalLukor_96839
                );
                DC(int64(0xb9c18a3ab4993c1d), EConversationDebugInfo::Executing);
                // He's calling me to him! But it's not enough. He wants a ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153726"));
                DC(int64(0xb9c18a3ab4993c1d), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c57), EConversationDebugInfo::Executing);
                // His will shall be done. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_154202"));
                DC(int64(0xb9c18a3ab4993c57), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b371), EConversationDebugInfo::Executing);
                G1R.BaalLukor_BringParchment = 4;
                DC(int64(0x240796094918b371), EConversationDebugInfo::Done);
                DC(int64(0x1d0ed7c96a760da4), EConversationDebugInfo::Executing);
                BaalLukor.RemoveImmortality();
                DC(int64(0x1d0ed7c96a760da4), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09ffaf), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER.SucceedQuest();
                DC(int64(0xb24b4c3ebc09ffaf), EConversationDebugInfo::Done);
                DC(int64(0x4ed97b34086d732d), EConversationDebugInfo::Executing);
                G1R.DeactivateStoryDataLayer("YberionCorpse");
                DC(int64(0x4ed97b34086d732d), EConversationDebugInfo::Done);
                DC(int64(0x42e237f527b35ec7), EConversationDebugInfo::Executing);
                BaalLukor.LeavePartyOf(Hero);
                DC(int64(0x42e237f527b35ec7), EConversationDebugInfo::Done);
                DC(int64(0x944db3e5acfbc6f6), EConversationDebugInfo::Executing);
                BaalLukor.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent);
                DC(int64(0x944db3e5acfbc6f6), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b375), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240796094918b375), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UBaalLukor_97048 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xb9c18a3ab4993c42);
            default Caption = LocText("TEXT_WIP_YQBMRVC_20240430_153911_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalLukor_97048);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9c18a3ab4993c43), EConversationDebugInfo::Executing);
                // Kalom said that? 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153911_3436"));
                DC(int64(0xb9c18a3ab4993c43), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c4c), EConversationDebugInfo::Executing);
                
                // Yes! He told us, but Y'Berion just saw what he wanted to ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153928"));
                DC(int64(0xb9c18a3ab4993c4c), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c4d), EConversationDebugInfo::Executing);
                // And now, now, you're here, and you've ANGERED Him!
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153953"));
                DC(int64(0xb9c18a3ab4993c4d), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c45), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb9c18a3ab4993c45), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalLukor_96717 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xb9c18a3ab4993c03);
            default Caption = LocText("TEXT_WIP_YQBMRVC_20240430_153717_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalLukor_96717);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9c18a3ab4993c04), EConversationDebugInfo::Executing);
                // Calm down. I'm on your side. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153717_41"));
                DC(int64(0xb9c18a3ab4993c04), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c54), EConversationDebugInfo::Executing);
                
                // LIES!
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_154024"));
                DC(int64(0xb9c18a3ab4993c54), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalLukor_96737 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xb9c18a3ab4993c07);
            default Caption = LocText("TEXT_WIP_YQBMRVC_20240430_153717_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalLukor_96737);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9c18a3ab4993c08), EConversationDebugInfo::Executing);
                
                // Don't do anything stupid now. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153717_2238"));
                DC(int64(0xb9c18a3ab4993c08), EConversationDebugInfo::Done);
                DC(int64(0xb9c18a3ab4993c55), EConversationDebugInfo::Executing);
                
                // SHUT UP!
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_154034"));
                DC(int64(0xb9c18a3ab4993c55), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalLukor_96839 : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0xb9c18a3ab4993c31);
            default Caption = LocText("TEXT_WIP_YQBMRVC_20240430_153812_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UBaalLukor_96839);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9c18a3ab4993c32), EConversationDebugInfo::Executing);
                
                // Here we go ... 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_153812_2785"));
                DC(int64(0xb9c18a3ab4993c32), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorDead : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2c0);
            default Caption = LocText("INFO_BAALLUKOR_DEAD_15_01");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorMeet);
            default Rules.HideIfKnows(UChoiceBaallukorDead);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GUR_1202_CORANGAR_SENDS_INFO_08_02"), int64(0x240796094918b2c0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b2c1), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2c2), EConversationDebugInfo::Executing);
                // Y'Berion is dead. He didn't survive the ritual. 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_DEAD_15_01"));
                DC(int64(0x240796094918b2c2), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2c3), EConversationDebugInfo::Executing);
                
                // I know. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_DEAD_13_02"));
                DC(int64(0x240796094918b2c3), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb27), EConversationDebugInfo::Executing);
                
                // That's it? He was your master. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_130442"));
                DC(int64(0xfd99951305c0eb27), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2c4), EConversationDebugInfo::Executing);
                
                // He was - and he served the Sleeper well. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_DEAD_13_03"));
                DC(int64(0x240796094918b2c4), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2c5), EConversationDebugInfo::Executing);
                // It seems his mind just wasn't strong enough to bear all ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_DEAD_13_04"));
                DC(int64(0x240796094918b2c5), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2c7), EConversationDebugInfo::Executing);
                // But none of that matters anymore. The Sleeper is here, I ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_DEAD_13_06"));
                DC(int64(0x240796094918b2c7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorExit : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2bb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2bc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240796094918b2bc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukorFirstscroll : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2e9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            default Rules.HideIfKnows(UChoiceBaallukorFirstscroll);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b2ea), Hero != nullptr && Hero.HasItem(UItKe_OrcGraveyardPiece_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItKe_OrcGraveyardPiece_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2eb), EConversationDebugInfo::Executing);
                // Look, I found this. 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_FIRSTSCROLL_15_01"));
                DC(int64(0x240796094918b2eb), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2ec), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(BaalLukor, UItKe_OrcGraveyardPiece_01, 1);
                DC(int64(0x240796094918b2ec), EConversationDebugInfo::Done);
                DC(int64(0xea59a806ec60b161), EConversationDebugInfo::Executing);
                G1R.BaalLukor_KeyPart01 = 1;
                DC(int64(0xea59a806ec60b161), EConversationDebugInfo::Done);
                DB(int64(0x240796094918b2ee), G1R.BaalLukor_BringParchment == 1);
                
                if (G1R.BaalLukor_BringParchment == 1)
                {
                    DC(int64(0x240796094918b2ef), EConversationDebugInfo::Executing);
                    // Let me see ... Oh, Sleeper be praised, that must be the ...
                    BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_FIRSTSCROLL_13_02"));
                    DC(int64(0x240796094918b2ef), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b2f0), EConversationDebugInfo::Executing);
                    G1R.BaalLukor_BringParchment = 2;
                    DC(int64(0x240796094918b2f0), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b2f1), EConversationDebugInfo::Executing);
                    BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                    DC(int64(0x240796094918b2f1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baallukor_firstscroll_exit_1");
                }
                else
                {
                    DC(int64(0x240796094918b2f2), EConversationDebugInfo::Executing);
                    // Hmm, indeed it does. Looks like some kind of ... key? I ...
                    BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_FIRSTSCROLL_13_03"));
                    DC(int64(0x240796094918b2f2), EConversationDebugInfo::Done);
                    DC(int64(0xfd99951305c0ec67), EConversationDebugInfo::Executing);
                    // Maybe this will help us get through the big door in the ...
                    BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_145658"));
                    DC(int64(0xfd99951305c0ec67), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b2f4), EConversationDebugInfo::Executing);
                    G1R.BaalLukor_BringParchment = 1;
                    DC(int64(0x240796094918b2f4), EConversationDebugInfo::Done);
                    DC(int64(0x240796094918b2f5), EConversationDebugInfo::Executing);
                    BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                    DC(int64(0x240796094918b2f5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baallukor_firstscroll_exit_2");
                    DC(int64(0x240796094918b2f6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x240796094918b2f6), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBaallukorFirstwait : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2e2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            default Rules.HideIfKnows(UChoiceBaallukorFirstwait);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_OG_TUNNEL1", 500.0f, int64(0x240796094918b2e2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea59a806ec60b15f), G1R.BaalLukor_KeyPart01 == 0);
                }
                
                return G1R.BaalLukor_KeyPart01 == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2e6), EConversationDebugInfo::Executing);
                // No, that's not it. Let's take a look at these alcoves - ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_FIRSTWAIT_13_01"));
                DC(int64(0x240796094918b2e6), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2e7), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Waitinsidetunnelone);
                DC(int64(0x240796094918b2e7), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2e8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240796094918b2e8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukorFoundnone : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2d6);
            default Caption = LocText("INFO_BAALLUKOR_FOUNDNONE_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b2d7), G1R.BaalLukor_BringParchment == 0);
                    DB(int64(0x240796094918b2d8), Hero != nullptr && !Hero.HasItem(UItKe_OrcGraveyardPiece_01, 1, 0));
                    DB(int64(0x240796094918b2d9), Hero != nullptr && !Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0));
                }
                
                if (G1R.BaalLukor_BringParchment != 0)
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItKe_OrcGraveyardPiece_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2da), EConversationDebugInfo::Executing);
                // I can't find anything.
                Hero.AI.Say(LocText("INFO_BAALLUKOR_FOUNDNONE_15_01"));
                DC(int64(0x240796094918b2da), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2db), EConversationDebugInfo::Executing);
                
                // Then look harder. We haven't yet explored all the ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_FOUNDNONE_13_02"));
                DC(int64(0x240796094918b2db), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eba7), EConversationDebugInfo::Executing);
                // The Sleeper IS here. I can hear Him, even now. 
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_135849"));
                DC(int64(0xfd99951305c0eba7), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2dc), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                DC(int64(0x240796094918b2dc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorFoundone : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2dd);
            default Caption = LocText("INFO_BAALLUKOR_FOUNDONE_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x490250d79e06d975), G1R.BaalLukor_BringParchment == 1);
                }
                
                return G1R.BaalLukor_BringParchment == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2df), EConversationDebugInfo::Executing);
                // What if there is no second part of that key?
                Hero.AI.Say(LocText("INFO_BAALLUKOR_FOUNDONE_15_01"));
                DC(int64(0x240796094918b2df), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2e0), EConversationDebugInfo::Executing);
                
                // There must be. We just have to keep looking. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_FOUNDONE_13_02"));
                DC(int64(0x240796094918b2e0), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2e1), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                DC(int64(0x240796094918b2e1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorHelp : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2cf);
            default Caption = LocText("INFO_BAALLUKOR_HELP_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorSummoning);
            default Rules.HideIfKnows(UChoiceBaallukorHelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b2d0), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2d1), EConversationDebugInfo::Executing);
                // Seems like we'll have to work together. Angar and Kalom ...
                Hero.AI.Say(LocText("INFO_BAALLUKOR_HELP_15_01"));
                DC(int64(0x240796094918b2d1), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb2e), EConversationDebugInfo::Executing);
                
                // Is that so?
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_132943"));
                DC(int64(0xfd99951305c0eb2e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_LukorJoined);
                DB(int64(0xfd99951305c0eb36), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xfd99951305c0eb44), EConversationDebugInfo::Executing);
                    // Hmm ... you're a novice, but there's no denying you've ...
                    BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_133102_2238"));
                    DC(int64(0xfd99951305c0eb44), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xfd99951305c0eb4d), EConversationDebugInfo::Executing);
                    // Hmm ... you're an infidel, but there's no denying you've ...
                    BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_133115_1924"));
                    DC(int64(0xfd99951305c0eb4d), EConversationDebugInfo::Done);
                }
                DC(int64(0xfd99951305c0eba5), EConversationDebugInfo::Executing);
                // Fine. With the templars dead, maybe your flesh can be of ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_134515"));
                DC(int64(0xfd99951305c0eba5), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb62), EConversationDebugInfo::Executing);
                // I can sense His power somewhere behind that door, but ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_133125_3436"));
                DC(int64(0xfd99951305c0eb62), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec54), EConversationDebugInfo::Executing);
                // Let's explore the corridors ... maybe there's something ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_145624"));
                DC(int64(0xfd99951305c0ec54), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2d4), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Follow);
                DC(int64(0x240796094918b2d4), EConversationDebugInfo::Done);
                DC(int64(0x40993ccb42646df2), EConversationDebugInfo::Executing);
                BaalLukor.JoinPartyOf(Hero);
                DC(int64(0x40993ccb42646df2), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09ff99), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_KEY.StartQuest();
                DC(int64(0xb24b4c3ebc09ff99), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2d5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240796094918b2d5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukorMeet : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2bd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBaallukorMeet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xea000d5c695cd270), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2be), EConversationDebugInfo::Executing);
                // YOU. What are YOU doing here?
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_MEET_13_01"));
                DC(int64(0x240796094918b2be), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb13), EConversationDebugInfo::Executing);
                
                // Cor Angar sent me to find you. What happened here?
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_125526"));
                DC(int64(0xfd99951305c0eb13), EConversationDebugInfo::Done);
                DC(int64(0x235f06f14b3e73f8), EConversationDebugInfo::Executing);
                
                // I don't know. I was exploring the tunnels, following the ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_FLUUHUE_20240419_134512"));
                DC(int64(0x235f06f14b3e73f8), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb25), EConversationDebugInfo::Executing);
                // Next, there were growls and screams and fighting, and ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_125952"));
                DC(int64(0xfd99951305c0eb25), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb26), EConversationDebugInfo::Executing);
                // They were all dead when I finally came here. Every last ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_130022"));
                DC(int64(0xfd99951305c0eb26), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb14), EConversationDebugInfo::Executing);
                
                // I can see that. 
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_125655"));
                DC(int64(0xfd99951305c0eb14), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_MeetLukor);
                DC(int64(0xb24b4c3ebc09fea5), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_FINDLUKOR.SucceedQuest();
                DC(int64(0xb24b4c3ebc09fea5), EConversationDebugInfo::Done);
                DC(int64(0xcdbd98db5a9ce353), EConversationDebugInfo::Executing);
                G1R.AfterTalkingWithCorAngar();
                DC(int64(0xcdbd98db5a9ce353), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorRunes : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b316);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukor92243);
            default Rules.HideIfKnows(UChoiceBaallukorRunes);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OG_DOOR", 500.0f, int64(0x240796094918b316));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9a2b95494a17681e), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                    DB(int64(0x301b91369b530913), BaalLukor != nullptr && BaalLukor.IsCloseToCharacter(Hero, 500.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning())
                    return false;
                
                if (BaalLukor != nullptr && !BaalLukor.IsCloseToCharacter(Hero, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b31b), EConversationDebugInfo::Executing);
                // This is it. He's there, behind this door. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_RUNES_13_01"));
                DC(int64(0x240796094918b31b), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b31c), EConversationDebugInfo::Executing);
                
                // I don't feel anything. 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_RUNES_15_02"));
                DC(int64(0x240796094918b31c), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b31d), EConversationDebugInfo::Executing);
                
                // Of course you don't. It's ME he has chosen to discover ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_RUNES_13_03"));
                DC(int64(0x240796094918b31d), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0ec9b), EConversationDebugInfo::Executing);
                
                // How do we get through? Another key?
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_150211"));
                DC(int64(0xfd99951305c0ec9b), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b31e), EConversationDebugInfo::Executing);
                
                // Hmm ... no, this door is much weaker than the previous ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_RUNES_13_04"));
                DC(int64(0x240796094918b31e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_InvisiblePower);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_Focus);
                DC(int64(0x240796094918b31f), EConversationDebugInfo::Executing);
                BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_OpenFocusStoneDoor);
                DC(int64(0x240796094918b31f), EConversationDebugInfo::Done);
                DC(int64(0x40993ccb42646dfd), EConversationDebugInfo::Executing);
                BaalLukor.LeavePartyOf(Hero);
                DC(int64(0x40993ccb42646dfd), EConversationDebugInfo::Done);
                DC(int64(0xb24b4c3ebc09fe14), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb24b4c3ebc09fe14), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaallukorSecondwait : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2f7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorHelp);
            default Rules.HideIfKnows(UChoiceBaallukorSecondwait);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_OG_TUNNEL2", 900.0f, int64(0x240796094918b2f7));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_BAALLUKOR_SECONDSCROLL_15_01"), int64(0x240796094918b2f7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae73f906338c271d), G1R.BaalLukor_KeyPart02 == 0);
                }
                
                return G1R.BaalLukor_KeyPart02 == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2fb), EConversationDebugInfo::Executing);
                // Hmm ... that's a dead end. Let's look around - maybe we ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SECONDWAIT_13_01"));
                DC(int64(0x240796094918b2fb), EConversationDebugInfo::Done);
                DB(int64(0x240796094918b2fd), Hero != nullptr && !Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0));
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_OrcGraveyardPiece_02, 1, 0))
                {
                    DC(int64(0x240796094918b2fe), EConversationDebugInfo::Executing);
                    BaalLukor.ExchangeDailyRoutineToClass(UDailyRoutine_OG_GUR_BaalLukor_1211_Waitinsidetunneltwo);
                    DC(int64(0x240796094918b2fe), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baallukor_secondwait_exit_1");
                    DC(int64(0x240796094918b2ff), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x240796094918b2ff), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_baallukor_secondwait_exit_2");
                }
            }
        }
        
        
        class UChoiceBaallukorSummoning : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b2c8);
            default Caption = LocText("INFO_BAALLUKOR_SUMMONING_15_01");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaallukorMeet);
            default Rules.HideIfKnows(UChoiceBaallukorSummoning);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b2c9), EConversationDebugInfo::Executing);
                // Why did you run off during the summoning? 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_SUMMONING_15_01"));
                DC(int64(0x240796094918b2c9), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2cd), EConversationDebugInfo::Executing);
                
                // What do you think? Because the Sleeper told me to. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SUMMONING_13_05"));
                DC(int64(0x240796094918b2cd), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb2a), EConversationDebugInfo::Executing);
                
                // You mean he spoke to you?
                Hero.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_131810"));
                DC(int64(0xfd99951305c0eb2a), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb2b), EConversationDebugInfo::Executing);
                
                // Yes, and I hear him still. He told me the others aren't ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_131814"));
                DC(int64(0xfd99951305c0eb2b), EConversationDebugInfo::Done);
                DC(int64(0xfd99951305c0eb29), EConversationDebugInfo::Executing);
                // Then, he showed me the vision, that you saw too, and ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_YQBMRVC_20240430_131056"));
                DC(int64(0xfd99951305c0eb29), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b2ce), EConversationDebugInfo::Executing);
                // Do you understand what this means? The Sleeper is... ...
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_SUMMONING_13_06"));
                DC(int64(0x240796094918b2ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaallukorTeleport : UTopic_Hero__OG_GUR_BAALLUKOR_1211
        {
            default DebugId = int64(0x240796094918b348);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBaallukorTeleport);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"WP_OG_TOMB_ENTRANCE", 400.0f, int64(0x240796094918b348));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x240796094918b349), BaalLukor != nullptr && BaalLukor.CanSeeCharacter(Hero));
                    DB(int64(0x240796094918b34b), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                if (BaalLukor != nullptr && !BaalLukor.CanSeeCharacter(Hero))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x240796094918b350), EConversationDebugInfo::Executing);
                
                // What now? Looks like just another burial chamber to me. 
                Hero.AI.Say(LocText("INFO_BAALLUKOR_TELEPORT_15_02"));
                DC(int64(0x240796094918b350), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b352), EConversationDebugInfo::Executing);
                
                // I ... no. This is the place, he's telling me, even now. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_TELEPORT_13_04"));
                DC(int64(0x240796094918b352), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b353), EConversationDebugInfo::Executing);
                // Come, let's go further in. 
                BaalLukor.AI.Say(LocText("INFO_BAALLUKOR_HELP_13_03"));
                DC(int64(0x240796094918b353), EConversationDebugInfo::Done);
                DC(int64(0x240796094918b355), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x240796094918b355), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */