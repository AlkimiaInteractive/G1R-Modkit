#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_GORHANIS_1422 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_GORHANIS_1422";
        }
        
        
        class UTopic_Hero__SC_TPL_GORHANIS_1422 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_GORHANIS_1422";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorHanis() const property
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
            
            AGothicCharacterState GetKharim() const property
            {
                return GetCharacter(n"OC_SLD_KHARIM_729");
            }
        }
        
        
        class UChoiceGorHanis157676 : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xcea9713af7e56c6d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGorHanis157676);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a315), Hero != nullptr && Hero.HasRecentlyDefeated(GorHanis));
                    DB(int64(0x73254a4874b4a655), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51a), G1R.GorHanis_Charged != 0);
                    DB(int64(0xa691a6912751f6d), G1R.GorHanis_Challenged != 0);
                }
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(GorHanis))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.GorHanis_Charged == 0)
                    return false;
                
                if (G1R.GorHanis_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcea9713af7e56c6c), EConversationDebugInfo::Executing);
                // I ... how? 
                GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_174420_3286"));
                DC(int64(0xcea9713af7e56c6c), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5c6), EConversationDebugInfo::Executing);
                
                // Just kept hitting you ... 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154931"));
                DC(int64(0x5dcd7126285f5c6), EConversationDebugInfo::Done);
                DC(int64(0xcea9713af7e56c72), EConversationDebugInfo::Executing);
                
                // But ... you're an infidel. Has the Sleeper forsaken me? 
                GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_174811"));
                DC(int64(0xcea9713af7e56c72), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5c7), EConversationDebugInfo::Executing);
                // I ... I must pray. Excuse me. 
                GorHanis.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154959"));
                DC(int64(0x5dcd7126285f5c7), EConversationDebugInfo::Done);
                DC(int64(0xa8821a85f0f6c8c7), EConversationDebugInfo::Executing);
                GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start);
                DC(int64(0xa8821a85f0f6c8c7), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e953e), EConversationDebugInfo::Executing);
                GorHanis.MakeLootable();
                DC(int64(0x1abb8b94ed4e953e), EConversationDebugInfo::Done);
                DC(int64(0x10f44f78329ee050), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                DC(int64(0x10f44f78329ee050), EConversationDebugInfo::Done);
                DC(int64(0x10f44f78329ee052), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                DC(int64(0x10f44f78329ee052), EConversationDebugInfo::Done);
                DC(int64(0xd619f574a2b323a9), EConversationDebugInfo::Executing);
                G1R.GorHanis_Charged -= 1;
                DC(int64(0xd619f574a2b323a9), EConversationDebugInfo::Done);
                DC(int64(0x16e0efa6d8d84c96), EConversationDebugInfo::Executing);
                G1R.GorHanis_Win = 1;
                DC(int64(0x16e0efa6d8d84c96), EConversationDebugInfo::Done);
                DC(int64(0xa8821a85f0f6c7d8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa8821a85f0f6c7d8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorHanis157958 : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xcea9713af7e56c76);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGorHanis157958);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc57744e51237a316), GorHanis != nullptr && GorHanis.HasRecentlyDefeated(Hero));
                    DB(int64(0x73254a4874b4a656), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xec5a70ca82b4d51b), G1R.GorHanis_Charged != 0);
                    DB(int64(0xa691a6912751f6e), G1R.GorHanis_Challenged != 0);
                }
                
                if (GorHanis != nullptr && !GorHanis.HasRecentlyDefeated(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.GorHanis_Charged == 0)
                    return false;
                
                if (G1R.GorHanis_Challenged == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcea9713af7e56c75), EConversationDebugInfo::Executing);
                // The Sleeper works through my blade. 
                GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_175327_2386"));
                DC(int64(0xcea9713af7e56c75), EConversationDebugInfo::Done);
                DB(int64(0xcea9713af7e56c79), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xcea9713af7e56c7b), EConversationDebugInfo::Executing);
                    // You were foolish to challenge me, but I applaud your ...
                    GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_175503_1609"));
                    DC(int64(0xcea9713af7e56c7b), EConversationDebugInfo::Done);
                    DC(int64(0x5dcd7126285f5c8), EConversationDebugInfo::Executing);
                    // Come to our camp, and better your ways - perhaps your ...
                    GorHanis.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155101"));
                    DC(int64(0x5dcd7126285f5c8), EConversationDebugInfo::Done);
                    DC(int64(0xa8821a85f0f6c8c7), EConversationDebugInfo::Executing);
                    GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start);
                    DC(int64(0xa8821a85f0f6c8c7), EConversationDebugInfo::Done);
                    DC(int64(0x1abb8b94ed4e953c), EConversationDebugInfo::Executing);
                    GorHanis.MakeLootable();
                    DC(int64(0x1abb8b94ed4e953c), EConversationDebugInfo::Done);
                    DC(int64(0x10f44f78329ee054), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                    DC(int64(0x10f44f78329ee054), EConversationDebugInfo::Done);
                    DC(int64(0x10f44f78329ee056), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                    DC(int64(0x10f44f78329ee056), EConversationDebugInfo::Done);
                    DC(int64(0xd619f574a2b323ab), EConversationDebugInfo::Executing);
                    G1R.GorHanis_Charged -= 1;
                    DC(int64(0xd619f574a2b323ab), EConversationDebugInfo::Done);
                    DC(int64(0x16e0efa6d8d84c98), EConversationDebugInfo::Executing);
                    G1R.GorHanis_Win = 1;
                    DC(int64(0x16e0efa6d8d84c98), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gor hanis_157958_exit_1");
                    DC(int64(0xa8821a85f0f6c7dd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa8821a85f0f6c7dd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_gor hanis_157958_exit_2");
                }
            }
        }
        
        
        class UChoiceGorHanis78987 : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0x33c8d6b2530f0dcc);
            default Caption = LocText("TEXT_NISEA_20231229_191446");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisArena);
            default Rules.HideIfKnows(UChoiceGorHanis78987);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33c8d6b2530f0dca), EConversationDebugInfo::Executing);
                // Big words ... 
                Hero.AI.Say(LocText("TEXT_NISEA_20231229_191446"));
                DC(int64(0x33c8d6b2530f0dca), EConversationDebugInfo::Done);
                DC(int64(0x33c8d6b2530f0dcb), EConversationDebugInfo::Executing);
                
                // Your mockery falls on deaf ears.
                GorHanis.AI.Say(LocText("TEXT_NISEA_20231229_191446_41"));
                DC(int64(0x33c8d6b2530f0dcb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorhanis616369 : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0x5678c9c180bf009a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGorhanis616369);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OC_FIGHTTRAINING_04", 500.0f, int64(0x5678c9c180bf009a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xddc22522e3258fa6), G1R.GorHanis_Charged != 0);
                }
                
                return G1R.GorHanis_Charged != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5678c9c180bf00c6), EConversationDebugInfo::Executing);
                RequestStopConversationCamera();
                DC(int64(0x5678c9c180bf00c6), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00d8), EConversationDebugInfo::Executing);
                RequestCameraToLookAtCharacter(GorHanis);
                DC(int64(0x5678c9c180bf00d8), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00da), EConversationDebugInfo::Executing);
                GorHanis.AI.GotoWaypoint(n"FP_OC_ARENAFIGHT2");
                DC(int64(0x5678c9c180bf00da), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00dc), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(GorHanis);
                DC(int64(0x5678c9c180bf00dc), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00de), EConversationDebugInfo::Executing);
                GorHanis.AI.TurnToCharacter(Hero);
                DC(int64(0x5678c9c180bf00de), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00e0), EConversationDebugInfo::Executing);
                GorHanis.AI.DrawCombatWeapon();
                DC(int64(0x5678c9c180bf00e0), EConversationDebugInfo::Done);
                DC(int64(0xa8821a85f0f6c87e), EConversationDebugInfo::Executing);
                // May he awaken. Come on!
                GorHanis.AI.Say(LocText("TEXT_NISEA_20240104_192026"));
                DC(int64(0xa8821a85f0f6c87e), EConversationDebugInfo::Done);
                DC(int64(0xa8821a85f0f6c8aa), EConversationDebugInfo::Executing);
                GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start);
                DC(int64(0xa8821a85f0f6c8aa), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00f8), EConversationDebugInfo::Executing);
                Hero.AI.DrawCombatWeapon();
                DC(int64(0x5678c9c180bf00f8), EConversationDebugInfo::Done);
                DC(int64(0x5678c9c180bf00fa), EConversationDebugInfo::Executing);
                GorHanis.AI.StartTrainingFight(Hero);
                DC(int64(0x5678c9c180bf00fa), EConversationDebugInfo::Done);
                DC(int64(0x1abb8b94ed4e953a), EConversationDebugInfo::Executing);
                GorHanis.MakeUnlootable();
                DC(int64(0x1abb8b94ed4e953a), EConversationDebugInfo::Done);
                DC(int64(0x5652a1d33a27847b), EConversationDebugInfo::Executing);
                G1R.GorHanis_Challenged = 1;
                DC(int64(0x5652a1d33a27847b), EConversationDebugInfo::Done);
                DC(int64(0xa8821a85f0f6c8b9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa8821a85f0f6c8b9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorhanisArena : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b06a);
            default Caption = LocText("INFO_GORHANIS_ARENA_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisWhat);
            default Rules.HideIfKnows(UChoiceGorhanisArena);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x66cd86d564980858), G1R.FireMagesDead == 0);
                }
                
                return G1R.FireMagesDead == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b06b), EConversationDebugInfo::Executing);
                // You fight in the arena?
                Hero.AI.Say(LocText("INFO_GORHANIS_ARENA_15_00"));
                DC(int64(0xea65d4e47b2b06b), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b06c), EConversationDebugInfo::Executing);
                
                // Indeed. The baals, our masters, sent me to fight here, ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_ARENA_08_01"));
                DC(int64(0xea65d4e47b2b06c), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b06d), EConversationDebugInfo::Executing);
                // My supreme discipline paired with my impeccable ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_ARENA_08_02"));
                DC(int64(0xea65d4e47b2b06d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorhanisCharge : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b07b);
            default Caption = LocText("INFO_GORHANIS_CHARGE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisArena);
            default Rules.HideIfKnows(UChoiceGorhanisCharge);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xddc22522e3258f84), G1R.GorHanis_Charged == 0);
                    DB(int64(0xddc22522e3258f85), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xde82815708e50bc3), Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted());
                    DB(int64(0xd5bbd9d87f157d1f), G1R.Kharim_Charged == 0);
                    DB(int64(0x34afc38000899546), G1R.Kirgo_Charged == 0);
                }
                
                if (G1R.GorHanis_Charged != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY != nullptr && !Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.HasBeenStarted())
                    return false;
                
                if (G1R.Kharim_Charged != 0)
                    return false;
                
                if (G1R.Kirgo_Charged != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b07c), EConversationDebugInfo::Executing);
                
                // I challenge you to a duel.
                Hero.AI.Say(LocText("INFO_GORHANIS_CHARGE_15_00"));
                DC(int64(0xea65d4e47b2b07c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORHANIS, Document::UDocumentSegment_Glossary_SC_TPL_GORHANIS_Duel);
                DC(int64(0x8f5d6e11921e1fa0), EConversationDebugInfo::Executing);
                Quest::SCATTY_CHARGEGORHANIS.StartQuest();
                DC(int64(0x8f5d6e11921e1fa0), EConversationDebugInfo::Done);
                DB(int64(0xabf3836f7b4cdf6a), Hero.GetLevelAttribute() >= 15);
                DB(int64(0xabf3836f7b4cdf7f), Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.HasBeenStarted());
                
                if (Hero.GetLevelAttribute() >= 15 && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.HasBeenStarted())
                {
                    DC(int64(0xcea9713af7e56c67), EConversationDebugInfo::Executing);
                    // Very well, let me show you the power bestowed upon me by ...
                    GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_173855_2785"));
                    DC(int64(0xcea9713af7e56c67), EConversationDebugInfo::Done);
                    DB(int64(0x5678c9c180bf004e), GorHanis != nullptr && GorHanis.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f));
                    
                    if (GorHanis != nullptr && GorHanis.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f))
                    {
                        DC(int64(0x5678c9c180bf005a), EConversationDebugInfo::Executing);
                        G1R.GorHanis_Charged = 1;
                        DC(int64(0x5678c9c180bf005a), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180bf006c), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0x5678c9c180bf006c), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180bf006e), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0x5678c9c180bf006e), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gorhanis_charge_exit_1");
                    }
                    else
                    {
                        DC(int64(0xa8821a85f0f6c791), EConversationDebugInfo::Executing);
                        G1R.GorHanis_Charged = 1;
                        DC(int64(0xa8821a85f0f6c791), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c79d), EConversationDebugInfo::Executing);
                        GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Guide);
                        DC(int64(0xa8821a85f0f6c79d), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c7a5), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0xa8821a85f0f6c7a5), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c7a7), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0xa8821a85f0f6c7a7), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gorhanis_charge_exit_2");
                        DC(int64(0xa8821a85f0f6c7b4), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xa8821a85f0f6c7b4), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0xa8821a85f0f6c834), EConversationDebugInfo::Executing);
                    // You? No. There's no glory in butchering some green-blood ...
                    GorHanis.AI.Say(LocText("INFO_GORHANIS_CHARGE_08_01"));
                    DC(int64(0xa8821a85f0f6c834), EConversationDebugInfo::Done);
                    DC(int64(0xa8821a85f0f6c835), EConversationDebugInfo::Executing);
                    // I'll fight you when you're worthy. 
                    GorHanis.AI.Say(LocText("INFO_GORHANIS_CHARGE_08_02"));
                    DC(int64(0xa8821a85f0f6c835), EConversationDebugInfo::Done);
                    DC(int64(0xa8821a85f0f6c836), EConversationDebugInfo::Executing);
                    // Ask the others first - I'm sure the mercenary and the ...
                    GorHanis.AI.Say(LocText("INFO_GORHANIS_CHARGE_08_03"));
                    DC(int64(0xa8821a85f0f6c836), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorhanis_charge_exit_3");
                    DC(int64(0xa8821a85f0f6c78b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa8821a85f0f6c78b), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGorhanisChargegood : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b080);
            default Caption = LocText("INFO_GORHANIS_CHARGEGOOD_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gorhanis_charge_exit_3");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xddc22522e3258f84), G1R.GorHanis_Charged == 0);
                    DB(int64(0x5e669123545dbff0), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (G1R.GorHanis_Charged != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b081), EConversationDebugInfo::Executing);
                // I've gotten stronger. Will you fight me now?
                Hero.AI.Say(LocText("INFO_GORHANIS_CHARGEGOOD_15_00"));
                DC(int64(0xea65d4e47b2b081), EConversationDebugInfo::Done);
                DB(int64(0xa8821a85f0f6c838), Hero.GetLevelAttribute() >= 15);
                DB(int64(0xda886b3c734c8bd7), Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.HasBeenStarted());
                
                if (Hero.GetLevelAttribute() >= 15 && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.HasBeenStarted())
                {
                    DC(int64(0xa8821a85f0f6c845), EConversationDebugInfo::Executing);
                    // Very well, let me show you the power bestowed upon me by ...
                    GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_173855_2785"));
                    DC(int64(0xa8821a85f0f6c845), EConversationDebugInfo::Done);
                    DB(int64(0x5678c9c180bf0077), GorHanis != nullptr && GorHanis.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f));
                    
                    if (GorHanis != nullptr && GorHanis.IsCloseToWaypoint(n"FP_OC_FIGHTTRAINING_04", 500.0f))
                    {
                        DC(int64(0x5678c9c180bf0085), EConversationDebugInfo::Executing);
                        G1R.GorHanis_Charged = 1;
                        DC(int64(0x5678c9c180bf0085), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180bf008f), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0x5678c9c180bf008f), EConversationDebugInfo::Done);
                        DC(int64(0x5678c9c180bf0091), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0x5678c9c180bf0091), EConversationDebugInfo::Done);
                        DC(int64(0x68b45c0693f6993a), EConversationDebugInfo::Executing);
                        Quest::SCATTY_CHARGEGORHANIS.StartQuest();
                        DC(int64(0x68b45c0693f6993a), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gorhanis_chargegood_exit_1");
                    }
                    else
                    {
                        DC(int64(0xa8821a85f0f6c7a7), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Wait); }
                        DC(int64(0xa8821a85f0f6c7a7), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c888), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Wait); }
                        DC(int64(0xa8821a85f0f6c888), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c88a), EConversationDebugInfo::Executing);
                        GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Guide);
                        DC(int64(0xa8821a85f0f6c88a), EConversationDebugInfo::Done);
                        DC(int64(0xa8821a85f0f6c88c), EConversationDebugInfo::Executing);
                        G1R.GorHanis_Charged = 1;
                        DC(int64(0xa8821a85f0f6c88c), EConversationDebugInfo::Done);
                        DC(int64(0x68b45c0693f6993c), EConversationDebugInfo::Executing);
                        Quest::SCATTY_CHARGEGORHANIS.StartQuest();
                        DC(int64(0x68b45c0693f6993c), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_gorhanis_chargegood_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa8821a85f0f6c83d), EConversationDebugInfo::Executing);
                    // You are unworthy. Train - not only your body, but also ...
                    GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_173858_3436"));
                    DC(int64(0xa8821a85f0f6c83d), EConversationDebugInfo::Done);
                    DC(int64(0xa8821a85f0f6c843), EConversationDebugInfo::Executing);
                    // Now leave. 
                    GorHanis.AI.Say(LocText("TEXT_MATTES_20231228_174119"));
                    DC(int64(0xa8821a85f0f6c843), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gorhanis_chargegood_exit_3");
                }
            }
        }
        
        
        class UChoiceGorhanisExit : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b065);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b066), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xea65d4e47b2b066), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGorhanisSleeper : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b06e);
            default Caption = LocText("INFO_GORHANIS_SLEEPER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisWhat);
            default Rules.HideIfKnows(UChoiceGorhanisSleeper);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b06f), EConversationDebugInfo::Executing);
                // Who is the Sleeper?
                Hero.AI.Say(LocText("INFO_GORHANIS_SLEEPER_15_00"));
                DC(int64(0xea65d4e47b2b06f), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b070), EConversationDebugInfo::Executing);
                
                // The gurus of the Brotherhood can answer that question ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_SLEEPER_08_01"));
                DC(int64(0xea65d4e47b2b070), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b071), EConversationDebugInfo::Executing);
                // All I will say is this: the Sleeper is our salvation. He ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_SLEEPER_08_02"));
                DC(int64(0xea65d4e47b2b071), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b072), EConversationDebugInfo::Executing);
                
                // In other words, you're waiting for your god to spring ...
                Hero.AI.Say(LocText("INFO_GORHANIS_SLEEPER_15_03"));
                DC(int64(0xea65d4e47b2b072), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b073), EConversationDebugInfo::Executing);
                
                // That's right. Well, smirk all you want, but the waiting ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_SLEEPER_08_04"));
                DC(int64(0xea65d4e47b2b073), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorhanisSummoning : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b074);
            default Caption = LocText("INFO_GORHANIS_SUMMONING_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisSleeper);
            default Rules.HideIfKnows(UChoiceGorhanisSummoning);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b075), EConversationDebugInfo::Executing);
                
                // What ritual are your gurus planning?
                Hero.AI.Say(LocText("INFO_GORHANIS_SUMMONING_15_00"));
                DC(int64(0xea65d4e47b2b075), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b076), EConversationDebugInfo::Executing);
                
                // A Hearing. Our prophet Y'Berion calls it the first step ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_SUMMONING_08_01"));
                DC(int64(0xea65d4e47b2b076), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b077), EConversationDebugInfo::Executing);
                // If you truly want to know more, go to our camp. 
                GorHanis.AI.Say(LocText("INFO_GORHANIS_SUMMONING_08_02"));
                DC(int64(0xea65d4e47b2b077), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorhanisWaytost : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b078);
            default Caption = LocText("INFO_GORHANIS_WAYTOST_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisSleeper);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGorhanisSummoning);
            default Rules.HideIfKnows(UChoiceGorhanisWaytost);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b079), EConversationDebugInfo::Executing);
                
                // Can you point me to that camp of yours?
                Hero.AI.Say(LocText("INFO_GORHANIS_WAYTOST_15_00"));
                DC(int64(0xea65d4e47b2b079), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b07a), EConversationDebugInfo::Executing);
                
                // I could, but we have novices here in the Old Camp who ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_WAYTOST_08_01"));
                DC(int64(0xea65d4e47b2b07a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGorhanisWhat : UTopic_Hero__SC_TPL_GORHANIS_1422
        {
            default DebugId = int64(0xea65d4e47b2b067);
            default Caption = LocText("INFO_GORHANIS_WHAT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGorhanisWhat);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xea65d4e47b2b068), EConversationDebugInfo::Executing);
                
                // What are you doing here?
                Hero.AI.Say(LocText("INFO_GORHANIS_WHAT_15_00"));
                DC(int64(0xea65d4e47b2b068), EConversationDebugInfo::Done);
                DC(int64(0xea65d4e47b2b069), EConversationDebugInfo::Executing);
                
                // Me? I fight for the glory of our lord and savior, the ...
                GorHanis.AI.Say(LocText("INFO_GORHANIS_WHAT_08_01"));
                DC(int64(0xea65d4e47b2b069), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORHANIS, Document::UDocumentSegment_Glossary_SC_TPL_GORHANIS_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */