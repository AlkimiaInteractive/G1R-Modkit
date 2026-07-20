#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD03_214 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD03_214";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD03_214 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD03_214";
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
                return GetCharacter(n"OC_VLK_Dusty_524");
            }
        }
        
        
        class UChoiceGrd214TorwacheExit : UTopic_Hero__OCR_GRD_GATEGUARD03_214
        {
            default DebugId = int64(0xbb964de693693d0b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb964de693693d0c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb964de693693d0c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd214TorwacheJob : UTopic_Hero__OCR_GRD_GATEGUARD03_214
        {
            default DebugId = int64(0xbb964de693693d0d);
            default Caption = LocText("DIA_GRD_214_TORWACHE_JOB_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb964de693693d0e), EConversationDebugInfo::Executing);
                // What's your job?
                Hero.AI.Say(LocText("DIA_GRD_214_TORWACHE_JOB_15_00"));
                DC(int64(0xbb964de693693d0e), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d0f), EConversationDebugInfo::Executing);
                
                // What's it look like? I'm here to make sure no one gets ...
                GateGuard.AI.Say(LocText("DIA_GRD_214_TORWACHE_JOB_07_01"));
                DC(int64(0xbb964de693693d0f), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d10), EConversationDebugInfo::Executing);
                // So don't cause any trouble in there - or you're not ...
                GateGuard.AI.Say(LocText("DIA_GRD_214_TORWACHE_JOB_07_02"));
                DC(int64(0xbb964de693693d10), EConversationDebugInfo::Done);
                DC(int64(0xa85b76d2ba9a6434), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa85b76d2ba9a6434), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd214TorwacheNodusty : UTopic_Hero__OCR_GRD_GATEGUARD03_214
        {
            default DebugId = int64(0xbb964de693693d17);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_214_TORWACHE_NODUSTY_INFO_07_01"), int64(0xbb964de693693d17));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa85b76d2ba9a6433), Hero != nullptr && Hero.IsInPartyWith(Dusty));
                }
                
                return Hero != nullptr && Hero.IsInPartyWith(Dusty);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb964de693693d19), EConversationDebugInfo::Executing);
                // Hey, you! You're trying to sneak out Dusty or what? 
                GateGuard.AI.Say(LocText("GRD_214_TORWACHE_NODUSTY_INFO_07_01"));
                DC(int64(0xbb964de693693d19), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d1a), EConversationDebugInfo::Executing);
                
                // We just wanted to-
                Hero.AI.Say(LocText("GRD_214_TORWACHE_NODUSTY_INFO_15_02"));
                DC(int64(0xbb964de693693d1a), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d1b), EConversationDebugInfo::Executing);
                
                // You won't be wanting anything when I'm done with you!
                GateGuard.AI.Say(LocText("GRD_214_TORWACHE_NODUSTY_INFO_07_03"));
                DC(int64(0xbb964de693693d1b), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d1d), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediately(Hero);
                DC(int64(0xbb964de693693d1d), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d1e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Dusty))) { Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Start); }
                DC(int64(0xbb964de693693d1e), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d1f), EConversationDebugInfo::Executing);
                G1R.Dusty_flags = 0;
                DC(int64(0xbb964de693693d1f), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d20), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbb964de693693d20), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd214TorwacheSeethorus : UTopic_Hero__OCR_GRD_GATEGUARD03_214
        {
            default DebugId = int64(0xbb964de693693d11);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusGardist, UChoiceGrd216TorwacheSeethorus);
            default Rules.HideIfKnows(UChoiceGrd214TorwacheSeethorus);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GRD_200_THORUS_GARDIST_INFO_09_02"), int64(0xbb964de693693d11));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc84934ce67283249), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x84d011413d331eaa), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x84d011413d331eab), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
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
                DC(int64(0xbb964de693693d14), EConversationDebugInfo::Executing);
                // Hey, good that you're here. Thorus wants to see you. 
                GateGuard.AI.Say(LocText("GRD_214_TORWACHE_SEETHORUS_INFO_07_01"));
                DC(int64(0xbb964de693693d14), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d15), EConversationDebugInfo::Executing);
                
                // What does he want?
                Hero.AI.Say(LocText("GRD_214_TORWACHE_SEETHORUS_INFO_15_02"));
                DC(int64(0xbb964de693693d15), EConversationDebugInfo::Done);
                DC(int64(0xbb964de693693d16), EConversationDebugInfo::Executing);
                
                // He'll tell you. 
                GateGuard.AI.Say(LocText("GRD_214_TORWACHE_SEETHORUS_INFO_07_03"));
                DC(int64(0xbb964de693693d16), EConversationDebugInfo::Done);
                DC(int64(0xa85b76d2ba9a6435), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa85b76d2ba9a6435), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */