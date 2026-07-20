#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD05_216 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD05_216";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD05_216 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD05_216";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGateGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetDusty() const property
            {
                return GetCharacter(n"OC_VLK_DUSTY_524");
            }
        }
        
        
        class UChoiceGrd216Dustyzoll : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xc0df3c3d9aef7dcb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceGrd216Dustyzoll);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_GRD_216_DUSTY_ZOLL_LITTLEWALK_13_00"), int64(0xc0df3c3d9aef7dcb));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc0df3c3d9aef7dcc), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY.HasSucceeded());
                    DB(int64(0xc0df3c3d9aef7dce), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                    DB(int64(0xd0fcbe4ae7736b0d), Hero != nullptr && Hero.IsInPartyWith(Dusty));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInPartyWith(Dusty))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7dcf), EConversationDebugInfo::Executing);
                // Hold it right there. Where you takin' him? 
                GateGuard.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_13_00"));
                DC(int64(0xc0df3c3d9aef7dcf), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrd216DustyzollPissoff,
                    UChoiceGrd216DustyzollTopsi,
                    UChoiceGrd216DustyzollLittlewalk
                );
            }
        }
        
        
        class UChoiceGrd216DustyzollPissoff : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xe8603e87342bea1f);
            default Caption = LocText("DIA_GRD_216_DUSTY_ZOLL_PISSOFF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7dd2), EConversationDebugInfo::Executing);
                // None of your business.
                Hero.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_PISSOFF_15_00"));
                DC(int64(0xc0df3c3d9aef7dd2), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7dd3), EConversationDebugInfo::Executing);
                
                // Oh, but I think it is. 
                GateGuard.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_PISSOFF_13_00"));
                DC(int64(0xc0df3c3d9aef7dd3), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466af), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediately(Hero);
                DC(int64(0xb4a1c7ed84466af), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466b1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Dusty))) { Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Start); }
                DC(int64(0xb4a1c7ed84466b1), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466b3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Dusty))) { Dusty.RemoveImmortality(); }
                DC(int64(0xb4a1c7ed84466b3), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7dd8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0df3c3d9aef7dd8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd216DustyzollTopsi : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xe8603e87342bea28);
            default Caption = LocText("DIA_GRD_216_DUSTY_ZOLL_TOPSI_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7dda), EConversationDebugInfo::Executing);
                // We're leaving for the Swamp Camp. 
                Hero.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_TOPSI_15_00"));
                DC(int64(0xc0df3c3d9aef7dda), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7ddb), EConversationDebugInfo::Executing);
                
                // No, mate. You ain't goin' anywhere. 
                GateGuard.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_TOPSI_13_00"));
                DC(int64(0xc0df3c3d9aef7ddb), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466ba), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediately(Hero);
                DC(int64(0xb4a1c7ed84466ba), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466bc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Dusty))) { Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Start); }
                DC(int64(0xb4a1c7ed84466bc), EConversationDebugInfo::Done);
                DC(int64(0xb4a1c7ed84466be), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Dusty))) { Dusty.RemoveImmortality(); }
                DC(int64(0xb4a1c7ed84466be), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7de0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0df3c3d9aef7de0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd216DustyzollLittlewalk : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xe8603e87342bea31);
            default Caption = LocText("DIA_GRD_216_DUSTY_ZOLL_LITTLEWALK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7de3), EConversationDebugInfo::Executing);
                // We're just going for a walk. Here's a hundred nuggets. 
                Hero.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_LITTLEWALK_15_00"));
                DC(int64(0xc0df3c3d9aef7de3), EConversationDebugInfo::Done);
                DB(int64(0xc0df3c3d9aef7de5), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0xc0df3c3d9aef7de6), EConversationDebugInfo::Executing);
                    // I ain't seen a soul ... 
                    GateGuard.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_LITTLEWALK_13_00"));
                    DC(int64(0xc0df3c3d9aef7de6), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_Bribe);
                    DC(int64(0xb4a1c7ed84466c7), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(GateGuard, UItMi_Orenugget, 100);
                    DC(int64(0xb4a1c7ed84466c7), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84466cb), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_SC_RECRUITDUSTY_BRIBE);
                    DC(int64(0xb4a1c7ed84466cb), EConversationDebugInfo::Done);
                    DC(int64(0xc0df3c3d9aef7dea), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc0df3c3d9aef7dea), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc0df3c3d9aef7deb), EConversationDebugInfo::Executing);
                    // This is a joke or what? Not with me, lad!
                    GateGuard.AI.Say(LocText("DIA_GRD_216_DUSTY_ZOLL_LITTLEWALK_13_02"));
                    DC(int64(0xc0df3c3d9aef7deb), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84466d1), EConversationDebugInfo::Executing);
                    GateGuard.AI.StartAttackingImmediately(Hero);
                    DC(int64(0xb4a1c7ed84466d1), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84466d3), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Dusty))) { Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Start); }
                    DC(int64(0xb4a1c7ed84466d3), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84466d5), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Dusty))) { Dusty.RemoveImmortality(); }
                    DC(int64(0xb4a1c7ed84466d5), EConversationDebugInfo::Done);
                    DC(int64(0xc0df3c3d9aef7df0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc0df3c3d9aef7df0), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGrd216Exit : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xc0df3c3d9aef7dc4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7dc5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc0df3c3d9aef7dc5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd216First : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xc0df3c3d9aef7dc6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd216First);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_OC_GUARDPASSAGE_29", 400.0f, int64(0xc0df3c3d9aef7dc6));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_GRD_215_TORWACHE_FIRST_06_00"), int64(0xc0df3c3d9aef7dc6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd0fcbe4ae7736b06), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xd0fcbe4ae7736b0c), Hero != nullptr && !Hero.IsInPartyWith(Dusty));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Hero != nullptr && Hero.IsInPartyWith(Dusty))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7dc8), EConversationDebugInfo::Executing);
                // Oy, you there! Who are you? I ain't seen you before.
                GateGuard.AI.Say(LocText("DIA_GRD_216_FIRST_13_00"));
                DC(int64(0xc0df3c3d9aef7dc8), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7dc9), EConversationDebugInfo::Executing);
                
                // That doesn't surprise me. I only just got here.
                Hero.AI.Say(LocText("DIA_GRD_216_FIRST_15_01"));
                DC(int64(0xc0df3c3d9aef7dc9), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7dca), EConversationDebugInfo::Executing);
                
                // Huh ... well, then be on your guard, will you? The ...
                GateGuard.AI.Say(LocText("DIA_GRD_216_FIRST_13_02"));
                DC(int64(0xc0df3c3d9aef7dca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd216TorwacheSeethorus : UTopic_Hero__OCR_GRD_GATEGUARD05_216
        {
            default DebugId = int64(0xc0df3c3d9aef7df1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusGardist, UChoiceGrd214TorwacheSeethorus);
            default Rules.HideIfKnows(UChoiceGrd216TorwacheSeethorus);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_200_THORUS_GARDIST_INFO_09_02"), int64(0xc0df3c3d9aef7df1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc84934ce67283249), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x84d011413d331e96), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x84d011413d331ea9), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc0df3c3d9aef7df4), EConversationDebugInfo::Executing);
                // Ah, you're here, good. Thorus wants to see you.
                GateGuard.AI.Say(LocText("GRD_216_TORWACHE_SEETHORUS_INFO_13_01"));
                DC(int64(0xc0df3c3d9aef7df4), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7df5), EConversationDebugInfo::Executing);
                
                // What's this about?
                Hero.AI.Say(LocText("GRD_216_TORWACHE_SEETHORUS_INFO_15_02"));
                DC(int64(0xc0df3c3d9aef7df5), EConversationDebugInfo::Done);
                DC(int64(0xc0df3c3d9aef7df6), EConversationDebugInfo::Executing);
                
                // I'm sure he'll tell you. 
                GateGuard.AI.Say(LocText("GRD_216_TORWACHE_SEETHORUS_INFO_13_03"));
                DC(int64(0xc0df3c3d9aef7df6), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */