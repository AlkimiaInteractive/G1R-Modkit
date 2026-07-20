#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_BALOR_1304 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_BALOR_1304";
        }
        
        
        class UTopic_Hero__SC_NOV_BALOR_1304 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_BALOR_1304";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBalor() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceBalor147501 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x2c980de305626ca4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBalor147501);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c980de305626cda), Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS != nullptr && Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS.IsRunning());
                    DB(int64(0x2c980de305626cdd), Hero != nullptr && Hero.IsInConversation());
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
                DC(int64(0x2c980de305626ca1), EConversationDebugInfo::Executing);
                // ... Wait. I know you. You're that bloke who fucked ...
                Balor.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151627_41"));
                DC(int64(0x2c980de305626ca1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_BALOR, Document::UDocumentSegment_Glossary_SC_NOV_BALOR_CampDivided);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_KALOMEXPERIMENTS, Document::UDocumentSegment_CH3_KALOMEXPERIMENTS_RecruitBalor);
                Subdialog(
                    UTopic_Balor_443547,
                    UTopic_Balor_443567,
                    UTopic_Balor_443704
                );
                DC(int64(0xed7a42cc531a1879), EConversationDebugInfo::Executing);
                // Don't get me wrong, though, I'm glad to see a "friendly ...
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153120_2386"));
                DC(int64(0xed7a42cc531a1879), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1880), EConversationDebugInfo::Executing);
                // This place ... I thought I was bein' clever stickin' ...
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153344"));
                DC(int64(0xed7a42cc531a1880), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cb0), EConversationDebugInfo::Executing);
                
                // Yeah, about that. Viran has an escape plan. Are you in? 
                Hero.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151657"));
                DC(int64(0x2c980de305626cb0), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1885), EConversationDebugInfo::Executing);
                
                // He ... how? 
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153534"));
                DC(int64(0xed7a42cc531a1885), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cb3), EConversationDebugInfo::Executing);
                
                // I'll stir up a distraction. Shouldn't be too hard. 
                Hero.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151705"));
                DC(int64(0x2c980de305626cb3), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cb9), EConversationDebugInfo::Executing);
                
                // Hmm. It's about that mate of his, ain't it? The one they ...
                Balor.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151719"));
                DC(int64(0x2c980de305626cb9), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cbf), EConversationDebugInfo::Executing);
                
                // Yes. Viran thinks he's next. And then the other novices.
                Hero.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151739"));
                DC(int64(0x2c980de305626cbf), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1886), EConversationDebugInfo::Executing);
                
                // And I think he's right. Okay, I'm in. Where do we meet?
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153713"));
                DC(int64(0xed7a42cc531a1886), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cc2), EConversationDebugInfo::Executing);
                
                // At the entrance. I'll take it from there.
                Hero.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151748"));
                DC(int64(0x2c980de305626cc2), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cc7), EConversationDebugInfo::Executing);
                
                // Thanks. If I believed in any of that crap, I'd say the ...
                Balor.AI.Say(LocText("TEXT_WIP_IKIVTFE_20250127_151759"));
                DC(int64(0x2c980de305626cc7), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626ccd), EConversationDebugInfo::Executing);
                Balor.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Balor_1304_Wait);
                DC(int64(0x2c980de305626ccd), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142629e2ea), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_KALOMEXPERIMENTS_KALOMEXPERIMENTS_OBJ_RECRUITBALOR.SucceedQuest();
                DC(int64(0x8c29f1142629e2ea), EConversationDebugInfo::Done);
                DC(int64(0x2c980de305626cd4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2c980de305626cd4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Balor_443547 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xed7a42cc531a185f);
            default Caption = LocText("TEXT_WIP_GPPCYMI_20250127_152927_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Balor_443547);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed7a42cc531a1860), EConversationDebugInfo::Executing);
                // The Sleeper WAS always a demon. I was just the one who ...
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_152927_2785"));
                DC(int64(0xed7a42cc531a1860), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1869), EConversationDebugInfo::Executing);
                
                // (snorts cynically) Can't argue with that. 
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_152945"));
                DC(int64(0xed7a42cc531a1869), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Balor_443567 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xed7a42cc531a1863);
            default Caption = LocText("TEXT_WIP_GPPCYMI_20250127_152927_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Balor_443567);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed7a42cc531a1864), EConversationDebugInfo::Executing);
                
                // I was just doing my job.
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_152927_3286"));
                DC(int64(0xed7a42cc531a1864), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1870), EConversationDebugInfo::Executing);
                
                // (snorts cynically) Guess you were. 
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153007"));
                DC(int64(0xed7a42cc531a1870), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Balor_443704 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xed7a42cc531a186a);
            default Caption = LocText("TEXT_WIP_GPPCYMI_20250127_152958_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Balor_443704);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed7a42cc531a186b), EConversationDebugInfo::Executing);
                
                // You're the idiot who joined a madman. 
                Hero.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_152958_686"));
                DC(int64(0xed7a42cc531a186b), EConversationDebugInfo::Done);
                DC(int64(0xed7a42cc531a1877), EConversationDebugInfo::Executing);
                
                // (snorts cynically) You say it how it comes, eh? 
                Balor.AI.Say(LocText("TEXT_WIP_GPPCYMI_20250127_153039"));
                DC(int64(0xed7a42cc531a1877), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorExit : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bc0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bc1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb7cbf5a3a5759bc1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBalorFetchweed : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bc2);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_140519");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBalorFetchweed);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7cbf5a3a5759bc3), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f54a), EConversationDebugInfo::Executing);
                // Are you the weed pickers?
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_140519"));
                DC(int64(0x5dcd7126285f54a), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f54b), EConversationDebugInfo::Executing);
                
                // No. We're out here for the view. 
                Balor.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_140529"));
                DC(int64(0x5dcd7126285f54b), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bc4), EConversationDebugInfo::Executing);
                
                // Baal Orun sent me - I'm supposed to pick up your ...
                Hero.AI.Say(LocText("DIA_BALOR_FETCHWEED_15_00"));
                DC(int64(0xb7cbf5a3a5759bc4), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bc5), EConversationDebugInfo::Executing);
                
                // Ah, good - that saves me the walk. Here, take it.
                Balor.AI.Say(LocText("DIA_BALOR_FETCHWEED_01_01"));
                DC(int64(0xb7cbf5a3a5759bc5), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bc6), EConversationDebugInfo::Executing);
                // Don't forget to grab Viran's harvest, in case you ain't ...
                Balor.AI.Say(LocText("DIA_BALOR_FETCHWEED_01_02"));
                DC(int64(0xb7cbf5a3a5759bc6), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bc7), EConversationDebugInfo::Executing);
                // If you don't, Kalom's gonna think you pawned the rest. 
                Balor.AI.Say(LocText("DIA_BALOR_FETCHWEED_01_03"));
                DC(int64(0xb7cbf5a3a5759bc7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_BALOR, Document::UDocumentSegment_Glossary_SC_NOV_BALOR_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_BalorHarvest);
                DB(int64(0x2425a25d0c6a94f1), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN != nullptr && !Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN.HasBeenStarted());
                
                if (Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN != nullptr && !Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_VIRAN.HasBeenStarted())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_BalorExtraInfo);
                }
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Balor.AddItemToInventory(UItMi_Plants_Swampherb_01, 50);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe6db), EConversationDebugInfo::Executing);
                Balor.AI.GiveItemTo(Hero, UItMi_Plants_Swampherb_01, 50);
                DC(int64(0x281bfa5ab8fe6db), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe6df), EConversationDebugInfo::Executing);
                G1R.Balor_CollectDay = FInGameTime::Now();
                DC(int64(0x281bfa5ab8fe6df), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba54d4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR.StartQuest();
                DC(int64(0x138d345a7dba54d4), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba54e7), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_BALOR.SucceedQuest();
                DC(int64(0x138d345a7dba54e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorPerm : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bfc);
            default Caption = LocText("DIA_BALOR_PERM_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBalorFetchweed);
            
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
                DC(int64(0xb7cbf5a3a5759bfd), EConversationDebugInfo::Executing);
                // Keep at it, lads.
                Hero.AI.Say(LocText("DIA_BALOR_PERM_15_00"));
                DC(int64(0xb7cbf5a3a5759bfd), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bfe), EConversationDebugInfo::Executing);
                
                // What else am I gonna do out here? Fondle me balls?
                Balor.AI.Say(LocText("DIA_BALOR_PERM_01_01"));
                DC(int64(0xb7cbf5a3a5759bfe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorRipoff : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bf1);
            default Caption = LocText("DIA_BALOR_RIPOFF_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBalorFetchweed);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7cbf5a3a5759bf2), G1R.Balor_CollectDay.IsValid() && G1R.Balor_CollectDay.IsAtLeastXDaysAgo(2));
                    DB(int64(0x9e8ab53bf21a658b), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x368694f2bc0ff406), G1R.Balor_Harvest <= 1);
                }
                
                if (G1R.Balor_CollectDay.IsValid() && !G1R.Balor_CollectDay.IsAtLeastXDaysAgo(2))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (G1R.Balor_Harvest > 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bf3), EConversationDebugInfo::Executing);
                
                // It's me again. Cor Kalom wants me to pick up the next ...
                Hero.AI.Say(LocText("DIA_BALOR_RIPOFF_15_00"));
                DC(int64(0xb7cbf5a3a5759bf3), EConversationDebugInfo::Done);
                DB(int64(0xb7cbf5a3a5759bf5), G1R.Balor_TellsNCDealer != 0);
                DB(int64(0x7018fa7f6d56c7e6), G1R.Balor_Harvest == 1);
                
                if (G1R.Balor_TellsNCDealer != 0)
                {
                    DC(int64(0xb7cbf5a3a5759bf6), EConversationDebugInfo::Executing);
                    // Riiiight ... so you can sell it to the New Campers ...
                    Balor.AI.Say(LocText("DIA_BALOR_RIPOFF_01_01"));
                    DC(int64(0xb7cbf5a3a5759bf6), EConversationDebugInfo::Done);
                    DC(int64(0xb7cbf5a3a5759bf7), EConversationDebugInfo::Executing);
                    // Fifty nuggets upfront. The usual rate.
                    Balor.AI.Say(LocText("DIA_BALOR_RIPOFF_01_02"));
                    DC(int64(0xb7cbf5a3a5759bf7), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Balor_231651,
                        UTopic_Balor_231671
                    );
                }
                else if (G1R.Balor_Harvest == 1)
                {
                    DC(int64(0x7018fa7f6d56c7e2), EConversationDebugInfo::Executing);
                    // Haaa.. (sigh)
                    Balor.AI.Say(LocText("GVL_G1R_VOICE25_REACTIONINTERJECTIONDISAPPOINTMENT_0"));
                    DC(int64(0x7018fa7f6d56c7e2), EConversationDebugInfo::Done);
                    DC(int64(0x368694f2bc0ff403), EConversationDebugInfo::Executing);
                    G1R.Balor_Harvest += 1;
                    DC(int64(0x368694f2bc0ff403), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb7cbf5a3a5759bf8), EConversationDebugInfo::Executing);
                    // Again? Fine, take it - but don't get any ideas, will ...
                    Balor.AI.Say(LocText("DIA_BALOR_RIPOFF_01_03"));
                    DC(int64(0xb7cbf5a3a5759bf8), EConversationDebugInfo::Done);
                    DC(int64(0xb7cbf5a3a5759bf9), EConversationDebugInfo::Executing);
                    
                    // I'd never.
                    Hero.AI.Say(LocText("DIA_BALOR_RIPOFF_15_04"));
                    DC(int64(0xb7cbf5a3a5759bf9), EConversationDebugInfo::Done);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                    Balor.AddItemToInventory(UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8fe6f1), EConversationDebugInfo::Executing);
                    Balor.AI.GiveItemTo(Hero, UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0x281bfa5ab8fe6f1), EConversationDebugInfo::Done);
                    DC(int64(0x7018fa7f6d56c7d7), EConversationDebugInfo::Executing);
                    G1R.Balor_CollectDay = FInGameTime::Now();
                    DC(int64(0x7018fa7f6d56c7d7), EConversationDebugInfo::Done);
                    DC(int64(0x368694f2bc0ff408), EConversationDebugInfo::Executing);
                    G1R.Balor_Harvest += 1;
                    DC(int64(0x368694f2bc0ff408), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Balor_231651 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x91e40d0667a9a822);
            default Caption = LocText("DIA_BALOR_TELLDEALER_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91e40d0667a9a823), EConversationDebugInfo::Executing);
                // Forget it.
                Hero.AI.Say(LocText("DIA_BALOR_TELLDEALER_FORGETIT_15_00"));
                DC(int64(0x91e40d0667a9a823), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Balor_231671 : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x91e40d0667a9a826);
            default Caption = LocText("DIA_BALOR_TELLDEALER_PAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91e40d0667a9a827), EConversationDebugInfo::Executing);
                // Fifty it is. Here.
                Hero.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_15_00"));
                DC(int64(0x91e40d0667a9a827), EConversationDebugInfo::Done);
                DB(int64(0x7018fa7f6d56c7b2), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0))
                {
                    DC(int64(0x7018fa7f6d56c7cd), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Balor, UItMi_Orenugget, 50);
                    DC(int64(0x7018fa7f6d56c7cd), EConversationDebugInfo::Done);
                    DC(int64(0x7018fa7f6d56c7cf), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Plants_Swampherb_01, 50);
                    DC(int64(0x7018fa7f6d56c7cf), EConversationDebugInfo::Done);
                    DC(int64(0x7018fa7f6d56c7d5), EConversationDebugInfo::Executing);
                    G1R.Balor_CollectDay = FInGameTime::Now();
                    DC(int64(0x7018fa7f6d56c7d5), EConversationDebugInfo::Done);
                    DC(int64(0x368694f2bc0ff405), EConversationDebugInfo::Executing);
                    G1R.Balor_Harvest += 1;
                    DC(int64(0x368694f2bc0ff405), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7018fa7f6d56c7b3), EConversationDebugInfo::Executing);
                    // I don't see nothing. Fifty, cold and blue. We clear?
                    Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_NOORE_01_00"));
                    DC(int64(0x7018fa7f6d56c7b3), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBalorSellunder : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bcb);
            default Caption = LocText("DIA_BALOR_SELLUNDER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBalorFetchweed);
            default Rules.HideIfKnows(UChoiceBalorSellunder);
            
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
                DC(int64(0xb7cbf5a3a5759bcc), EConversationDebugInfo::Executing);
                // Who would I sell that weed to anyway?
                Hero.AI.Say(LocText("DIA_BALOR_SELLUNDER_15_00"));
                DC(int64(0xb7cbf5a3a5759bcc), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bcd), EConversationDebugInfo::Executing);
                
                // Ha! Put an idea in your head, didn't I?
                Balor.AI.Say(LocText("DIA_BALOR_SELLUNDER_01_01"));
                DC(int64(0xb7cbf5a3a5759bcd), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBalorSellunderForgetit,
                    UChoiceBalorSellunderHalfhalf,
                    UChoiceBalorSellunderComeon
                );
            }
        }
        
        
        class UChoiceBalorSellunderForgetit : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xbc94b682d71a929a);
            default Caption = LocText("DIA_BALOR_SELLUNDER_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bd0), EConversationDebugInfo::Executing);
                // Nevermind.
                Hero.AI.Say(LocText("DIA_BALOR_SELLUNDER_FORGETIT_15_00"));
                DC(int64(0xb7cbf5a3a5759bd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorSellunderHalfhalf : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x1ddca920c174660c);
            default Caption = LocText("DIA_BALOR_SELLUNDER_HALFHALF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bd2), EConversationDebugInfo::Executing);
                // If you know a buyer, we could go fifty-fifty. 
                Hero.AI.Say(LocText("DIA_BALOR_SELLUNDER_HALFHALF_15_00"));
                DC(int64(0xb7cbf5a3a5759bd2), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bd3), EConversationDebugInfo::Executing);
                
                // Weeell ... now that you mention it, maybe I do know ...
                Balor.AI.Say(LocText("DIA_BALOR_SELLUNDER_HALFHALF_01_01"));
                DC(int64(0xb7cbf5a3a5759bd3), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bd4), EConversationDebugInfo::Executing);
                // But if the gurus catch you, they're gonna feed you to ...
                Balor.AI.Say(LocText("DIA_BALOR_SELLUNDER_HALFHALF_01_02"));
                DC(int64(0xb7cbf5a3a5759bd4), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe6ff), EConversationDebugInfo::Executing);
                G1R.Balor_PlayerCheating = 1;
                DC(int64(0x281bfa5ab8fe6ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorSellunderComeon : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x99f3ca9d08d74bd7);
            default Caption = LocText("DIA_BALOR_SELLUNDER_COMEON_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBalorSellunderComeon);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bd7), EConversationDebugInfo::Executing);
                // Tell me. Who's buying?
                Hero.AI.Say(LocText("DIA_BALOR_SELLUNDER_COMEON_15_00"));
                DC(int64(0xb7cbf5a3a5759bd7), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bd8), EConversationDebugInfo::Executing);
                
                // ... Wait a minute, you're cookin' up somethin', ain't ...
                Balor.AI.Say(LocText("DIA_BALOR_SELLUNDER_COMEON_01_01"));
                DC(int64(0xb7cbf5a3a5759bd8), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bd9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb7cbf5a3a5759bd9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorTelldealer : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0xb7cbf5a3a5759bda);
            default Caption = LocText("DIA_BALOR_TELLDEALER_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7cbf5a3a5759bdb), G1R.Balor_PlayerCheating != 0);
                    DB(int64(0xb7cbf5a3a5759bdc), G1R.Balor_TellsNCDealer == 0);
                    DB(int64(0xb7cbf5a3a5759bdd), Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning());
                }
                
                if (G1R.Balor_PlayerCheating == 0)
                    return false;
                
                if (G1R.Balor_TellsNCDealer != 0)
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_DELIVERWEED != nullptr && !Quest::SwampCamp_SCCHAPTER1_DELIVERWEED.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759bde), EConversationDebugInfo::Executing);
                // All right. Who's that buyer? 
                Hero.AI.Say(LocText("DIA_BALOR_TELLDEALER_15_00"));
                DC(int64(0xb7cbf5a3a5759bde), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759bdf), EConversationDebugInfo::Executing);
                
                // I give you a name and you make a run for it, y'think ...
                Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_01_01"));
                DC(int64(0xb7cbf5a3a5759bdf), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759be0), EConversationDebugInfo::Executing);
                // Fifty nuggets, advance payment. Then we can talk.
                Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_01_02"));
                DC(int64(0xb7cbf5a3a5759be0), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBalorTelldealerForgetit,
                    UChoiceBalorTelldealerPay
                );
            }
        }
        
        
        class UChoiceBalorTelldealerForgetit : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x884c4b60e4d7c8de);
            default Caption = LocText("DIA_BALOR_TELLDEALER_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759be3), EConversationDebugInfo::Executing);
                // Forget it.
                Hero.AI.Say(LocText("DIA_BALOR_TELLDEALER_FORGETIT_15_00"));
                DC(int64(0xb7cbf5a3a5759be3), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759be4), EConversationDebugInfo::Executing);
                
                // You sure? 'Cause without a contact, no one's gonna buy ...
                Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_FORGETIT_01_01"));
                DC(int64(0xb7cbf5a3a5759be4), EConversationDebugInfo::Done);
                DC(int64(0xb7cbf5a3a5759be5), EConversationDebugInfo::Executing);
                // Or, if you're lucky, some bandit is gonna beat you up ...
                Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_FORGETIT_01_02"));
                DC(int64(0xb7cbf5a3a5759be5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBalorTelldealerPay : UTopic_Hero__SC_NOV_BALOR_1304
        {
            default DebugId = int64(0x8a5275107fa83780);
            default Caption = LocText("DIA_BALOR_TELLDEALER_PAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7cbf5a3a5759be7), EConversationDebugInfo::Executing);
                
                // Fifty it is. Here.
                Hero.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_15_00"));
                DC(int64(0xb7cbf5a3a5759be7), EConversationDebugInfo::Done);
                DB(int64(0xb7cbf5a3a5759be9), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0))
                {
                    DC(int64(0xb7cbf5a3a5759bea), EConversationDebugInfo::Executing);
                    // All right ... the guy's named Cipher, and you'll find ...
                    Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_01_01"));
                    DC(int64(0xb7cbf5a3a5759bea), EConversationDebugInfo::Done);
                    DC(int64(0xb7cbf5a3a5759beb), EConversationDebugInfo::Executing);
                    // Be careful, though, and don't let him rip you off. He's ...
                    Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_01_02"));
                    DC(int64(0xb7cbf5a3a5759beb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_CIPHER, Document::UDocumentSegment_Glossary_NC_ORG_CIPHER_Contact);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DELIVERWEED, Document::UDocumentSegment_CH1_DELIVERWEED_Cipher);
                    DC(int64(0x281bfa5ab8fe718), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Balor, UItMi_Orenugget, 50);
                    DC(int64(0x281bfa5ab8fe718), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8fe71a), EConversationDebugInfo::Executing);
                    G1R.Balor_TellsNCDealer = 1;
                    DC(int64(0x281bfa5ab8fe71a), EConversationDebugInfo::Done);
                    DC(int64(0x281bfa5ab8fe71c), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_SC_DELIVERWEED_CIPHER);
                    DC(int64(0x281bfa5ab8fe71c), EConversationDebugInfo::Done);
                    DC(int64(0x7a32772e530e2c73), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7a32772e530e2c73), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xb7cbf5a3a5759bef), EConversationDebugInfo::Executing);
                    // I don't see nothing. Fifty, cold and blue. We clear?
                    Balor.AI.Say(LocText("DIA_BALOR_TELLDEALER_PAY_NOORE_01_00"));
                    DC(int64(0xb7cbf5a3a5759bef), EConversationDebugInfo::Done);
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */