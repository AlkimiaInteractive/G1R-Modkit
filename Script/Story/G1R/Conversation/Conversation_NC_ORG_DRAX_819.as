#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_DRAX_819 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_DRAX_819";
        }
        
        
        class UTopic_OC_STT_DIEGO__NC_ORG_DRAX_819 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_DRAX_819";
            default WithCharacter = n"OC_STT_DIEGO";
            
            AGothicCharacterState GetDrax() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
        }
        
        
        class UTopic_Hero__NC_ORG_DRAX_819 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_DRAX_819";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDrax() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
        }
        
        
        class UChoiceDrax105758_0 : UTopic_OC_STT_DIEGO__NC_ORG_DRAX_819
        {
            default DebugId = int64(0xfac94e848b31dda4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrax105758);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"OC_STT_DIEGO", n"WP_OCS_STORY_DIEGO_DRAX", 1000.0f, int64(0xfac94e848b31dda4));
            default Rules.HideIfKnows(UChoiceDrax105758_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfac94e848b31ddb3), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31dda3), EConversationDebugInfo::Executing);
                // If it ain't the old Shadow!
                Drax.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_120508_2785"));
                DC(int64(0xfac94e848b31dda3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax105758 : UTopic_OC_STT_DIEGO__NC_ORG_DRAX_819
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrax105758_0);
            default Rules.HideIfKnows(UChoiceDrax105758);
            default DebugId = int64(0xfac94e848b31dda4);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfac94e848b31dda6), EConversationDebugInfo::Executing);
                
                // I'd stay away from these guys if I were you. They're New ...
                Diego.AI.Say(LocText("TEXT_WIP_OACNPYL_20241021_120605"));
                DC(int64(0xfac94e848b31dda6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax221041 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x802abf1da302f19e);
            default Caption = LocText("TEXT_WIP_HCMTZIF_20260212_144446");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg819DraxScavenger);
            default Rules.HideIfKnows(UChoiceDrax221041);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x802abf1da302f1a2), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x802abf1da302f19a), EConversationDebugInfo::Executing);
                
                // Are you hunting boars too?
                Hero.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_144446"));
                DC(int64(0x802abf1da302f19a), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f19b), EConversationDebugInfo::Executing);
                
                // What? course not. There's no boars here.
                Drax.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_144446_41"));
                DC(int64(0x802abf1da302f19b), EConversationDebugInfo::Done);
                DC(int64(0x802abf1da302f1a0), EConversationDebugInfo::Executing);
                // I'll make it outta here someday, I'm going to Myrtana ...
                Drax.AI.Say(LocText("TEXT_WIP_HCMTZIF_20260212_144553"));
                DC(int64(0x802abf1da302f1a0), EConversationDebugInfo::Done);
                DC(int64(0x4a17af0592127e5a), EConversationDebugInfo::Executing);
                // I'm telling you, I'll hunt them all ... Though, the ...
                Drax.AI.Say(LocText("TEXT_WIP_HLVUYVI_20260213_065504"));
                DC(int64(0x4a17af0592127e5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax221739 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x38a817431f4d12d6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrax221739);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_Drax_02", 400.0f, int64(0x38a817431f4d12d6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide));
                }
                
                return Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38a817431f4d12d3), EConversationDebugInfo::Executing);
                // Being a bandit is not only about raids and stealing. We ...
                Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_211508_2785"));
                DC(int64(0x38a817431f4d12d3), EConversationDebugInfo::Done);
                DC(int64(0x38a817431f4d12f1), EConversationDebugInfo::Executing);
                // It's a tough world, and we take what we can get.
                Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_211516"));
                DC(int64(0x38a817431f4d12f1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax221755 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x38a817431f4d12dc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrax221755);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_Drax_03", 400.0f, int64(0x38a817431f4d12dc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide));
                }
                
                return Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38a817431f4d12d9), EConversationDebugInfo::Executing);
                // Mercenaries accept us, we accept them. All fine.
                Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_211523"));
                DC(int64(0x38a817431f4d12d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax221771 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x38a817431f4d12e2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrax221771);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_Drax_04", 400.0f, int64(0x38a817431f4d12e2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide));
                }
                
                return Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38a817431f4d12df), EConversationDebugInfo::Executing);
                // Once you are in, do not mess up.
                Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_211525"));
                DC(int64(0x38a817431f4d12df), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax431683 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0xc600b249feaf9e3b);
            default Caption = LocText("TEXT_WIP_PALRZBB_20260123_203932");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrax432159);
            default Rules.HideIfKnows(UChoiceDrax431683);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6e82bb2180d8827d), EConversationDebugInfo::Executing);
                
                // Let's go to the New Camp.
                Hero.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_203932"));
                DC(int64(0x6e82bb2180d8827d), EConversationDebugInfo::Done);
                DB(int64(0xc600b249feaf9e2b), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                DB(int64(0xc600b249feaf9e32), Hero != nullptr && !Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")));
                DB(int64(0x38a817431f4d12d0), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                DB(int64(0xc600b249feaf9e15), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                DB(int64(0xc600b249feaf9e23), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_JARVIS_FIRST_08_00")));
                DB(int64(0x38a817431f4d12d1), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded());
                
                if (((Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded())) || ((Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_JARVIS_FIRST_08_00")) && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasSucceeded())))
                {
                    DC(int64(0x6e82bb2180d88283), EConversationDebugInfo::Executing);
                    // Alright, I'll show you the way. Stay tight.
                    Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_205656"));
                    DC(int64(0x6e82bb2180d88283), EConversationDebugInfo::Done);
                    DC(int64(0x38a817431f4d1255), EConversationDebugInfo::Executing);
                    Drax.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Drax_819_Guide);
                    DC(int64(0x38a817431f4d1255), EConversationDebugInfo::Done);
                    DC(int64(0xb2945bcd5a0bfe7), EConversationDebugInfo::Executing);
                    Drax.JoinPartyOf(Hero);
                    DC(int64(0xb2945bcd5a0bfe7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_drax_431683_exit_1");
                    DC(int64(0x38a817431f4d12bd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x38a817431f4d12bd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x66fe1e10ee7accc6), EConversationDebugInfo::Executing);
                    // You missed your chance. No worries, most people in here ...
                    Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_184109_3286"));
                    DC(int64(0x66fe1e10ee7accc6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_drax_431683_exit_2");
                    DC(int64(0x38a817431f4d128f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x38a817431f4d128f), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceDrax432055 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x66fe1e10ee7accb0);
            default Caption = LocText("TEXT_WIP_RQHNQN_20260123_182725");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDrax432055);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("ORG_819_DRAX_HUNTHERE_06_05"), int64(0x66fe1e10ee7accb0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc600b249feaf9dfb), Hero != nullptr && Hero.HasItem(UItMs_DraxHunterKnife, 1, 0));
                    DB(int64(0x256e258bb4055bd6), G1R.Drax_CanTeach == 1);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_DraxHunterKnife, 1, 0))
                    return false;
                
                if (G1R.Drax_CanTeach != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x66fe1e10ee7accae), EConversationDebugInfo::Executing);
                // I found your Hunting Knife.
                Hero.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_182725"));
                DC(int64(0x66fe1e10ee7accae), EConversationDebugInfo::Done);
                DC(int64(0xc600b249feaf9e03), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Drax, UItMs_DraxHunterKnife, 1);
                DC(int64(0xc600b249feaf9e03), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accaf), EConversationDebugInfo::Executing);
                // You - thanks, man! Well, I already thought it would be ...
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_182725_41"));
                DC(int64(0x66fe1e10ee7accaf), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accb3), EConversationDebugInfo::Executing);
                // Do not think you can learn from me for free now. But I ...
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183021"));
                DC(int64(0x66fe1e10ee7accb3), EConversationDebugInfo::Done);
                DC(int64(0x19cc118a750aa477), EConversationDebugInfo::Executing);
                Drax.AddItemToInventory(UItRw_Bow_Small_01, 1);
                DC(int64(0x19cc118a750aa477), EConversationDebugInfo::Done);
                DC(int64(0x19cc118a750aa479), EConversationDebugInfo::Executing);
                Drax.AI.GiveItemTo(Hero, UItRw_Bow_Small_01, 1);
                DC(int64(0x19cc118a750aa479), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax432159 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x66fe1e10ee7accb8);
            default Caption = LocText("TEXT_WIP_RQHNQN_20260123_183427");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrax432055);
            default Rules.HideIfKnows(UChoiceDrax432159);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc600b249feaf9e15), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0xc600b249feaf9e23), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_JARVIS_FIRST_08_00")));
                    DB(int64(0xc600b249feaf9e2b), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0xc600b249feaf9e32), Hero != nullptr && !Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_JARVIS_FIRST_08_00")))
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x66fe1e10ee7accb6), EConversationDebugInfo::Executing);
                // Do you think I have what it takes to become a bandit?
                Hero.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183427"));
                DC(int64(0x66fe1e10ee7accb6), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accb7), EConversationDebugInfo::Executing);
                
                // No idea. Loyality and the will to learn, that's what it ...
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183427_2238"));
                DC(int64(0x66fe1e10ee7accb7), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accba), EConversationDebugInfo::Executing);
                // Do you got it? We'll see. But, I can get you to our camp ...
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183711"));
                DC(int64(0x66fe1e10ee7accba), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accbb), EConversationDebugInfo::Executing);
                // What do you think? Do you take a chance?
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183722"));
                DC(int64(0x66fe1e10ee7accbb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrax432191 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x66fe1e10ee7accc2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_drax_431683_exit_1");
            default Rules.HideIfKnows(UChoiceDrax432191);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_7", 300.0f, int64(0x66fe1e10ee7accc2));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x66fe1e10ee7accc1), EConversationDebugInfo::Executing);
                // Here we are. The New Camp.
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183831_2785"));
                DC(int64(0x66fe1e10ee7accc1), EConversationDebugInfo::Done);
                DC(int64(0x66fe1e10ee7accc4), EConversationDebugInfo::Executing);
                // Have a drink on me in the tavern. Talk to you later.
                Drax.AI.Say(LocText("TEXT_WIP_RQHNQN_20260123_183845"));
                DC(int64(0x66fe1e10ee7accc4), EConversationDebugInfo::Done);
                DC(int64(0x38a817431f4d1298), EConversationDebugInfo::Executing);
                Drax.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Drax_819_Start);
                DC(int64(0x38a817431f4d1298), EConversationDebugInfo::Done);
                DC(int64(0xb2945bcd5a0bfe9), EConversationDebugInfo::Executing);
                Drax.LeavePartyOf(Hero);
                DC(int64(0xb2945bcd5a0bfe9), EConversationDebugInfo::Done);
                DC(int64(0x38a817431f4d129c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x38a817431f4d129c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDrax432556 : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x6e82bb2180d8828f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrax432556);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_Guide_Path_FromTo_NewCamp_Drax_start", 400.0f, int64(0x6e82bb2180d8828f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf7e1f6d991f5f9a7), Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide));
                }
                
                return Drax != nullptr && Drax.HasAssignedDailyRoutine(UDailyRoutine_NC_ORG_Drax_819_Guide);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6e82bb2180d88292), EConversationDebugInfo::Executing);
                // Ah the Old Camp is rich, and they do not want to share. ...
                Drax.AI.Say(LocText("TEXT_WIP_PALRZBB_20260123_211520"));
                DC(int64(0x6e82bb2180d88292), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg819DraxCreatures : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e4314708036c);
            default Caption = LocText("ORG_819_DRAX_CREATURES_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg819DraxScavenger);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e4314708036e), EConversationDebugInfo::Executing);
                
                // What else can you teach me about hunting?
                Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_15_00"));
                DC(int64(0x3196e4314708036e), EConversationDebugInfo::Done);
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                
                if ((Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained)))
                {
                    DC(int64(0x3196e43147080370), EConversationDebugInfo::Executing);
                    // As it goes, a lot - but that's gonna cost you a whole ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_06_01"));
                    DC(int64(0x3196e43147080370), EConversationDebugInfo::Done);
                    DC(int64(0x3196e43147080371), EConversationDebugInfo::Executing);
                    // I can show you how to skin animals, or pull their teeth ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_06_02"));
                    DC(int64(0x3196e43147080371), EConversationDebugInfo::Done);
                    DC(int64(0x3196e43147080372), EConversationDebugInfo::Executing);
                    // Traders are gonna make you a good price.
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_06_03"));
                    DC(int64(0x3196e43147080372), EConversationDebugInfo::Done);
                    Subdialog(
                        UChoiceOrg819DraxCreaturesPrettymuch,
                        UChoiceOrg819DraxCreaturesZahn,
                        UChoiceOrg819DraxCreaturesFell,
                        UChoiceOrg819DraxCreaturesKralle,
                        UChoiceOrg819DraxCreaturesHaut,
                        UChoiceOrg819DraxCreaturesBack
                    );
                }
                else
                {
                    DC(int64(0x3196e431470803ae), EConversationDebugInfo::Executing);
                    // I've told you everything I know.
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_TAUGHTALL_06_00"));
                    DC(int64(0x3196e431470803ae), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesPrettymuch : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e43147080374);
            default Caption = LocText("TEXT_CHOICE_ORG_819_DRAX_CREATURES_PRETTYMUCH");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e43147080375), EConversationDebugInfo::Executing);
                // You're asking for a lot of nuggets.
                Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_PRETTYMUCH_15_00"));
                DC(int64(0x3196e43147080375), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080376), EConversationDebugInfo::Executing);
                
                // Maybe. But you can make a lot of nuggets with that ...
                Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_PRETTYMUCH_06_01"));
                DC(int64(0x3196e43147080376), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080377), EConversationDebugInfo::Executing);
                // Kill an animal without knowin' how to gut it, and ...
                Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_PRETTYMUCH_06_02"));
                DC(int64(0x3196e43147080377), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080378), EConversationDebugInfo::Executing);
                // Which in turn means you missed out on a beautiful hide ...
                Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_PRETTYMUCH_06_03"));
                DC(int64(0x3196e43147080378), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080379), EConversationDebugInfo::Executing);
                // If I was you, I'd learn that stuff as soon as I could.
                Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_PRETTYMUCH_06_04"));
                DC(int64(0x3196e43147080379), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesZahn : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e4314708037a);
            default Caption = LocText("TEXT_CHOICE_ORG_819_DRAX_CREATURES_ZAHN");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Teeth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e4314708037b), EConversationDebugInfo::Executing);
                
                // How do I get to the teeth?
                Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_ZAHN_15_00"));
                DC(int64(0x3196e4314708037b), EConversationDebugInfo::Done);
                DB(int64(0x3196e4314708037d), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Teeth_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Teeth_Trained))
                {
                    DB(int64(0x3196e4314708037f), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Teeth_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Teeth_Trained))
                    {
                        DC(int64(0x3196e43147080382), EConversationDebugInfo::Executing);
                        // You've gotta make sure they don't break. Put your knife ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_ZAHN_06_01"));
                        DC(int64(0x3196e43147080382), EConversationDebugInfo::Done);
                        DC(int64(0x3196e43147080383), EConversationDebugInfo::Executing);
                        // Wolves, snappers, and shadowstalkers are good sources. 
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_ZAHN_06_02"));
                        DC(int64(0x3196e43147080383), EConversationDebugInfo::Done);
                        DC(int64(0x3196e43147080384), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Teeth_Trained);
                        DC(int64(0x3196e43147080384), EConversationDebugInfo::Done);
                        DC(int64(0xd4e50e1a3a89a3bb), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd4e50e1a3a89a3bb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3196e43147080386), EConversationDebugInfo::Executing);
                        // Nuggets first, freshie. Like I said, life ain't free.
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEIN_ERZ_06_00"));
                        DC(int64(0x3196e43147080386), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x3196e43147080385), EConversationDebugInfo::Executing);
                    // Sorry, green-blood, but it's too soon for that. Get more ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEINE_LP_06_00"));
                    DC(int64(0x3196e43147080385), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesFell : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e43147080387);
            default Caption = LocText("TEXT_CHOICE_ORG_819_DRAX_CREATURES_FELL");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Fur);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e43147080388), EConversationDebugInfo::Executing);
                // All right - teach me how to skin.
                Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_FELL_15_00"));
                DC(int64(0x3196e43147080388), EConversationDebugInfo::Done);
                DB(int64(0x3196e4314708038a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Fur_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Fur_Trained))
                {
                    DB(int64(0x3196e4314708038c), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Fur_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Fur_Trained))
                    {
                        DC(int64(0x3196e4314708038f), EConversationDebugInfo::Executing);
                        // All right, first and foremost, skin from the front to ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_FELL_06_01"));
                        DC(int64(0x3196e4314708038f), EConversationDebugInfo::Done);
                        DC(int64(0x3196e43147080390), EConversationDebugInfo::Executing);
                        // Wolf and shadowbeast hides are great for making clothes. ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_FELL_06_02"));
                        DC(int64(0x3196e43147080390), EConversationDebugInfo::Done);
                        DC(int64(0x3196e43147080391), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Fur_Trained);
                        DC(int64(0x3196e43147080391), EConversationDebugInfo::Done);
                        DC(int64(0xd4e50e1a3a89a3c3), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd4e50e1a3a89a3c3), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3196e43147080393), EConversationDebugInfo::Executing);
                        // Nuggets first, freshie. As I said, life ain't free.
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEIN_ERZ_06_01"));
                        DC(int64(0x3196e43147080393), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x3196e43147080392), EConversationDebugInfo::Executing);
                    // Sorry, green-blood, but it's too soon for that. Get more ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEINE_LP_06_01"));
                    DC(int64(0x3196e43147080392), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesKralle : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e43147080394);
            default Caption = LocText("TEXT_CHOICE_ORG_819_DRAX_CREATURES_KRALLE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Claw);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x3196e43147080396), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Claw_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Claw_Trained))
                {
                    DB(int64(0x3196e43147080398), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Claw_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Claw_Trained))
                    {
                        DC(int64(0x3196e4314708039b), EConversationDebugInfo::Executing);
                        // Okay - teach me how to pull claws.
                        Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_KRALLE_15_00"));
                        DC(int64(0x3196e4314708039b), EConversationDebugInfo::Done);
                        DC(int64(0x3196e4314708039c), EConversationDebugInfo::Executing);
                        
                        // That's a piece of cake once you know the secret: you've ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KRALLE_06_01"));
                        DC(int64(0x3196e4314708039c), EConversationDebugInfo::Done);
                        DC(int64(0x3196e4314708039d), EConversationDebugInfo::Executing);
                        // Lizards are best for hunting claws. But you'll see which ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KRALLE_06_02"));
                        DC(int64(0x3196e4314708039d), EConversationDebugInfo::Done);
                        DC(int64(0x3196e4314708039e), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Claw_Trained);
                        DC(int64(0x3196e4314708039e), EConversationDebugInfo::Done);
                        DC(int64(0xd4e50e1a3a89a3ca), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd4e50e1a3a89a3ca), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3196e431470803a0), EConversationDebugInfo::Executing);
                        // Nuggets first, freshie. As I said, life ain't free.
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEIN_ERZ_06_02"));
                        DC(int64(0x3196e431470803a0), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x3196e4314708039f), EConversationDebugInfo::Executing);
                    // Sorry, green-blood, but it's too soon for that. Get more ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEINE_LP_06_02"));
                    DC(int64(0x3196e4314708039f), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesHaut : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e431470803a1);
            default Caption = LocText("TEXT_CHOICE_ORG_819_DRAX_CREATURES_HAUT");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Skin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x3196e431470803a3), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Skin_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Skin_Trained))
                {
                    DB(int64(0x3196e431470803a5), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Skin_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Skin_Trained))
                    {
                        DC(int64(0x3196e431470803a8), EConversationDebugInfo::Executing);
                        // What about reptiles? How do I skin those?
                        Hero.AI.Say(LocText("ORG_819_DRAX_CREATURES_HAUT_15_00"));
                        DC(int64(0x3196e431470803a8), EConversationDebugInfo::Done);
                        DC(int64(0x3196e431470803a9), EConversationDebugInfo::Executing);
                        
                        // Well, first off, there ain't many reptiles in the Colony ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_HAUT_06_01"));
                        DC(int64(0x3196e431470803a9), EConversationDebugInfo::Done);
                        DC(int64(0x3196e431470803aa), EConversationDebugInfo::Executing);
                        // Just make a small cut on both sides, then the hide is ...
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_HAUT_06_02"));
                        DC(int64(0x3196e431470803aa), EConversationDebugInfo::Done);
                        DC(int64(0x3196e431470803ab), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Skin_Trained);
                        DC(int64(0x3196e431470803ab), EConversationDebugInfo::Done);
                        DC(int64(0xd4e50e1a3a89a3d1), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd4e50e1a3a89a3d1), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x3196e431470803ad), EConversationDebugInfo::Executing);
                        // Nuggets first, freshie. As I said, life ain't free.
                        Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEIN_ERZ_06_03"));
                        DC(int64(0x3196e431470803ad), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x3196e431470803ac), EConversationDebugInfo::Executing);
                    // Sorry, green-blood, but it's too soon for that. Get more ...
                    Drax.AI.Say(LocText("ORG_819_DRAX_CREATURES_KEINE_LP_06_03"));
                    DC(int64(0x3196e431470803ac), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg819DraxCreaturesBack : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x656b524d3ef3b8f9);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceOrg819DraxExit : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e4314708034f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e43147080350), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3196e43147080350), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg819DraxHunthere : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e43147080351);
            default Caption = LocText("ORG_819_DRAX_HUNTHERE_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg819DraxHunthere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e43147080352), EConversationDebugInfo::Executing);
                // You hunt here - right?
                Hero.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_15_00"));
                DC(int64(0x3196e43147080352), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080353), EConversationDebugInfo::Executing);
                
                // I wonder what gave it away. What do you want?
                Drax.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_06_01"));
                DC(int64(0x3196e43147080353), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080354), EConversationDebugInfo::Executing);
                
                // Do you have some hunting advice for me?
                Hero.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_15_02"));
                DC(int64(0x3196e43147080354), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080355), EConversationDebugInfo::Executing);
                
                // Hmm ... I guess, yeah. But that's gonna cost you. Life ...
                Drax.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_06_03"));
                DC(int64(0x3196e43147080355), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080356), EConversationDebugInfo::Executing);
                
                // Hmph, how much?
                Hero.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_15_04"));
                DC(int64(0x3196e43147080356), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080357), EConversationDebugInfo::Executing);
                
                // Well, how about a beer for starters. And after that, ...
                Drax.AI.Say(LocText("ORG_819_DRAX_HUNTHERE_06_05"));
                DC(int64(0x3196e43147080357), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_DRAX, Document::UDocumentSegment_Glossary_NC_ORG_DRAX_Introduction_Teacher);
            }
        }
        
        
        class UChoiceOrg819DraxNoBeer : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x8393a8f93bdbac98);
            default Caption = LocText("ORG_819_DRAX_SCAVENGER_KEIN_BIER_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg819DraxHunthere);
            default Rules.HideIfKnows(UChoiceOrg819DraxNoBeer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8393a8f93bdbac9f), Hero != nullptr && !Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                    DB(int64(0xad0c0d922193073e), G1R.Drax_GotBeer == 0);
                }
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                    return false;
                
                if (G1R.Drax_GotBeer != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8393a8f93bdbac96), EConversationDebugInfo::Executing);
                // I haven't got any beer on me.
                Hero.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_KEIN_BIER_15_00"));
                DC(int64(0x8393a8f93bdbac96), EConversationDebugInfo::Done);
                DC(int64(0x8393a8f93bdbac97), EConversationDebugInfo::Executing);
                
                // Well, then go get some - trust me, you ain't never ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_KEIN_BIER_06_01"));
                DC(int64(0x8393a8f93bdbac97), EConversationDebugInfo::Done);
                DC(int64(0x8393a8f93bdbac9a), EConversationDebugInfo::Executing);
                // There's a lot I can teach you about hunting, but it's ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_KEIN_BIER_06_02"));
                DC(int64(0x8393a8f93bdbac9a), EConversationDebugInfo::Done);
                DC(int64(0x3196e4314708036b), EConversationDebugInfo::Executing);
                G1R.Drax_CanTeach = 1;
                DC(int64(0x3196e4314708036b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg819DraxScavenger : UTopic_Hero__NC_ORG_DRAX_819
        {
            default DebugId = int64(0x3196e43147080358);
            default Caption = LocText("ORG_819_DRAX_SCAVENGER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg819DraxHunthere);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8393a8f93bdbac9f), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                    DB(int64(0xad0c0d922193073f), G1R.Drax_GotBeer == 0);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                    return false;
                
                if (G1R.Drax_GotBeer != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3196e4314708035c), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Drax, UItFo_Potion_Beer, 1);
                DC(int64(0x3196e4314708035c), EConversationDebugInfo::Done);
                DC(int64(0x3196e4314708035d), EConversationDebugInfo::Executing);
                // All right, here's your beer. Now tell me something about ...
                Hero.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_15_00"), bUnskippable = true);
                DC(int64(0x3196e4314708035d), EConversationDebugInfo::Done);
                DB(int64(0x3196e4314708035f), Drax != nullptr && Drax.IsSitting());
                
                if (Drax != nullptr && Drax.IsSitting())
                {
                    DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                    DC(int64(0x123f53d08c63c7ed), EConversationDebugInfo::Executing);
                    Drax.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                    DC(int64(0x123f53d08c63c7ed), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                    DC(int64(0x123f53d08c63c7ef), EConversationDebugInfo::Executing);
                    Drax.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                    DC(int64(0x123f53d08c63c7ef), EConversationDebugInfo::Done);
                }
                DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                Drax.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080363), EConversationDebugInfo::Executing);
                // Alright. When you run into a group of scavengers, that's ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_06_01"));
                DC(int64(0x3196e43147080363), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080364), EConversationDebugInfo::Executing);
                // It's child's play, really: the second you get close ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_06_02"));
                DC(int64(0x3196e43147080364), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080365), EConversationDebugInfo::Executing);
                // If you're good and hit him before he hits you, keep at ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_06_03"));
                DC(int64(0x3196e43147080365), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080366), EConversationDebugInfo::Executing);
                // If he hits you first, though ... well, just don't let ...
                Drax.AI.Say(LocText("ORG_819_DRAX_SCAVENGER_06_04"));
                DC(int64(0x3196e43147080366), EConversationDebugInfo::Done);
                DC(int64(0x3196e43147080367), EConversationDebugInfo::Executing);
                G1R.Drax_GotBeer = 1;
                DC(int64(0x3196e43147080367), EConversationDebugInfo::Done);
                DC(int64(0x3196e4314708036b), EConversationDebugInfo::Executing);
                G1R.Drax_CanTeach = 1;
                DC(int64(0x3196e4314708036b), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */