#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_VLK_MELVIN_582 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_VLK_MELVIN_582";
        }
        
        
        class UTopic_Hero__SC_VLK_MELVIN_582 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_VLK_MELVIN_582";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMelvin() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMelvin105981 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x939200c25ea5835d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_SC_LISTEN_07", 200.0f, int64(0x939200c25ea5835d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2ac4582ce19d5c3), Hero != nullptr && Hero.IsCloseToCharacter(Melvin, 800.0f));
                    DB(int64(0x939200c25ea58360), G1R.Melvin_Meditating.IsValid() && G1R.Melvin_Meditating.IsMoreThanXMinutesAgo(60));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Melvin, 800.0f))
                    return false;
                
                if (G1R.Melvin_Meditating.IsValid() && !G1R.Melvin_Meditating.IsMoreThanXMinutesAgo(60))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x939200c25ea58362), G1R.Melvin_Preaching == 0);
                DB(int64(0x939200c25ea58363), G1R.Melvin_Preaching == 1);
                
                if (G1R.Melvin_Preaching == 0)
                {
                    DC(int64(0x939200c25ea58365), EConversationDebugInfo::Executing);
                    // Oh, Sleeper, I exist to serve you. May you awaken.
                    Melvin.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_165111_2238"));
                    DC(int64(0x939200c25ea58365), EConversationDebugInfo::Done);
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Executing);
                    G1R.Melvin_Preaching += 1;
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Done);
                }
                else if (G1R.Melvin_Preaching == 1)
                {
                    DC(int64(0x939200c25ea58367), EConversationDebugInfo::Executing);
                    // Oh, Sleeper, keep my spirit pure. May you awaken.
                    Melvin.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_165123_1924"));
                    DC(int64(0x939200c25ea58367), EConversationDebugInfo::Done);
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Executing);
                    G1R.Melvin_Preaching += 1;
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x939200c25ea5836b), EConversationDebugInfo::Executing);
                    // Oh, Sleeper, my flesh is yours. May you awaken.
                    Melvin.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_165136_2785"));
                    DC(int64(0x939200c25ea5836b), EConversationDebugInfo::Done);
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Executing);
                    G1R.Melvin_Preaching = 0;
                    DC(int64(0x939200c25ea58370), EConversationDebugInfo::Done);
                }
                DC(int64(0x939200c25ea58385), EConversationDebugInfo::Executing);
                G1R.Melvin_Meditating = FInGameTime::Now();
                DC(int64(0x939200c25ea58385), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMelvin108345 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f48);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceMelvin108345);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa46e7634d49bce49), Melvin != nullptr && Melvin.HasAssignedDailyRoutine(UDailyRoutine_SC_VLK_Melvin_582_Confrontation));
                }
                
                return Melvin != nullptr && Melvin.HasAssignedDailyRoutine(UDailyRoutine_SC_VLK_Melvin_582_Confrontation);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f47), EConversationDebugInfo::Executing);
                // And back he comes. Just as Master Kalom foretold. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_220126_3286"));
                DC(int64(0xc13a8675c0b16f47), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_VLK_MELVIN, Document::UDocumentSegment_Glossary_SC_VLK_MELVIN_SleeperTemple);
                DB(int64(0x6c4519adbe1dd4b0), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_NISEA_20240206_182744")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_NISEA_20240206_182744")))
                {
                    DB(int64(0xc13a8675c0b16f4b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xc13a8675c0b16f4f), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0xc13a8675c0b16f52), EConversationDebugInfo::Executing);
                        // Wait. You're Melvin, aren't you?
                        Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221250"));
                        DC(int64(0xc13a8675c0b16f52), EConversationDebugInfo::Done);
                        DC(int64(0xc13a8675c0b16f53), EConversationDebugInfo::Executing);
                        
                        // How kind of you to remember me.
                        Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221250_3984"));
                        DC(int64(0xc13a8675c0b16f53), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0xc13a8675c0b16f4c), EConversationDebugInfo::Executing);
                        
                        // Wait. Aren't you that digger who ran off to the Swamp ...
                        Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221142"));
                        DC(int64(0xc13a8675c0b16f4c), EConversationDebugInfo::Done);
                        DC(int64(0xc13a8675c0b16f57), EConversationDebugInfo::Executing);
                        // Melvin?
                        Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221533"));
                        DC(int64(0xc13a8675c0b16f57), EConversationDebugInfo::Done);
                        DC(int64(0xc13a8675c0b16f56), EConversationDebugInfo::Executing);
                        
                        // How kind of you to remember me.
                        Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221530"));
                        DC(int64(0xc13a8675c0b16f56), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xc13a8675c0b16f58), EConversationDebugInfo::Executing);
                        
                        // And who are you?
                        Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221554"));
                        DC(int64(0xc13a8675c0b16f58), EConversationDebugInfo::Done);
                        DC(int64(0xc13a8675c0b16f59), EConversationDebugInfo::Executing);
                        
                        // (scoffs) Not too long ago, they called me Melvin.
                        Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221554_1609"));
                        DC(int64(0xc13a8675c0b16f59), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xc13a8675c0b16f5e), EConversationDebugInfo::Executing);
                    // But the age of names is in the past. The Sleeper is ...
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221640_3569"));
                    DC(int64(0xc13a8675c0b16f5e), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16f64), EConversationDebugInfo::Executing);
                    // The era of the chosen.
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221720"));
                    DC(int64(0xc13a8675c0b16f64), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Melvin_1090832,
                        UTopic_Melvin_1091032,
                        UTopic_Melvin_1093672
                    );
                    DC(int64(0xc13a8675c0b16f76), EConversationDebugInfo::Executing);
                    // You really think this little magic knife o' yours is ...
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222029_2995"));
                    DC(int64(0xc13a8675c0b16f76), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16f77), EConversationDebugInfo::Executing);
                    // The Sleeper CHOSE us. And in doin' so, gave us power ...
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222057"));
                    DC(int64(0xc13a8675c0b16f77), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16f78), EConversationDebugInfo::Executing);
                    // But let's skip the banter. If it were up to me, I'd have ...
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222114"));
                    DC(int64(0xc13a8675c0b16f78), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16f79), EConversationDebugInfo::Executing);
                    // "REPENT. Admit you were wrong, and accept our lord, the ...
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222208"));
                    DC(int64(0xc13a8675c0b16f79), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16f7a), EConversationDebugInfo::Executing);
                    // Then, and only then, will you be spared. 
                    Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222243"));
                    DC(int64(0xc13a8675c0b16f7a), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Melvin_1103252,
                        UTopic_Melvin_1103452,
                        UTopic_Melvin_1103672,
                        UTopic_Melvin_1111452
                    );
                }
                else
                {
                    DC(int64(0xa2e8be856cfc81ca), EConversationDebugInfo::Executing);
                    Melvin.AI.StartAttackingImmediately(Hero);
                    DC(int64(0xa2e8be856cfc81ca), EConversationDebugInfo::Done);
                    DC(int64(0xa2e8be856cfc81cc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa2e8be856cfc81cc), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Melvin_1090832 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f66);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_221729_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1090832);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f67), EConversationDebugInfo::Executing);
                // Get out of my way.
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221729_2801"));
                DC(int64(0xc13a8675c0b16f67), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f72), EConversationDebugInfo::Executing);
                
                // Look at him. So confident. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221949"));
                DC(int64(0xc13a8675c0b16f72), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1091032 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f6a);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_221729_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1091032);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f6b), EConversationDebugInfo::Executing);
                
                // Is this the part where you wax on about your god and the ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221729_1769"));
                DC(int64(0xc13a8675c0b16f6b), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f73), EConversationDebugInfo::Executing);
                
                // Funny.
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222003"));
                DC(int64(0xc13a8675c0b16f73), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1093672 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f6e);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_221904_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1093672);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f6f), EConversationDebugInfo::Executing);
                
                // You're making a mistake. The Sleeper will kill everyone, ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_221904_491"));
                DC(int64(0xc13a8675c0b16f6f), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f74), EConversationDebugInfo::Executing);
                
                // Of course you would say that. Because you weren't ...
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222008"));
                DC(int64(0xc13a8675c0b16f74), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1103252 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f7c);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_222257_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1103252);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f7d), EConversationDebugInfo::Executing);
                
                // Where is Cor Kalom?
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222257_3750"));
                DC(int64(0xc13a8675c0b16f7d), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f88), EConversationDebugInfo::Executing);
                
                // Where do you think?
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222319"));
                DC(int64(0xc13a8675c0b16f88), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f89), EConversationDebugInfo::Executing);
                
                // It's happening, isn't it? They're waking him up. 
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222322"));
                DC(int64(0xc13a8675c0b16f89), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f8a), EConversationDebugInfo::Executing);
                
                // The last sacrifice, yes. Your struggle was pointless, ...
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222344"));
                DC(int64(0xc13a8675c0b16f8a), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f7f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc13a8675c0b16f7f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1103452 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f80);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_222257_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1103452);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc13a8675c0b16f8f), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded());
                }
                
                return Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f81), EConversationDebugInfo::Executing);
                // Why didn't the orcs try to stop you?
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222257_1340"));
                DC(int64(0xc13a8675c0b16f81), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f8b), EConversationDebugInfo::Executing);
                
                // If you have to ask that, you're even dafter than you ...
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222410"));
                DC(int64(0xc13a8675c0b16f8b), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f8c), EConversationDebugInfo::Executing);
                // They serve the Sleeper, as do we! And when HE chose us ...
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222425"));
                DC(int64(0xc13a8675c0b16f8c), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f8d), EConversationDebugInfo::Executing);
                
                // ... And here I went through all that trouble to get into ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222502"));
                DC(int64(0xc13a8675c0b16f8d), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f90), EConversationDebugInfo::Executing);
                
                // What was that?
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222603"));
                DC(int64(0xc13a8675c0b16f90), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f91), EConversationDebugInfo::Executing);
                
                // Nothing. 
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222606"));
                DC(int64(0xc13a8675c0b16f91), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f83), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc13a8675c0b16f83), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1103672 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f84);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_222303_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1103672);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f85), EConversationDebugInfo::Executing);
                // You're not half as intimidating as you think.
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222303_3719"));
                DC(int64(0xc13a8675c0b16f85), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f96), EConversationDebugInfo::Executing);
                
                // Looks can be deceivin'.
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222646"));
                DC(int64(0xc13a8675c0b16f96), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16fab), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc13a8675c0b16fab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1111452 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f92);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_222624_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1111452);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f93), EConversationDebugInfo::Executing);
                // Tell Cor Kalom ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_222624_2316"));
                DC(int64(0xc13a8675c0b16f93), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Melvin_1114312,
                    UTopic_Melvin_1114512,
                    UTopic_Melvin_1114732
                );
                DC(int64(0xc13a8675c0b16fae), EConversationDebugInfo::Executing);
                // Thing is, I ain't gonna tell Kalom nothin'. I just ...
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_225138_1037"));
                DC(int64(0xc13a8675c0b16fae), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16faf), EConversationDebugInfo::Executing);
                // Now I can finally cut your head off. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_225240"));
                DC(int64(0xc13a8675c0b16faf), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f99), EConversationDebugInfo::Executing);
                Melvin.AI.StartAttackingImmediately(Hero);
                DC(int64(0xc13a8675c0b16f99), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1114312 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f9b);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_223338_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1114312);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16f9c), EConversationDebugInfo::Executing);
                // ... that I'm going to kick his ass back to whatever hole ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_223338_3902"));
                DC(int64(0xc13a8675c0b16f9c), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16fa9), EConversationDebugInfo::Executing);
                
                // How fearsome. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_224047"));
                DC(int64(0xc13a8675c0b16fa9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1114512 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16f9f);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_223338_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1114512);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16fa0), EConversationDebugInfo::Executing);
                
                // ... that he should have killed me when he had the ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_223338_292"));
                DC(int64(0xc13a8675c0b16fa0), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16fa7), EConversationDebugInfo::Executing);
                
                // Ah. Charmin'. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_223718"));
                DC(int64(0xc13a8675c0b16fa7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_1114732 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xc13a8675c0b16fa3);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_223344_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_1114732);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16fa4), EConversationDebugInfo::Executing);
                
                // ... that he better hurry up with that ritual because I'm ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_223344_94"));
                DC(int64(0xc13a8675c0b16fa4), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16fac), EConversationDebugInfo::Executing);
                
                // Uh. I'm shakin' in me boots. 
                Melvin.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_225111"));
                DC(int64(0xc13a8675c0b16fac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMelvin226332 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0xa273d651a4b7be4b);
            default Caption = LocText("TEXT_NISEA_20240206_183518_1924");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMelvinHello);
            default Rules.HideIfKnows(UChoiceMelvin226332);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6e79dfa677596d6c), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa273d651a4b7be49), EConversationDebugInfo::Executing);
                
                // Baal Tondral told me to find a new recruit, and that the ...
                Hero.AI.Say(LocText("TEXT_NISEA_20240206_183518_1924"));
                DC(int64(0xa273d651a4b7be49), EConversationDebugInfo::Done);
                DC(int64(0xa273d651a4b7be4a), EConversationDebugInfo::Executing);
                
                // Oh? Yeah, I can - Dusty. He actually meant to come with ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183610"));
                DC(int64(0xa273d651a4b7be4a), EConversationDebugInfo::Done);
                DC(int64(0xa273d651a4b7be4d), EConversationDebugInfo::Executing);
                // I figured it's better that way, cause the Sleeper ain't ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183632"));
                DC(int64(0xa273d651a4b7be4d), EConversationDebugInfo::Done);
                DC(int64(0xa273d651a4b7be4e), EConversationDebugInfo::Executing);
                // I say, try your luck. Any soul we can save is a victory. 
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183707"));
                DC(int64(0xa273d651a4b7be4e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_MelvinStart);
                DC(int64(0x1c2195c1a25579eb), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY.StartQuest();
                DC(int64(0x1c2195c1a25579eb), EConversationDebugInfo::Done);
                DC(int64(0x1c2195c1a2557af1), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE.SucceedQuest();
                DC(int64(0x1c2195c1a2557af1), EConversationDebugInfo::Done);
                DC(int64(0x4ab58a13307115a3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN.SucceedQuest();
                DC(int64(0x4ab58a13307115a3), EConversationDebugInfo::Done);
                DC(int64(0x6e79dfa677596d6a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6e79dfa677596d6a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMelvinExit : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x77e2817db47118d3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x77e2817db47118d4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x77e2817db47118d4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMelvinHello : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x77e2817db47118d5);
            default Caption = LocText("DIA_MELVIN_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceMelvinHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa2e8be856cfc81ce), G1R != nullptr && !G1R.HasReachedChapter(5));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(5);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x77e2817db47118d7), EConversationDebugInfo::Executing);
                // You're not from here, are you? 
                Hero.AI.Say(LocText("DIA_MELVIN_HELLO_15_00"));
                DC(int64(0x77e2817db47118d7), EConversationDebugInfo::Done);
                DC(int64(0x77e2817db47118d8), EConversationDebugInfo::Executing);
                
                // Is it that obvious? 
                Melvin.AI.Say(LocText("DIA_MELVIN_HELLO_03_01"));
                DC(int64(0x77e2817db47118d8), EConversationDebugInfo::Done);
                DC(int64(0xf0b20927f924059d), EConversationDebugInfo::Executing);
                
                // Well ... the hair, the clothes ... 
                Hero.AI.Say(LocText("TEXT_NISEA_20240206_182719"));
                DC(int64(0xf0b20927f924059d), EConversationDebugInfo::Done);
                DC(int64(0xf0b20927f924059e), EConversationDebugInfo::Executing);
                
                // Right. Anyway, it won't be like that much longer. Baal ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_182744"));
                DC(int64(0xf0b20927f924059e), EConversationDebugInfo::Done);
                DC(int64(0xf0b20927f924059f), EConversationDebugInfo::Executing);
                // I will be. 
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_182905"));
                DC(int64(0xf0b20927f924059f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_VLK_MELVIN, Document::UDocumentSegment_Glossary_SC_VLK_MELVIN_Introduction);
                Subdialog(
                    UTopic_Melvin_79351,
                    UTopic_Melvin_79371
                );
            }
        }
        
        
        class UTopic_Melvin_79351 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x20f2618b9dc6d664);
            default Caption = LocText("TEXT_NISEA_20240206_183154_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_79351);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x20f2618b9dc6d665), EConversationDebugInfo::Executing);
                // You actually believe all that stuff?
                Hero.AI.Say(LocText("TEXT_NISEA_20240206_183154_41"));
                DC(int64(0x20f2618b9dc6d665), EConversationDebugInfo::Done);
                DC(int64(0x20f2618b9dc6d66c), EConversationDebugInfo::Executing);
                
                // Course I do. I HEARD the Sleeper, whisperin' to me in me ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183213"));
                DC(int64(0x20f2618b9dc6d66c), EConversationDebugInfo::Done);
                DC(int64(0x20f2618b9dc6d66d), EConversationDebugInfo::Executing);
                // He IS here, and he will awaken.
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183248"));
                DC(int64(0x20f2618b9dc6d66d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Melvin_79371 : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x20f2618b9dc6d668);
            default Caption = LocText("TEXT_NISEA_20240206_183154_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Melvin_79371);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x20f2618b9dc6d669), EConversationDebugInfo::Executing);
                
                // I'm guessing you used to be a digger?
                Hero.AI.Say(LocText("TEXT_NISEA_20240206_183154_2238"));
                DC(int64(0x20f2618b9dc6d669), EConversationDebugInfo::Done);
                DC(int64(0x20f2618b9dc6d66e), EConversationDebugInfo::Executing);
                
                // Ha. Slave's more like it. I work me hands bloody for ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183347"));
                DC(int64(0x20f2618b9dc6d66e), EConversationDebugInfo::Done);
                DC(int64(0x20f2618b9dc6d66f), EConversationDebugInfo::Executing);
                // A bowl of that fuckin' stew and some rancid beer. ...
                Melvin.AI.Say(LocText("TEXT_NISEA_20240206_183417"));
                DC(int64(0x20f2618b9dc6d66f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMelvinMetdusty : UTopic_Hero__SC_VLK_MELVIN_582
        {
            default DebugId = int64(0x77e2817db47118da);
            default Caption = LocText("DIA_MELVIN_METDUSTY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMelvin226332);
            default Rules.HideIfKnows(UChoiceDustyIwouldgo);
            default Rules.HideIfKnows(UChoiceMelvinMetdusty);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_MELVIN_HELLO_03_01"), int64(0x77e2817db47118da));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DUSTY_HELLO_03_04"), int64(0x77e2817db47118da));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ca4a84dc9672b3a), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x77e2817db47118db), EConversationDebugInfo::Executing);
                
                // Wait, I know Dusty. I spoke to him once.
                Hero.AI.Say(LocText("DIA_MELVIN_METDUSTY_15_00"));
                DC(int64(0x77e2817db47118db), EConversationDebugInfo::Done);
                DC(int64(0x77e2817db47118dc), EConversationDebugInfo::Executing);
                
                // Did you? Well, then tell him to get over himself. 
                Melvin.AI.Say(LocText("DIA_MELVIN_METDUSTY_03_01"));
                DC(int64(0x77e2817db47118dc), EConversationDebugInfo::Done);
                DC(int64(0x1ee539a0ef4f3ca1), EConversationDebugInfo::Executing);
                // Even if he hasn't yet seen the Sleeper's light, this ...
                Melvin.AI.Say(LocText("TEXT_GROMEU_20231123_145306"));
                DC(int64(0x1ee539a0ef4f3ca1), EConversationDebugInfo::Done);
                DC(int64(0x77e2817db47118dd), EConversationDebugInfo::Executing);
                
                // I'll tell him that. 
                Hero.AI.Say(LocText("DIA_MELVIN_METDUSTY_15_02"));
                DC(int64(0x77e2817db47118dd), EConversationDebugInfo::Done);
                DC(int64(0x1c2195c1a25577c9), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN.SucceedQuest();
                DC(int64(0x1c2195c1a25577c9), EConversationDebugInfo::Done);
                DC(int64(0x6ff314fb3b809eae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6ff314fb3b809eae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */