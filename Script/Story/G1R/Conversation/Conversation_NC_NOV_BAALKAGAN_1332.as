#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_NOV_BAALKAGAN_1332 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_NOV_BAALKAGAN_1332";
        }
        
        
        class UTopic_Hero__NC_NOV_BAALKAGAN_1332 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_NOV_BAALKAGAN_1332";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalKagan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBaalkagan106785 : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0x6b673100f2bfcbe3);
            default Caption = LocText("TEXT_WIP_DUQZKWJ_20241024_160305");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBaalkagan106785);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b673100f2bfcbe7), G1R.Kalom_Counter > 0);
                }
                
                return G1R.Kalom_Counter > 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b673100f2bfcbdf), EConversationDebugInfo::Executing);
                // You're from the Brotherhood in the swamp, aren't you?
                Hero.AI.Say(LocText("TEXT_WIP_DUQZKWJ_20241024_160305"));
                DC(int64(0x6b673100f2bfcbdf), EConversationDebugInfo::Done);
                DC(int64(0x6b673100f2bfcbe0), EConversationDebugInfo::Executing);
                
                // Indeed. I serve the Sleeper here in the New Camp.
                BaalKagan.AI.Say(LocText("TEXT_WIP_DUQZKWJ_20241024_160305_2083"));
                DC(int64(0x6b673100f2bfcbe0), EConversationDebugInfo::Done);
                DC(int64(0x6b673100f2bfcbe5), EConversationDebugInfo::Executing);
                // I am Baal Kagan. The Sleeper's wisdom be with you. 
                BaalKagan.AI.Say(LocText("TEXT_WIP_DUQZKWJ_20241024_160549"));
                DC(int64(0x6b673100f2bfcbe5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALKAGAN, Document::UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Introduction);
            }
        }
        
        
        class UChoiceBaalkaganExit : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd6d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd6e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd87d8953ad94cd6e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalkaganGimmekraut : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd95);
            default Caption = LocText("DIA_BAALKAGAN_GIMMEKRAUT_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganWasdrin);
            default Rules.HideIfKnows(UChoiceBaalkaganGimmekraut);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd87d8953ad94cd96), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd97), EConversationDebugInfo::Executing);
                // All right, hand me those rolls. Who I should give them ...
                Hero.AI.Say(LocText("DIA_BAALKAGAN_GIMMEKRAUT_15_00"));
                DC(int64(0xd87d8953ad94cd97), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd98), EConversationDebugInfo::Executing);
                
                // Anyone, really. Most guys in here won't turn down a free ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_GIMMEKRAUT_13_01"));
                DC(int64(0xd87d8953ad94cd98), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd99), EConversationDebugInfo::Executing);
                // Ah, and one more thing: if you lose the herbs or smoke ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_GIMMEKRAUT_13_02"));
                DC(int64(0xd87d8953ad94cd99), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd9a), EConversationDebugInfo::Executing);
                
                // Sure.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_GIMMEKRAUT_15_03"));
                DC(int64(0xd87d8953ad94cd9a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SPREADJOINTS, Document::UDocumentSegment_CH1_SPREADJOINTS_Start);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItMi_Joint_01, 10);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6b4), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.StartQuest();
                DC(int64(0x61a39c21bde6d6b4), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6b8), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItMi_Joint_01, 10);
                DC(int64(0x61a39c21bde6d6b8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalkaganHello : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd6f);
            default Caption = LocText("DIA_BAALKAGAN_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaalkaganHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6b673100f2bfcbdc), G1R.Kalom_Counter <= 0);
                }
                
                return G1R.Kalom_Counter <= 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd70), EConversationDebugInfo::Executing);
                // You're one of those cultists, aren't you?
                Hero.AI.Say(LocText("DIA_BAALKAGAN_HELLO_15_00"));
                DC(int64(0xd87d8953ad94cd70), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd71), EConversationDebugInfo::Executing);
                
                // We call it the Brotherhood, but yes, I am.
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_HELLO_13_01"));
                DC(int64(0xd87d8953ad94cd71), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd72), EConversationDebugInfo::Executing);
                // My name's Kagan. May the Sleeper be with you.
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_HELLO_13_02"));
                DC(int64(0xd87d8953ad94cd72), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALKAGAN, Document::UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Introduction);
            }
        }
        
        
        class UChoiceBaalkaganOrderhelp : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd7d);
            default Caption = LocText("DIA_BAALKAGAN_ORDERHELP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganWhyhere);
            default Rules.HideIfKnows(UChoiceBaalkaganOrderhelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd87d8953ad94cd7e), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd7f), EConversationDebugInfo::Executing);
                // Why don't your people send another man to help you out?
                Hero.AI.Say(LocText("DIA_BAALKAGAN_ORDERHELP_15_00"));
                DC(int64(0xd87d8953ad94cd7f), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd80), EConversationDebugInfo::Executing);
                
                // They did, actually - Isidro. The problem is, he does ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_ORDERHELP_13_01"));
                DC(int64(0xd87d8953ad94cd80), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd81), EConversationDebugInfo::Executing);
                // He's a drunkard. Good for nothing. 
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_ORDERHELP_13_02"));
                DC(int64(0xd87d8953ad94cd81), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALISIDRO, Document::UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_HelpKagan);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroBar);
            }
        }
        
        
        class UChoiceBaalkaganSuccess : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd9e);
            default Caption = LocText("DIA_BAALKAGAN_SUCCESS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganGimmekraut);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd87d8953ad94cd9f), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cda0), EConversationDebugInfo::Executing);
                // I gave out those "appetizers."
                Hero.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_15_00"));
                DC(int64(0xd87d8953ad94cda0), EConversationDebugInfo::Done);
                DB(int64(0xd87d8953ad94cda2), G1R.NC_JointsDistributed >= 10);
                
                if (G1R.NC_JointsDistributed >= 10)
                {
                    DC(int64(0xd87d8953ad94cda3), EConversationDebugInfo::Executing);
                    // So I heard - the first new clients already approached ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_13_01"));
                    DC(int64(0xd87d8953ad94cda3), EConversationDebugInfo::Done);
                    DC(int64(0xd87d8953ad94cda4), EConversationDebugInfo::Executing);
                    // How should I compensate you?
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_13_02"));
                    DC(int64(0xd87d8953ad94cda4), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SPREADJOINTS, Document::UDocumentSegment_CH1_SPREADJOINTS_Complete);
                    DC(int64(0x61a39c21bde6d731), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT.SucceedQuest();
                    DC(int64(0x61a39c21bde6d731), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a10b), EConversationDebugInfo::Executing);
                    BaalKagan.RemoveImmortality();
                    DC(int64(0x7858bf075764a10b), EConversationDebugInfo::Done);
                    Subdialog(
                        UChoiceBaalkaganSuccessErz,
                        UChoiceBaalkaganSuccessJoin,
                        UChoiceBaalkaganSuccessWhatspells,
                        UChoiceBaalkaganSuccessTakescrolls
                    );
                }
                else
                {
                    DC(int64(0xd87d8953ad94cde1), EConversationDebugInfo::Executing);
                    // Is that so? I have yet to see new customers. Give out ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_NO_SUCCESS_13_00"));
                    DC(int64(0xd87d8953ad94cde1), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganSuccessErz : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc75e);
            default Caption = LocText("DIA_BAALKAGAN_SUCCESS_ERZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBaalkaganSuccessErz);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_13_01"), int64(0xe8603e87342bc75e));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cda7), EConversationDebugInfo::Executing);
                // I'll take the nuggets.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_ERZ_15_00"));
                DC(int64(0xd87d8953ad94cda7), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cda8), EConversationDebugInfo::Executing);
                
                // Fine, then. Here.
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_ERZ_13_01"));
                DC(int64(0xd87d8953ad94cda8), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItMi_Orenugget, 100);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6d6), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItMi_Orenugget, 100);
                DC(int64(0x61a39c21bde6d6d6), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde71a74), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61a39c21bde71a74), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalkaganSuccessJoin : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc764);
            default Caption = LocText("DIA_BAALKAGAN_SUCCESS_JOIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBaalkaganSuccessJoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a9e1a8fd4762484), Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_13_01")));
                    DB(int64(0xec5c436c4aea1c92), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_13_01")))
                    return true;
                
                if (G1R != nullptr && G1R.IsInChapter(1))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cdad), EConversationDebugInfo::Executing);
                // Help me join the Brotherhood.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_JOIN_15_00"));
                DC(int64(0xd87d8953ad94cdad), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdae), EConversationDebugInfo::Executing);
                
                // A wise choice. You already know that you'll have to ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_JOIN_13_01"));
                DC(int64(0xd87d8953ad94cdae), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdaf), EConversationDebugInfo::Executing);
                // The problem is, one of them, Baal Tyon, is a touch ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_JOIN_13_02"));
                DC(int64(0xd87d8953ad94cdaf), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdb0), EConversationDebugInfo::Executing);
                // That will make it very hard for you to win his support. 
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_JOIN_13_03"));
                DC(int64(0xd87d8953ad94cdb0), EConversationDebugInfo::Done);
                DC(int64(0xb015d6f41fe6ab5d), EConversationDebugInfo::Executing);
                
                // Let me guess: that's where you can help me with that ...
                Hero.AI.Say(LocText("TEXT_WIP_XRVMXID_20241018_135216"));
                DC(int64(0xb015d6f41fe6ab5d), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdb1), EConversationDebugInfo::Executing);
                
                // I can indeed. Here. Give him this smoke roll, and he'll ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_JOIN_13_04"));
                DC(int64(0xd87d8953ad94cdb1), EConversationDebugInfo::Done);
                DC(int64(0xb015d6f41fe6ab61), EConversationDebugInfo::Executing);
                // Good luck. Perhaps we'll be brothers soon. 
                BaalKagan.AI.Say(LocText("TEXT_WIP_XRVMXID_20241018_135304"));
                DC(int64(0xb015d6f41fe6ab61), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Impress);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_Kagan);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItMi_Specialjoint, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6de), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItMi_Specialjoint, 1);
                DC(int64(0x61a39c21bde6d6de), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6e0), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                DC(int64(0x61a39c21bde6d6e0), EConversationDebugInfo::Done);
                DC(int64(0x7e5d602938fe69c5), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_TYON.StartQuest();
                DC(int64(0x7e5d602938fe69c5), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde71a75), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61a39c21bde71a75), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalkaganSuccessWhatspells : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc770);
            default Caption = LocText("DIA_BAALKAGAN_SUCCESS_WHATSPELLS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBaalkaganSuccessWhatspells);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cdb6), EConversationDebugInfo::Executing);
                // I want the scrolls. What do you have on offer?
                Hero.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_WHATSPELLS_15_00"));
                DC(int64(0xd87d8953ad94cdb6), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdb7), EConversationDebugInfo::Executing);
                
                // Windfist, Charm, Telekinesis, Pyrokinesis, and Slumber. ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_WHATSPELLS_13_01"));
                DC(int64(0xd87d8953ad94cdb7), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde71a68), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x61a39c21bde71a68), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrolls : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc774);
            default Caption = LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_BAALKAGAN_SUCCESS_WHATSPELLS_13_01"), int64(0xe8603e87342bc774));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9d168dad3cbcd1c), G1R.BaalKagan_three != 3);
                }
                
                return G1R.BaalKagan_three != 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cdb9), EConversationDebugInfo::Executing);
                // I'll take the scrolls.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_15_00"));
                DC(int64(0xd87d8953ad94cdb9), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cdba), EConversationDebugInfo::Executing);
                
                // A wise decision. Which ones?
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_13_01"));
                DC(int64(0xd87d8953ad94cdba), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBaalkaganSuccessTakescrollsWindfaust,
                    UChoiceBaalkaganSuccessTakescrollsTelekinese,
                    UChoiceBaalkaganSuccessTakescrollsPyrokinese,
                    UChoiceBaalkaganSuccessTakescrollsSchlaf,
                    UChoiceBaalkaganSuccessTakescrollsCharme
                );
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrollsWindfaust : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc776);
            default Caption = LocText("TEXT_CHOICE_BAALKAGAN_SUCCESS_TAKESCROLLS_WINDFAUST");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItAr_Scroll_FistOfWind, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6f8), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItAr_Scroll_FistOfWind, 1);
                DC(int64(0x61a39c21bde6d6f8), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d6fa), EConversationDebugInfo::Executing);
                G1R.BaalKagan_three += 1;
                DC(int64(0x61a39c21bde6d6fa), EConversationDebugInfo::Done);
                DB(int64(0xd87d8953ad94cdc3), G1R.BaalKagan_three >= 3);
                
                if (G1R.BaalKagan_three >= 3)
                {
                    DC(int64(0xd87d8953ad94cdc4), EConversationDebugInfo::Executing);
                    // Very well - that was three. Use them wisely.
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_DREI_13_00"));
                    DC(int64(0xd87d8953ad94cdc4), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde71a6f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x61a39c21bde71a6f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x61a39c21bde71a69), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x61a39c21bde71a69), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrollsTelekinese : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc780);
            default Caption = LocText("TEXT_CHOICE_BAALKAGAN_SUCCESS_TAKESCROLLS_TELEKINESE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItAr_Scroll_Telekinesis, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d705), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItAr_Scroll_Telekinesis, 1);
                DC(int64(0x61a39c21bde6d705), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d707), EConversationDebugInfo::Executing);
                G1R.BaalKagan_three += 1;
                DC(int64(0x61a39c21bde6d707), EConversationDebugInfo::Done);
                DB(int64(0xc028b02000162cc2), G1R.BaalKagan_three >= 3);
                
                if (G1R.BaalKagan_three >= 3)
                {
                    DC(int64(0xc028b02000162cc9), EConversationDebugInfo::Executing);
                    // Very well - that was three. Use them wisely.
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_DREI_13_00"));
                    DC(int64(0xc028b02000162cc9), EConversationDebugInfo::Done);
                    DC(int64(0xc028b02000162ccc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc028b02000162ccc), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc028b02000162cc5), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xc028b02000162cc5), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrollsPyrokinese : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc78a);
            default Caption = LocText("TEXT_CHOICE_BAALKAGAN_SUCCESS_TAKESCROLLS_PYROKINESE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItAr_Scroll_Pyrokinesis, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d712), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItAr_Scroll_Pyrokinesis, 1);
                DC(int64(0x61a39c21bde6d712), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d714), EConversationDebugInfo::Executing);
                G1R.BaalKagan_three += 1;
                DC(int64(0x61a39c21bde6d714), EConversationDebugInfo::Done);
                DB(int64(0xc028b02000162cd0), G1R.BaalKagan_three >= 3);
                
                if (G1R.BaalKagan_three >= 3)
                {
                    DC(int64(0xc028b02000162cd4), EConversationDebugInfo::Executing);
                    // Very well - that was three. Use them wisely.
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_DREI_13_00"));
                    DC(int64(0xc028b02000162cd4), EConversationDebugInfo::Done);
                    DC(int64(0xc028b02000162cd7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc028b02000162cd7), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc028b02000162cf5), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xc028b02000162cf5), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrollsSchlaf : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc794);
            default Caption = LocText("TEXT_CHOICE_BAALKAGAN_SUCCESS_TAKESCROLLS_SCHLAF");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItAr_Scroll_Sleep, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d71f), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItAr_Scroll_Sleep, 1);
                DC(int64(0x61a39c21bde6d71f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d721), EConversationDebugInfo::Executing);
                G1R.BaalKagan_three += 1;
                DC(int64(0x61a39c21bde6d721), EConversationDebugInfo::Done);
                DB(int64(0xc028b02000162cf9), G1R.BaalKagan_three >= 3);
                
                if (G1R.BaalKagan_three >= 3)
                {
                    DC(int64(0xc028b02000162cfd), EConversationDebugInfo::Executing);
                    // Very well - that was three. Use them wisely.
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_DREI_13_00"));
                    DC(int64(0xc028b02000162cfd), EConversationDebugInfo::Done);
                    DC(int64(0xc028b02000162d03), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc028b02000162d03), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc028b02000162d00), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xc028b02000162d00), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganSuccessTakescrollsCharme : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xe8603e87342bc79e);
            default Caption = LocText("TEXT_CHOICE_BAALKAGAN_SUCCESS_TAKESCROLLS_CHARME");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                BaalKagan.AddItemToInventory(UItAr_Scroll_Charm, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d72c), EConversationDebugInfo::Executing);
                BaalKagan.AI.GiveItemTo(Hero, UItAr_Scroll_Charm, 1);
                DC(int64(0x61a39c21bde6d72c), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d72e), EConversationDebugInfo::Executing);
                G1R.BaalKagan_three += 1;
                DC(int64(0x61a39c21bde6d72e), EConversationDebugInfo::Done);
                DB(int64(0xc028b02000162d07), G1R.BaalKagan_three >= 3);
                
                if (G1R.BaalKagan_three >= 3)
                {
                    DC(int64(0xc028b02000162d0e), EConversationDebugInfo::Executing);
                    // Very well - that was three. Use them wisely.
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_SUCCESS_TAKESCROLLS_DREI_13_00"));
                    DC(int64(0xc028b02000162d0e), EConversationDebugInfo::Done);
                    DC(int64(0xc028b02000162d11), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc028b02000162d11), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xc028b02000162d0a), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xc028b02000162d0a), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBaalkaganTrade : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd79);
            default Caption = LocText("DIA_BAALKAGAN_TRADE_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganWhyhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd7a), EConversationDebugInfo::Executing);
                // Show me your wares.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_TRADE_15_00"));
                DC(int64(0xd87d8953ad94cd7a), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc72116887f), BaalKagan != nullptr && BaalKagan.IsAngryTowards(Hero));
                
                if (BaalKagan != nullptr && BaalKagan.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168886), EConversationDebugInfo::Executing);
                    // I can only trade with people who respect the Camp's ...
                    BaalKagan.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_103314"));
                    DC(int64(0x7ec56dc721168886), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f2316294e4), EConversationDebugInfo::Executing);
                    // I'm sorry, but if I trade with you, I'll get in trouble.
                    BaalKagan.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_135425"));
                    DC(int64(0x81b634f2316294e4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalkagan_trade_exit_1");
                    DC(int64(0x7ec56dc721168890), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168890), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168882), EConversationDebugInfo::Executing);
                    // As you wish.
                    BaalKagan.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_103306"));
                    DC(int64(0x7ec56dc721168882), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6d740), EConversationDebugInfo::Executing);
                    BaalKagan.AI.StartTradingWith(Hero);
                    DC(int64(0x61a39c21bde6d740), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalkagan_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceBaalkaganWannahelp : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd85);
            default Caption = LocText("DIA_BAALKAGAN_WANNAHELP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganOrderhelp);
            default Rules.HideIfKnows(UChoiceBaalkaganWannahelp);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd86), EConversationDebugInfo::Executing);
                // Maybe I could help you peddle your swampweed.
                Hero.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_15_00"));
                DC(int64(0xd87d8953ad94cd86), EConversationDebugInfo::Done);
                DB(int64(0xec5c436c4aea1c88), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xd87d8953ad94cd87), EConversationDebugInfo::Executing);
                    // Hmm ... As long as you're not a member of the ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_13_01"));
                    DC(int64(0xd87d8953ad94cd87), EConversationDebugInfo::Done);
                    DC(int64(0xd87d8953ad94cd88), EConversationDebugInfo::Executing);
                    // But maybe you could help me hand out some gifts. ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_13_02"));
                    DC(int64(0xd87d8953ad94cd88), EConversationDebugInfo::Done);
                }
                DC(int64(0xd87d8953ad94cd89), EConversationDebugInfo::Executing);
                // Some of the men in here have yet to taste our ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_13_03"));
                DC(int64(0xd87d8953ad94cd89), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd8a), EConversationDebugInfo::Executing);
                
                // Didn't you just say you can hardly keep up with the ...
                Hero.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_15_04"));
                DC(int64(0xd87d8953ad94cd8a), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd8b), EConversationDebugInfo::Executing);
                
                // I did, but I already informed Master Kalom about ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WANNAHELP_13_05"));
                DC(int64(0xd87d8953ad94cd8b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalkaganWasdrin : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd8c);
            default Caption = LocText("DIA_BAALKAGAN_WASDRIN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganWannahelp);
            default Rules.HideIfKnows(UChoiceBaalkaganWasdrin);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd8d), EConversationDebugInfo::Executing);
                
                // Say I hand out these "appetizers" for you - what's in it ...
                Hero.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_15_00"));
                DC(int64(0xd87d8953ad94cd8d), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd8e), EConversationDebugInfo::Executing);
                
                // Oh, we'll think of something. 
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_13_01"));
                DC(int64(0xd87d8953ad94cd8e), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd8f), EConversationDebugInfo::Executing);
                // For example, I could give you some scrolls that are ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_13_02"));
                DC(int64(0xd87d8953ad94cd8f), EConversationDebugInfo::Done);
                DB(int64(0xd87d8953ad94cd91), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                {
                    DC(int64(0xd87d8953ad94cd92), EConversationDebugInfo::Executing);
                    // Alternatively, I could even help you get accepted into ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_13_03"));
                    DC(int64(0xd87d8953ad94cd92), EConversationDebugInfo::Done);
                    DC(int64(0xd87d8953ad94cd93), EConversationDebugInfo::Executing);
                    // Master Kalom decides who gets a novitiate, but I know a ...
                    BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_13_04"));
                    DC(int64(0xd87d8953ad94cd93), EConversationDebugInfo::Done);
                }
                DC(int64(0xbe9ef79675521348), EConversationDebugInfo::Executing);
                // And if I'm not interested in that?
                Hero.AI.Say(LocText("TEXT_WIP_VTYHSLC_20240222_191148"));
                DC(int64(0xbe9ef79675521348), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd94), EConversationDebugInfo::Executing);
                
                // Well, then I'd be happy to pay in cold, dull ore. A ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WASDRIN_13_05"));
                DC(int64(0xd87d8953ad94cd94), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalkaganWhyhere : UTopic_Hero__NC_NOV_BAALKAGAN_1332
        {
            default DebugId = int64(0xd87d8953ad94cd73);
            default Caption = LocText("DIA_BAALKAGAN_WHYHERE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkagan106785);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganHello);
            default Rules.HideIfKnows(UChoiceBaalkaganWhyhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87d8953ad94cd75), EConversationDebugInfo::Executing);
                
                // What brings you here?
                Hero.AI.Say(LocText("DIA_BAALKAGAN_WHYHERE_15_00"));
                DC(int64(0xd87d8953ad94cd75), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd76), EConversationDebugInfo::Executing);
                
                // Well, originally, Master Y'Berion sent me here to look ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WHYHERE_13_01"));
                DC(int64(0xd87d8953ad94cd76), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd77), EConversationDebugInfo::Executing);
                // Sadly, it turns out most of the guys here would rather ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WHYHERE_13_02"));
                DC(int64(0xd87d8953ad94cd77), EConversationDebugInfo::Done);
                DC(int64(0xbe9ef79675521347), EConversationDebugInfo::Executing);
                
                // Any more luck with that? 
                Hero.AI.Say(LocText("TEXT_WIP_VTYHSLC_20240222_190042"));
                DC(int64(0xbe9ef79675521347), EConversationDebugInfo::Done);
                DC(int64(0xd87d8953ad94cd78), EConversationDebugInfo::Executing);
                
                // Oh, if only you knew. I can barely keep up with the ...
                BaalKagan.AI.Say(LocText("DIA_BAALKAGAN_WHYHERE_13_03"));
                DC(int64(0xd87d8953ad94cd78), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALKAGAN, Document::UDocumentSegment_Glossary_NC_NOV_BAALKAGAN_Dealer);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */