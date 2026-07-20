#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_SCATTY_210 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_SCATTY_210";
        }
        
        
        class UTopic_Hero__OCR_GRD_SCATTY_210 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_SCATTY_210";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetScatty() const property
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
            
            AGothicCharacterState GetGorHanis() const property
            {
                return GetCharacter(n"SC_TPL_GORHANIS_1422");
            }
        }
        
        
        class UChoiceScatty156538 : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0xcea9713af7e56c57);
            default Caption = LocText("TEXT_MATTES_20231228_170548");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceScatty156538);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x192d18d4e64c6e16), G1R.GorHanis_Lose != 0);
                    DB(int64(0x192d18d4e64c6e21), G1R.GorHanis_Win != 0);
                }
                
                if (G1R.GorHanis_Lose != 0)
                    return true;
                
                if (G1R.GorHanis_Win != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcea9713af7e56c55), EConversationDebugInfo::Executing);
                // I challenged Gor Hanis.
                Hero.AI.Say(LocText("TEXT_MATTES_20231228_170548"));
                DC(int64(0xcea9713af7e56c55), EConversationDebugInfo::Done);
                DB(int64(0xcea9713af7e56c5a), G1R.GorHanis_Lose != 0);
                DB(int64(0xcea9713af7e56c5b), G1R.GorHanis_Win != 0);
                
                if (G1R.GorHanis_Lose != 0)
                {
                    DC(int64(0xcea9713af7e56c5d), EConversationDebugInfo::Executing);
                    // And he wiped the floor with you. Don't let it get to ...
                    Scatty.AI.Say(LocText("TEXT_MATTES_20231228_171000_2238"));
                    DC(int64(0xcea9713af7e56c5d), EConversationDebugInfo::Done);
                    DC(int64(0xcea9713af7e56c62), EConversationDebugInfo::Executing);
                    // Whether it's all the weed or the training, those ...
                    Scatty.AI.Say(LocText("TEXT_MATTES_20231228_171208"));
                    DC(int64(0xcea9713af7e56c62), EConversationDebugInfo::Done);
                    DC(int64(0x69ca3b568785e8bf), EConversationDebugInfo::Executing);
                    // Maybe next time.
                    Scatty.AI.Say(LocText("TEXT_NISEA_20240103_191629"));
                    DC(int64(0x69ca3b568785e8bf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_scatty_156538_exit_1");
                }
                else if (G1R.GorHanis_Win != 0)
                {
                    DC(int64(0xcea9713af7e56c5f), EConversationDebugInfo::Executing);
                    // And you beat the tar out of him. Not bad.
                    Scatty.AI.Say(LocText("TEXT_MATTES_20231228_171009_1924"));
                    DC(int64(0xcea9713af7e56c5f), EConversationDebugInfo::Done);
                    DC(int64(0xcea9713af7e56c63), EConversationDebugInfo::Executing);
                    // I wouldn't have put my ore on you, but seems I was ...
                    Scatty.AI.Say(LocText("TEXT_MATTES_20231228_171403"));
                    DC(int64(0xcea9713af7e56c63), EConversationDebugInfo::Done);
                    DC(int64(0x63819e1318111a49), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.SucceedQuest();
                    DC(int64(0x63819e1318111a49), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_scatty_156538_exit_2");
                }
                else
                {
                    
                    Other.Remember(n"choice_scatty_156538_exit_3");
                }
            }
        }
        
        
        class UChoiceScattyExit : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6cca);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6ccb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7f2fc06b6d6b6ccb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceScattyJoinoc : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6ccf);
            default Caption = LocText("DIA_SCATTY_JOINOC_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceScattyJoinoc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7f2fc06b6d6b6cd0), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x7f2fc06b6d6b6cd1), Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS != nullptr && Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS != nullptr && !Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6cd2), EConversationDebugInfo::Executing);
                // I wanna join the Old Camp. Is there anything you can do ...
                Hero.AI.Say(LocText("DIA_SCATTY_JOINOC_15_00"));
                DC(int64(0x7f2fc06b6d6b6cd2), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cd3), EConversationDebugInfo::Executing);
                
                // Diego already told you how this works, huh? Sure, maybe ...
                Scatty.AI.Say(LocText("DIA_SCATTY_JOINOC_01_01"));
                DC(int64(0x7f2fc06b6d6b6cd3), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cd4), EConversationDebugInfo::Executing);
                // See that ring over there? Some of the best fighters from ...
                Scatty.AI.Say(LocText("DIA_SCATTY_JOINOC_01_02"));
                DC(int64(0x7f2fc06b6d6b6cd4), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cd5), EConversationDebugInfo::Executing);
                // Challenge one of them and fight him. Depending on how ...
                Scatty.AI.Say(LocText("DIA_SCATTY_JOINOC_01_03"));
                DC(int64(0x7f2fc06b6d6b6cd5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ScattyStart);
                DC(int64(0x69ca3b568785cc13), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.StartQuest();
                DC(int64(0x69ca3b568785cc13), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScattyKharimsuccess : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6ce7);
            default Caption = LocText("DIA_SCATTY_KHARIMSUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceScattyKharimsuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c2b2e26119bc6cb), G1R.Kharim_Lose != 0);
                    DB(int64(0xda2779513bfb9245), G1R.Kharim_Win != 0);
                }
                
                if (G1R.Kharim_Lose != 0)
                    return true;
                
                if (G1R.Kharim_Win != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6ceb), EConversationDebugInfo::Executing);
                // I challenged Kharim.
                Hero.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_15_00"));
                DC(int64(0x7f2fc06b6d6b6ceb), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2433), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                DC(int64(0xf0c92a1570bc2433), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2444), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                DC(int64(0xf0c92a1570bc2444), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2446), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc2446), EConversationDebugInfo::Done);
                DB(int64(0x7f2fc06b6d6b6ced), G1R.Kharim_Lose != 0);
                DB(int64(0x7f2fc06b6d6b6cf5), G1R.Kharim_Win != 0);
                
                if (G1R.Kharim_Lose != 0)
                {
                    DC(int64(0x7f2fc06b6d6b6cee), EConversationDebugInfo::Executing);
                    // And, boy, did he kick your ass.
                    Scatty.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_01_01"));
                    DC(int64(0x7f2fc06b6d6b6cee), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ScattyKharimNotDefeated);
                    DB(int64(0x7f2fc06b6d6b6cf0), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    {
                        DC(int64(0x7f2fc06b6d6b6cf1), EConversationDebugInfo::Executing);
                        // Still, anyone who swings a sword at a New Camper is a ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_01_02"));
                        DC(int64(0x7f2fc06b6d6b6cf1), EConversationDebugInfo::Done);
                        DC(int64(0x7f2fc06b6d6b6cf2), EConversationDebugInfo::Executing);
                        // You're the type of guy we need around here. I'm gonna ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_01_03"));
                        DC(int64(0x7f2fc06b6d6b6cf2), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x69ca3b568785cc23), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_BROWNIEPOINTS_KHARIMLOSS);
                    DC(int64(0x69ca3b568785cc23), EConversationDebugInfo::Done);
                    DC(int64(0x63819e1318111a47), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.SucceedQuest();
                    DC(int64(0x63819e1318111a47), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_scatty_kharimsuccess_exit_1");
                }
                else if (G1R.Kharim_Win != 0)
                {
                    DC(int64(0x7f2fc06b6d6b6cf6), EConversationDebugInfo::Executing);
                    // And you kicked his ass. I gotta hand it to you, I didn't ...
                    Scatty.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_01_04"));
                    DC(int64(0x7f2fc06b6d6b6cf6), EConversationDebugInfo::Done);
                    DC(int64(0x7f2fc06b6d6b6cf7), EConversationDebugInfo::Executing);
                    // You impressed me, freshie. And trust me, that doesn't ...
                    Scatty.AI.Say(LocText("DIA_SCATTY_KHARIMSUCCESS_01_05"));
                    DC(int64(0x7f2fc06b6d6b6cf7), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ScattyImpressedKharim);
                    DC(int64(0x69ca3b568785cc2d), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.SucceedQuest();
                    DC(int64(0x69ca3b568785cc2d), EConversationDebugInfo::Done);
                    DC(int64(0x69ca3b568785cc2f), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_BROWNIEPOINTS_KHARIMVICTORY);
                    DC(int64(0x69ca3b568785cc2f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_scatty_kharimsuccess_exit_2");
                }
                else
                {
                    
                    Other.Remember(n"choice_scatty_kharimsuccess_exit_3");
                }
            }
        }
        
        
        class UChoiceScattyKirgosuccess : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6cd9);
            default Caption = LocText("DIA_SCATTY_KIRGOSUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceScattyKirgosuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c2b2e26119bc6ba), G1R.Kirgo_Lose != 0);
                    DB(int64(0xa691a6912751f78), G1R.Kirgo_Win != 0);
                }
                
                if (G1R.Kirgo_Lose != 0)
                    return true;
                
                if (G1R.Kirgo_Win != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6cdd), EConversationDebugInfo::Executing);
                // I fought Kirgo.
                Hero.AI.Say(LocText("DIA_SCATTY_KIRGOSUCCESS_15_00"));
                DC(int64(0x7f2fc06b6d6b6cdd), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc23ef), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Start); }
                DC(int64(0xf0c92a1570bc23ef), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2402), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorHanis))) { GorHanis.ExchangeDailyRoutineToClass(UDailyRoutine_SC_TPL_GorHanis_1422_Start); }
                DC(int64(0xf0c92a1570bc2402), EConversationDebugInfo::Done);
                DC(int64(0xf0c92a1570bc2404), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kharim))) { Kharim.ExchangeDailyRoutineToClass(UDailyRoutine_OC_SLD_Kharim_729_Start); }
                DC(int64(0xf0c92a1570bc2404), EConversationDebugInfo::Done);
                DB(int64(0x7f2fc06b6d6b6cdf), G1R.Kirgo_Lose != 0);
                DB(int64(0x2f37857fa1b704b1), G1R.Kirgo_Win != 0);
                
                if (G1R.Kirgo_Lose != 0)
                {
                    DC(int64(0x7f2fc06b6d6b6ce0), EConversationDebugInfo::Executing);
                    // Yeah, and he gave you a face full of regret. I saw it. 
                    Scatty.AI.Say(LocText("DIA_SCATTY_KIRGOSUCCESS_01_01"));
                    DC(int64(0x7f2fc06b6d6b6ce0), EConversationDebugInfo::Done);
                    DC(int64(0x7f2fc06b6d6b6ce1), EConversationDebugInfo::Executing);
                    // I hope you're not expecting praise for that, freshie.
                    Scatty.AI.Say(LocText("DIA_SCATTY_KIRGOSUCCESS_01_02"));
                    DC(int64(0x7f2fc06b6d6b6ce1), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ScattyKirgoNotDefeated);
                    
                    Other.Remember(n"choice_scatty_kirgosuccess_exit_1");
                }
                else if (G1R.Kirgo_Win != 0)
                {
                    DC(int64(0x7f2fc06b6d6b6ce4), EConversationDebugInfo::Executing);
                    // And you beat him up good. Not bad for a freshie ... I'm ...
                    Scatty.AI.Say(LocText("DIA_SCATTY_KIRGOSUCCESS_01_03"));
                    DC(int64(0x7f2fc06b6d6b6ce4), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ScattyImpressedKirgo);
                    DC(int64(0x69ca3b568785cc40), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SCATTY.SucceedQuest();
                    DC(int64(0x69ca3b568785cc40), EConversationDebugInfo::Done);
                    DC(int64(0x69ca3b568785cc42), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_BROWNIEPOINTS_KIRGOVICTORY);
                    DC(int64(0x69ca3b568785cc42), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_scatty_kirgosuccess_exit_2");
                }
                else
                {
                    
                    Other.Remember(n"choice_scatty_kirgosuccess_exit_3");
                }
            }
        }
        
        
        class UChoiceScattyOthercamps : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6cfa);
            default Caption = LocText("DIA_SCATTY_OTHERCAMPS_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScattyWhatdoyoudo);
            default Rules.HideIfKnows(UChoiceScattyOthercamps);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5cca5287241c863), Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_STANDAROUND_85", 500.0f));
                    DB(int64(0x5cca5287241c86f), Kharim != nullptr && Kharim.IsCloseToWaypoint(n"IO_OC_SHARP_04", 500.0f));
                    DB(int64(0x5cca5287241c87a), Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_STANDAROUND_04", 500.0f));
                }
                
                if (Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_STANDAROUND_85", 500.0f))
                    return true;
                
                if (Kharim != nullptr && Kharim.IsCloseToWaypoint(n"IO_OC_SHARP_04", 500.0f))
                    return true;
                
                if (Kharim != nullptr && Kharim.IsCloseToWaypoint(n"FP_OC_STANDAROUND_04", 500.0f))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6cfb), EConversationDebugInfo::Executing);
                // That fighter over there - isn't he from the New Camp? I ...
                Hero.AI.Say(LocText("DIA_SCATTY_OTHERCAMPS_15_00"));
                DC(int64(0x7f2fc06b6d6b6cfb), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cfc), EConversationDebugInfo::Executing);
                
                // Oh, that's easy: after a week of scraping up ore, there ...
                Scatty.AI.Say(LocText("DIA_SCATTY_OTHERCAMPS_01_01"));
                DC(int64(0x7f2fc06b6d6b6cfc), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cfd), EConversationDebugInfo::Executing);
                // Bets are way higher when that happens, and that's good ...
                Scatty.AI.Say(LocText("DIA_SCATTY_OTHERCAMPS_01_02"));
                DC(int64(0x7f2fc06b6d6b6cfd), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cfe), EConversationDebugInfo::Executing);
                // So, yeah, I don't like those guys either - but business ...
                Scatty.AI.Say(LocText("DIA_SCATTY_OTHERCAMPS_01_03"));
                DC(int64(0x7f2fc06b6d6b6cfe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScattyTrain : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6d03);
            default Caption = LocText("DIA_SCATTY_TRAIN_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScattyWhatdoyoudo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x959938528b9a19f), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xc2f3b0bf23e02494), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SCATTY, Document::UDocumentSegment_Glossary_OCR_GRD_SCATTY_Teacher);
                DB(int64(0x7f2fc06b6d6b6d06), G1R.LogScattytrain == 0);
                
                if (G1R.LogScattytrain == 0)
                {
                    DC(int64(0x69ca3b568785cc87), EConversationDebugInfo::Executing);
                    G1R.LogScattytrain = 1;
                    DC(int64(0x69ca3b568785cc87), EConversationDebugInfo::Done);
                }
                DC(int64(0x7f2fc06b6d6b6d08), EConversationDebugInfo::Executing);
                // Do you also train fighters?
                Hero.AI.Say(LocText("DIA_SCATTY_TRAIN_15_00"));
                DC(int64(0x7f2fc06b6d6b6d08), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6d09), EConversationDebugInfo::Executing);
                
                // Yeah, but not just for fun. If you want me to train you, ...
                Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_01_01"));
                DC(int64(0x7f2fc06b6d6b6d09), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceScattyTrain1h,
                    UChoiceScattyTrain2h,
                    UChoiceScattyTrainBack
                );
            }
        }
        
        
        class UChoiceScattyTrain1h : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x1667e7ccecfb665c);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_150807_1560");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2330b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                    DB(int64(0x1a491ba842e9958c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1667e7ccecfb665e), EConversationDebugInfo::Executing);
                // I want to be better with one-handed weapons. 
                Hero.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_15_00"));
                DC(int64(0x1667e7ccecfb665e), EConversationDebugInfo::Done);
                DB(int64(0x11b421d8254b891a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                {
                    DB(int64(0xcc853cdb43cca23b), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                    {
                        DC(int64(0x1667e7ccecfb6662), EConversationDebugInfo::Executing);
                        // Good choice. Much of it comes down to posture. Some ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_01"));
                        DC(int64(0x1667e7ccecfb6662), EConversationDebugInfo::Done);
                        DC(int64(0x1667e7ccecfb6663), EConversationDebugInfo::Executing);
                        // For the fight itself, momentum is the key. Don't stop ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_02"));
                        DC(int64(0x1667e7ccecfb6663), EConversationDebugInfo::Done);
                        DC(int64(0x1667e7ccecfb6664), EConversationDebugInfo::Executing);
                        // You can also use your sword to parry. If your opponent ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_03"));
                        DC(int64(0x1667e7ccecfb6664), EConversationDebugInfo::Done);
                        DC(int64(0x1667e7ccecfb6665), EConversationDebugInfo::Executing);
                        // What else ... right. When you're about to swing, but ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_04"));
                        DC(int64(0x1667e7ccecfb6665), EConversationDebugInfo::Done);
                        DC(int64(0x1667e7ccecfb6666), EConversationDebugInfo::Executing);
                        // Finally, some blows do more damage than the others. ...
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_05"));
                        DC(int64(0x1667e7ccecfb6666), EConversationDebugInfo::Done);
                        DC(int64(0x1667e7ccecfb6667), EConversationDebugInfo::Executing);
                        // But the better you get, the more often you'll land them. 
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_06"));
                        DC(int64(0x1667e7ccecfb6667), EConversationDebugInfo::Done);
                        DC(int64(0x69ca3b568785cc72), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Trained);
                        DC(int64(0x69ca3b568785cc72), EConversationDebugInfo::Done);
                        DC(int64(0x11b421d8254b8920), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x11b421d8254b8920), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1667e7ccecfb666a), EConversationDebugInfo::Executing);
                        // Good for you, but I told you: no nuggets, no lesson. 
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_2H_NOORE_01_00"));
                        DC(int64(0x1667e7ccecfb666a), EConversationDebugInfo::Done);
                        DC(int64(0x11b421d8254b891d), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x11b421d8254b891d), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x11b421d8254b891b), EConversationDebugInfo::Executing);
                    // Better come back another time - when you've got more ...
                    Scatty.AI.Say(LocText("TEXT_DDIAZ_20231019_112908"));
                    DC(int64(0x11b421d8254b891b), EConversationDebugInfo::Done);
                    DC(int64(0x11b421d8254b891e), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x11b421d8254b891e), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceScattyTrain2h : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x1667e7ccecfb6650);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_150807_3676");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2331b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0x118acb5747a17de9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1667e7ccecfb6652), EConversationDebugInfo::Executing);
                // I want to be a master with one-handed weapons. 
                Hero.AI.Say(LocText("DIA_SCATTY_TRAIN_2H_15_01"));
                DC(int64(0x1667e7ccecfb6652), EConversationDebugInfo::Done);
                DB(int64(0x11b421d8254b8909), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                {
                    DB(int64(0xcc853cdb43cca282), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                    {
                        DC(int64(0xa7deef969d1cb58b), EConversationDebugInfo::Executing);
                        // Hm. Yes, I think you're ready. You already know it's all ...
                        Scatty.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155521"));
                        DC(int64(0xa7deef969d1cb58b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb58c), EConversationDebugInfo::Executing);
                        // The next step is to create a proper sequence. You need ...
                        Scatty.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155527"));
                        DC(int64(0xa7deef969d1cb58c), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb58d), EConversationDebugInfo::Executing);
                        // It's like a dance, really. Don't let your opponent even ...
                        Scatty.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155532"));
                        DC(int64(0xa7deef969d1cb58d), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb59e), EConversationDebugInfo::Executing);
                        // Attacking like this won't just make it more likely ...
                        Scatty.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155612"));
                        DC(int64(0xa7deef969d1cb59e), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb5b1), EConversationDebugInfo::Executing);
                        // Let's see, what else ... oh, of course. Ripostes. If you ...
                        Scatty.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155624"));
                        DC(int64(0xa7deef969d1cb5b1), EConversationDebugInfo::Done);
                        DC(int64(0x69ca3b568785cc5b), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Master);
                        DC(int64(0x69ca3b568785cc5b), EConversationDebugInfo::Done);
                        DC(int64(0x11b421d8254b8913), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x11b421d8254b8913), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1667e7ccecfb665b), EConversationDebugInfo::Executing);
                        // Good for you, but I told you: no nuggets, no lesson. 
                        Scatty.AI.Say(LocText("DIA_SCATTY_TRAIN_2H_NOORE_01_00"));
                        DC(int64(0x1667e7ccecfb665b), EConversationDebugInfo::Done);
                        DC(int64(0x11b421d8254b8910), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x11b421d8254b8910), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x11b421d8254b890e), EConversationDebugInfo::Executing);
                    // Better come back another time - when you've got more ...
                    Scatty.AI.Say(LocText("TEXT_DDIAZ_20231019_112908"));
                    DC(int64(0x11b421d8254b890e), EConversationDebugInfo::Done);
                    DC(int64(0x11b421d8254b8911), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x11b421d8254b8911), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceScattyTrainBack : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x1667e7ccecfb664f);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceScattyWannabet : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6cff);
            default Caption = LocText("DIA_SCATTY_WANNABET_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScattyWhatdoyoudo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdf6a461744f7c234), G1R.PlaceholderCondition == 3);
                }
                
                return G1R.PlaceholderCondition == 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6d00), EConversationDebugInfo::Executing);
                // I want to bet.
                Hero.AI.Say(LocText("DIA_SCATTY_WANNABET_15_00"));
                DC(int64(0x7f2fc06b6d6b6d00), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6d01), EConversationDebugInfo::Executing);
                
                // Good to hear - there aren't any fights now, though. 
                Scatty.AI.Say(LocText("DIA_SCATTY_WANNABET_01_01"));
                DC(int64(0x7f2fc06b6d6b6d01), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6d02), EConversationDebugInfo::Executing);
                // The next will be in a couple of days. Just keep your ...
                Scatty.AI.Say(LocText("DIA_SCATTY_WANNABET_01_02"));
                DC(int64(0x7f2fc06b6d6b6d02), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScattyWhatdoyoudo : UTopic_Hero__OCR_GRD_SCATTY_210
        {
            default DebugId = int64(0x7f2fc06b6d6b6ccc);
            default Caption = LocText("DIA_SCATTY_WHATDOYOUDO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceScattyWhatdoyoudo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7f2fc06b6d6b6ccd), EConversationDebugInfo::Executing);
                
                // What are you doing here?
                Hero.AI.Say(LocText("DIA_SCATTY_WHATDOYOUDO_15_00"));
                DC(int64(0x7f2fc06b6d6b6ccd), EConversationDebugInfo::Done);
                DC(int64(0x7f2fc06b6d6b6cce), EConversationDebugInfo::Executing);
                
                // Me? I run the arena. Rounding up the wagers, recruiting ...
                Scatty.AI.Say(LocText("DIA_SCATTY_WHATDOYOUDO_01_01"));
                DC(int64(0x7f2fc06b6d6b6cce), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SCATTY, Document::UDocumentSegment_Glossary_OCR_GRD_SCATTY_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */