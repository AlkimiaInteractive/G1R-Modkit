#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_GUARD31_283N : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_GUARD31_283N";
        }
        
        
        class UTopic_Hero__OC_GRD_GUARD31_283N : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_GUARD31_283N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard31() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD32_284N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD32_284N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD33_285N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD33_285N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD35_287N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD35_287N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD36_288N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD36_288N");
            }
        }
        
        
        class UChoiceGuard31145483 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0x5b76997c88e39dfa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbfa11b5924e00d6c), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.HasSucceeded());
                    DB(int64(0xbfa11b5924e00d72), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.HasBeenStarted());
                    DB(int64(0xbfa11b5924e00d73), G1R.Convoy_Guard.IsValid() && G1R.Convoy_Guard.IsMoreThanXMinutesAgo(60));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.HasSucceeded())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.HasBeenStarted())
                    return false;
                
                if (G1R.Convoy_Guard.IsValid() && !G1R.Convoy_Guard.IsMoreThanXMinutesAgo(60))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x5b76997c88e39e03), G1R.Guard_Order == 0);
                DB(int64(0x5b76997c88e39e5c), G1R.Guard_Order == 1);
                
                if (G1R.Guard_Order == 0)
                {
                    DC(int64(0x5b76997c88e39e05), EConversationDebugInfo::Executing);
                    // Beliar's Arse ... just move that thing already.
                    Guard31.AI.Say(LocText("TEXT_WIP_NVXGRO_20250123_135836_2238"));
                    DC(int64(0x5b76997c88e39e05), EConversationDebugInfo::Done);
                    DC(int64(0x5b76997c88e39e66), EConversationDebugInfo::Executing);
                    G1R.Guard_Order += 1;
                    DC(int64(0x5b76997c88e39e66), EConversationDebugInfo::Done);
                }
                else if (G1R.Guard_Order == 1)
                {
                    DC(int64(0x5b76997c88e39e07), EConversationDebugInfo::Executing);
                    // That's gotta be a bloody joke ... 
                    Guard31.AI.Say(LocText("TEXT_WIP_NVXGRO_20250123_135842_1924"));
                    DC(int64(0x5b76997c88e39e07), EConversationDebugInfo::Done);
                    DC(int64(0x5b76997c88e39e6a), EConversationDebugInfo::Executing);
                    G1R.Guard_Order = 0;
                    DC(int64(0x5b76997c88e39e6a), EConversationDebugInfo::Done);
                }
                DC(int64(0x5b76997c88e39e7e), EConversationDebugInfo::Executing);
                G1R.Convoy_Guard = FInGameTime::Now();
                DC(int64(0x5b76997c88e39e7e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGuard31227021 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0xda2810ebd1e88c60);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGuard3199109);
            default Rules.HideIfKnows(UChoiceGuard31227021);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda2810ebd1e88c63), G1R.Convoy_PlayerBriefed != 0);
                    DB(int64(0xda2810ebd1e88c66), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                if (G1R.Convoy_PlayerBriefed == 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda2810ebd1e88c5f), EConversationDebugInfo::Executing);
                // Hm. Wait a minute, who are you? Ain't seen your mug ...
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182222"));
                DC(int64(0xda2810ebd1e88c5f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Guard31_99838,
                    UTopic_Guard31_99858,
                    UTopic_Guard31_99945
                );
            }
        }
        
        
        class UTopic_Guard31_99838 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0xb4aa8f8f32bf121c);
            default Caption = LocText("TEXT_WIP_DMEKYPF_20240617_111746_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Guard31_99838);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4aa8f8f32bf121d), EConversationDebugInfo::Executing);
                // Just a digger. 
                Hero.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111746_2083"));
                DC(int64(0xb4aa8f8f32bf121d), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1224), EConversationDebugInfo::Executing);
                
                // Then why ain't I seen you before? 
                Guard31.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111757"));
                DC(int64(0xb4aa8f8f32bf1224), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3444), EConversationDebugInfo::Executing);
                // This is an ambush, ain't it? I got a feeling ... 
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182542"));
                DC(int64(0xbe4743f5c2eb3444), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3445), EConversationDebugInfo::Executing);
                
                // No, I'm just- 
                Hero.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182703"));
                DC(int64(0xbe4743f5c2eb3445), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3446), EConversationDebugInfo::Executing);
                
                // Lads! Mess him up!
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182709"));
                DC(int64(0xbe4743f5c2eb3446), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1226), EConversationDebugInfo::Executing);
                Guard31.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xb4aa8f8f32bf1226), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1227), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4aa8f8f32bf1227), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Guard31_99858 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0xb4aa8f8f32bf1220);
            default Caption = LocText("TEXT_WIP_DMEKYPF_20240617_111746_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Guard31_99858);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4aa8f8f32bf1221), EConversationDebugInfo::Executing);
                // Nevermind me, I'm just passing through. 
                Hero.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111746_1924"));
                DC(int64(0xb4aa8f8f32bf1221), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf122c), EConversationDebugInfo::Executing);
                
                // Then why are you lookin' so tense? Nah, I don't like ...
                Guard31.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111856"));
                DC(int64(0xb4aa8f8f32bf122c), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3441), EConversationDebugInfo::Executing);
                // This is an ambush, ain't it? And you're part of it. 
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182316"));
                DC(int64(0xbe4743f5c2eb3441), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3442), EConversationDebugInfo::Executing);
                
                // No, I'm just- 
                Hero.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182703"));
                DC(int64(0xbe4743f5c2eb3442), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3443), EConversationDebugInfo::Executing);
                
                // Lads! Mess him up!
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_182709"));
                DC(int64(0xbe4743f5c2eb3443), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1226), EConversationDebugInfo::Executing);
                Guard31.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xb4aa8f8f32bf1226), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1227), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb4aa8f8f32bf1227), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Guard31_99945 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0xb4aa8f8f32bf1228);
            default Caption = LocText("TEXT_WIP_DMEKYPF_20240617_111847_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Guard31_99945);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4aa8f8f32bf1229), EConversationDebugInfo::Executing);
                // Yeah, they just threw me in. What happened? Broke an ...
                Hero.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111847_2785"));
                DC(int64(0xb4aa8f8f32bf1229), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3448), EConversationDebugInfo::Executing);
                
                // We're gonna find out ... bloody mud was way deeper than ...
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_183010"));
                DC(int64(0xbe4743f5c2eb3448), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb3449), EConversationDebugInfo::Executing);
                // What's it to you, anyhow? You a wheelwright or ...
                Guard31.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_183300"));
                DC(int64(0xbe4743f5c2eb3449), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1230), EConversationDebugInfo::Executing);
                
                // Something like that. Do you have some joists in that ...
                Hero.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111941"));
                DC(int64(0xb4aa8f8f32bf1230), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1232), EConversationDebugInfo::Executing);
                
                // Hmm ... good idea, but we ain't got none of that either. ...
                Guard31.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_111954"));
                DC(int64(0xb4aa8f8f32bf1232), EConversationDebugInfo::Done);
                DC(int64(0xbe4743f5c2eb344a), EConversationDebugInfo::Executing);
                
                // Worth a try.
                Hero.AI.Say(LocText("TEXT_WIP_KPBBQAJ_20240618_183634"));
                DC(int64(0xbe4743f5c2eb344a), EConversationDebugInfo::Done);
                DC(int64(0xb4aa8f8f32bf1233), EConversationDebugInfo::Executing);
                
                // Then that's what we're gonna do. Lads - let's find us ...
                Guard31.AI.Say(LocText("TEXT_WIP_DMEKYPF_20240617_112000"));
                DC(int64(0xb4aa8f8f32bf1233), EConversationDebugInfo::Done);
                DC(int64(0xf98d30dc9199fa20), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD32_284N))) { OC_GRD_GUARD32_284N.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard32_284N_GetWood); }
                DC(int64(0xf98d30dc9199fa20), EConversationDebugInfo::Done);
                DC(int64(0xffa7c4569152cc48), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD33_285N))) { OC_GRD_GUARD33_285N.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard33_285N_GetWood); }
                DC(int64(0xffa7c4569152cc48), EConversationDebugInfo::Done);
                DC(int64(0xffa7c4569152cc4a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD35_287N))) { OC_GRD_GUARD35_287N.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard35_287N_GetWood); }
                DC(int64(0xffa7c4569152cc4a), EConversationDebugInfo::Done);
                DC(int64(0xffa7c4569152cc4c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD36_288N))) { OC_GRD_GUARD36_288N.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard36_288N_GetWood); }
                DC(int64(0xffa7c4569152cc4c), EConversationDebugInfo::Done);
                DC(int64(0xe8e3d198b578563e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe8e3d198b578563e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuard3199093 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0x7e544846c8814637);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceGuard3199093);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7e544846c8814636), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7e544846c8814636), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuard3199109 : UTopic_Hero__OC_GRD_GUARD31_283N
        {
            default DebugId = int64(0x7e544846c881463b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGuard3199109);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_DMEKYPF_20240617_111954"), int64(0x7e544846c881463b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1074d4c94e106c5b), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7e544846c881463a), EConversationDebugInfo::Executing);
                // Move along, man. We're in the middle of somethin'.
                Guard31.AI.Say(LocText("TEXT_WIP_YITCJRF_20240603_150905_3436"));
                DC(int64(0x7e544846c881463a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */