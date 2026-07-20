#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NYRAS_1303 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NYRAS_1303";
        }
        
        
        class UTopic_Hero__SC_NOV_NYRAS_1303 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NYRAS_1303";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNyras() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNov1303NyrasGreet : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x1fbd4a530643dc46);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceNov1303NyrasGreet);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_STORY_APPROACH_NYRAS_FOCUS", 1000.0f, int64(0x1fbd4a530643dc46));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1fbd4a530643dc47), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x29133d81b9176c02), G1R.AfterCinematic_Nyras == 1);
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (G1R.AfterCinematic_Nyras != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc48), EConversationDebugInfo::Executing);
                // He ... he spoke to me.
                Nyras.AI.Say(LocText("NOV_1303_NYRAS_GREET_INFO_03_00"));
                DC(int64(0x1fbd4a530643dc48), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Crazy);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_NyrasCrazy);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction);
                Subdialog(
                    UTopic_Nyras_90138,
                    UTopic_Nyras_90158
                );
                DB(int64(0x20cea06813c704cd), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x20cea06813c704cf), EConversationDebugInfo::Executing);
                    // I mean, you've only just joined us, and now YOU get the ...
                    Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201859_686"));
                    DC(int64(0x20cea06813c704cf), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x20cea06813c704d1), EConversationDebugInfo::Executing);
                    // I mean, you're not even part of our Brotherhood!
                    Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201902_2386"));
                    DC(int64(0x20cea06813c704d1), EConversationDebugInfo::Done);
                    DC(int64(0x5dcd7126285f597), EConversationDebugInfo::Executing);
                    // You're an unbeliever, and now YOU should get the honor ...
                    Nyras.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_151316"));
                    DC(int64(0x5dcd7126285f597), EConversationDebugInfo::Done);
                }
                DC(int64(0x20cea06813c704d3), EConversationDebugInfo::Executing);
                // No. No, this isn't right, this isn't fair. I'm the most ...
                Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_202037_3984"));
                DC(int64(0x20cea06813c704d3), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704e7), EConversationDebugInfo::Executing);
                
                // You can't be serious ...
                Hero.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_203227"));
                DC(int64(0x20cea06813c704e7), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704e8), EConversationDebugInfo::Executing);
                
                // IT SHOULD BE ME!
                Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_203247"));
                DC(int64(0x20cea06813c704e8), EConversationDebugInfo::Done);
                DC(int64(0x1f3d20e544aef542), EConversationDebugInfo::Executing);
                Nyras.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_UntilDefeated);
                DC(int64(0x1f3d20e544aef542), EConversationDebugInfo::Done);
                DC(int64(0xba8443f1d174eedc), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP.SucceedQuest();
                DC(int64(0xba8443f1d174eedc), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc53), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1fbd4a530643dc53), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Nyras_90138 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x20cea06813c704c0);
            default Caption = LocText("TEXT_WIP_JVXAWSC_20240411_201253_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_90138);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x20cea06813c704c1), EConversationDebugInfo::Executing);
                // Are you okay?
                Hero.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201253_1924"));
                DC(int64(0x20cea06813c704c1), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704cb), EConversationDebugInfo::Executing);
                
                // What? Oh, yes, I ... I am. 
                Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201703"));
                DC(int64(0x20cea06813c704cb), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f595), EConversationDebugInfo::Executing);
                
                // Then give me the focus stone. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_151132"));
                DC(int64(0x5dcd7126285f595), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f596), EConversationDebugInfo::Executing);
                
                // To you? No. No, I won't. 
                Nyras.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_151137"));
                DC(int64(0x5dcd7126285f596), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nyras_90158 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x20cea06813c704c4);
            default Caption = LocText("TEXT_WIP_JVXAWSC_20240411_201253_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_90158);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x20cea06813c704c5), EConversationDebugInfo::Executing);
                
                // Give me the focus, Nyras.
                Hero.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201253_3436"));
                DC(int64(0x20cea06813c704c5), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704ca), EConversationDebugInfo::Executing);
                
                // What? No ... no. Not to you. 
                Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_201356"));
                DC(int64(0x20cea06813c704ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras110997 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x162ad6fd32a9dafd);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_180324");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNyras110997);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x162ad6fd32a9db00), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x162ad6fd32a9dafb), EConversationDebugInfo::Executing);
                
                // How are you holding up?
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180324"));
                DC(int64(0x162ad6fd32a9dafb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_CampDivided);
                DB(int64(0x162ad6fd32a9db02), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_151535")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_151535")))
                {
                    DC(int64(0x162ad6fd32a9db05), EConversationDebugInfo::Executing);
                    // I don't think it's wise for us to speak. 
                    Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180519"));
                    DC(int64(0x162ad6fd32a9db05), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db4c), EConversationDebugInfo::Executing);
                    
                    // Why?
                    Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_181042"));
                    DC(int64(0x162ad6fd32a9db4c), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db4d), EConversationDebugInfo::Executing);
                    
                    // Because you are not a true believer - it's like Master ...
                    Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_181043"));
                    DC(int64(0x162ad6fd32a9db4d), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db4e), EConversationDebugInfo::Executing);
                    // It's better you stay away for now. 
                    Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_181059"));
                    DC(int64(0x162ad6fd32a9db4e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_nyras_110997_exit_1");
                }
                else
                {
                    DC(int64(0x162ad6fd32a9db03), EConversationDebugInfo::Executing);
                    // Kind of you to ask. 
                    Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180517"));
                    DC(int64(0x162ad6fd32a9db03), EConversationDebugInfo::Done);
                    DB(int64(0x162ad6fd32a9db0a), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_150328")));
                    
                    if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_EETMBHG_20241011_150328")))
                    {
                        DC(int64(0x162ad6fd32a9db0c), EConversationDebugInfo::Executing);
                        // Frankly, I'm ... confused. I don't know what to make of ...
                        Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180752_2995"));
                        DC(int64(0x162ad6fd32a9db0c), EConversationDebugInfo::Done);
                        DC(int64(0x162ad6fd32a9db48), EConversationDebugInfo::Executing);
                        // Y'Berion was a faithful servant of the Sleeper, so why ...
                        Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180935"));
                        DC(int64(0x162ad6fd32a9db48), EConversationDebugInfo::Done);
                        DC(int64(0x162ad6fd32a9db49), EConversationDebugInfo::Executing);
                        // Ah, well, let me not bother you with this. You did all ...
                        Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180958"));
                        DC(int64(0x162ad6fd32a9db49), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_nyras_110997_exit_2");
                    }
                    else
                    {
                        DC(int64(0x162ad6fd32a9db10), EConversationDebugInfo::Executing);
                        // I'm well. I'm still sorry for what happened at the focus ...
                        Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180758_3750"));
                        DC(int64(0x162ad6fd32a9db10), EConversationDebugInfo::Done);
                        DC(int64(0x162ad6fd32a9db14), EConversationDebugInfo::Executing);
                        // But thanks to you, the Great Awakening is almost ready. ...
                        Nyras.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_180820"));
                        DC(int64(0x162ad6fd32a9db14), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_nyras_110997_exit_3");
                    }
                }
            }
        }
        
        
        class UChoiceNyras144390_0 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0xcf6cde32246c7d37);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceNyras144390);
            
            default Rules.HideIfKnows(UChoiceNyras144390_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_OreBaron);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7d33), EConversationDebugInfo::Executing);
                // Was that ... was that all of them?
                Nyras.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_132121_1869"));
                DC(int64(0xcf6cde32246c7d33), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras144390_1 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNyras144390_0);
            default Rules.HideIfKnows(UChoiceNyras144390_1);
            default DebugId = int64(0xcf6cde32246c7d37);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7d4c), EConversationDebugInfo::Executing);
                
                // Yeah.
                Hero.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_132218"));
                DC(int64(0xcf6cde32246c7d4c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras144390_2 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNyras144390_1);
            default Rules.HideIfKnows(UChoiceNyras144390_2);
            default DebugId = int64(0xcf6cde32246c7d37);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7d4d), EConversationDebugInfo::Executing);
                
                // What now? The barrier is still there.
                Nyras.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_132223"));
                DC(int64(0xcf6cde32246c7d4d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras144390 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNyras144390_2);
            default Rules.HideIfKnows(UChoiceNyras144390);
            default DebugId = int64(0xcf6cde32246c7d37);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7d4e), EConversationDebugInfo::Executing);
                
                // I'm not sure.
                Hero.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_132232"));
                DC(int64(0xcf6cde32246c7d4e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras85959 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x997aafb17da4a187);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceNyras85959);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x997aafb17da4a18a), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0xe254bbcb8b4c984f), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x997aafb17da4a186), EConversationDebugInfo::Executing);
                
                // Yes?
                Nyras.AI.Say(LocText("TEXT_WIP_ISIOAHF_20240320_145233_41"));
                DC(int64(0x997aafb17da4a186), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Fanatic);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_NyrasGuide);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_FocusLocation);
                DB(int64(0x9c7ad88e45e2dbc6), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111711")));
                DB(int64(0xe254bbcb8b4c9858), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111922")));
                DB(int64(0x9c7ad88e45e2dbce), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111711")));
                DB(int64(0xe254bbcb8b4c9865), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xe254bbcb8b4c9861), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111922")));
                DB(int64(0xe254bbcb8b4c9866), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if ((Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111711"))) || (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111922"))))
                {
                    DC(int64(0x9c7ad88e45e2dbc8), EConversationDebugInfo::Executing);
                    // Oh, it's you. Did you end up finding Caine? I've heard ...
                    Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193440_94"));
                    DC(int64(0x9c7ad88e45e2dbc8), EConversationDebugInfo::Done);
                }
                else if (((Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111711")) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))) || ((Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_111922")) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))))
                {
                    DC(int64(0x9c7ad88e45e2dbca), EConversationDebugInfo::Executing);
                    // Wait, aren't you that new novice who went looking for ...
                    Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193650_1037"));
                    DC(int64(0x9c7ad88e45e2dbca), EConversationDebugInfo::Done);
                    DC(int64(0x9c7ad88e45e2dbd9), EConversationDebugInfo::Executing);
                    // Lester told me about it. Did you find him? I've heard ...
                    Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193837_3334"));
                    DC(int64(0x9c7ad88e45e2dbd9), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9c7ad88e45e2dbd4), EConversationDebugInfo::Executing);
                    // Wait, aren't you the outsider who went looking for Caine ...
                    Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193756_2332"));
                    DC(int64(0x9c7ad88e45e2dbd4), EConversationDebugInfo::Done);
                    DC(int64(0x9c7ad88e45e2dbd9), EConversationDebugInfo::Executing);
                    // Lester told me about it. Did you find him? I've heard ...
                    Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193837_3334"));
                    DC(int64(0x9c7ad88e45e2dbd9), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Nyras_950251,
                    UTopic_Nyras_950451
                );
                DC(int64(0x9c7ad88e45e2dbec), EConversationDebugInfo::Executing);
                // YOU spoke to Y'Berion? That's ... incredible. What was ...
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_195017"));
                DC(int64(0x9c7ad88e45e2dbec), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbed), EConversationDebugInfo::Executing);
                
                // No offense, but can we do this later? 
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_195017_2483"));
                DC(int64(0x9c7ad88e45e2dbed), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbee), EConversationDebugInfo::Executing);
                
                // ... Of course. But - ah, nevermind. If Y'Berion wills ...
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_195034"));
                DC(int64(0x9c7ad88e45e2dbee), EConversationDebugInfo::Done);
                DC(int64(0x997aafb17da4a18e), EConversationDebugInfo::Executing);
                
                // Where is that focus stone? 
                Hero.AI.Say(LocText("TEXT_WIP_ISIOAHF_20240320_145607_2238"));
                DC(int64(0x997aafb17da4a18e), EConversationDebugInfo::Done);
                DC(int64(0x997aafb17da4a195), EConversationDebugInfo::Executing);
                
                // Not far - just out of the camp, up by the north cliff. ...
                Nyras.AI.Say(LocText("TEXT_WIP_ISIOAHF_20240320_145630"));
                DC(int64(0x997aafb17da4a195), EConversationDebugInfo::Done);
                DC(int64(0xa9075e981a8203ed), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItWr_Map_Cliff, 1);
                DC(int64(0xa9075e981a8203ed), EConversationDebugInfo::Done);
                DC(int64(0xba8443f1d174eed3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP.StartQuest();
                DC(int64(0xba8443f1d174eed3), EConversationDebugInfo::Done);
                DC(int64(0x997aafb17da4a192), EConversationDebugInfo::Executing);
                // Then let's go.
                Hero.AI.Say(LocText("TEXT_WIP_ISIOAHF_20240320_145607_2785"));
                DC(int64(0x997aafb17da4a192), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbf0), EConversationDebugInfo::Executing);
                
                // Very well. Come, let's go.
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_195502"));
                DC(int64(0x9c7ad88e45e2dbf0), EConversationDebugInfo::Done);
                DC(int64(0x997aafb17da4a197), EConversationDebugInfo::Executing);
                Nyras.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_Guide);
                DC(int64(0x997aafb17da4a197), EConversationDebugInfo::Done);
                DC(int64(0x1b2ade3c63ae7cbe), EConversationDebugInfo::Executing);
                Nyras.JoinPartyOf(Hero);
                DC(int64(0x1b2ade3c63ae7cbe), EConversationDebugInfo::Done);
                DC(int64(0x997aafb17da4a198), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x997aafb17da4a198), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Nyras_950251 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x9c7ad88e45e2dbe0);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_193852_3511");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_950251);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2dbe1), EConversationDebugInfo::Executing);
                // Don't ask. Y'Berion sent me to find you, though. ...
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193852_3511"));
                DC(int64(0x9c7ad88e45e2dbe1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nyras_950451 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x9c7ad88e45e2dbe4);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_193852_1246");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_950451);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2dbe5), EConversationDebugInfo::Executing);
                // Caine's dead.
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_193852_1246"));
                DC(int64(0x9c7ad88e45e2dbe5), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbe9), EConversationDebugInfo::Executing);
                
                // D-dead? How?
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_194202"));
                DC(int64(0x9c7ad88e45e2dbe9), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704d6), EConversationDebugInfo::Executing);
                
                // It's a long story. But now Y'Berion wants you to show me ...
                Hero.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_202436"));
                DC(int64(0x20cea06813c704d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyras86006 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0xdc24fe363c0a9c01);
            default Caption = LocText("TEXT_WIP_MWAGUXL_20240319_111711");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNyras86006);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9c04), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0x188124b8621e6b7e), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc24fe363c0a9bff), EConversationDebugInfo::Executing);
                // You're a novice, right? Do you know where Caine lives?
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_111711"));
                DC(int64(0xdc24fe363c0a9bff), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3ab3), EConversationDebugInfo::Executing);
                
                // Kalom's apprentice? I'm not sure - but I think it's one ...
                Nyras.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_192749"));
                DC(int64(0xa3421f1016cb3ab3), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3ab4), EConversationDebugInfo::Executing);
                
                // He didn't show at Kalom's lab this morning. 
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_192952"));
                DC(int64(0xa3421f1016cb3ab4), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3ab5), EConversationDebugInfo::Executing);
                
                // And now you're looking for him? Interesting. I hope you ...
                Nyras.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_192954"));
                DC(int64(0xa3421f1016cb3ab5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction);
                DC(int64(0xdc24fe363c0a9c0c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc24fe363c0a9c0c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNyras86073 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0xdc24fe363c0a9c07);
            default Caption = LocText("TEXT_WIP_MWAGUXL_20240319_111922");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNyras86073);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9c0a), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0xdc24fe363c0a9c0b), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc24fe363c0a9c05), EConversationDebugInfo::Executing);
                // I found this drawing in Caine's hut. Any idea what it ...
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_111922"));
                DC(int64(0xdc24fe363c0a9c05), EConversationDebugInfo::Done);
                DC(int64(0xdc24fe363c0a9c06), EConversationDebugInfo::Executing);
                
                // Hmm ... looks like a mine to me? I don't know. You ...
                Nyras.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_111922_3436"));
                DC(int64(0xdc24fe363c0a9c06), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f44), EConversationDebugInfo::Executing);
                
                // Who? 
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_004352"));
                DC(int64(0xac160bfd93ad0f44), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f45), EConversationDebugInfo::Executing);
                
                // Try Lester. Not the most faithful of us, but he knows ...
                Nyras.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_004403"));
                DC(int64(0xac160bfd93ad0f45), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction);
                DC(int64(0xdc24fe363c0a9c0d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc24fe363c0a9c0d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNyras86233 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x1f3d20e544aef545);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceNyras86233);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_NYRAS_1303", n"FP_NYRAS_FOCUS", 2000.0f, int64(0x1f3d20e544aef545));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JVXAWSC_20240411_203247"), int64(0x1f3d20e544aef545));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f3d20e544aef548), Hero != nullptr && Hero.HasRecentlyDefeated(Nyras));
                    DB(int64(0xe254bbcb8b4c987b), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Nyras))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f3d20e544aef544), EConversationDebugInfo::Executing);
                // By the Sleeper. What ... what happened? It's all so ... ...
                Nyras.AI.Say(LocText("TEXT_WIP_GSIOAHF_20240322_150449_41"));
                DC(int64(0x1f3d20e544aef544), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Forgive);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_NyrasForgive);
                Subdialog(
                    UTopic_Nyras_96583,
                    UTopic_Nyras_96603
                );
                DC(int64(0x9c7ad88e45e2dc00), EConversationDebugInfo::Executing);
                // You took the focus, and went on about how you should be ...
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214457"));
                DC(int64(0x9c7ad88e45e2dc00), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc01), EConversationDebugInfo::Executing);
                
                // I ... by the Sleeper, I don't know what to say. I'm so ...
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214457_1723"));
                DC(int64(0x9c7ad88e45e2dc01), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc03), EConversationDebugInfo::Executing);
                // But it worked. Right? We destroyed the barrier. I still ...
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214646"));
                DC(int64(0x9c7ad88e45e2dc03), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc04), EConversationDebugInfo::Executing);
                // You should bring him the focus as soon as possible. With ...
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_215119"));
                DC(int64(0x9c7ad88e45e2dc04), EConversationDebugInfo::Done);
                DC(int64(0x20cea06813c704e9), EConversationDebugInfo::Executing);
                // I'll see you at the camp, all right? I need to clear my ...
                Nyras.AI.Say(LocText("TEXT_WIP_JVXAWSC_20240411_203719"));
                DC(int64(0x20cea06813c704e9), EConversationDebugInfo::Done);
                DB(int64(0xe254bbcb8b4c9881), Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                {
                    DC(int64(0x4cb733c658593652), EConversationDebugInfo::Executing);
                    Nyras.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_Start);
                    DC(int64(0x4cb733c658593652), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    Nyras.AddItemToInventory(UItMs_Focus_01, 1);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0x1f3d20e544aef54c), EConversationDebugInfo::Executing);
                    Nyras.AI.GiveItemTo(Hero, UItMs_Focus_01, 1);
                    DC(int64(0x1f3d20e544aef54c), EConversationDebugInfo::Done);
                    DC(int64(0x1f3d20e544aef54f), EConversationDebugInfo::Executing);
                    Nyras.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_Start);
                    DC(int64(0x1f3d20e544aef54f), EConversationDebugInfo::Done);
                }
                DC(int64(0x1f3d20e544aef54d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f3d20e544aef54d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Nyras_96583 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x9c7ad88e45e2dbf2);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_214132_3346");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_96583);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2dbf3), EConversationDebugInfo::Executing);
                // You don't remember?
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214132_3346"));
                DC(int64(0x9c7ad88e45e2dbf3), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbfe), EConversationDebugInfo::Executing);
                
                // Remember what? What do you mean?
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214240"));
                DC(int64(0x9c7ad88e45e2dbfe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Nyras_96603 : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x9c7ad88e45e2dbf6);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_214132_3528");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Nyras_96603);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2dbf7), EConversationDebugInfo::Executing);
                
                // You attacked me.
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214132_3528"));
                DC(int64(0x9c7ad88e45e2dbf7), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbff), EConversationDebugInfo::Executing);
                
                // Wh-what? 
                Nyras.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_214323"));
                DC(int64(0x9c7ad88e45e2dbff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyrasExit : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x1fbd4a530643dc2f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc30), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1fbd4a530643dc30), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNyrasHallo : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x1fbd4a530643dc31);
            default Caption = LocText("DIA_NYRAS_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceNyrasHallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1fbd4a530643dc32), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc33), EConversationDebugInfo::Executing);
                // Hi - I'm new here.
                Hero.AI.Say(LocText("DIA_NYRAS_HALLO_15_00"));
                DC(int64(0x1fbd4a530643dc33), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc34), EConversationDebugInfo::Executing);
                
                // Always a joy to see a lost soul saved by the Sleeper's ...
                Nyras.AI.Say(LocText("DIA_NYRAS_HALLO_03_01"));
                DC(int64(0x1fbd4a530643dc34), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Introduction);
            }
        }
        
        
        class UChoiceNyrasOrt : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0x1fbd4a530643dc35);
            default Caption = LocText("DIA_NYRAS_ORT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNyrasHallo);
            default Rules.HideIfKnows(UChoiceNyrasOrt);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1fbd4a530643dc36), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc37), EConversationDebugInfo::Executing);
                // What can you tell me about this place?
                Hero.AI.Say(LocText("DIA_NYRAS_ORT_15_00"));
                DC(int64(0x1fbd4a530643dc37), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc38), EConversationDebugInfo::Executing);
                
                // About the camp, you mean? Don't cross the gurus - they ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_03_01"));
                DC(int64(0x1fbd4a530643dc38), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc39), EConversationDebugInfo::Executing);
                // It's a true privilege - Y'Berion is far too weary from ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_03_02"));
                DC(int64(0x1fbd4a530643dc39), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc3a), EConversationDebugInfo::Executing);
                // Though he sometimes does give sermons on Temple Square. ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_03_03"));
                DC(int64(0x1fbd4a530643dc3a), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceNyrasOrtHoly,
                    UChoiceNyrasOrtCasual
                );
            }
        }
        
        
        class UChoiceNyrasOrtHoly : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0xe8603e87342bfa1b);
            default Caption = LocText("DIA_NYRAS_ORT_HOLY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc3d), EConversationDebugInfo::Executing);
                // What does the Sleeper tell Y'Berion in these holy ...
                Hero.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_15_00"));
                DC(int64(0x1fbd4a530643dc3d), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc3e), EConversationDebugInfo::Executing);
                
                // Oh, it's abstract for the most part - pictures, ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_03_01"));
                DC(int64(0x1fbd4a530643dc3e), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc3f), EConversationDebugInfo::Executing);
                // But that is why he and the gurus have been preparing the ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_03_02"));
                DC(int64(0x1fbd4a530643dc3f), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc40), EConversationDebugInfo::Executing);
                // And that is when he will finally show us the path to ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_03_03"));
                DC(int64(0x1fbd4a530643dc40), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc41), EConversationDebugInfo::Executing);
                // Cor Kalom, our chief alchemist, has prepared an elixir ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_03_04"));
                DC(int64(0x1fbd4a530643dc41), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc42), EConversationDebugInfo::Executing);
                // That state, as well as dreams, are the only way to ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_HOLY_03_05"));
                DC(int64(0x1fbd4a530643dc42), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dbeb), EConversationDebugInfo::Executing);
                
                // I see. 
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_194517"));
                DC(int64(0x9c7ad88e45e2dbeb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNyrasOrtCasual : UTopic_Hero__SC_NOV_NYRAS_1303
        {
            default DebugId = int64(0xe8603e87342bfa23);
            default Caption = LocText("DIA_NYRAS_ORT_CASUAL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1fbd4a530643dc44), EConversationDebugInfo::Executing);
                // What does the Sleeper tell you?
                Hero.AI.Say(LocText("DIA_NYRAS_ORT_CASUAL_15_00"));
                DC(int64(0x1fbd4a530643dc44), EConversationDebugInfo::Done);
                DC(int64(0x1fbd4a530643dc45), EConversationDebugInfo::Executing);
                
                // It's hard to grasp unless you've experienced it, too. ...
                Nyras.AI.Say(LocText("DIA_NYRAS_ORT_CASUAL_03_01"));
                DC(int64(0x1fbd4a530643dc45), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */