#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_EBR_GOMEZ_100 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_EBR_GOMEZ_100";
        }
        
        
        class UTopic_Hero__OC_EBR_GOMEZ_100 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_GOMEZ_100";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGomez() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetOC_VLK_DIGGER38_565() const property
            {
                return GetCharacter(n"OC_VLK_DIGGER38_565");
            }
        }
        
        
        class UChoiceEbr100GomezWait4sc : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d2713e1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceEbr100GomezWait4sc);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_FREEMINEORC_INTRO_17_01"), int64(0x7c68590f2d2713e1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7c68590f2d2713e2), G1R.ExploreSunkenTower == 0);
                    DB(int64(0xf8098c70905e1bd3), G1R != nullptr && !G1R.HasReachedChapter(5));
                }
                
                if (G1R.ExploreSunkenTower != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(5))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713e3), EConversationDebugInfo::Executing);
                // How did you get -
                Gomez.AI.Say(LocText("DIA_EBR_100_GOMEZ_WAIT4SC_11_01"));
                DC(int64(0x7c68590f2d2713e3), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e4), EConversationDebugInfo::Executing);
                // Hold on a moment. I know you. You're that bloody meatbug ...
                Gomez.AI.Say(LocText("DIA_EBR_100_GOMEZ_WAIT4SC_11_02"));
                DC(int64(0x7c68590f2d2713e4), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e5), EConversationDebugInfo::Executing);
                
                // You had no right to that raid. You should thank me for ...
                Hero.AI.Say(LocText("DIA_EBR_100_GOMEZ_WAIT4SC_15_03"));
                DC(int64(0x7c68590f2d2713e5), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e6), EConversationDebugInfo::Executing);
                
                // ... You got balls talking to me like that. But you were ...
                Gomez.AI.Say(LocText("DIA_EBR_100_GOMEZ_WAIT4SC_11_04"));
                DC(int64(0x7c68590f2d2713e6), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e7), EConversationDebugInfo::Executing);
                // I'll personally make sure you'll never get in my way ...
                Gomez.AI.Say(LocText("DIA_EBR_100_GOMEZ_WAIT4SC_11_05"));
                DC(int64(0x7c68590f2d2713e7), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8436), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0x48bed3b8afff8436), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7c68590f2d2713e9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomez145985 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c0631f9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceGomez145985);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Waypoint_Gomez_Throne", 150.0f, int64(0x67edebd12c0631f9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6830d3052dae068), G1R != nullptr && G1R.HasReachedChapter(5));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(5);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c0631f8), EConversationDebugInfo::Executing);
                // You have some nerve showing up here. Have you come to ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234202_41"));
                DC(int64(0x67edebd12c0631f8), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gomez_145991,
                    UTopic_Gomez_146011
                );
            }
        }
        
        
        class UTopic_Gomez_145991 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c0631fc);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234239_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_145991);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_WLOOBMH_20250219_150531"), int64(0x67edebd12c0631fc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c0631fd), EConversationDebugInfo::Executing);
                // Let's talk about this.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234239_2238"));
                DC(int64(0x67edebd12c0631fd), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063204), EConversationDebugInfo::Executing);
                
                // "Talk?" After all you've done, YOU want to TALK?
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234329"));
                DC(int64(0x67edebd12c063204), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063205), EConversationDebugInfo::Executing);
                
                // That's what I said. 
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234331"));
                DC(int64(0x67edebd12c063205), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063206), EConversationDebugInfo::Executing);
                
                // (scoffs) Fine. Say your piece then. THEN I'll kill you. 
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234337"));
                DC(int64(0x67edebd12c063206), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063207), EConversationDebugInfo::Executing);
                
                // Okay. I need your armor.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234352"));
                DC(int64(0x67edebd12c063207), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063208), EConversationDebugInfo::Executing);
                
                // ... You're joking. 
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234354"));
                DC(int64(0x67edebd12c063208), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gomez_146058,
                    UTopic_Gomez_146078
                );
            }
        }
        
        
        class UTopic_Gomez_146011 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c063200);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234239_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_146011);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063201), EConversationDebugInfo::Executing);
                // No. To kill you. 
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234239_2785"));
                DC(int64(0x67edebd12c063201), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0a6), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf6830d3052dae0a6), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0ac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6830d3052dae0ac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_146058 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06320a);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234455_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_146058);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c06320b), EConversationDebugInfo::Executing);
                // Give me the armor and I might spare your life. 
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234455_3436"));
                DC(int64(0x67edebd12c06320b), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac2), EConversationDebugInfo::Executing);
                
                // (long sigh) Bloody hell. You're as dumb as you look. 
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_161347"));
                DC(int64(0x329737458380ac2), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac3), EConversationDebugInfo::Executing);
                // Let's get this over with.
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_161401"));
                DC(int64(0x329737458380ac3), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0a8), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf6830d3052dae0a8), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x329737458380ac1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_146078 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06320e);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234455_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_146078);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c06320f), EConversationDebugInfo::Executing);
                // No. I need it to destroy the Sleeper.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234455_686"));
                DC(int64(0x67edebd12c06320f), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063212), EConversationDebugInfo::Executing);
                
                // The god of the Loons? So you bought into their nonsense? ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234544"));
                DC(int64(0x67edebd12c063212), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063213), EConversationDebugInfo::Executing);
                
                // The Sleeper is real, but he is no god. He's a demon, and ...
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234550"));
                DC(int64(0x67edebd12c063213), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063214), EConversationDebugInfo::Executing);
                // If we don't stop him before he wakes up, he'll kill ...
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234552"));
                DC(int64(0x67edebd12c063214), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063215), EConversationDebugInfo::Executing);
                
                // ... Well, I'll be damned. You actually believe this.
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234553"));
                DC(int64(0x67edebd12c063215), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063216), EConversationDebugInfo::Executing);
                
                // Yes. I'm headed into his lair to stop him, but I need ...
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234559"));
                DC(int64(0x67edebd12c063216), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063217), EConversationDebugInfo::Executing);
                // It's an ancient relic, and it's my only chance.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234601"));
                DC(int64(0x67edebd12c063217), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac4), EConversationDebugInfo::Executing);
                
                // ... 
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_161906"));
                DC(int64(0x329737458380ac4), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063218), EConversationDebugInfo::Executing);
                // What do I get out of this? 
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234602"));
                DC(int64(0x67edebd12c063218), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gomez_146128,
                    UTopic_Gomez_146148
                );
            }
        }
        
        
        class UTopic_Gomez_146128 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06321b);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234724_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_146128);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c06321c), EConversationDebugInfo::Executing);
                // How about I don't kill you? 
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234724_2386"));
                DC(int64(0x67edebd12c06321c), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063223), EConversationDebugInfo::Executing);
                
                // All that talking, and THAT's how you end? Fine, then, ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234745"));
                DC(int64(0x67edebd12c063223), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac5), EConversationDebugInfo::Executing);
                // Fight me. 
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_162142"));
                DC(int64(0x329737458380ac5), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0aa), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf6830d3052dae0aa), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0ab), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6830d3052dae0ab), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_146148 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06321f);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_234724_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_146148);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063220), EConversationDebugInfo::Executing);
                // What do you want?
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234724_1609"));
                DC(int64(0x67edebd12c063220), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063224), EConversationDebugInfo::Executing);
                
                // Well, let's assume you're right. There's a demon who ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234806"));
                DC(int64(0x67edebd12c063224), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063225), EConversationDebugInfo::Executing);
                
                // He's real.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234815"));
                DC(int64(0x67edebd12c063225), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063226), EConversationDebugInfo::Executing);
                
                // Fine. Then I want a rune. A teleportation rune that will ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_234826"));
                DC(int64(0x67edebd12c063226), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063227), EConversationDebugInfo::Executing);
                
                // Like what? I guess the other camps aren't in the cards.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235320"));
                DC(int64(0x67edebd12c063227), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063228), EConversationDebugInfo::Executing);
                
                // What a cunning jackal you are. No, I need a hiding ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235436"));
                DC(int64(0x67edebd12c063228), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063229), EConversationDebugInfo::Executing);
                // Hmm. Yes. The sunken tower. Surely, you've heard about ...
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235615"));
                DC(int64(0x67edebd12c063229), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac6), EConversationDebugInfo::Executing);
                // I don't know why, but something tells me you aren't ...
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_162421"));
                DC(int64(0x329737458380ac6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_Deal);
                DB(int64(0x67edebd12c063243), Hero != nullptr && Hero.HasItem(UItAr_Rune_TeleportToSunkenTower, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAr_Rune_TeleportToSunkenTower, 1, 0))
                {
                    Subdialog(
                        UTopic_Gomez_147329,
                        UTopic_Gomez_147349
                    );
                }
                else
                {
                    DC(int64(0x67edebd12c06323b), EConversationDebugInfo::Executing);
                    // I'll see if I can find one.
                    Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000004"));
                    DC(int64(0x67edebd12c06323b), EConversationDebugInfo::Done);
                    DC(int64(0x67edebd12c06323c), EConversationDebugInfo::Executing);
                    
                    // Do that. You know where to find me. 
                    Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000004_2995"));
                    DC(int64(0x67edebd12c06323c), EConversationDebugInfo::Done);
                    DC(int64(0x54bddbfe4da71eaf), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x54bddbfe4da71eaf), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Gomez_147329 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c063249);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_235956");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_147329);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063239), EConversationDebugInfo::Executing);
                // I have what you're after.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235956"));
                DC(int64(0x67edebd12c063239), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06323d), EConversationDebugInfo::Executing);
                // A rune for your armor.
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000134"));
                DC(int64(0x67edebd12c06323d), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06323a), EConversationDebugInfo::Executing);
                
                // Alright, then. The armor's in my chest. Here's the key.
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235956_491"));
                DC(int64(0x67edebd12c06323a), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063264), EConversationDebugInfo::Executing);
                
                // Okay. So that's it?
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001156"));
                DC(int64(0x67edebd12c063264), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063265), EConversationDebugInfo::Executing);
                
                // That's it. Good luck with what comes next. 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001204"));
                DC(int64(0x67edebd12c063265), EConversationDebugInfo::Done);
                DC(int64(0x3a7f267d2b842d59), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"GomezEscaped", Other);
                DC(int64(0x3a7f267d2b842d59), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c660d), EConversationDebugInfo::Executing);
                Gomez.AddItemToInventory(UItAr_Rune_TeleportToSunkenTower, 1);
                DC(int64(0xadb833f7154c660d), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c660f), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAr_Rune_TeleportToSunkenTower, 1, 0);
                DC(int64(0xadb833f7154c660f), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6611), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItKe_Gomez_01, 1);
                DC(int64(0xadb833f7154c6611), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6613), EConversationDebugInfo::Executing);
                Gomez.RemoveItemFromInventory(UItKe_Gomez_01, 1, 1);
                DC(int64(0xadb833f7154c6613), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6615), EConversationDebugInfo::Executing);
                Gomez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Teleport);
                DC(int64(0xadb833f7154c6615), EConversationDebugInfo::Done);
                DC(int64(0x54bddbfe4da71eb1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x54bddbfe4da71eb1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_147349 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06324d);
            default Caption = LocText("TEXT_WIP_AKGBIDI_20250130_000004");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_147349);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c06323b), EConversationDebugInfo::Executing);
                // I'll see if I can find one.
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000004"));
                DC(int64(0x67edebd12c06323b), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06323c), EConversationDebugInfo::Executing);
                
                // Do that. You know where to find me. 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000004_2995"));
                DC(int64(0x67edebd12c06323c), EConversationDebugInfo::Done);
                DC(int64(0x54bddbfe4da71eae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x54bddbfe4da71eae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomez147400 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c063259);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Waypoint_Gomez_Throne", 150.0f, int64(0x67edebd12c063259));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_AKGBIDI_20250130_000004_2995"), int64(0x67edebd12c063259));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_AKGBIDI_20250130_001204"), int64(0x67edebd12c063259));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6830d3052dae0ae), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063258), EConversationDebugInfo::Executing);
                // You have the rune? 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001042_3902"));
                DC(int64(0x67edebd12c063258), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Gomez_147422,
                    UTopic_Gomez_147442,
                    UTopic_Gomez_147601
                );
            }
        }
        
        
        class UTopic_Gomez_147422 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c06325c);
            default Caption = LocText("TEXT_WIP_AKGBIDI_20250130_001115_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c06325d), EConversationDebugInfo::Executing);
                // Not yet.
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001115_292"));
                DC(int64(0x67edebd12c06325d), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063267), EConversationDebugInfo::Executing);
                
                // Then get it. 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001413"));
                DC(int64(0x67edebd12c063267), EConversationDebugInfo::Done);
                DC(int64(0xf8098c70905e1bab), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf8098c70905e1bab), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_147442 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c063260);
            default Caption = LocText("TEXT_WIP_CIVTSEI_20250129_235956");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_147442);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf6830d3052dae0b2), Hero != nullptr && Hero.HasItem(UItAr_Rune_TeleportToSunkenTower, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAr_Rune_TeleportToSunkenTower, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063239), EConversationDebugInfo::Executing);
                // I have what you're after.
                Hero.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235956"));
                DC(int64(0x67edebd12c063239), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06323d), EConversationDebugInfo::Executing);
                // A rune for your armor.
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_000134"));
                DC(int64(0x67edebd12c06323d), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06323a), EConversationDebugInfo::Executing);
                
                // Alright, then. The armor's in my chest. Here's the key.
                Gomez.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_235956_491"));
                DC(int64(0x67edebd12c06323a), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063264), EConversationDebugInfo::Executing);
                
                // Okay. So that's it?
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001156"));
                DC(int64(0x67edebd12c063264), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c063265), EConversationDebugInfo::Executing);
                
                // That's it. Good luck with what comes next. 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001204"));
                DC(int64(0x67edebd12c063265), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_Escape);
                DC(int64(0x3a7f267d2b842d59), EConversationDebugInfo::Executing);
                Hero.StoreStoryEventInMemory(n"GomezEscaped", Other);
                DC(int64(0x3a7f267d2b842d59), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c660d), EConversationDebugInfo::Executing);
                Gomez.AddItemToInventory(UItAr_Rune_TeleportToSunkenTower, 1);
                DC(int64(0xadb833f7154c660d), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c660f), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItAr_Rune_TeleportToSunkenTower, 1, 0);
                DC(int64(0xadb833f7154c660f), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6611), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItKe_Gomez_01, 1);
                DC(int64(0xadb833f7154c6611), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6613), EConversationDebugInfo::Executing);
                Gomez.RemoveItemFromInventory(UItKe_Gomez_01, 1, 1);
                DC(int64(0xadb833f7154c6613), EConversationDebugInfo::Done);
                DC(int64(0xadb833f7154c6615), EConversationDebugInfo::Executing);
                Gomez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Teleport);
                DC(int64(0xadb833f7154c6615), EConversationDebugInfo::Done);
                DC(int64(0x54bddbfe4da71eb0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x54bddbfe4da71eb0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Gomez_147601 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x67edebd12c063268);
            default Caption = LocText("TEXT_WIP_AKGBIDI_20250130_001456_2332");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Gomez_147601);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67edebd12c063269), EConversationDebugInfo::Executing);
                // I changed my mind. I'll kill you after all.
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001456_2332"));
                DC(int64(0x67edebd12c063269), EConversationDebugInfo::Done);
                DC(int64(0x67edebd12c06326c), EConversationDebugInfo::Executing);
                
                // You know, part of me was hoping you'd say that. 
                Gomez.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_001519"));
                DC(int64(0x67edebd12c06326c), EConversationDebugInfo::Done);
                DC(int64(0x329737458380ac7), EConversationDebugInfo::Executing);
                // Let's see what you got. 
                Gomez.AI.Say(LocText("TEXT_WIP_YNZVQKH_20250204_162932"));
                DC(int64(0x329737458380ac7), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0b4), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0xf6830d3052dae0b4), EConversationDebugInfo::Done);
                DC(int64(0xf6830d3052dae0b5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf6830d3052dae0b5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomez227049 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xed4772c3b5e03e34);
            default Caption = LocText("TEXT_WIP_KZIQTLI_20260423_164836");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceGomez227049);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4772c3b5e03e38), G1R.FireMagesDead == 0);
                    DB(int64(0xed4772c3b5e03e39), G1R.PlaceholderCondition == 1);
                }
                
                if (G1R.FireMagesDead != 0)
                    return false;
                
                if (G1R.PlaceholderCondition != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4772c3b5e03e32), EConversationDebugInfo::Executing);
                // What about In Extremo? Some music won't hurt anybody.
                Hero.AI.Say(LocText("TEXT_WIP_KZIQTLI_20260423_164836"));
                DC(int64(0xed4772c3b5e03e32), EConversationDebugInfo::Done);
                DC(int64(0xed4772c3b5e03e33), EConversationDebugInfo::Executing);
                
                // And you're all getting distracted. Enough of that. The ...
                Gomez.AI.Say(LocText("TEXT_WIP_KZIQTLI_20260423_164836_41"));
                DC(int64(0xed4772c3b5e03e33), EConversationDebugInfo::Done);
                DC(int64(0xc18bca787d06d4bb), EConversationDebugInfo::Executing);
                
                // And the musicians?
                Hero.AI.Say(LocText("TEXT_WIP_PZDDTWI_20260424_103445"));
                DC(int64(0xc18bca787d06d4bb), EConversationDebugInfo::Done);
                DC(int64(0xed4772c3b5e03e36), EConversationDebugInfo::Executing);
                
                // They'll be rotting in the dungeon.
                Gomez.AI.Say(LocText("TEXT_WIP_KZIQTLI_20260423_164926"));
                DC(int64(0xed4772c3b5e03e36), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomez229617 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x4ff2ad69e40a16cc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGomez229617);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OC_INEXTREMO_GOMEZ_INTRO", 200.0f, int64(0x4ff2ad69e40a16cc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x75a94ed1b6b4e5bd), G1R.IntroInExtremo != 0);
                }
                
                return G1R.IntroInExtremo != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ff2ad69e40a16d0), EConversationDebugInfo::Executing);
                Gomez.AI.TurnToCharacter(OC_VLK_DIGGER38_565);
                DC(int64(0x4ff2ad69e40a16d0), EConversationDebugInfo::Done);
                DC(int64(0xb694b8b6e87ec49f), EConversationDebugInfo::Executing);
                // Men!
                Gomez.AI.Say(LocText("TEXT_WIP_QNKNJXI_20260207_181508_41"), Posture = GameplayTag::Posture_Standing_Forced_Presentation01, TargetCharacter = OC_VLK_DIGGER38_565.Character);
                DC(int64(0xb694b8b6e87ec49f), EConversationDebugInfo::Done);
                DC(int64(0xb694b8b6e87ec4a2), EConversationDebugInfo::Executing);
                // In the last few weeks, we have mined ore. A lot of ore. ...
                Gomez.AI.Say(LocText("TEXT_WIP_QNKNJXI_20260207_181539"), ForceCameraPreset = n"GOMEZ IN EXTREMO WIDE", Posture = GameplayTag::Posture_Standing_Forced_Presentation02, TargetCharacter = OC_VLK_DIGGER38_565.Character);
                DC(int64(0xb694b8b6e87ec4a2), EConversationDebugInfo::Done);
                DC(int64(0xb694b8b6e87ec4a5), EConversationDebugInfo::Executing);
                // But that was not enough for you. No… you wanted more. ...
                Gomez.AI.Say(LocText("TEXT_WIP_QNKNJXI_20260207_181546"), ForceCameraPreset = n"GOMEZ IN EXTREMO CLOSE", Posture = GameplayTag::Posture_Standing_Forced_Presentation03, TargetCharacter = OC_VLK_DIGGER38_565.Character);
                DC(int64(0xb694b8b6e87ec4a5), EConversationDebugInfo::Done);
                DC(int64(0xb694b8b6e87ec4a8), EConversationDebugInfo::Executing);
                // I heard you. And today, I give you what you wanted.
                Gomez.AI.Say(LocText("TEXT_WIP_QNKNJXI_20260207_181708"), ForceCameraPreset = n"GOMEZ IN EXTREMO CLOSE", Posture = GameplayTag::Posture_Standing_Forced_Presentation04, TargetCharacter = OC_VLK_DIGGER38_565.Character);
                DC(int64(0xb694b8b6e87ec4a8), EConversationDebugInfo::Done);
                DC(int64(0xd90aec68c9e328ad), EConversationDebugInfo::Executing);
                G1R.BannerInExtremo();
                DC(int64(0xd90aec68c9e328ad), EConversationDebugInfo::Done);
                DC(int64(0xd90aec68c9e328a9), EConversationDebugInfo::Executing);
                // IN EXTREMO!
                Gomez.AI.Say(LocText("TEXT_WIP_QNKNJXI_20260207_181723"), ForceCameraPreset = n"GOMEZ IN EXTREMO BANNER", Posture = GameplayTag::Posture_Standing_Forced_Presentation05, TargetCharacter = OC_VLK_DIGGER38_565.Character);
                DC(int64(0xd90aec68c9e328a9), EConversationDebugInfo::Done);
                DC(int64(0xd90aec68c9e328ad), EConversationDebugInfo::Executing);
                Gomez.AI.WaitSeconds(1);
                DC(int64(0xd90aec68c9e328ad), EConversationDebugInfo::Done);
                DC(int64(0xb75341bf30de2e2d), EConversationDebugInfo::Executing);
                Gomez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_InExtremoOut);
                DC(int64(0xb75341bf30de2e2d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomez230157 : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x488137803f0310fc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x488137803f031101), G1R.FireMagesDead != 0);
                    DB(int64(0x488137803f031255), Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && !Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded());
                }
                
                if (G1R.FireMagesDead == 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE != nullptr && Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x48bed3b8afff8436), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediately(Hero);
                DC(int64(0x48bed3b8afff8436), EConversationDebugInfo::Done);
                DC(int64(0x488137803f031256), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x488137803f031256), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezDabei : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d2713d0);
            default Caption = LocText("DIA_GOMEZ_DABEI_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGomezDabei);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_11_01"), int64(0x7c68590f2d2713d0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7c68590f2d2713d1), G1R.Gomez_Contacts >= 3);
                    DB(int64(0x7c68590f2d2713d2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x7c68590f2d2713d3), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                if (G1R.Gomez_Contacts < 3)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713d4), EConversationDebugInfo::Executing);
                // Does that mean I'm in?
                Hero.AI.Say(LocText("DIA_GOMEZ_DABEI_15_00"));
                DC(int64(0x7c68590f2d2713d4), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713d5), EConversationDebugInfo::Executing);
                
                // That's exactly what it means. You're one of us now, ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_DABEI_11_01"));
                DC(int64(0x7c68590f2d2713d5), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713d6), EConversationDebugInfo::Executing);
                // Go talk to Raven. He'll give you something to do.
                Gomez.AI.Say(LocText("DIA_GOMEZ_DABEI_11_02"));
                DC(int64(0x7c68590f2d2713d6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_Shadow);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_RAVEN, Document::UDocumentSegment_Glossary_OC_EBR_RAVEN_Boss);
                DB(int64(0xd001c8c0a4f04561), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                {
                    DC(int64(0xd001c8c0a4f04563), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_MORDRAGKO.FailQuest();
                    DC(int64(0xd001c8c0a4f04563), EConversationDebugInfo::Done);
                }
                DB(int64(0x9852e53caa8f79c9), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
                {
                    DC(int64(0x9852e53caa8f79cb), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_FINGERS_RING.FailQuest();
                    DC(int64(0x9852e53caa8f79cb), EConversationDebugInfo::Done);
                }
                DB(int64(0xffb2308570a1da92), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                {
                    DC(int64(0xffb2308570a1da94), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CONVOY.FailQuest();
                    DC(int64(0xffb2308570a1da94), EConversationDebugInfo::Done);
                }
                DB(int64(0x56788585a6b9026), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINNC, Document::UDocumentSegment_CH1_JOINNC_OCFail);
                }
                DB(int64(0x56788585a6b97e2), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_FailOC);
                }
                DC(int64(0x48bed3b8afff8440), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_OldCamp_Shadow);
                DC(int64(0x48bed3b8afff8440), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8442), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC.SucceedQuest();
                DC(int64(0x48bed3b8afff8442), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8444), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_JOINNC.FailQuest();
                DC(int64(0x48bed3b8afff8444), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8446), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.FailQuest();
                DC(int64(0x48bed3b8afff8446), EConversationDebugInfo::Done);
                DC(int64(0xf82777388df4cfbb), EConversationDebugInfo::Executing);
                G1R.ForceConvoyCleanup();
                DC(int64(0xf82777388df4cfbb), EConversationDebugInfo::Done);
                DC(int64(0xa9a741ef3bb53c9f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.RemoveImmortality(); }
                DC(int64(0xa9a741ef3bb53c9f), EConversationDebugInfo::Done);
                DB(int64(0x9a4c498930550b8d), Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait));
                
                if (Mordrag != nullptr && Mordrag.HasAssignedDailyRoutine(UDailyRoutine_OC_ORG_Mordrag_826_GuideWait))
                {
                    DC(int64(0x9a4c498930550b8f), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Mordrag))) { Mordrag.ExchangeDailyRoutineToClass(UDailyRoutine_OC_ORG_Mordrag_826_AfterBeated); }
                    DC(int64(0x9a4c498930550b8f), EConversationDebugInfo::Done);
                }
                DC(int64(0x7c68590f2d2713dc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7c68590f2d2713dc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezExit : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d271387);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d271388), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7c68590f2d271388), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezFault : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d271389);
            default Caption = LocText("DIA_GOMEZ_FAULT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGomezFault);
            default Rules.HideIfKnows(UChoiceRavenThere);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Waypoint_Gomez_Throne", 150.0f, int64(0x7c68590f2d271389));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa234b93972ac50b2), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0xa234b93972ac50b3), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && !Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d27138a), EConversationDebugInfo::Executing);
                // I'm here because I want to work for you.
                Hero.AI.Say(LocText("DIA_GOMEZ_FAULT_15_00"));
                DC(int64(0x7c68590f2d27138a), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d27138b), EConversationDebugInfo::Executing);
                
                // What, so you just sneak in here like a thief? You worm ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_FAULT_11_01"));
                DC(int64(0x7c68590f2d27138b), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8453), EConversationDebugInfo::Executing);
                Gomez.AI.StartAttackingImmediatelySpareLifeNoLooting(Hero);
                DC(int64(0x48bed3b8afff8453), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d27138f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7c68590f2d27138f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezHello : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d271390);
            default Caption = LocText("DIA_GOMEZ_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Waypoint_Gomez_Throne", 150.0f, int64(0x7c68590f2d271390));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_RAVEN_THERE_10_01"), int64(0x7c68590f2d271390));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7c68590f2d271391), G1R.Gomez_Contacts < 4);
                    DB(int64(0xd5f96abeb9f7c358), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                if (G1R.Gomez_Contacts >= 4)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d271392), EConversationDebugInfo::Executing);
                // I want to work for you.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_15_00"));
                DC(int64(0x7c68590f2d271392), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d271393), EConversationDebugInfo::Executing);
                
                // Like every freshie they throw in here. What makes YOU ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_11_01"));
                DC(int64(0x7c68590f2d271393), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_Introduction);
                DC(int64(0xa0c47c1e219584f5), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE.SucceedQuest();
                DC(int64(0xa0c47c1e219584f5), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGomezHelloKopfab,
                    UChoiceGomezHelloSpinner,
                    UChoiceGomezHelloKontakte,
                    UChoiceGomezHelloThorussays
                );
            }
        }
        
        
        class UChoiceGomezHelloKopfab : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd36f);
            default Caption = LocText("DIA_GOMEZ_HELLO_KOPFAB_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d271396), EConversationDebugInfo::Executing);
                // Do I need to chop your head off to prove I'm a good ...
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KOPFAB_15_00"));
                DC(int64(0x7c68590f2d271396), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d271397), EConversationDebugInfo::Executing);
                
                // Well. That was about the dumbest thing anyone's ever ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KOPFAB_11_01"));
                DC(int64(0x7c68590f2d271397), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8497), EConversationDebugInfo::Executing);
                Gomez.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent);
                DC(int64(0x48bed3b8afff8497), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d27139b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7c68590f2d27139b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezHelloSpinner : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd377);
            default Caption = LocText("DIA_GOMEZ_HELLO_SPINNER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloSpinner);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d27139d), EConversationDebugInfo::Executing);
                // Because this camp is full of idiots who let others do ...
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_SPINNER_15_00"));
                DC(int64(0x7c68590f2d27139d), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d27139e), EConversationDebugInfo::Executing);
                
                // True, at least for the most part. But what tells me ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_SPINNER_11_01"));
                DC(int64(0x7c68590f2d27139e), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d27139f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d27139f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakte : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd37c);
            default Caption = LocText("TEXT_CHOICE_GOMEZ_HELLO_KONTAKTE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713a2), EConversationDebugInfo::Executing);
                // I got around a bit - I know people in all the camps.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_15_00"));
                DC(int64(0x7c68590f2d2713a2), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713a3), EConversationDebugInfo::Executing);
                
                // That's actually a good reason. Who do you know? 
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_11_01"));
                DC(int64(0x7c68590f2d2713a3), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGomezHelloKontakteThatsall,
                    UChoiceGomezHelloKontakteNlhehler,
                    UChoiceGomezHelloKontakteLares,
                    UChoiceGomezHelloKontakteBaals,
                    UChoiceGomezHelloKontakteKalom,
                    UChoiceGomezHelloKontakteYberion
                );
            }
        }
        
        
        class UChoiceGomezHelloThorussays : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd3b2);
            default Caption = LocText("DIA_GOMEZ_HELLO_THORUSSAYS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloThorussays);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713cd), EConversationDebugInfo::Executing);
                // Diego trusts me, and Thorus says I'm a good man. 
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_THORUSSAYS_15_00"));
                DC(int64(0x7c68590f2d2713cd), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713ce), EConversationDebugInfo::Executing);
                
                // You wouldn't be talking to me if you weren't. I hope ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_THORUSSAYS_11_01"));
                DC(int64(0x7c68590f2d2713ce), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713cf), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d2713cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakteThatsall : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd37e);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x930a1886f134cee7), G1R.Gomez_Contacts >= 1);
                }
                
                return G1R.Gomez_Contacts >= 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713a6), EConversationDebugInfo::Executing);
                // Those were the important ones.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_15_00"));
                DC(int64(0x7c68590f2d2713a6), EConversationDebugInfo::Done);
                DB(int64(0x7c68590f2d2713a8), G1R.Gomez_Contacts >= 4);
                
                if (G1R.Gomez_Contacts >= 4)
                {
                    DC(int64(0x7c68590f2d2713a9), EConversationDebugInfo::Executing);
                    // Not bad. Especially for a new guy.
                    Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_11_01"));
                    DC(int64(0x7c68590f2d2713a9), EConversationDebugInfo::Done);
                    DC(int64(0x7c68590f2d2713aa), EConversationDebugInfo::Executing);
                    // All right. You'll get your chance.
                    Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_11_02"));
                    DC(int64(0x7c68590f2d2713aa), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7c68590f2d2713ab), EConversationDebugInfo::Executing);
                    // What, and that's supposed to impress me? I know diggers ...
                    Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_THATSALL_INSUFF_11_00"));
                    DC(int64(0x7c68590f2d2713ab), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGomezHelloKontakteNlhehler : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd389);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_NLHEHLER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloKontakteNlhehler);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713ae), EConversationDebugInfo::Executing);
                // A couple of fences from the New Camp.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_NLHEHLER_15_00"));
                DC(int64(0x7c68590f2d2713ae), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713af), EConversationDebugInfo::Executing);
                
                // And?
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_NLHEHLER_11_01"));
                DC(int64(0x7c68590f2d2713af), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8479), EConversationDebugInfo::Executing);
                G1R.Gomez_Contacts += 1;
                DC(int64(0x48bed3b8afff8479), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713b1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d2713b1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakteLares : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd38f);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_LARES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloKontakteLares);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713b3), EConversationDebugInfo::Executing);
                // Lares.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_LARES_15_00"));
                DC(int64(0x7c68590f2d2713b3), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713b4), EConversationDebugInfo::Executing);
                
                // And?
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_LARES_11_01"));
                DC(int64(0x7c68590f2d2713b4), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8480), EConversationDebugInfo::Executing);
                G1R.Gomez_Contacts += 1;
                DC(int64(0x48bed3b8afff8480), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713b6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d2713b6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakteBaals : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd395);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_BAALS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloKontakteBaals);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713b8), EConversationDebugInfo::Executing);
                // Some of the baals from the Brotherhood.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_BAALS_15_00"));
                DC(int64(0x7c68590f2d2713b8), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713b9), EConversationDebugInfo::Executing);
                
                // And?
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_BAALS_11_01"));
                DC(int64(0x7c68590f2d2713b9), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8487), EConversationDebugInfo::Executing);
                G1R.Gomez_Contacts += 1;
                DC(int64(0x48bed3b8afff8487), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713bb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d2713bb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakteKalom : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd39b);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_KALOM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloKontakteKalom);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713bd), EConversationDebugInfo::Executing);
                // Cor Kalom.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_KALOM_15_00"));
                DC(int64(0x7c68590f2d2713bd), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713be), EConversationDebugInfo::Executing);
                
                // And?
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_KALOM_11_01"));
                DC(int64(0x7c68590f2d2713be), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff848e), EConversationDebugInfo::Executing);
                G1R.Gomez_Contacts += 1;
                DC(int64(0x48bed3b8afff848e), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713c0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7c68590f2d2713c0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGomezHelloKontakteYberion : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0xe8603e87342bd3a1);
            default Caption = LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGomezHelloKontakteYberion);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713c3), EConversationDebugInfo::Executing);
                // To Y'Berion.
                Hero.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_15_00"));
                DC(int64(0x7c68590f2d2713c3), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713c4), EConversationDebugInfo::Executing);
                
                // Y'Berion? He wouldn't waste his time with a freshie like ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_11_01"));
                DC(int64(0x7c68590f2d2713c4), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713c5), EConversationDebugInfo::Executing);
                // Which means you lied to me - and that you seem to think ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_11_02"));
                DC(int64(0x7c68590f2d2713c5), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713c6), EConversationDebugInfo::Executing);
                // That's disappointing.
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_11_03"));
                DC(int64(0x7c68590f2d2713c6), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713c7), EConversationDebugInfo::Executing);
                // And I hate being disappointed.
                Gomez.AI.Say(LocText("DIA_GOMEZ_HELLO_KONTAKTE_YBERION_11_04"));
                DC(int64(0x7c68590f2d2713c7), EConversationDebugInfo::Done);
                DC(int64(0x48bed3b8afff8497), EConversationDebugInfo::Executing);
                Gomez.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Real, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent);
                DC(int64(0x48bed3b8afff8497), EConversationDebugInfo::Done);
                DC(int64(0x8cb9a96ecdca7097), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8cb9a96ecdca7097), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGomezNurso : UTopic_Hero__OC_EBR_GOMEZ_100
        {
            default DebugId = int64(0x7c68590f2d2713dd);
            default Caption = LocText("DIA_GOMEZ_NURSO_15_00");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"Waypoint_Gomez_Throne", 150.0f, int64(0x7c68590f2d2713dd));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_RAVEN_SPYSECT_10_01"), int64(0x7c68590f2d2713dd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7c68590f2d2713de), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c68590f2d2713df), EConversationDebugInfo::Executing);
                // I have news from the Swamp Camp. 
                Hero.AI.Say(LocText("DIA_GOMEZ_NURSO_15_00"));
                DC(int64(0x7c68590f2d2713df), EConversationDebugInfo::Done);
                DC(int64(0x7c68590f2d2713e0), EConversationDebugInfo::Executing);
                
                // Raven handles the moles. Never talk to me again unless I ...
                Gomez.AI.Say(LocText("DIA_GOMEZ_NURSO_11_00"));
                DC(int64(0x7c68590f2d2713e0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_GOMEZ, Document::UDocumentSegment_Glossary_OC_EBR_GOMEZ_DontTalk);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */