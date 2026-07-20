#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_DUSTY_524 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_DUSTY_524";
        }
        
        
        class UTopic_Hero__OC_VLK_DUSTY_524 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_DUSTY_524";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDusty() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBaalTondral() const property
            {
                return GetCharacter(n"SC_GUR_BAALTONDRAL_1203");
            }
            
            AGothicCharacterState GetMelvin() const property
            {
                return GetCharacter(n"SC_VLK_MELVIN_582");
            }
        }
        
        
        class UChoiceDusty120225_0 : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x2c6ecb01f6f77006);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDusty120225);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_VLK_DUSTY_524", n"FP_SC_START_SWAMPCAMP", 800.0f, int64(0x2c6ecb01f6f77006));
            default Rules.HideIfKnows(UChoiceDusty120225_0);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f77003), EConversationDebugInfo::Executing);
                // We made it ... by Innos, we made it. 
                Dusty.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_152953_686"));
                DC(int64(0x2c6ecb01f6f77003), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDusty120225_1 : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDusty120225_0);
            default Rules.HideIfKnows(UChoiceDusty120225_1);
            default DebugId = int64(0x2c6ecb01f6f77006);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f7700a), EConversationDebugInfo::Executing);
                
                // How do you like it?
                Hero.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_153053"));
                DC(int64(0x2c6ecb01f6f7700a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDusty120225_2 : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDusty120225_1);
            default Rules.HideIfKnows(UChoiceDusty120225_2);
            default DebugId = int64(0x2c6ecb01f6f77006);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f7700b), EConversationDebugInfo::Executing);
                
                // It's, um ... different. But nice. Guess I'll be shavin' ...
                Dusty.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_153100"));
                DC(int64(0x2c6ecb01f6f7700b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDusty120225 : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDusty120225_2);
            default Rules.HideIfKnows(UChoiceDusty120225);
            default DebugId = int64(0x2c6ecb01f6f77006);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2c6ecb01f6f7700c), EConversationDebugInfo::Executing);
                // Thanks, mate. I owe you one. 
                Dusty.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_153202"));
                DC(int64(0x2c6ecb01f6f7700c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_DUSTY, Document::UDocumentSegment_Glossary_OC_VLK_DUSTY_SwampCamp);
            }
        }
        
        
        class UChoiceDusty231174 : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x2710d277008c511d);
            default Caption = LocText("DIA_DUSTY_LETSGO_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDustyLetsgo);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DUSTY_IWOULDGO_03_02"), int64(0x2710d277008c511d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x398dcde13dcbdf7c), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                    DB(int64(0xc56459278147e782), Dusty != nullptr && !Dusty.IsCloseToCharacter(BaalTondral, 1000.0f));
                    DB(int64(0xbedc3965c5a118), Dusty != nullptr && !Dusty.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Dusty_524_Follow));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning())
                    return false;
                
                if (Dusty != nullptr && Dusty.IsCloseToCharacter(BaalTondral, 1000.0f))
                    return false;
                
                if (Dusty != nullptr && Dusty.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Dusty_524_Follow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2710d277008c5119), EConversationDebugInfo::Executing);
                // I'm ready. Let's go to the Swamp Camp.
                Hero.AI.Say(LocText("DIA_DUSTY_LETSGO_15_00"));
                DC(int64(0x2710d277008c5119), EConversationDebugInfo::Done);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Executing);
                Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Follow);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Done);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Executing);
                Dusty.JoinPartyOf(Hero);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Done);
                DC(int64(0x5779fc893e8ec2e3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Melvin))) { Melvin.ExchangeDailyRoutineToClass(UDailyRoutine_SC_VLK_Melvin_582_WaitDusty); }
                DC(int64(0x5779fc893e8ec2e3), EConversationDebugInfo::Done);
                DC(int64(0x2710d277008c5133), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2710d277008c5133), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDustyExit : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf57);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf58), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x398dcde13dcbdf58), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDustyHello : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf59);
            default Caption = LocText("DIA_DUSTY_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDustyHello);
            default Rules.HideIfKnows(UChoiceDustyMetmelvin);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf5a), EConversationDebugInfo::Executing);
                // Hey, I'm new here. How's it going?
                Hero.AI.Say(LocText("DIA_DUSTY_HELLO_15_00"));
                DC(int64(0x398dcde13dcbdf5a), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf5b), EConversationDebugInfo::Executing);
                
                // Ah, don't ask ... I've been workin' me arse off in the ...
                Dusty.AI.Say(LocText("DIA_DUSTY_HELLO_03_01"));
                DC(int64(0x398dcde13dcbdf5b), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf5c), EConversationDebugInfo::Executing);
                // A handful lousy nuggets. Most of which I need for food. 
                Dusty.AI.Say(LocText("DIA_DUSTY_HELLO_03_02"));
                DC(int64(0x398dcde13dcbdf5c), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf5d), EConversationDebugInfo::Executing);
                // That bald bloke down there, that Parvez character - he's ...
                Dusty.AI.Say(LocText("DIA_DUSTY_HELLO_03_03"));
                DC(int64(0x398dcde13dcbdf5d), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf5e), EConversationDebugInfo::Executing);
                // Maybe ... ah, I dunno. 
                Dusty.AI.Say(LocText("DIA_DUSTY_HELLO_03_04"));
                DC(int64(0x398dcde13dcbdf5e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_DUSTY, Document::UDocumentSegment_Glossary_OC_VLK_DUSTY_Introduction);
            }
        }
        
        
        class UChoiceDustyIwouldgo : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf73);
            default Caption = LocText("DIA_DUSTY_IWOULDGO_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDustyOffer100ore);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_DUSTY_IWOULDGO_03_01"), int64(0x398dcde13dcbdf73));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x398dcde13dcbdf74), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf75), EConversationDebugInfo::Executing);
                // I will. 
                Hero.AI.Say(LocText("DIA_DUSTY_IWOULDGO_15_00"));
                DC(int64(0x398dcde13dcbdf75), EConversationDebugInfo::Done);
                DB(int64(0x1ee539a0ef4f3caa), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTONDRAL_LOYALITY_13_02")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALTONDRAL_LOYALITY_13_02")))
                {
                    DC(int64(0x1ee539a0ef4f3cb2), EConversationDebugInfo::Executing);
                    // Huh. What was that saying about gift horses? Anyway. I'm ...
                    Dusty.AI.Say(LocText("DIA_DUSTY_IWOULDGO_03_01"));
                    DC(int64(0x1ee539a0ef4f3cb2), EConversationDebugInfo::Done);
                    DC(int64(0x1ee539a0ef4f3cb3), EConversationDebugInfo::Executing);
                    // Just remember the bribe, okay? We'll need a hundred ...
                    Dusty.AI.Say(LocText("DIA_DUSTY_IWOULDGO_03_02"));
                    DC(int64(0x1ee539a0ef4f3cb3), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_ConvinceDusty);
                    DC(int64(0x1c2195c1a25578d5), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_CONVINCEDUSTY.SucceedQuest();
                    DC(int64(0x1c2195c1a25578d5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_dusty_iwouldgo_exit_1");
                }
                else
                {
                    DC(int64(0x1ee539a0ef4f3cad), EConversationDebugInfo::Executing);
                    // I'm gonna have to tell the gurus first, though. I'll be ...
                    Hero.AI.Say(LocText("TEXT_GROMEU_20231123_164014"));
                    DC(int64(0x1ee539a0ef4f3cad), EConversationDebugInfo::Done);
                    DC(int64(0x2c6ecb01f6f77001), EConversationDebugInfo::Executing);
                    
                    // Gurus? Okay, I guess. I'll wait. 
                    Dusty.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_152758"));
                    DC(int64(0x2c6ecb01f6f77001), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_dusty_iwouldgo_exit_2");
                    DC(int64(0x1ee539a0ef4f3cb0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1ee539a0ef4f3cb0), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceDustyLetsgo : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf79);
            default Caption = LocText("DIA_DUSTY_LETSGO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDustyLetsgo);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_DUSTY_IWOULDGO_03_02"), int64(0x398dcde13dcbdf79));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x398dcde13dcbdf7c), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                    DB(int64(0xc56459278147e782), Dusty != nullptr && !Dusty.IsCloseToCharacter(BaalTondral, 1000.0f));
                    DB(int64(0xbedc3965c5a117), Dusty != nullptr && !Dusty.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Dusty_524_Follow));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning())
                    return false;
                
                if (Dusty != nullptr && Dusty.IsCloseToCharacter(BaalTondral, 1000.0f))
                    return false;
                
                if (Dusty != nullptr && Dusty.HasAssignedDailyRoutine(UDailyRoutine_OC_VLK_Dusty_524_Follow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf7d), EConversationDebugInfo::Executing);
                // I'm ready. Let's go to the Swamp Camp.
                Hero.AI.Say(LocText("DIA_DUSTY_LETSGO_15_00"));
                DC(int64(0x398dcde13dcbdf7d), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf7e), EConversationDebugInfo::Executing);
                
                // We're really doin' this, are we? Okay. Let's take the ...
                Dusty.AI.Say(LocText("DIA_DUSTY_LETSGO_03_01"));
                DC(int64(0x398dcde13dcbdf7e), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf7f), EConversationDebugInfo::Executing);
                // And you do the talkin' - I ain't good with that stuff. 
                Dusty.AI.Say(LocText("DIA_DUSTY_LETSGO_03_02"));
                DC(int64(0x398dcde13dcbdf7f), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf80), EConversationDebugInfo::Executing);
                
                // Will do. Let's go.
                Hero.AI.Say(LocText("DIA_DUSTY_LETSGO_15_03"));
                DC(int64(0x398dcde13dcbdf80), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_Advice);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Executing);
                Dusty.ExchangeDailyRoutineToClass(UDailyRoutine_OC_VLK_Dusty_524_Follow);
                DC(int64(0x1ce0f15481f962f9), EConversationDebugInfo::Done);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Executing);
                Dusty.JoinPartyOf(Hero);
                DC(int64(0xfb31217cc8347b3d), EConversationDebugInfo::Done);
                DC(int64(0x5779fc893e8ec2e3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Melvin))) { Melvin.ExchangeDailyRoutineToClass(UDailyRoutine_SC_VLK_Melvin_582_WaitDusty); }
                DC(int64(0x5779fc893e8ec2e3), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf84), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x398dcde13dcbdf84), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDustyMetmelvin : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf65);
            default Caption = LocText("DIA_DUSTY_METMELVIN_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDustyMetmelvin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1ee539a0ef4f3c95), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                    DB(int64(0x1c2195c1a25577cd), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN != nullptr && !Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf66), EConversationDebugInfo::Executing);
                // I met Melvin in the Swamp Camp.
                Hero.AI.Say(LocText("DIA_DUSTY_METMELVIN_15_00"));
                DC(int64(0x398dcde13dcbdf66), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf67), EConversationDebugInfo::Executing);
                
                // You did? How's he doin'?
                Dusty.AI.Say(LocText("DIA_DUSTY_METMELVIN_03_01"));
                DC(int64(0x398dcde13dcbdf67), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf68), EConversationDebugInfo::Executing);
                
                // Good, I guess. He has devoted himself to the Sleeper, ...
                Hero.AI.Say(LocText("DIA_DUSTY_METMELVIN_15_02"));
                DC(int64(0x398dcde13dcbdf68), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf69), EConversationDebugInfo::Executing);
                
                // Huh ... not too keen on all that Sleeper business, but I ...
                Dusty.AI.Say(LocText("DIA_DUSTY_METMELVIN_03_03"));
                DC(int64(0x398dcde13dcbdf69), EConversationDebugInfo::Done);
                DC(int64(0x20f2618b9dc6d677), EConversationDebugInfo::Executing);
                // I don't think I can leave, though. 
                Dusty.AI.Say(LocText("TEXT_NISEA_20240206_185859"));
                DC(int64(0x20f2618b9dc6d677), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf6a), EConversationDebugInfo::Executing);
                
                // Why not?
                Hero.AI.Say(LocText("DIA_DUSTY_METMELVIN_15_04"));
                DC(int64(0x398dcde13dcbdf6a), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf6b), EConversationDebugInfo::Executing);
                
                // Well, turns out the warders caught wind that I'm ...
                Dusty.AI.Say(LocText("DIA_DUSTY_METMELVIN_03_05"));
                DC(int64(0x398dcde13dcbdf6b), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf6c), EConversationDebugInfo::Executing);
                // Now they got their eyes on me, and it'll take a lot of ...
                Dusty.AI.Say(LocText("DIA_DUSTY_METMELVIN_03_06"));
                DC(int64(0x398dcde13dcbdf6c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDustyOffer100ore : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf6d);
            default Caption = LocText("DIA_DUSTY_OFFER100ORE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDustyMetmelvin);
            default Rules.HideIfKnows(UChoiceDustyOffer100ore);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x398dcde13dcbdf6e), Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY != nullptr && Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf6f), EConversationDebugInfo::Executing);
                
                // What if I give you those one hundred nuggets for the ...
                Hero.AI.Say(LocText("DIA_DUSTY_OFFER100ORE_15_00"));
                DC(int64(0x398dcde13dcbdf6f), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf70), EConversationDebugInfo::Executing);
                
                // You'd ... why?
                Dusty.AI.Say(LocText("DIA_DUSTY_OFFER100ORE_03_01"));
                DC(int64(0x398dcde13dcbdf70), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf71), EConversationDebugInfo::Executing);
                
                // Let's just say you're not the only one who wants to see ...
                Hero.AI.Say(LocText("DIA_DUSTY_OFFER100ORE_15_02"));
                DC(int64(0x398dcde13dcbdf71), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf72), EConversationDebugInfo::Executing);
                
                // So ... you're gonna help me get there?
                Dusty.AI.Say(LocText("DIA_DUSTY_OFFER100ORE_03_03"));
                DC(int64(0x398dcde13dcbdf72), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDustyWhynotleave : UTopic_Hero__OC_VLK_DUSTY_524
        {
            default DebugId = int64(0x398dcde13dcbdf5f);
            default Caption = LocText("DIA_DUSTY_WHYNOTLEAVE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDustyHello);
            default Rules.HideIfKnows(UChoiceDustyMetmelvin);
            default Rules.HideIfKnows(UChoiceDustyWhynotleave);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x548fd4076acfdb), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x398dcde13dcbdf61), EConversationDebugInfo::Executing);
                
                // If you don't like it here, why don't you leave?
                Hero.AI.Say(LocText("DIA_DUSTY_WHYNOTLEAVE_15_00"));
                DC(int64(0x398dcde13dcbdf61), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf62), EConversationDebugInfo::Executing);
                
                // Cause I'm not sure what it's like over there. I had a ...
                Dusty.AI.Say(LocText("DIA_DUSTY_WHYNOTLEAVE_03_01"));
                DC(int64(0x398dcde13dcbdf62), EConversationDebugInfo::Done);
                DC(int64(0x398dcde13dcbdf63), EConversationDebugInfo::Executing);
                // I ain't heard from him since ... until I do, I'll stay ...
                Dusty.AI.Say(LocText("DIA_DUSTY_WHYNOTLEAVE_03_02"));
                DC(int64(0x398dcde13dcbdf63), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_DUSTY, Document::UDocumentSegment_Glossary_OC_VLK_DUSTY_Escape);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RECRUITDUSTY, Document::UDocumentSegment_CH1_RECRUITDUSTY_DustyStart);
                DC(int64(0x1ce0f15481f96311), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY.StartQuest();
                DC(int64(0x1ce0f15481f96311), EConversationDebugInfo::Done);
                DC(int64(0x1c2195c1a25577c3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_MELVIN.StartQuest();
                DC(int64(0x1c2195c1a25577c3), EConversationDebugInfo::Done);
                DC(int64(0x1ce0f15481f985df), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1ce0f15481f985df), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */