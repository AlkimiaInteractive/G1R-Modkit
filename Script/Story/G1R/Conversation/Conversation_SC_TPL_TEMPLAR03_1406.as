#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_TEMPLAR03_1406 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_TEMPLAR03_1406";
        }
        
        
        class UTopic_Hero__SC_TPL_TEMPLAR03_1406 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_TEMPLAR03_1406";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar03() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTemplar03106171 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x465cde9079e8abf9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceTemplar03106171);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x465cde9079e8abfc), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                return G1R != nullptr && G1R.IsInChapter(6);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x465cde9079e8abf8), EConversationDebugInfo::Executing);
                // There's blood on your clothes. So you did not accept the ...
                Templar03.AI.Say(LocText("TEXT_WIP_JIHZZJF_20240826_144734_41"));
                DC(int64(0x465cde9079e8abf8), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5e7), EConversationDebugInfo::Executing);
                
                // You could say that.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222608"));
                DC(int64(0x5f713b767244c5e7), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5e8), EConversationDebugInfo::Executing);
                
                // A shame. I would have thought you wiser than that. 
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222619"));
                DC(int64(0x5f713b767244c5e8), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5e9), EConversationDebugInfo::Executing);
                // Wasn't it he who guided you to Brother Caine? Why can't ...
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222639"));
                DC(int64(0x5f713b767244c5e9), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5ff), EConversationDebugInfo::Executing);
                // Why, by the Sleeper's name, do you have to STRUGGLE?
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_223946"));
                DC(int64(0x5f713b767244c5ff), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Templar03_110783,
                    UTopic_Templar03_110803,
                    UTopic_Templar03_111292
                );
                DC(int64(0x5f713b767244c5f7), EConversationDebugInfo::Executing);
                Templar03.AI.StartAttackingImmediately(Hero);
                DC(int64(0x5f713b767244c5f7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_110783 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x5f713b767244c5ec);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_222918_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_110783);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5ed), EConversationDebugInfo::Executing);
                // Are you done?
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222918_2386"));
                DC(int64(0x5f713b767244c5ed), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5f4), EConversationDebugInfo::Executing);
                
                // ...
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222927"));
                DC(int64(0x5f713b767244c5f4), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5f5), EConversationDebugInfo::Executing);
                // I am. 
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222956"));
                DC(int64(0x5f713b767244c5f5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_110803 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x5f713b767244c5f0);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_222918_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_110803);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5f1), EConversationDebugInfo::Executing);
                
                // Just because something is powerful doesn't mean it's a ...
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_222918_1609"));
                DC(int64(0x5f713b767244c5f1), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5f8), EConversationDebugInfo::Executing);
                
                // (snort) Spoken like a true simpleton. 
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_223720"));
                DC(int64(0x5f713b767244c5f8), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c5f9), EConversationDebugInfo::Executing);
                // Die like one. 
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_223756"));
                DC(int64(0x5f713b767244c5f9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_111292 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x5f713b767244c5fa);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_223815_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_111292);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c5fb), EConversationDebugInfo::Executing);
                
                // Did you wait down here just to tell me that?
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_223815_3569"));
                DC(int64(0x5f713b767244c5fb), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c600), EConversationDebugInfo::Executing);
                
                // (long sigh) You know - I did. 
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_224241"));
                DC(int64(0x5f713b767244c600), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c602), EConversationDebugInfo::Executing);
                // Believe it or not, when you walked into Master Kalom's ...
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_224319"));
                DC(int64(0x5f713b767244c602), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c601), EConversationDebugInfo::Executing);
                // Seems I was wrong.
                Templar03.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_224252"));
                DC(int64(0x5f713b767244c601), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTemplar0382522 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xeca4bc82201f7a0b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceTemplar0382522);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeca4bc82201f7a0a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeca4bc82201f7a0a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar0382538 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xeca4bc82201f7a0f);
            default Caption = LocText("TEXT_WIP_SREDFEF_20240306_160130_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTemplar0382538);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeca4bc82201f7a0d), EConversationDebugInfo::Executing);
                // How's it going, brother?
                Hero.AI.Say(LocText("TEXT_WIP_SREDFEF_20240306_160130_41"));
                DC(int64(0xeca4bc82201f7a0d), EConversationDebugInfo::Done);
                DB(int64(0xdd6977046c25a85e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xdd6977046c25a85f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0xdd6977046c25a860), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xdd6977046c25a861), EConversationDebugInfo::Executing);
                    // No time for chitchat. Make yourself useful.
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_154552"));
                    DC(int64(0xdd6977046c25a861), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xdd6977046c25a863), EConversationDebugInfo::Executing);
                    // Don't get on my nerves. Do your business, then slink ...
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_154642"));
                    DC(int64(0xdd6977046c25a863), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xdd6977046c25a867), EConversationDebugInfo::Executing);
                    // Don't get on my nerves. Do your business, then slink ...
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_154649"));
                    DC(int64(0xdd6977046c25a867), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xfb4f56f6761d9513), EConversationDebugInfo::Executing);
                    // No time for chitchat. Make yourself useful.
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_154552"));
                    DC(int64(0xfb4f56f6761d9513), EConversationDebugInfo::Done);
                }
                DC(int64(0xeca4bc82201f7a11), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeca4bc82201f7a11), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTemplar0382563 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xeca4bc82201f7a14);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTemplar0382563);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeca4bc82201f7a17), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0x59245830ef758fe4), Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_SC_GUARD_03", 300.0f));
                    DB(int64(0x994e91f41571d881), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted());
                    DB(int64(0x903216c8cd7b3dd2), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0x903216c8cd7b3dd3), Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_SC_GUARD_03", 300.0f));
                    DB(int64(0x994e91f41571d882), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted());
                }
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_SC_GUARD_03", 300.0f) && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted())
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_SC_GUARD_03", 300.0f) && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeca4bc82201f7a13), EConversationDebugInfo::Executing);
                // Hold it. Where do you think YOU'RE going? 
                Templar03.AI.Say(LocText("TEXT_WIP_SREDFEF_20240306_160505_1924"));
                DC(int64(0xeca4bc82201f7a13), EConversationDebugInfo::Done);
                DC(int64(0xeca4bc82201f7a12), EConversationDebugInfo::Executing);
                
                // I'm looking for Kalom's apprentice. Caine. 
                Hero.AI.Say(LocText("TEXT_WIP_SREDFEF_20240306_160505"));
                DC(int64(0xeca4bc82201f7a12), EConversationDebugInfo::Done);
                DC(int64(0x4ff003a56e756b82), EConversationDebugInfo::Executing);
                
                // Are you, now? 
                Templar03.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131004"));
                DC(int64(0x4ff003a56e756b82), EConversationDebugInfo::Done);
                DB(int64(0xdd6977046c25a86f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                {
                    DC(int64(0xdd6977046c25a871), EConversationDebugInfo::Executing);
                    // And what business does a Shadow have with one of our ...
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155051_1924"));
                    DC(int64(0xdd6977046c25a871), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xdd6977046c25a873), EConversationDebugInfo::Executing);
                    // And what business does a bandit have with one of our ...
                    Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155054_2785"));
                    DC(int64(0xdd6977046c25a873), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Templar03_85859,
                    UTopic_Templar03_85879,
                    UTopic_Templar03_85974,
                    UTopic_Templar03_88131,
                    UTopic_Templar03_110009
                );
                DC(int64(0x4ff003a56e756b93), EConversationDebugInfo::Executing);
                // You're wasting your time, though. Caine isn't here - ...
                Templar03.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131536_3436"));
                DC(int64(0x4ff003a56e756b93), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a883), EConversationDebugInfo::Executing);
                
                // How come?
                Hero.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_160353"));
                DC(int64(0xdd6977046c25a883), EConversationDebugInfo::Done);
                DC(int64(0x4ff003a56e756b94), EConversationDebugInfo::Executing);
                
                // Don't ask me - mabye Kalom knows more. He wasn't in a ...
                Templar03.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131724"));
                DC(int64(0x4ff003a56e756b94), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a884), EConversationDebugInfo::Executing);
                // You can go in. But I'm warning you: one false move, and ...
                Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_161229"));
                DC(int64(0xdd6977046c25a884), EConversationDebugInfo::Done);
                DC(int64(0xa0700e0deda91b9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa0700e0deda91b9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Templar03_85859 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x4ff003a56e756b84);
            default Caption = LocText("TEXT_WIP_KXHZGRJ_20240320_131119_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_85859);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ff003a56e756b85), EConversationDebugInfo::Executing);
                // It's about ore. Caine still owes us.
                Hero.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131119_41"));
                DC(int64(0x4ff003a56e756b85), EConversationDebugInfo::Done);
                DC(int64(0x4ff003a56e756b90), EConversationDebugInfo::Executing);
                
                // Why am I not surprised ... that guy does nothing but ...
                Templar03.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131407"));
                DC(int64(0x4ff003a56e756b90), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_85879 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x4ff003a56e756b88);
            default Caption = LocText("TEXT_WIP_ATMTGUC_20240403_155541");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_85879);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd6977046c25a87e), EConversationDebugInfo::Executing);
                
                // I know him from outside. 
                Hero.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155541"));
                DC(int64(0xdd6977046c25a87e), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a87f), EConversationDebugInfo::Executing);
                
                // That so? Hm, fine. 
                Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155541_3286"));
                DC(int64(0xdd6977046c25a87f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_85974 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x4ff003a56e756b8c);
            default Caption = LocText("TEXT_WIP_KXHZGRJ_20240320_131256_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_85974);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ff003a56e756b8d), EConversationDebugInfo::Executing);
                
                // It's about a recipe. 
                Hero.AI.Say(LocText("TEXT_WIP_KXHZGRJ_20240320_131256_1924"));
                DC(int64(0x4ff003a56e756b8d), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a881), EConversationDebugInfo::Executing);
                
                // Hmm ... You're one of those peddlers, then?
                Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155617"));
                DC(int64(0xdd6977046c25a881), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_88131 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xdd6977046c25a877);
            default Caption = LocText("TEXT_WIP_ATMTGUC_20240403_155154_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_88131);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdd6977046c25a87c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd6977046c25a878), EConversationDebugInfo::Executing);
                
                // Lares sent me. It's about the swampweed.
                Hero.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155154_3436"));
                DC(int64(0xdd6977046c25a878), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a882), EConversationDebugInfo::Executing);
                
                // ... Right. Well. 
                Templar03.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_155653"));
                DC(int64(0xdd6977046c25a882), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Templar03_110009 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x227f4d3778d4ebc9);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_180112_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_110009);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x227f4d3778d4ebca), EConversationDebugInfo::Executing);
                
                // You don't have to know that. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_180112_41"));
                DC(int64(0x227f4d3778d4ebca), EConversationDebugInfo::Done);
                DC(int64(0x227f4d3778d4ebcd), EConversationDebugInfo::Executing);
                
                // I do. And you should watch that mouth of yours if you ...
                Templar03.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_180124"));
                DC(int64(0x227f4d3778d4ebcd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTemplar0382957 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0x10207616d2190c7a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTemplar0382957);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x10207616d2190c7d), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK.HasSucceeded());
                    DB(int64(0x46b4ee13ecebe939), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.HasSucceeded());
                    DB(int64(0xcdbb572daa9fdfc0), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x10207616d2190c79), EConversationDebugInfo::Executing);
                // Let me guess.
                Templar03.AI.Say(LocText("TEXT_WIP_ZYLNJWL_20240307_124847_2238"));
                DC(int64(0x10207616d2190c79), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FINDINGCAINE, Document::UDocumentSegment_CH2_FINDINGCAINE_Hut);
                DB(int64(0x855808a9bb1f1830), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x855808a9bb1f1841), EConversationDebugInfo::Executing);
                    // Master Kalom wants you to find Caine?
                    Templar03.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181359"));
                    DC(int64(0x855808a9bb1f1841), EConversationDebugInfo::Done);
                    DC(int64(0x855808a9bb1f1832), EConversationDebugInfo::Executing);
                    
                    // Yes. Any idea where he might have gone?
                    Hero.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181224_41"));
                    DC(int64(0x855808a9bb1f1832), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x855808a9bb1f1833), EConversationDebugInfo::Executing);
                    
                    // Kalom has no idea where he is?
                    Templar03.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181229"));
                    DC(int64(0x855808a9bb1f1833), EConversationDebugInfo::Done);
                    DC(int64(0x855808a9bb1f1834), EConversationDebugInfo::Executing);
                    
                    // No. Any idea where I should start looking?
                    Hero.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181229_2083"));
                    DC(int64(0x855808a9bb1f1834), EConversationDebugInfo::Done);
                }
                DC(int64(0x855808a9bb1f1860), EConversationDebugInfo::Executing);
                // Not really. I guess his hut is a good place to start ...
                Templar03.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_182007"));
                DC(int64(0x855808a9bb1f1860), EConversationDebugInfo::Done);
                DC(int64(0x855808a9bb1f183b), EConversationDebugInfo::Executing);
                // Hope he's all right. He's been a bit off lately, talking ...
                Templar03.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181240"));
                DC(int64(0x855808a9bb1f183b), EConversationDebugInfo::Done);
                DC(int64(0x855808a9bb1f185d), EConversationDebugInfo::Executing);
                
                // Which hut is his? 
                Hero.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181853"));
                DC(int64(0x855808a9bb1f185d), EConversationDebugInfo::Done);
                DC(int64(0x855808a9bb1f185e), EConversationDebugInfo::Executing);
                
                // Not sure - but I think it's near the weed mashers. Just ...
                Templar03.AI.Say(LocText("TEXT_WIP_ZSMTGUC_20240404_181901"));
                DC(int64(0x855808a9bb1f185e), EConversationDebugInfo::Done);
                DC(int64(0x593f54845c8620a4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK.StartQuest();
                DC(int64(0x593f54845c8620a4), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Templar03_89160,
                    UTopic_Templar03_89180
                );
            }
        }
        
        
        class UTopic_Templar03_89160 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xa3421f1016cb3adf);
            default Caption = LocText("TEXT_WIP_YSMTGUC_20240405_193748_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_89160);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3421f1016cb3ae0), EConversationDebugInfo::Executing);
                // What does this dreamjuice do, exactly? Is it like ...
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_193748_41"));
                DC(int64(0xa3421f1016cb3ae0), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3ae7), EConversationDebugInfo::Executing);
                
                // Not quite. Master Kalom makes it from the ichor of ...
                Templar03.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_193836"));
                DC(int64(0xa3421f1016cb3ae7), EConversationDebugInfo::Done);
                DC(int64(0xa3421f1016cb3ae8), EConversationDebugInfo::Executing);
                // Hmm. Some of us, at least.
                Templar03.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_195915"));
                DC(int64(0xa3421f1016cb3ae8), EConversationDebugInfo::Done);
                DB(int64(0xa3421f1016cb3aea), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xa3421f1016cb3aec), EConversationDebugInfo::Executing);
                    // If you haven't tried it, I hear Fortuno has a few ...
                    Templar03.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_200003_1924"));
                    DC(int64(0xa3421f1016cb3aec), EConversationDebugInfo::Done);
                    DC(int64(0xa3421f1016cb3aed), EConversationDebugInfo::Executing);
                    // Or you wait until the Great Awakening. 
                    Templar03.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_200036"));
                    DC(int64(0xa3421f1016cb3aed), EConversationDebugInfo::Done);
                    DC(int64(0xa3421f1016cb3ae2), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xa3421f1016cb3ae2), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa3421f1016cb3aef), EConversationDebugInfo::Executing);
                    // But what am I saying. To you nonbelievers, this is all ...
                    Templar03.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_200142_2785"));
                    DC(int64(0xa3421f1016cb3aef), EConversationDebugInfo::Done);
                    DC(int64(0xa3421f1016cb3af0), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xa3421f1016cb3af0), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Templar03_89180 : UTopic_Hero__SC_TPL_TEMPLAR03_1406
        {
            default DebugId = int64(0xa3421f1016cb3ae3);
            default Caption = LocText("TEXT_WIP_YSMTGUC_20240405_193748_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Templar03_89180);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3421f1016cb3ae4), EConversationDebugInfo::Executing);
                // All right. I'll see if I can find him.
                Hero.AI.Say(LocText("TEXT_WIP_YSMTGUC_20240405_193748_2238"));
                DC(int64(0xa3421f1016cb3ae4), EConversationDebugInfo::Done);
                DC(int64(0x10207616d2190c89), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x10207616d2190c89), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */