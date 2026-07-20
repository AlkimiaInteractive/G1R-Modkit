#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_JORU_1305 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_JORU_1305";
        }
        
        
        class UTopic_Hero__SC_NOV_JORU_1305 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_JORU_1305";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJoru() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceJoru137701 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0xed7a42cc53190cc4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceJoru137701);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2936aaa9d819e46), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0xf2936aaa9d819e64), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && !Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2936aaa9d819e3f), EConversationDebugInfo::Executing);
                // Who- Oh. You. How did you get in here?
                Joru.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_160614_2386"));
                DC(int64(0xf2936aaa9d819e3f), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cc6), EConversationDebugInfo::Executing);
                
                // No one stopped me ...
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145146"));
                DC(int64(0xed7a42cc53190cc6), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cc7), EConversationDebugInfo::Executing);
                
                // Huh... then you're one lucky bastard. We can't take a ...
                Joru.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145150"));
                DC(int64(0xed7a42cc53190cc7), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cc8), EConversationDebugInfo::Executing);
                // Oh, godsdammit. Why on earth did I think going with ...
                Joru.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145720"));
                DC(int64(0xed7a42cc53190cc8), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190ccd), EConversationDebugInfo::Executing);
                
                // Well, maybe you won't have to stay here much longer. ...
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145832"));
                DC(int64(0xed7a42cc53190ccd), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cce), EConversationDebugInfo::Executing);
                
                // Really? But the templars ... 
                Joru.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145851"));
                DC(int64(0xed7a42cc53190cce), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190ccf), EConversationDebugInfo::Executing);
                
                // I'll take care of it. We're meeting at the camp ...
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145856"));
                DC(int64(0xed7a42cc53190ccf), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd0), EConversationDebugInfo::Executing);
                
                // ... All right. And you're sure this isn't a trap? 
                Joru.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145934"));
                DC(int64(0xed7a42cc53190cd0), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd1), EConversationDebugInfo::Executing);
                
                // I hope so. 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_145956"));
                DC(int64(0xed7a42cc53190cd1), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc53190cd2), EConversationDebugInfo::Executing);
                
                // (deep sigh) Reassuring ... 
                Joru.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_150001"));
                DC(int64(0xed7a42cc53190cd2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_CampDivided);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_RecruitJoru);
                DC(int64(0xf2936aaa9d819e56), EConversationDebugInfo::Executing);
                Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_Wait);
                DC(int64(0xf2936aaa9d819e56), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142629e2e6), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITJORU.SucceedQuest();
                DC(int64(0x8c29f1142629e2e6), EConversationDebugInfo::Done);
                DC(int64(0xf2936aaa9d819e59), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf2936aaa9d819e59), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJoru220432 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x737069758ce831a);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_144915");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_JORU_1305", n"WP_SC_CSShave_Joru_End", 500.0f, int64(0x737069758ce831a));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_XEXAPHF_20260209_145632"), int64(0x737069758ce831a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x737069758ce8353), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce8316), EConversationDebugInfo::Executing);
                // You're all bald ...
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_144915"));
                DC(int64(0x737069758ce8316), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8317), EConversationDebugInfo::Executing);
                
                // Yeah. It's a sign of our bond. As a community. We're ...
                Joru.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_144915_41"));
                DC(int64(0x737069758ce8317), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8328), EConversationDebugInfo::Executing);
                // It's mainly symbolic, sure, but who knows ... You wanna ...
                Joru.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145459"));
                DC(int64(0x737069758ce8328), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_Introduction_Shave);
                Subdialog(
                    UTopic_Joru_220456,
                    UTopic_Joru_220476
                );
            }
        }
        
        
        class UTopic_Joru_220456 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x737069758ce8337);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_145539_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce8338), EConversationDebugInfo::Executing);
                // I'll think about it ...
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145539_2238"));
                DC(int64(0x737069758ce8338), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Joru_220476 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x737069758ce833b);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_145539_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Joru_220476);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce833c), EConversationDebugInfo::Executing);
                // Sure, why not.
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145539_2785"));
                DC(int64(0x737069758ce833c), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce834a), EConversationDebugInfo::Executing);
                
                // And here's the catch: you need a razor blade. Harder to ...
                Joru.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145632"));
                DC(int64(0x737069758ce834a), EConversationDebugInfo::Done);
                DC(int64(0xb66e9b4b6b2a02c1), EConversationDebugInfo::Executing);
                // So if you manage to get one, let me know.
                Joru.AI.Say(LocText("TEXT_WIP_EOKNJXI_20260209_183527"));
                DC(int64(0xb66e9b4b6b2a02c1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_Razor);
            }
        }
        
        
        class UChoiceJoru220532 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x737069758ce834f);
            default Caption = LocText("TEXT_WIP_XEXAPHF_20260209_145647");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Joru_220476);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_JORU_1305", n"WP_SC_CSShave_Joru_End", 500.0f, int64(0x737069758ce834f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x737069758ce835b), Hero != nullptr && Hero.HasItem(UItMi_Stuff_Barbknife_01, 1, 0));
                    DB(int64(0x906638b3dc944e55), Hero != nullptr && Hero.Character.IsCurrentHairstylePhaseGreaterThan(0));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Stuff_Barbknife_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.Character.IsCurrentHairstylePhaseGreaterThan(0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x737069758ce834b), EConversationDebugInfo::Executing);
                // I've got a razor blade. Let's do this!
                Hero.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145647"));
                DC(int64(0x737069758ce834b), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce834c), EConversationDebugInfo::Executing);
                
                // All right then, off with that stuff
                Joru.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145647_3436"));
                DC(int64(0x737069758ce834c), EConversationDebugInfo::Done);
                DC(int64(0x737069758ce8351), EConversationDebugInfo::Executing);
                // Won't take long ...
                Joru.AI.Say(LocText("TEXT_WIP_XEXAPHF_20260209_145740"));
                DC(int64(0x737069758ce8351), EConversationDebugInfo::Done);
                DC(int64(0x9250688d0636db6a), EConversationDebugInfo::Executing);
                G1R.TriggerShavingCinematic();
                DC(int64(0x9250688d0636db6a), EConversationDebugInfo::Done);
                DC(int64(0x9250688d0636db6f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9250688d0636db6f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJoru694937_0 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x9250688d0636db7a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceJoru694937);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XEXAPHF_20260209_145740"), int64(0x9250688d0636db7a));
            default Rules.HideIfKnows(UChoiceJoru694937_0);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9250688d0636db75), EConversationDebugInfo::Executing);
                // There, all done. May the Sleeper find his way into your ...
                Joru.AI.Say(LocText("TEXT_WIP_EOKNJXI_20260209_183615"));
                DC(int64(0x9250688d0636db75), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoru694937 : UTopic_Hero__SC_NOV_JORU_1305
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJoru694937_0);
            default Rules.HideIfKnows(UChoiceJoru694937);
            default DebugId = int64(0x9250688d0636db7a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9250688d0636db7c), EConversationDebugInfo::Executing);
                // Might take some time to get used to it. Swampweed helps, ...
                Joru.AI.Say(LocText("TEXT_WIP_EOKNJXI_20260209_183617"));
                DC(int64(0x9250688d0636db7c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoruExit : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c47);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c48), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6aa0ebb737086c48), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJoruGetmagic : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c83);
            default Caption = LocText("DIA_JORU_GETMAGIC_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6aa0ebb737086c84), G1R.Joru_Tips != 0);
                    DB(int64(0x9e8ab53bf21a657c), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (G1R.Joru_Tips == 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x6aa0ebb737086c86), G1R.Joru_Tips_Mage == 0);
                
                if (G1R.Joru_Tips_Mage == 0)
                {
                    DC(int64(0x6aa0ebb737086c87), EConversationDebugInfo::Executing);
                    G1R.Joru_Tips_Mage = 1;
                    DC(int64(0x6aa0ebb737086c87), EConversationDebugInfo::Done);
                }
                DC(int64(0x6aa0ebb737086c88), EConversationDebugInfo::Executing);
                // Where do I find scrolls with Sleeper magic?
                Hero.AI.Say(LocText("DIA_JORU_GETMAGIC_15_00"));
                DC(int64(0x6aa0ebb737086c88), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c89), EConversationDebugInfo::Executing);
                
                // Well, Baal Cadar sells them, but that won't do you much ...
                Joru.AI.Say(LocText("DIA_JORU_GETMAGIC_07_01"));
                DC(int64(0x6aa0ebb737086c89), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c8a), EConversationDebugInfo::Executing);
                // Maybe one of the other gurus can help you? I don't know, ...
                Joru.AI.Say(LocText("DIA_JORU_GETMAGIC_07_02"));
                DC(int64(0x6aa0ebb737086c8a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoruGreet : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c49);
            default Caption = LocText("DIA_JORU_GREET_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceJoruGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9e8ab53bf21a6563), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c4a), EConversationDebugInfo::Executing);
                
                // What's your job around here?
                Hero.AI.Say(LocText("DIA_JORU_GREET_15_00"));
                DC(int64(0x6aa0ebb737086c4a), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c4b), EConversationDebugInfo::Executing);
                
                // Me? I'm a novice. An "accomplished novice," to be ...
                Joru.AI.Say(LocText("DIA_JORU_GREET_07_01"));
                DC(int64(0x6aa0ebb737086c4b), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c4c), EConversationDebugInfo::Executing);
                // That's why I'm here, teaching the wisdom of the Sleeper, ...
                Joru.AI.Say(LocText("DIA_JORU_GREET_07_02"));
                DC(int64(0x6aa0ebb737086c4c), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c4d), EConversationDebugInfo::Executing);
                // Master Y'Berion even said I might become a proper baal ...
                Joru.AI.Say(LocText("DIA_JORU_GREET_07_03"));
                DC(int64(0x6aa0ebb737086c4d), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f55d), EConversationDebugInfo::Executing);
                
                // When's the day? 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_144528"));
                DC(int64(0x5dcd7126285f55d), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c4e), EConversationDebugInfo::Executing);
                
                // Oh, we'll see. I've been slacking a bit lately, but ...
                Joru.AI.Say(LocText("DIA_JORU_GREET_07_04"));
                DC(int64(0x6aa0ebb737086c4e), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c4f), EConversationDebugInfo::Executing);
                // Spreading the Sleeper's word is a great honor.
                Joru.AI.Say(LocText("DIA_JORU_GREET_07_05"));
                DC(int64(0x6aa0ebb737086c4f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_Introduction);
            }
        }
        
        
        class UChoiceJoruImpressgurus : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c75);
            default Caption = LocText("DIA_JORU_IMPRESSGURUS_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceJoruImpressgurus);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6aa0ebb737086c76), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.HasSucceeded());
                    DB(int64(0x9e8ab53bf21a657b), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c77), EConversationDebugInfo::Executing);
                // I helped you out. Your turn now: how do I impress the ...
                Hero.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_15_00"));
                DC(int64(0x6aa0ebb737086c77), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c78), EConversationDebugInfo::Executing);
                
                // That depends on the guru. Baal Cadar, for example, ...
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_01"));
                DC(int64(0x6aa0ebb737086c78), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c79), EConversationDebugInfo::Executing);
                // If you want his attention, try and use a magic scroll in ...
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_02"));
                DC(int64(0x6aa0ebb737086c79), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c7a), EConversationDebugInfo::Executing);
                // Not a Windfist, of course - try putting one of his ...
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_03"));
                DC(int64(0x6aa0ebb737086c7a), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c7b), EConversationDebugInfo::Executing);
                // Baal Namib, the one by the entrance, is a tough nut. I ...
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_04"));
                DC(int64(0x6aa0ebb737086c7b), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c7c), EConversationDebugInfo::Executing);
                // The other gurus aren't as hard to impress ... just make ...
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_05"));
                DC(int64(0x6aa0ebb737086c7c), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c7d), EConversationDebugInfo::Executing);
                
                // All right. Thanks for the tips.
                Hero.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_15_06"));
                DC(int64(0x6aa0ebb737086c7d), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c7e), EConversationDebugInfo::Executing);
                
                // Sure thing - you scratch my back, I scratch yours. 
                Joru.AI.Say(LocText("DIA_JORU_IMPRESSGURUS_07_07"));
                DC(int64(0x6aa0ebb737086c7e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALNAMIB, Document::UDocumentSegment_Glossary_SC_GUR_BAALNAMIB_Impress);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALCADAR, Document::UDocumentSegment_Glossary_SC_GUR_BAALCADAR_Impress);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_JORU, Document::UDocumentSegment_Glossary_SC_NOV_JORU_Help);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_CadarTrick);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_LesterApproach);
                DB(int64(0x6aa0ebb737086c80), G1R.Joru_JoinSC == 0);
                
                if (G1R.Joru_JoinSC == 0)
                {
                    DC(int64(0x6aa0ebb737086c81), EConversationDebugInfo::Executing);
                    G1R.Joru_JoinSC = 1;
                    DC(int64(0x6aa0ebb737086c81), EConversationDebugInfo::Done);
                }
                DC(int64(0x6aa0ebb737086c82), EConversationDebugInfo::Executing);
                G1R.Joru_Tips = 1;
                DC(int64(0x6aa0ebb737086c82), EConversationDebugInfo::Done);
                DC(int64(0x4e86cbd6c686cc84), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_LESTER.StartQuest();
                DC(int64(0x4e86cbd6c686cc84), EConversationDebugInfo::Done);
                DC(int64(0x7e5d602938fe6be3), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_NAMIB.StartQuest();
                DC(int64(0x7e5d602938fe6be3), EConversationDebugInfo::Done);
                DC(int64(0x7e5d602938fe6ce0), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_CADAR.StartQuest();
                DC(int64(0x7e5d602938fe6ce0), EConversationDebugInfo::Done);
                DB(int64(0x11437211dc44a25b), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning())
                {
                    DC(int64(0x11437211dc44a25f), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.SucceedQuest();
                    DC(int64(0x11437211dc44a25f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_joru_impressgurus_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_joru_impressgurus_exit_2");
                }
            }
        }
        
        
        class UChoiceJoruJoinpsi : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c5b);
            default Caption = LocText("DIA_JORU_JOINPSI_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJoruGreet);
            default Rules.HideIfKnows(UChoiceJoruJoinpsi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7bd4872447d95d55), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x7bd4872447d95d56), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.HasBeenStarted());
                    DB(int64(0x52f33a4655659e6b), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.HasBeenStarted())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c5c), EConversationDebugInfo::Executing);
                // I'm to win the favor of the baals. Do you have any tips?
                Hero.AI.Say(LocText("DIA_JORU_JOINPSI_15_00"));
                DC(int64(0x6aa0ebb737086c5c), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c5d), EConversationDebugInfo::Executing);
                
                // Oh, so you're looking to join us? That's nice. Let's see ...
                Joru.AI.Say(LocText("DIA_JORU_JOINPSI_07_01"));
                DC(int64(0x6aa0ebb737086c5d), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c5e), EConversationDebugInfo::Executing);
                // I'm still a novice, but I know these people better than ...
                Joru.AI.Say(LocText("DIA_JORU_JOINPSI_07_02"));
                DC(int64(0x6aa0ebb737086c5e), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c5f), EConversationDebugInfo::Executing);
                // That said, I want you to do me a favor first. Have you ...
                Joru.AI.Say(LocText("DIA_JORU_JOINPSI_07_03"));
                DC(int64(0x6aa0ebb737086c5f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_Joru);
                Subdialog(
                    UChoiceJoruJoinpsiNein,
                    UChoiceJoruJoinpsiJa
                );
            }
        }
        
        
        class UChoiceJoruJoinpsiNein : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0xa129ed1915896bd2);
            default Caption = LocText("TEXT_WIP_LRNADNC_20240219_184723");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad0d4017ab783f1e), EConversationDebugInfo::Executing);
                // Not yet. Who's that?
                Hero.AI.Say(LocText("TEXT_WIP_LRNADNC_20240219_184723"));
                DC(int64(0xad0d4017ab783f1e), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c62), EConversationDebugInfo::Executing);
                
                // I guess you could call him the quartermaster - he gives ...
                Joru.AI.Say(LocText("DIA_JORU_JOINPSI_NEIN_07_00"));
                DC(int64(0x6aa0ebb737086c62), EConversationDebugInfo::Done);
                DC(int64(0xad0d4017ab783f1f), EConversationDebugInfo::Executing);
                // If you go see him and give me your ration, we have a ...
                Joru.AI.Say(LocText("TEXT_WIP_LRNADNC_20240219_185016"));
                DC(int64(0xad0d4017ab783f1f), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c63), EConversationDebugInfo::Executing);
                
                // I'll think about it. 
                Hero.AI.Say(LocText("DIA_JORU_JOINPSI_NEIN_15_01"));
                DC(int64(0x6aa0ebb737086c63), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c64), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.StartQuest();
                DC(int64(0x6aa0ebb737086c64), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoruJoinpsiJa : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0xdaa503a2b7d40c0a);
            default Caption = LocText("TEXT_WIP_LRNADNC_20240219_185218");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xad0d4017ab783f20), EConversationDebugInfo::Executing);
                // Yes, I saw him. 
                Hero.AI.Say(LocText("TEXT_WIP_LRNADNC_20240219_185218"));
                DC(int64(0xad0d4017ab783f20), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c67), EConversationDebugInfo::Executing);
                
                // Then you already got your daily ration? Give it to me, ...
                Joru.AI.Say(LocText("DIA_JORU_JOINPSI_JA_07_00"));
                DC(int64(0x6aa0ebb737086c67), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c68), EConversationDebugInfo::Executing);
                
                // I'll think about it. 
                Hero.AI.Say(LocText("DIA_JORU_JOINPSI_JA_15_01"));
                DC(int64(0x6aa0ebb737086c68), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c69), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.StartQuest();
                DC(int64(0x6aa0ebb737086c69), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoruJointsrunning : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c6a);
            default Caption = LocText("DIA_JORU_JOINTSRUNNING_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJoruJoinpsi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6aa0ebb737086c6b), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c6c), EConversationDebugInfo::Executing);
                // Here are some smoke rolls for you.
                Hero.AI.Say(LocText("DIA_JORU_JOINTSRUNNING_15_00"));
                DC(int64(0x6aa0ebb737086c6c), EConversationDebugInfo::Done);
                DB(int64(0x6aa0ebb737086c6e), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 3, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 3, 0))
                {
                    DC(int64(0xd3f81e982a1ea4ee), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0xd3f81e982a1ea4ee), EConversationDebugInfo::Done);
                    DC(int64(0xd3f81e982a1ea4f2), EConversationDebugInfo::Executing);
                    Joru.AI.UseItem(UItMi_Joint_02);
                    DC(int64(0xd3f81e982a1ea4f2), EConversationDebugInfo::Done);
                    DC(int64(0x6aa0ebb737086c6f), EConversationDebugInfo::Executing);
                    // Good choice. All right, here we go: I'm sure you already ...
                    Joru.AI.Say(LocText("DIA_JORU_JOINTSRUNNING_07_01"));
                    DC(int64(0x6aa0ebb737086c6f), EConversationDebugInfo::Done);
                    DC(int64(0x6aa0ebb737086c70), EConversationDebugInfo::Executing);
                    // There are ways to work around that, but they are ...
                    Joru.AI.Say(LocText("DIA_JORU_JOINTSRUNNING_07_02"));
                    DC(int64(0x6aa0ebb737086c70), EConversationDebugInfo::Done);
                    DC(int64(0x6aa0ebb737086c72), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JORU_BRINGJOINTS.SucceedQuest();
                    DC(int64(0x6aa0ebb737086c72), EConversationDebugInfo::Done);
                    DC(int64(0xda007c82c70532d6), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMi_Joint_02, 3, 0);
                    DC(int64(0xda007c82c70532d6), EConversationDebugInfo::Done);
                    DC(int64(0xda007c82c70532d8), EConversationDebugInfo::Executing);
                    Joru.AddItemToInventory(UItMi_Joint_02, 3);
                    DC(int64(0xda007c82c70532d8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_joru_jointsrunning_exit_1");
                }
                else
                {
                    DC(int64(0x6aa0ebb737086c74), EConversationDebugInfo::Executing);
                    // Wait, what's that? I want three rolls of black sage, ...
                    Joru.AI.Say(LocText("DIA_JORU_JOINTSRUNNING_NO_JOINTS_07_00"));
                    DC(int64(0x6aa0ebb737086c74), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_joru_jointsrunning_exit_2");
                }
            }
        }
        
        
        class UChoiceJoruSleepercontact : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c55);
            default Caption = LocText("DIA_JORU_SLEEPERCONTACT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJoruTester);
            default Rules.HideIfKnows(UChoiceJoruSleepercontact);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9e8ab53bf21a6563), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c56), EConversationDebugInfo::Executing);
                // So? Has the Sleeper spoken to you yet?
                Hero.AI.Say(LocText("DIA_JORU_SLEEPERCONTACT_15_00"));
                DC(int64(0x6aa0ebb737086c56), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c57), EConversationDebugInfo::Executing);
                
                // Not yet. But Kalom only ever gives us a few rolls.
                Joru.AI.Say(LocText("DIA_JORU_SLEEPERCONTACT_07_01"));
                DC(int64(0x6aa0ebb737086c57), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c58), EConversationDebugInfo::Executing);
                // Only the gurus get enough swampweed to truly elevate ...
                Joru.AI.Say(LocText("DIA_JORU_SLEEPERCONTACT_07_02"));
                DC(int64(0x6aa0ebb737086c58), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c59), EConversationDebugInfo::Executing);
                // But I don't mind ... someday, I'll be a guru, and then ...
                Joru.AI.Say(LocText("DIA_JORU_SLEEPERCONTACT_07_03"));
                DC(int64(0x6aa0ebb737086c59), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c5a), EConversationDebugInfo::Executing);
                // Someday ... 
                Joru.AI.Say(LocText("DIA_JORU_SLEEPERCONTACT_07_04"));
                DC(int64(0x6aa0ebb737086c5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJoruTester : UTopic_Hero__SC_NOV_JORU_1305
        {
            default DebugId = int64(0x6aa0ebb737086c50);
            default Caption = LocText("DIA_JORU_TESTER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJoruGreet);
            default Rules.HideIfKnows(UChoiceJoruTester);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9e8ab53bf21a6563), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6aa0ebb737086c51), EConversationDebugInfo::Executing);
                
                // You guys seem to be enjoying yourself. 
                Hero.AI.Say(LocText("DIA_JORU_TESTER_15_00"));
                DC(int64(0x6aa0ebb737086c51), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c52), EConversationDebugInfo::Executing);
                
                // Ha! You mean the smoking? That's not leisure, that's our ...
                Joru.AI.Say(LocText("DIA_JORU_TESTER_07_01"));
                DC(int64(0x6aa0ebb737086c52), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c53), EConversationDebugInfo::Executing);
                // Every other day, his apprentice, Caine, delivers us a ...
                Joru.AI.Say(LocText("DIA_JORU_TESTER_07_02"));
                DC(int64(0x6aa0ebb737086c53), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f560), EConversationDebugInfo::Executing);
                
                // Hard work, I'm sure ... 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_144919"));
                DC(int64(0x5dcd7126285f560), EConversationDebugInfo::Done);
                DC(int64(0x6aa0ebb737086c54), EConversationDebugInfo::Executing);
                
                // Actually, it is. The swampweed does much more than take ...
                Joru.AI.Say(LocText("DIA_JORU_TESTER_07_03"));
                DC(int64(0x6aa0ebb737086c54), EConversationDebugInfo::Done);
                DC(int64(0xfb31217cc8347b31), EConversationDebugInfo::Executing);
                Joru.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Joru_1305_AfterTalking);
                DC(int64(0xfb31217cc8347b31), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */