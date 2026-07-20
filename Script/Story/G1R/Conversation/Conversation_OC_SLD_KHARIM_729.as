#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_SLD_KHARIM_729 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_SLD_KHARIM_729";
        }
        
        
        class UTopic_Hero__OC_SLD_KHARIM_729 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_SLD_KHARIM_729";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKharim() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetKirgo() const property
            {
                return GetCharacter(n"OC_GRD_KIRGO_251");
            }
            
            AGothicCharacterState GetGorHanis() const property
            {
                return GetCharacter(n"SC_TPL_GORHANIS_1422");
            }
        }
        
        
        class UChoiceKharim109751 : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xf0c92a1570bc23b8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKharim109751);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a315), Hero != nullptr && Hero.HasRecentlyDefeated(Kharim));
                    DB(int64(0x73254a4874b4a655), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51a), G1R.Kharim_Charged != 0);
                    DB(int64(0xa691a6912751f6d), G1R.Kharim_Challenged != 0);
                }
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Kharim))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Kharim_Charged == 0)
                    return false;
                
                if (G1R.Kharim_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0c92a1570bc23b5), EConversationDebugInfo::Executing);
                // Beliar.. What just happened?
                Kharim.AI.Say(LocText("TEXT_WIP_WRRWVYL_20240913_153212_41"));
                DC(int64(0xf0c92a1570bc23b5), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fa6), EConversationDebugInfo::Executing);
                
                // That was me kicking your ass. 
                Hero.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_134949"));
                DC(int64(0x2c6ecb01f6f76fa6), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fa7), EConversationDebugInfo::Executing);
                
                // Yeah, I noticed. Hurts like a bitch ... but I gotta say, ...
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_135105"));
                DC(int64(0x2c6ecb01f6f76fa7), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fa8), EConversationDebugInfo::Executing);
                // You're doing this to impress the Shadows, ain't you? I'd ...
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_135206"));
                DC(int64(0x2c6ecb01f6f76fa8), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fa9), EConversationDebugInfo::Executing);
                // All you're gonna be doing here is blow sugar up the ore ...
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_135229"));
                DC(int64(0x2c6ecb01f6f76fa9), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76faa), EConversationDebugInfo::Executing);
                // Anyway. Good fight. 
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_135340"));
                DC(int64(0x2c6ecb01f6f76faa), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23cb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc23cb), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23db), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                DC(int64(0xf0c92a1570bc23db), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e9526), EConversationDebugInfo::Executing);
                Kharim.MakeLootable();
                DC(int64(0x1abb8b94ed4e9526), EConversationDebugInfo::Done);
                DC(int64(0xbdb3c0ca2f1c7d0f), EConversationDebugInfo::Executing);
                G1R.Kharim_Charged -= 1;
                DC(int64(0xbdb3c0ca2f1c7d0f), EConversationDebugInfo::Done);
                DC(int64(0x16e0efa6d8d84c8a), EConversationDebugInfo::Executing);
                G1R.Kharim_Win = 1;
                DC(int64(0x16e0efa6d8d84c8a), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23ce), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0c92a1570bc23ce), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKharim109767 : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xf0c92a1570bc23be);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKharim109767);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a316), Kharim != nullptr && Kharim.HasRecentlyDefeated(Hero));
                    DB(int64(0x73254a4874b4a656), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51b), G1R.Kharim_Charged != 0);
                    DB(int64(0xa691a6912751f6e), G1R.Kharim_Challenged != 0);
                }
                
                if (Kharim != nullptr && !Kharim.HasRecentlyDefeated(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Kharim_Charged == 0)
                    return false;
                
                if (G1R.Kharim_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f76fab), EConversationDebugInfo::Executing);
                // I'll leave it at that. Be grateful I didn't break every ...
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_135405"));
                DC(int64(0x2c6ecb01f6f76fab), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23d2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc23d2), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23d9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                DC(int64(0xf0c92a1570bc23d9), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e9528), EConversationDebugInfo::Executing);
                Kharim.MakeLootable();
                DC(int64(0x1abb8b94ed4e9528), EConversationDebugInfo::Done);
                DC(int64(0xbdb3c0ca2f1c7d11), EConversationDebugInfo::Executing);
                G1R.Kharim_Charged -= 1;
                DC(int64(0xbdb3c0ca2f1c7d11), EConversationDebugInfo::Done);
                DC(int64(0x16e0efa6d8d84c8c), EConversationDebugInfo::Executing);
                G1R.Kharim_Lose = 1;
                DC(int64(0x16e0efa6d8d84c8c), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23d5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0c92a1570bc23d5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKharim233117 : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0x68ab4cab8d87151);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKharimChargeInsultGomezass);
            default Rules.HideIfKnows(UChoiceKharim233117);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68ab4cab8d87154), G1R.Kharim_Night == 1);
                    DB(int64(0x68ab4cab8d87157), GameTime.CurrentClockTime.IsBetween(FClockTime(7, 30), FClockTime(23, 59)));
                }
                
                if (G1R.Kharim_Night != 1)
                    return false;
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(7, 30), FClockTime(23, 59)))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x68ab4cab8d87165), Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f));
                
                if (Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f))
                {
                    DC(int64(0x5678c9c180befff5), EConversationDebugInfo::Executing);
                    G1R.Kharim_Charged = 1;
                    DC(int64(0x5678c9c180befff5), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180befff9), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                    DC(int64(0x5678c9c180befff9), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180befffb), EConversationDebugInfo::Executing);
                    Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait);
                    DC(int64(0x5678c9c180befffb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kharim_233117_exit_1");
                }
                else
                {
                    DC(int64(0x68ab4cab8d87173), EConversationDebugInfo::Executing);
                    // Let's get this over with. 
                    Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_134407_2238"));
                    DC(int64(0x68ab4cab8d87173), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb3b8f), EConversationDebugInfo::Executing);
                    G1R.Kharim_Charged = 1;
                    DC(int64(0x2c01e07654cb3b8f), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb3b91), EConversationDebugInfo::Executing);
                    Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Guide);
                    DC(int64(0x2c01e07654cb3b91), EConversationDebugInfo::Done);
                    DC(int64(0xf0c92a1570bc23af), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                    DC(int64(0xf0c92a1570bc23af), EConversationDebugInfo::Done);
                    DC(int64(0xf0c92a1570bc23b1), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Wait); }
                    DC(int64(0xf0c92a1570bc23b1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kharim_233117_exit_2");
                    DC(int64(0x68ab4cab8d87188), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x68ab4cab8d87188), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKharimCharge : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xddc22522e3258f83);
            default Caption = LocText("INFO_KHARIM_CHARGE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKharimWhat);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xddc22522e3258f84), G1R.Kharim_Charged == 0);
                    DB(int64(0xddc22522e3258f85), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xde82815708e50bc3), Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted());
                    DB(int64(0xd5bbd9d87f157d11), G1R.GorHanis_Charged == 0);
                    DB(int64(0x34afc38000899535), G1R.Kirgo_Charged == 0);
                    DB(int64(0x481e399de05c9a7e), G1R.Kharim_Challenged == 0);
                }
                
                if (G1R.Kharim_Charged != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && !Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted())
                    return false;
                
                if (G1R.GorHanis_Charged != 0)
                    return false;
                
                if (G1R.Kirgo_Charged != 0)
                    return false;
                
                if (G1R.Kharim_Challenged != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f86), EConversationDebugInfo::Executing);
                // I want to fight you.
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_15_00"));
                DC(int64(0xddc22522e3258f86), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f87), EConversationDebugInfo::Executing);
                
                // You? You've gotta be joking. I'll eat you for breakfast, ...
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_09_01"));
                DC(int64(0xddc22522e3258f87), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f88), EConversationDebugInfo::Executing);
                // Do yourself a favor and get lost.
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_09_02"));
                DC(int64(0xddc22522e3258f88), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKharimChargeBack,
                    UChoiceKharimChargeInsult
                );
            }
        }
        
        
        class UChoiceKharimChargeBack : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde7c);
            default Caption = LocText("INFO_KHARIM_CHARGE_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f8b), EConversationDebugInfo::Executing);
                // Fine. Let's forget about this.
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_BACK_15_00"));
                DC(int64(0xddc22522e3258f8b), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76f81), EConversationDebugInfo::Executing);
                
                // Hmm. 
                Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_132812"));
                DC(int64(0x2c6ecb01f6f76f81), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f8c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xddc22522e3258f8c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKharimChargeInsult : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde80);
            default Caption = LocText("INFO_KHARIM_CHARGE_INSULT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f8e), EConversationDebugInfo::Executing);
                // You're just a coward, are you? You know I'd make ...
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_15_00"));
                DC(int64(0xddc22522e3258f8e), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f8f), EConversationDebugInfo::Executing);
                
                // Couldn't think of a better line, freshie?
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_09_01"));
                DC(int64(0xddc22522e3258f8f), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKharimChargeInsultFace,
                    UChoiceKharimChargeInsultGoats,
                    UChoiceKharimChargeInsultStupid,
                    UChoiceKharimChargeInsultGomezass
                );
            }
        }
        
        
        class UChoiceKharimChargeInsultFace : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde95);
            default Caption = LocText("INFO_KHARIM_CHARGE_INSULT_FACE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceKharimChargeInsultFace);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258fa2), EConversationDebugInfo::Executing);
                // I was gonna say something about your scrawny arms, but ...
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_FACE_15_00"));
                DC(int64(0xddc22522e3258fa2), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258fa3), EConversationDebugInfo::Executing);
                
                // Funny.
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_FACE_09_01"));
                DC(int64(0xddc22522e3258fa3), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258fa4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xddc22522e3258fa4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKharimChargeInsultGoats : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde8b);
            default Caption = LocText("INFO_KHARIM_CHARGE_INSULT_GOATS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceKharimChargeInsultGoats);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f9a), EConversationDebugInfo::Executing);
                // Did your mother fuck a goat? You look the part. 
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOATS_15_00"));
                DC(int64(0xddc22522e3258f9a), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f9b), EConversationDebugInfo::Executing);
                
                // She probably did. 
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOATS_09_01"));
                DC(int64(0xddc22522e3258f9b), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f9c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xddc22522e3258f9c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKharimChargeInsultStupid : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde90);
            default Caption = LocText("INFO_KHARIM_CHARGE_INSULT_STUPID_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceKharimChargeInsultStupid);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f9e), EConversationDebugInfo::Executing);
                // I'm just trying to keep it simple. I'd hate to strain ...
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_STUPID_15_00"));
                DC(int64(0xddc22522e3258f9e), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f9f), EConversationDebugInfo::Executing);
                
                // Ain't that kind of you. But please, keep trying.
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_STUPID_09_01"));
                DC(int64(0xddc22522e3258f9f), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258fa0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xddc22522e3258fa0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKharimChargeInsultGomezass : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xe8603e87342bde82);
            default Caption = LocText("INFO_KHARIM_CHARGE_INSULT_GOMEZASS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceKharimChargeInsultGomezass);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f92), EConversationDebugInfo::Executing);
                // You're only here to get a chance to kiss Gomez' ass!
                Hero.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOMEZASS_15_00"));
                DC(int64(0xddc22522e3258f92), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f93), EConversationDebugInfo::Executing);
                
                // What? You bastard, you know NOTHING about me. I'm a New ...
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOMEZASS_09_01"));
                DC(int64(0xddc22522e3258f93), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f94), EConversationDebugInfo::Executing);
                // You wanna know why I'm really here? So I can smack the ...
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOMEZASS_09_02"));
                DC(int64(0xddc22522e3258f94), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f95), EConversationDebugInfo::Executing);
                // Which is EXACTLY what I'm gonna do to you. 
                Kharim.AI.Say(LocText("INFO_KHARIM_CHARGE_INSULT_GOMEZASS_09_03"));
                DC(int64(0xddc22522e3258f95), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_SLD_KHARIM, Document::UDocumentSegment_Glossary_OC_SLD_KHARIM_Duel);
                DC(int64(0x8f5d6e11921e1f83), EConversationDebugInfo::Executing);
                Quest::SCATTY_CHARGEKHARIM.StartQuest();
                DC(int64(0x8f5d6e11921e1f83), EConversationDebugInfo::Done);
                DB(int64(0x2c6ecb01f6f76f8c), GameTime.CurrentClockTime.IsBetween(FClockTime(7, 30), FClockTime(23, 59)));
                
                if (GameTime.CurrentClockTime.IsBetween(FClockTime(7, 30), FClockTime(23, 59)))
                {
                    DB(int64(0x5678c9c180beffef), Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f));
                    
                    if (Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f))
                    {
                        DC(int64(0x5678c9c180befff5), EConversationDebugInfo::Executing);
                        G1R.Kharim_Charged = 1;
                        DC(int64(0x5678c9c180befff5), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180befff9), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0x5678c9c180befff9), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180befffb), EConversationDebugInfo::Executing);
                        Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait);
                        DC(int64(0x5678c9c180befffb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x2c6ecb01f6f76f96), EConversationDebugInfo::Executing);
                        // Let's get this over with. 
                        Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_134407_2238"));
                        DC(int64(0x2c6ecb01f6f76f96), EConversationDebugInfo::Done);
                        DC(int64(0x2c01e07654cb3b8f), EConversationDebugInfo::Executing);
                        G1R.Kharim_Charged = 1;
                        DC(int64(0x2c01e07654cb3b8f), EConversationDebugInfo::Done);
                        DC(int64(0x2c01e07654cb3b91), EConversationDebugInfo::Executing);
                        Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Guide);
                        DC(int64(0x2c01e07654cb3b91), EConversationDebugInfo::Done);
                        DC(int64(0xf0c92a1570bc23af), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0xf0c92a1570bc23af), EConversationDebugInfo::Done);
                        DC(int64(0xf0c92a1570bc23b1), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Wait); }
                        DC(int64(0xf0c92a1570bc23b1), EConversationDebugInfo::Done);
                        DC(int64(0xf0c92a1570bc23ab), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf0c92a1570bc23ab), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0x2c6ecb01f6f76f92), EConversationDebugInfo::Executing);
                    // Tomorrow, in the arena. Don't you dare chicken out. 
                    Kharim.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_134402_2083"));
                    DC(int64(0x2c6ecb01f6f76f92), EConversationDebugInfo::Done);
                    DC(int64(0x68ab4cab8d87148), EConversationDebugInfo::Executing);
                    G1R.Kharim_Night = 1;
                    DC(int64(0x68ab4cab8d87148), EConversationDebugInfo::Done);
                    DC(int64(0x2c6ecb01f6f76f99), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2c6ecb01f6f76f99), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKharimExit : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xddc22522e3258f7d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f7e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xddc22522e3258f7e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKharimInarena : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xddc22522e3258fa5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKharimInarena);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OC_FIGHTTRAINING_04", 500.0f, int64(0xddc22522e3258fa5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xddc22522e3258fa6), G1R.Kharim_Charged != 0);
                }
                
                return G1R.Kharim_Charged != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xddc22522e3258fa9), G1R != nullptr && !G1R.HasReachedChapter(2));
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                {
                    DC(int64(0x5678c9c180bf0006), EConversationDebugInfo::Executing);
                    RequestStopConversationCamera();
                    DC(int64(0x5678c9c180bf0006), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf000c), EConversationDebugInfo::Executing);
                    RequestCameraToLookAtCharacter(Kharim);
                    DC(int64(0x5678c9c180bf000c), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf000e), EConversationDebugInfo::Executing);
                    Kharim.AI.GotoWaypoint(n"FP_OC_ARENAFIGHT2");
                    DC(int64(0x5678c9c180bf000e), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf0010), EConversationDebugInfo::Executing);
                    Hero.AI.TurnToCharacter(Kharim);
                    DC(int64(0x5678c9c180bf0010), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf0012), EConversationDebugInfo::Executing);
                    Kharim.AI.TurnToCharacter(Hero);
                    DC(int64(0x5678c9c180bf0012), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf00ee), EConversationDebugInfo::Executing);
                    Kharim.AI.DrawCombatWeapon();
                    DC(int64(0x5678c9c180bf00ee), EConversationDebugInfo::Done);
                    DC(int64(0xddc22522e3258faa), EConversationDebugInfo::Executing);
                    // Let's dance. 
                    Kharim.AI.Say(LocText("INFO_KHARIM_INARENA_09_00"));
                    DC(int64(0xddc22522e3258faa), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb3ba6), EConversationDebugInfo::Executing);
                    Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start);
                    DC(int64(0x2c01e07654cb3ba6), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf0014), EConversationDebugInfo::Executing);
                    Hero.AI.DrawCombatWeapon();
                    DC(int64(0x5678c9c180bf0014), EConversationDebugInfo::Done);
                    DC(int64(0x5678c9c180bf0016), EConversationDebugInfo::Executing);
                    Kharim.AI.StartTrainingFight(Hero);
                    DC(int64(0x5678c9c180bf0016), EConversationDebugInfo::Done);
                    DC(int64(0x1abb8b94ed4e9524), EConversationDebugInfo::Executing);
                    Kharim.MakeUnlootable();
                    DC(int64(0x1abb8b94ed4e9524), EConversationDebugInfo::Done);
                    DC(int64(0xaea48441f0985ae7), EConversationDebugInfo::Executing);
                    G1R.Kharim_Challenged = 1;
                    DC(int64(0xaea48441f0985ae7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kharim_inarena_exit_1");
                    DC(int64(0xddc22522e3258fae), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xddc22522e3258fae), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xddc22522e3258faf), EConversationDebugInfo::Executing);
                    // Let's bury the hatchet ... 
                    Kharim.AI.Say(LocText("SVM_9_LETSFORGETOURLITTLEFIGHT"));
                    DC(int64(0xddc22522e3258faf), EConversationDebugInfo::Done);
                    DC(int64(0x2c01e07654cb3bac), EConversationDebugInfo::Executing);
                    Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start);
                    DC(int64(0x2c01e07654cb3bac), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kharim_inarena_exit_2");
                    DC(int64(0xddc22522e3258fb1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xddc22522e3258fb1), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKharimWhat : UTopic_Hero__OC_SLD_KHARIM_729
        {
            default DebugId = int64(0xddc22522e3258f7f);
            default Caption = LocText("INFO_KHARIM_WHAT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKharimWhat);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xddc22522e3258f80), EConversationDebugInfo::Executing);
                // Hey, I'm new here. Who are you?
                Hero.AI.Say(LocText("INFO_KHARIM_WHAT_15_00"));
                DC(int64(0xddc22522e3258f80), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f81), EConversationDebugInfo::Executing);
                
                // I'm Kharim. And yeah, you really gotta be new here if ...
                Kharim.AI.Say(LocText("INFO_KHARIM_WHAT_09_01"));
                DC(int64(0xddc22522e3258f81), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76f62), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_132129"));
                DC(int64(0x2c6ecb01f6f76f62), EConversationDebugInfo::Done);
                DC(int64(0xddc22522e3258f82), EConversationDebugInfo::Executing);
                
                // Because I'm the best godsdamned fighter this pisspot of ...
                Kharim.AI.Say(LocText("INFO_KHARIM_WHAT_09_02"));
                DC(int64(0xddc22522e3258f82), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_SLD_KHARIM, Document::UDocumentSegment_Glossary_OC_SLD_KHARIM_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */