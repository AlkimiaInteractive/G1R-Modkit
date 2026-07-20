#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_MUD_574 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_MUD_574";
        }
        
        
        class UTopic_Hero__OC_VLK_MUD_574 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_MUD_574";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMud() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMud221135 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1a7);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_144927");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMud221135);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x802abf1da302f1d6), G1R != nullptr && G1R.HasReachedChapter(4));
                    DB(int64(0xcf3fe1802155657f), G1R.RevealedKalomists != 0);
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                if (G1R.RevealedKalomists == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f1a5), EConversationDebugInfo::Executing);
                // Hey, how’s it going?
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_144927"));
                DC(int64(0x802abf1da302f1a5), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1a6), EConversationDebugInfo::Executing);
                
                // Ah, y'know ... folks used to like me. Same as you did. ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_144927_2238"));
                DC(int64(0x802abf1da302f1a6), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e41), EConversationDebugInfo::Executing);
                
                // Sure.
                Hero.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063013"));
                DC(int64(0x4a17af0592127e41), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1aa), EConversationDebugInfo::Executing);
                
                // But ever since you started turnin' everything upside ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145110"));
                DC(int64(0x802abf1da302f1aa), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1ab), EConversationDebugInfo::Executing);
                // Only one who can save me now is the Sleeper.
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145134"));
                DC(int64(0x802abf1da302f1ab), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Mud_221187,
                    UTopic_Mud_221207
                );
            }
        }
        
        
        class UTopic_Mud_221187 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1af);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_145458_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mud_221187);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f1b0), EConversationDebugInfo::Executing);
                // The Sleeper? Really? What now, you wanna head to the ...
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145458_2785"));
                DC(int64(0x802abf1da302f1b0), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1b7), EConversationDebugInfo::Executing);
                
                // Been there already. With that Novice. But Angar chased ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145530"));
                DC(int64(0x802abf1da302f1b7), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e42), EConversationDebugInfo::Executing);
                // But he wouldn’t hear any of it. Got proper angry, he ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063135"));
                DC(int64(0x4a17af0592127e42), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1bc), EConversationDebugInfo::Executing);
                
                // There's still a couple of guys there who believe in the ...
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145933"));
                DC(int64(0x802abf1da302f1bc), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e43), EConversationDebugInfo::Executing);
                
                // Really? Where are they then?
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063203"));
                DC(int64(0x4a17af0592127e43), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e44), EConversationDebugInfo::Executing);
                
                // They've set up camp by the Orc Graveyard.
                Hero.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063217"));
                DC(int64(0x4a17af0592127e44), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1bd), EConversationDebugInfo::Executing);
                
                // Will you take me to 'em?
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145933_2386"));
                DC(int64(0x802abf1da302f1bd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mud_221207 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1b3);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_145458_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mud_221207);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f1b4), EConversationDebugInfo::Executing);
                
                // Best I leave you alone then.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_145458_3286"));
                DC(int64(0x802abf1da302f1b4), EConversationDebugInfo::Done);
                DC(int64(0xae4e4801e133c848), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xae4e4801e133c848), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMud221363 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0xfddcf2c24943caa8);
            default Caption = LocText("TEXT_WIP_NDMMTZB_20260213_093743");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221747);
            default Rules.HideIfKnows(UChoiceMud221363);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f3922), G1R.Mud_Stay_Kalomists.IsValid() && G1R.Mud_Stay_Kalomists.IsAtLeastXDaysAgo(1));
                }
                
                return G1R.Mud_Stay_Kalomists.IsValid() && G1R.Mud_Stay_Kalomists.IsAtLeastXDaysAgo(1);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfddcf2c24943caa6), EConversationDebugInfo::Executing);
                // So? How do you like it here?
                Hero.AI.Say(LocText("TEXT_WIP_NDMMTZB_20260213_093743"));
                DC(int64(0xfddcf2c24943caa6), EConversationDebugInfo::Done);
                DC(int64(0xfddcf2c24943caa7), EConversationDebugInfo::Executing);
                
                // These blokes are different ... real creepy ... and ...
                Mud.AI.Say(LocText("TEXT_WIP_NDMMTZB_20260213_093743_41"));
                DC(int64(0xfddcf2c24943caa7), EConversationDebugInfo::Done);
                DC(int64(0xfddcf2c24943caaa), EConversationDebugInfo::Executing);
                // Oh, it was great at first, but I reckon they don't like ...
                Mud.AI.Say(LocText("TEXT_WIP_NDMMTZB_20260213_093951"));
                DC(int64(0xfddcf2c24943caaa), EConversationDebugInfo::Done);
                DC(int64(0xfddcf2c24943caab), EConversationDebugInfo::Executing);
                // And the Sleeper ain't showin' himself anywhere either ...
                Mud.AI.Say(LocText("TEXT_WIP_NDMMTZB_20260213_094011"));
                DC(int64(0xfddcf2c24943caab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud221582 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1c4);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150213");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Mud_221187);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb1749a689821867), Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Kalomists));
                }
                
                return Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Kalomists);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f1c2), EConversationDebugInfo::Executing);
                
                // Let’s head to the Orc Graveyard.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150213"));
                DC(int64(0x802abf1da302f1c2), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1c3), EConversationDebugInfo::Executing);
                
                // Brilliant! You go first, I'll stay right behind you!
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150213_1609"));
                DC(int64(0x802abf1da302f1c3), EConversationDebugInfo::Done);
                DC(int64(0x7fda7c62e90ddab9), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Follow);
                DC(int64(0x7fda7c62e90ddab9), EConversationDebugInfo::Done);
                DC(int64(0x7fda7c62e90ddabb), EConversationDebugInfo::Executing);
                G1R.Mud_OrcGraveyard = 1;
                DC(int64(0x7fda7c62e90ddabb), EConversationDebugInfo::Done);
                DC(int64(0x52c02bfb6d884f16), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f16), EConversationDebugInfo::Done);
                DC(int64(0x64305eff085f1a7d), EConversationDebugInfo::Executing);
                Mud.JoinPartyOf(Hero);
                DC(int64(0x64305eff085f1a7d), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fca), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fca), EConversationDebugInfo::Done);
                DC(int64(0xb1749a689821863), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb1749a689821863), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMud221656 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1c9);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 0);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f1c7), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x802abf1da302f1c7), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1c8), EConversationDebugInfo::Executing);
                
                // That's it? You're just gonna leave me sittin' here? ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417_2801"));
                DC(int64(0x802abf1da302f1c8), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0xb1749a689821862), EConversationDebugInfo::Executing);
                G1R.Mud_OrcGraveyard = 0;
                DC(int64(0xb1749a689821862), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a6), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a6), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fce), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 0;
                DC(int64(0x40640248135e3fce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud221718 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x50ceb1c3b66fd854);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default bIsAmbientTopic = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221747);
            default Rules.HideIfKnows(UChoiceMud221718);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_VLK_MUD_574", n"FP_OG_LISTEN_04", 200.0f, int64(0x50ceb1c3b66fd854));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f391e), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 500.0f));
                }
                
                return Mud != nullptr && Mud.IsCloseToCharacter(Hero, 500.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50ceb1c3b66fd853), EConversationDebugInfo::Executing);
                // Sleeper! Come on! Come quickly and free us!
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_162152_41"));
                DC(int64(0x50ceb1c3b66fd853), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud221747 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x802abf1da302f1ce);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            default Rules.HideIfKnows(UChoiceMud221747);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Mud_Kalomists", 3000.0f, int64(0x802abf1da302f1ce));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f2c), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4a17af0592127e4a), EConversationDebugInfo::Executing);
                
                // We’re here.
                Hero.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063409"));
                DC(int64(0x4a17af0592127e4a), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1d0), EConversationDebugInfo::Executing);
                
                // Oh man, that was something. You actually brought me ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150543"));
                DC(int64(0x802abf1da302f1d0), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1cd), EConversationDebugInfo::Executing);
                // You helped me. Now the Sleeper's gonna save me.
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150528_1769"));
                DC(int64(0x802abf1da302f1cd), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e4b), EConversationDebugInfo::Executing);
                
                // Yeeeah... maybe.
                Hero.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063443"));
                DC(int64(0x4a17af0592127e4b), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1d1), EConversationDebugInfo::Executing);
                
                // I'll pray to him, and maybe smoke a bit o' the herb too. ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150614"));
                DC(int64(0x802abf1da302f1d1), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1d3), EConversationDebugInfo::Executing);
                // I can hear his voice even without smokin'. Right in me ...
                Mud.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150635"));
                DC(int64(0x802abf1da302f1d3), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e4c), EConversationDebugInfo::Executing);
                // Say, you're gonna come pray with us later? Pray to the ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063541"));
                DC(int64(0x4a17af0592127e4c), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1d4), EConversationDebugInfo::Executing);
                
                // Eh, we’ll see... we’ll see.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150642"));
                DC(int64(0x802abf1da302f1d4), EConversationDebugInfo::Done);
                DC(int64(0x52c02bfb6d884f33), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Kalomists);
                DC(int64(0x52c02bfb6d884f33), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f3920), EConversationDebugInfo::Executing);
                G1R.Mud_Stay_Kalomists = FInGameTime::Now();
                DC(int64(0x39763e5993f3920), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a4), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a4), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fcc), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 0;
                DC(int64(0x40640248135e3fcc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222247_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddad3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222247);
            
            default Rules.HideIfKnows(UChoiceMud222247_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddad2), EConversationDebugInfo::Executing);
                // Cor Kalom's a wise man. He can free us all because he ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063918"));
                DC(int64(0x7fda7c62e90ddad2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222247 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222247_0);
            default Rules.HideIfKnows(UChoiceMud222247);
            default DebugId = int64(0x7fda7c62e90ddad3);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222263_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddad7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222263);
            
            default Rules.HideIfKnows(UChoiceMud222263_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddad6), EConversationDebugInfo::Executing);
                // All the mages are dead. I wanted to live there - must be ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063753"));
                DC(int64(0x7fda7c62e90ddad6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222263 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222263_0);
            default Rules.HideIfKnows(UChoiceMud222263);
            default DebugId = int64(0x7fda7c62e90ddad7);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222279_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddadb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222279);
            
            default Rules.HideIfKnows(UChoiceMud222279_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddada), EConversationDebugInfo::Executing);
                // Lucky you weren't in the mine when it collapsed. You'd ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063751"));
                DC(int64(0x7fda7c62e90ddada), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222279 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222279_0);
            default Rules.HideIfKnows(UChoiceMud222279);
            default DebugId = int64(0x7fda7c62e90ddadb);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222295_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddadf);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222295);
            
            default Rules.HideIfKnows(UChoiceMud222295_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddade), EConversationDebugInfo::Executing);
                // Wanderin' around out there all the time, you can die ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063749"));
                DC(int64(0x7fda7c62e90ddade), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222295 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222295_0);
            default Rules.HideIfKnows(UChoiceMud222295);
            default DebugId = int64(0x7fda7c62e90ddadf);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222311_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddae3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222311);
            
            default Rules.HideIfKnows(UChoiceMud222311_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddae2), EConversationDebugInfo::Executing);
                // Heard you were lookin' for some stone for the mages. Bit ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063748"));
                DC(int64(0x7fda7c62e90ddae2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222311 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222311_0);
            default Rules.HideIfKnows(UChoiceMud222311);
            default DebugId = int64(0x7fda7c62e90ddae3);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222327_0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x7fda7c62e90ddae7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMud222327);
            
            default Rules.HideIfKnows(UChoiceMud222327_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52c02bfb6d884f18), G1R.Mud_Path_OrcGraveyard.IsValid() && G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15));
                    DB(int64(0x52c02bfb6d884f19), G1R.Mud_OrcGraveyard == 1);
                }
                
                if (G1R.Mud_Path_OrcGraveyard.IsValid() && !G1R.Mud_Path_OrcGraveyard.IsAtLeastXMinutesAgo(15))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7fda7c62e90ddae6), EConversationDebugInfo::Executing);
                // Say, are you really workin' for the New Camp now? Don't ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063635_41"));
                DC(int64(0x7fda7c62e90ddae6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222327 : UTopic_Hero__OC_VLK_MUD_574
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud222327_0);
            default Rules.HideIfKnows(UChoiceMud222327);
            default DebugId = int64(0x7fda7c62e90ddae7);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Executing);
                G1R.Mud_Path_OrcGraveyard = FInGameTime::Now();
                DC(int64(0x52c02bfb6d884f1b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222359 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x39763e5993f3925);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 1);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39763e5993f3923), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x39763e5993f3923), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f3924), EConversationDebugInfo::Executing);
                
                // Ah well. I get it. Got more important things to do, ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063315"));
                DC(int64(0x39763e5993f3924), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222375 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x39763e5993f3929);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 2);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 2)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39763e5993f3927), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x39763e5993f3927), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f3928), EConversationDebugInfo::Executing);
                
                // Gonna save us all, are you? You can't pull it off, ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063316"));
                DC(int64(0x39763e5993f3928), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222391 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x39763e5993f392d);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 3);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 3)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39763e5993f392b), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x39763e5993f392b), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f392c), EConversationDebugInfo::Executing);
                
                // But once the Sleeper's freed us all, we can get on the ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063317"));
                DC(int64(0x39763e5993f392c), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222407 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x39763e5993f3931);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 4);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 4)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39763e5993f392f), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x39763e5993f392f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f3930), EConversationDebugInfo::Executing);
                
                // What d'you say? Just you and me, spreadin' the Sleeper’s ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063337"));
                DC(int64(0x39763e5993f3930), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMud222423 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x39763e5993f3935);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_150417");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMud221582);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39763e5993f394b), Mud != nullptr && Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow));
                    DB(int64(0x39763e5993f394c), G1R.Mud_Leave == 5);
                }
                
                if (Mud != nullptr && !Mud.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Mud_574_Follow))
                    return false;
                
                if (G1R.Mud_Leave != 5)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39763e5993f3933), EConversationDebugInfo::Executing);
                // This is where we part ways.
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_150417"));
                DC(int64(0x39763e5993f3933), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f3934), EConversationDebugInfo::Executing);
                
                // Well, you'll have to do without me for now, I guess. But ...
                Mud.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_063348"));
                DC(int64(0x39763e5993f3934), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x39763e5993f393f), EConversationDebugInfo::Done);
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Executing);
                G1R.Mud_Leave += 1;
                DC(int64(0x39763e5993f394e), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3a8), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMudDefeated : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c0c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceMudDefeated);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c0d), Mud != nullptr && Mud.WasDefeatedBy(Hero));
                }
                
                return Mud != nullptr && Mud.WasDefeatedBy(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c0e), EConversationDebugInfo::Executing);
                // Oy, man, you hit me! What was that for?
                Mud.AI.Say(LocText("DIA_MUD_GETLOST_07_00"));
                DC(int64(0x1b2a70bf07e61c0e), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c0f), EConversationDebugInfo::Executing);
                
                // Yeah, and I'm about to hit you again. I like hitting ...
                Hero.AI.Say(LocText("DIA_MUD_GETLOST_15_01"));
                DC(int64(0x1b2a70bf07e61c0f), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c10), EConversationDebugInfo::Executing);
                
                // What? What by Beliar is wrong with you?! I don't want ...
                Mud.AI.Say(LocText("DIA_MUD_GETLOST_07_02"));
                DC(int64(0x1b2a70bf07e61c10), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_MUD, Document::UDocumentSegment_Glossary_OC_VLK_MUD_Beated);
                DC(int64(0xf619b20ccc7c23f), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 0;
                DC(int64(0xf619b20ccc7c23f), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d85), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudOut", Mud);
                DC(int64(0x3a7f267d2b842d85), EConversationDebugInfo::Done);
                DC(int64(0x35b41f65960b8355), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Start);
                DC(int64(0x35b41f65960b8355), EConversationDebugInfo::Done);
                DC(int64(0x566cfb772b1bc3b2), EConversationDebugInfo::Executing);
                Mud.LeavePartyOf(Hero);
                DC(int64(0x566cfb772b1bc3b2), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c12), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c12), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudExit : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61bf3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61bf4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61bf4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudFirstexit : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61bf5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceMudFirstexit);
            
            default InitialForcedLine = LocText("DIA_MUD_FIRSTEXIT_07_00");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                if(!WasInitialForcedLinePlayed())
                {
                    DC(int64(0x1b2a70bf07e61bf7), EConversationDebugInfo::Executing);
                    // Oy, you new 'ere? I ain't seen you 'ere before!
                    Mud.AI.Say(LocText("DIA_MUD_FIRSTEXIT_07_00"));
                    DC(int64(0x1b2a70bf07e61bf7), EConversationDebugInfo::Done);
                }
                DC(int64(0x1b2a70bf07e61bf8), EConversationDebugInfo::Executing);
                // Say, you mind if I join you for a bit? I'm sure you ...
                Mud.AI.Say(LocText("DIA_MUD_FIRSTEXIT_07_01"));
                DC(int64(0x1b2a70bf07e61bf8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_MUD, Document::UDocumentSegment_Glossary_OC_VLK_MUD_Introduction);
                Subdialog(
                    UChoiceMudFirstexitVerpiss,
                    UChoiceMudFirstexitKomm
                );
                DC(int64(0x3a7f267d2b842d87), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudIn", Mud);
                DC(int64(0x3a7f267d2b842d87), EConversationDebugInfo::Done);
                DC(int64(0xc413ac721f092ca9), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(10);
                DC(int64(0xc413ac721f092ca9), EConversationDebugInfo::Done);
                DC(int64(0x35b41f65960b8353), EConversationDebugInfo::Executing);
                Mud.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Mud_574_Follow);
                DC(int64(0x35b41f65960b8353), EConversationDebugInfo::Done);
                DC(int64(0x64305eff085f1a7f), EConversationDebugInfo::Executing);
                Mud.JoinPartyOf(Hero);
                DC(int64(0x64305eff085f1a7f), EConversationDebugInfo::Done);
                DC(int64(0x40640248135e3fc8), EConversationDebugInfo::Executing);
                G1R.Mud_Follow = 1;
                DC(int64(0x40640248135e3fc8), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61bfe), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61bfe), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudFirstexitVerpiss : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61bfa);
            default Caption = LocText("DIA_MUD_FIRSTEXIT_VERPISS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61bfb), EConversationDebugInfo::Executing);
                // Piss off.
                Hero.AI.Say(LocText("DIA_MUD_FIRSTEXIT_VERPISS_15_00"));
                DC(int64(0x1b2a70bf07e61bfb), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61bfc), EConversationDebugInfo::Executing);
                
                // Bad day, eh? Surely some company is gonna cheer you ...
                Mud.AI.Say(LocText("DIA_MUD_FIRSTEXIT_VERPISS_07_01"));
                DC(int64(0x1b2a70bf07e61bfc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMudFirstexitKomm : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61bff);
            default Caption = LocText("DIA_MUD_FIRSTEXIT_KOMM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c00), EConversationDebugInfo::Executing);
                
                // Why not. Come along.
                Hero.AI.Say(LocText("DIA_MUD_FIRSTEXIT_KOMM_15_00"));
                DC(int64(0x1b2a70bf07e61c00), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c01), EConversationDebugInfo::Executing);
                
                // Great! We can chat on the way!
                Mud.AI.Say(LocText("DIA_MUD_FIRSTEXIT_KOMM_07_01"));
                DC(int64(0x1b2a70bf07e61c01), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMudGetlost : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c09);
            default Caption = LocText("DIA_MUD_GETLOST_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb1749a689821865), G1R.Mud_Follow != 0);
                }
                
                return G1R.Mud_Follow != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c0a), EConversationDebugInfo::Executing);
                
                // Piss off. 
                Hero.AI.Say(LocText("DIA_MUD_GETLOST_15_00"));
                DC(int64(0x1b2a70bf07e61c0a), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c0b), EConversationDebugInfo::Executing);
                
                // Want a moment to yourself, do you? No problem, I get it! ...
                Mud.AI.Say(LocText("DIA_MUD_GETLOST_07_01"));
                DC(int64(0x1b2a70bf07e61c0b), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d8d), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudGetLost", Mud);
                DC(int64(0x3a7f267d2b842d8d), EConversationDebugInfo::Done);
                DC(int64(0x1f01f9d3f430d832), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f01f9d3f430d832), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve0 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c13);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_MUD_FIRSTEXIT_07_01"), int64(0x1b2a70bf07e61c13));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c14), G1R.Mud_Nerve == 0);
                    DB(int64(0x1b2a70bf07e61c15), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c16), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c17), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddabc), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 0)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c18), EConversationDebugInfo::Executing);
                // Say, where we goin'? Or is that a surprise? I love ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_0_07_00"));
                DC(int64(0x1b2a70bf07e61c18), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c261), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c261), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c263), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 1;
                DC(int64(0xf619b20ccc7c263), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d5d), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline1", Mud);
                DC(int64(0x3a7f267d2b842d5d), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c1b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c1b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve1 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c1c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c1d), G1R.Mud_Nerve == 1);
                    DB(int64(0x1b2a70bf07e61c1e), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c1f), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c20), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddabd), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 1)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c21), EConversationDebugInfo::Executing);
                // Hey, you just do your thing and don't mind me! I'll just ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_1_07_00"));
                DC(int64(0x1b2a70bf07e61c21), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_MUD, Document::UDocumentSegment_Glossary_OC_VLK_MUD_Annoying);
                DC(int64(0xf619b20ccc7c269), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c269), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c26b), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 2;
                DC(int64(0xf619b20ccc7c26b), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c26d), EConversationDebugInfo::Executing);
                G1R.Mud_NerveRealized = 1;
                DC(int64(0xf619b20ccc7c26d), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d5f), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline2", Mud);
                DC(int64(0x3a7f267d2b842d5f), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c25), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c25), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve10 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c6e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c6f), G1R.Mud_Nerve == 10);
                    DB(int64(0x1b2a70bf07e61c70), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c71), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c72), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac5), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 10)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c73), EConversationDebugInfo::Executing);
                // You know what? I'll do you a favor and put in a good ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_10_07_00"));
                DC(int64(0x1b2a70bf07e61c73), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c273), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c273), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c275), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 11;
                DC(int64(0xf619b20ccc7c275), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d6f), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline11", Mud);
                DC(int64(0x3a7f267d2b842d6f), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c76), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c76), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve11 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c77);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c78), G1R.Mud_Nerve == 11);
                    DB(int64(0x1b2a70bf07e61c79), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c7a), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c7b), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac6), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 11)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c7c), EConversationDebugInfo::Executing);
                // Some folks reckon I'm a bit whacky. But someone like you ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_11_07_00"));
                DC(int64(0x1b2a70bf07e61c7c), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c27b), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c27b), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c27d), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 12;
                DC(int64(0xf619b20ccc7c27d), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d71), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline12", Mud);
                DC(int64(0x3a7f267d2b842d71), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c7f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c7f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve12 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c80);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c81), G1R.Mud_Nerve == 12);
                    DB(int64(0x1b2a70bf07e61c82), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c83), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c84), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac7), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 12)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c85), EConversationDebugInfo::Executing);
                // You know, you're me best mate in here! Everyone else ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_12_07_00"));
                DC(int64(0x1b2a70bf07e61c85), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c283), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c283), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c285), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 13;
                DC(int64(0xf619b20ccc7c285), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d73), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline13", Mud);
                DC(int64(0x3a7f267d2b842d73), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c88), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c88), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve13 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c89);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c8a), G1R.Mud_Nerve == 13);
                    DB(int64(0x1b2a70bf07e61c8b), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c8c), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c8d), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac8), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 13)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c8e), EConversationDebugInfo::Executing);
                // Ugh ... me feet are all sore from all this runnin' ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_13_07_00"));
                DC(int64(0x1b2a70bf07e61c8e), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c28b), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c28b), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c28d), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 14;
                DC(int64(0xf619b20ccc7c28d), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d75), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline14", Mud);
                DC(int64(0x3a7f267d2b842d75), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve14 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c92);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c93), G1R.Mud_Nerve == 14);
                    DB(int64(0x1b2a70bf07e61c94), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c95), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c96), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddacb), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 14)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c97), EConversationDebugInfo::Executing);
                // Y'know, you're like a big brother to me. I ain't never ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_14_07_00"));
                DC(int64(0x1b2a70bf07e61c97), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c98), EConversationDebugInfo::Executing);
                
                // I'm sure. 
                Hero.AI.Say(LocText("DIA_MUD_NERVE_14_15_01"));
                DC(int64(0x1b2a70bf07e61c98), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c293), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c293), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c295), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 15;
                DC(int64(0xf619b20ccc7c295), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d7b), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline15", Mud);
                DC(int64(0x3a7f267d2b842d7b), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c9b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c9b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve15 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c9c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c9d), G1R.Mud_Nerve == 15);
                    DB(int64(0x1b2a70bf07e61c9e), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c9f), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61ca0), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac9), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 15)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61ca1), EConversationDebugInfo::Executing);
                // Hey, I just realized I don't even know where you're ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_15_07_00"));
                DC(int64(0x1b2a70bf07e61ca1), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c29c), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c29c), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c29e), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 16;
                DC(int64(0xf619b20ccc7c29e), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d77), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline16", Mud);
                DC(int64(0x3a7f267d2b842d77), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61ca4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61ca4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve16 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61ca5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61ca6), G1R.Mud_Nerve == 16);
                    DB(int64(0x1b2a70bf07e61ca7), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61ca8), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61ca9), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddaca), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 16)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61caa), EConversationDebugInfo::Executing);
                // I think I'm hungry. D'you have some food for me? I mean, ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_16_07_00"));
                DC(int64(0x1b2a70bf07e61caa), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2a4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2a4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2a6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 17;
                DC(int64(0xf619b20ccc7c2a6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d79), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline17", Mud);
                DC(int64(0x3a7f267d2b842d79), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61cad), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61cad), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve17 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61cae);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61caf), G1R.Mud_Nerve == 17);
                    DB(int64(0x1b2a70bf07e61cb0), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61cb1), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61cb2), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddacc), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 17)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61cb3), EConversationDebugInfo::Executing);
                // Hey, you reckon we'll ever get proper visitors in 'ere? ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_17_07_00"));
                DC(int64(0x1b2a70bf07e61cb3), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2ac), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2ac), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2ae), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 18;
                DC(int64(0xf619b20ccc7c2ae), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d7d), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline18", Mud);
                DC(int64(0x3a7f267d2b842d7d), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61cb6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61cb6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve18 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61cb7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61cb8), G1R.Mud_Nerve == 18);
                    DB(int64(0x1b2a70bf07e61cb9), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61cba), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61cbb), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddacd), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 18)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61cbc), EConversationDebugInfo::Executing);
                // Y'know, now that you're 'ere, we could go give some of ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_18_07_00"));
                DC(int64(0x1b2a70bf07e61cbc), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2b4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2b4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2b6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 19;
                DC(int64(0xf619b20ccc7c2b6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d7f), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline19", Mud);
                DC(int64(0x3a7f267d2b842d7f), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61cbf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61cbf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve19 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61cc0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61cc1), G1R.Mud_Nerve == 19);
                    DB(int64(0x1b2a70bf07e61cc2), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61cc3), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61cc4), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddace), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 19)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61cc5), EConversationDebugInfo::Executing);
                // The two of us together, we're pretty much invincible. We ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_19_07_00"));
                DC(int64(0x1b2a70bf07e61cc5), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2bc), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2bc), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2be), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 0;
                DC(int64(0xf619b20ccc7c2be), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d81), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline20", Mud);
                DC(int64(0x3a7f267d2b842d81), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61cc8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61cc8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve2 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c26);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c27), G1R.Mud_Nerve == 2);
                    DB(int64(0x1b2a70bf07e61c28), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c29), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c2a), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddabe), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 2)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c2b), EConversationDebugInfo::Executing);
                // So, say, where exactly are we goin' again? Maybe there's ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_2_07_00"));
                DC(int64(0x1b2a70bf07e61c2b), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2c4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2c4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2c6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 3;
                DC(int64(0xf619b20ccc7c2c6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d61), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline3", Mud);
                DC(int64(0x3a7f267d2b842d61), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c2e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c2e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve3 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c2f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c30), G1R.Mud_Nerve == 3);
                    DB(int64(0x1b2a70bf07e61c31), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c32), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c33), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddabf), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 3)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c34), EConversationDebugInfo::Executing);
                // So, say, where are we goin'? Maybe there's a nice and ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_3_07_00"));
                DC(int64(0x1b2a70bf07e61c34), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2cc), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2cc), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2ce), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 4;
                DC(int64(0xf619b20ccc7c2ce), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d63), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline4", Mud);
                DC(int64(0x3a7f267d2b842d63), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c37), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c37), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve4 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c38);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c39), G1R.Mud_Nerve == 4);
                    DB(int64(0x1b2a70bf07e61c3a), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c3b), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c3c), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac0), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 4)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c3d), EConversationDebugInfo::Executing);
                // Hey, could it be that you're just runnin' in circles? I ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_4_07_00"));
                DC(int64(0x1b2a70bf07e61c3d), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2d4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2d4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2d6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 5;
                DC(int64(0xf619b20ccc7c2d6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d65), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline5", Mud);
                DC(int64(0x3a7f267d2b842d65), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c40), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c40), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve5 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c41);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c42), G1R.Mud_Nerve == 5);
                    DB(int64(0x1b2a70bf07e61c43), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c44), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c45), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac1), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 5)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c46), EConversationDebugInfo::Executing);
                // Y'know, it's a right laugh lollygaggin' with you! Cheers ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_5_07_00"));
                DC(int64(0x1b2a70bf07e61c46), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2dc), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2dc), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2de), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 6;
                DC(int64(0xf619b20ccc7c2de), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d67), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline6", Mud);
                DC(int64(0x3a7f267d2b842d67), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c49), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c49), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve6 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c4a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c4b), G1R.Mud_Nerve == 6);
                    DB(int64(0x1b2a70bf07e61c4c), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c4d), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c4e), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac2), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 6)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c4f), EConversationDebugInfo::Executing);
                // Hey, I've really gotten used to you, and I think the two ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_6_07_00"));
                DC(int64(0x1b2a70bf07e61c4f), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2e4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2e4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2e6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 7;
                DC(int64(0xf619b20ccc7c2e6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d69), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline7", Mud);
                DC(int64(0x3a7f267d2b842d69), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c52), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c52), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve7 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c53);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c54), G1R.Mud_Nerve == 7);
                    DB(int64(0x1b2a70bf07e61c55), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c56), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c57), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddacf), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 7)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c58), EConversationDebugInfo::Executing);
                // Did I ever ask why they tossed you in 'ere? Maybe you ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_7_07_00"));
                DC(int64(0x1b2a70bf07e61c58), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2ec), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2ec), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2ee), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 8;
                DC(int64(0xf619b20ccc7c2ee), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d83), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline8", Mud);
                DC(int64(0x3a7f267d2b842d83), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c5b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c5b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve8 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c5c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c5d), G1R.Mud_Nerve == 8);
                    DB(int64(0x1b2a70bf07e61c5e), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c5f), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c60), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac3), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 8)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c61), EConversationDebugInfo::Executing);
                // You know, there's some folk 'ere who always beat me up. ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_8_07_00"));
                DC(int64(0x1b2a70bf07e61c61), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2f4), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2f4), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2f6), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 9;
                DC(int64(0xf619b20ccc7c2f6), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d6b), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline9", Mud);
                DC(int64(0x3a7f267d2b842d6b), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c64), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c64), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudNerve9 : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c65);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c66), G1R.Mud_Nerve == 9);
                    DB(int64(0x1b2a70bf07e61c67), Mud != nullptr && !Mud.IsRefusingToTalkWith(Hero));
                    DB(int64(0x1b2a70bf07e61c68), Mud != nullptr && Mud.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x1b2a70bf07e61c69), Mud != nullptr && !Mud.WasDefeatedBy(Hero));
                    DB(int64(0x7fda7c62e90ddac4), G1R.Mud_OrcGraveyard == 0);
                }
                
                if (G1R.Mud_Nerve != 9)
                    return false;
                
                if (Mud != nullptr && Mud.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Mud != nullptr && !Mud.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Mud != nullptr && Mud.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Mud_OrcGraveyard != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c6a), EConversationDebugInfo::Executing);
                // Ha, those mean New Campers are in for a big surprise! ...
                Mud.AI.Say(LocText("DIA_MUD_NERVE_9_07_00"));
                DC(int64(0x1b2a70bf07e61c6a), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2fc), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(G1R.NerveSec);
                DC(int64(0xf619b20ccc7c2fc), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c2fe), EConversationDebugInfo::Executing);
                G1R.Mud_Nerve = 10;
                DC(int64(0xf619b20ccc7c2fe), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d6d), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudVoiceline10", Mud);
                DC(int64(0x3a7f267d2b842d6d), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c6d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1b2a70bf07e61c6d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMudShutup : UTopic_Hero__OC_VLK_MUD_574
        {
            default DebugId = int64(0x1b2a70bf07e61c04);
            default Caption = LocText("DIA_MUD_SHUTUP_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1b2a70bf07e61c05), G1R.Mud_NerveRealized != 0);
                    DB(int64(0x40640248135e3fc6), G1R.Mud_Follow != 0);
                }
                
                if (G1R.Mud_NerveRealized == 0)
                    return false;
                
                if (G1R.Mud_Follow == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1b2a70bf07e61c06), EConversationDebugInfo::Executing);
                // Please, could you shut up for just ONE moment?
                Hero.AI.Say(LocText("DIA_MUD_SHUTUP_15_00"));
                DC(int64(0x1b2a70bf07e61c06), EConversationDebugInfo::Done);
                DC(int64(0x1b2a70bf07e61c07), EConversationDebugInfo::Executing);
                
                // Sure.
                Mud.AI.Say(LocText("DIA_MUD_SHUTUP_07_01"));
                DC(int64(0x1b2a70bf07e61c07), EConversationDebugInfo::Done);
                DC(int64(0xf619b20ccc7c303), EConversationDebugInfo::Executing);
                Mud.RefuseToTalk(300);
                DC(int64(0xf619b20ccc7c303), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d8b), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"MudQuiet", Mud);
                DC(int64(0x3a7f267d2b842d8b), EConversationDebugInfo::Done);
                DC(int64(0x1f01f9d3f430d833), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f01f9d3f430d833), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */