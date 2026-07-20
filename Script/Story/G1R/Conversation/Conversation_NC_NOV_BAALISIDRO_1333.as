#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_NOV_BAALISIDRO_1333 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_NOV_BAALISIDRO_1333";
        }
        
        
        class UTopic_Hero__NC_NOV_BAALISIDRO_1333 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_NOV_BAALISIDRO_1333";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalIsidro() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceBaalisidroDrink : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f550);
            default Caption = LocText("DIA_BAALISIDRO_DRINK_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalisidroGimmekraut);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c12de30dd07f551), G1R.BaalIsidro_GotDrink == 0);
                    DB(int64(0x1c12de30dd07f552), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted());
                }
                
                if (G1R.BaalIsidro_GotDrink != 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f553), EConversationDebugInfo::Executing);
                // Hey, how about another round? I'm buying.
                Hero.AI.Say(LocText("DIA_BAALISIDRO_DRINK_15_00"));
                DC(int64(0x1c12de30dd07f553), EConversationDebugInfo::Done);
                DB(int64(0x498886ff5e950fe0), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0));
                DB(int64(0x498886ff5e950fe2), Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0));
                DB(int64(0x498886ff5e950fe1), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                
                if ((Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0)))
                {
                    DC(int64(0x1c12de30dd07f556), EConversationDebugInfo::Executing);
                    // Hmm, I don't know. I've already ... ah, fuck it. Cheers!
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_DRINK_03_01"));
                    DC(int64(0x1c12de30dd07f556), EConversationDebugInfo::Done);
                    DB(int64(0x1c12de30dd07f558), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0));
                    DB(int64(0x1c12de30dd07f55f), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0))
                    {
                        DC(int64(0x9c096e8facaf90f3), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(BaalIsidro, UItFo_Potion_Booze, 1);
                        DC(int64(0x9c096e8facaf90f3), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroSip);
                        DB(int64(0x1c12de30dd07f55b), BaalIsidro != nullptr && BaalIsidro.IsSitting());
                        
                        if (BaalIsidro != nullptr && BaalIsidro.IsSitting())
                        {
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_1");
                        }
                        else
                        {
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Executing);
                            G1R.BaalIsidro_GotDrink = 1;
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39653), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                            DC(int64(0xfaadadd2b4e39653), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                            BaalIsidro.RemoveItemFromInventory(UItFo_Potion_Booze, 1, 0);
                            DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_2");
                        }
                    }
                    else if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                    {
                        DC(int64(0x9c096e8facaf9100), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(BaalIsidro, UItFo_Potion_Beer, 1);
                        DC(int64(0x9c096e8facaf9100), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroSip);
                        DB(int64(0x1c12de30dd07f562), BaalIsidro != nullptr && BaalIsidro.IsSitting());
                        
                        if (BaalIsidro != nullptr && BaalIsidro.IsSitting())
                        {
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_3");
                        }
                        else
                        {
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Executing);
                            G1R.BaalIsidro_GotDrink = 1;
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39653), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                            DC(int64(0xfaadadd2b4e39653), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                            BaalIsidro.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                            DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_4");
                        }
                    }
                    else
                    {
                        DC(int64(0x9c096e8facaf910d), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(BaalIsidro, UItFo_Potion_Wine, 1);
                        DC(int64(0x9c096e8facaf910d), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroSip);
                        DB(int64(0x1c12de30dd07f569), BaalIsidro != nullptr && BaalIsidro.IsSitting());
                        
                        if (BaalIsidro != nullptr && BaalIsidro.IsSitting())
                        {
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                            DC(int64(0x123f53d08c63c60a), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_5");
                        }
                        else
                        {
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Executing);
                            G1R.BaalIsidro_GotDrink = 1;
                            DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39674), EConversationDebugInfo::Executing);
                            BaalIsidro.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                            DC(int64(0xfaadadd2b4e39674), EConversationDebugInfo::Done);
                            DC(int64(0xfaadadd2b4e39678), EConversationDebugInfo::Executing);
                            BaalIsidro.RemoveItemFromInventory(UItFo_Potion_Wine, 1, 0);
                            DC(int64(0xfaadadd2b4e39678), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_baalisidro_drink_exit_6");
                        }
                    }
                }
                else
                {
                    DC(int64(0x1c12de30dd07f56e), EConversationDebugInfo::Executing);
                    // This a joke? You ain't got none. 
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_NO_DRINK_03_00"));
                    DC(int64(0x1c12de30dd07f56e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_drink_exit_7");
                }
            }
        }
        
        
        class UChoiceBaalisidroExit : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f53b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f53c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1c12de30dd07f53c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaalisidroGimmekraut : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f547);
            default Caption = LocText("DIA_BAALISIDRO_GIMMEKRAUT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalisidroHello);
            default Rules.HideIfKnows(UChoiceBaalisidroGimmekraut);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c12de30dd07f548), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f549), EConversationDebugInfo::Executing);
                // How about I sell that swampweed for you? For a cut.
                Hero.AI.Say(LocText("DIA_BAALISIDRO_GIMMEKRAUT_15_00"));
                DC(int64(0x1c12de30dd07f549), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f54a), EConversationDebugInfo::Executing);
                
                // Tah! Forget it, I ain't that pissed yet. You'd just nick ...
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_GIMMEKRAUT_03_01"));
                DC(int64(0x1c12de30dd07f54a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaalisidroHello : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f53d);
            default Caption = LocText("DIA_BAALISIDRO_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBaalisidroHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f53e), EConversationDebugInfo::Executing);
                
                // You look glum.
                Hero.AI.Say(LocText("DIA_BAALISIDRO_HELLO_15_00"));
                DC(int64(0x1c12de30dd07f53e), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f53f), EConversationDebugInfo::Executing);
                
                // I am. 
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_HELLO_03_01"));
                DC(int64(0x1c12de30dd07f53f), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f540), EConversationDebugInfo::Executing);
                // Got a pissload of swampweed to sell, and I'm way behind.
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_HELLO_03_02"));
                DC(int64(0x1c12de30dd07f540), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f541), EConversationDebugInfo::Executing);
                
                // You're selling goods for the Brotherhood?
                Hero.AI.Say(LocText("DIA_BAALISIDRO_HELLO_15_03"));
                DC(int64(0x1c12de30dd07f541), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f542), EConversationDebugInfo::Executing);
                
                // Did me subtle tattoos give me away? But yeah, I am ... I ...
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_HELLO_03_04"));
                DC(int64(0x1c12de30dd07f542), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALISIDRO, Document::UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_NOV_BAALISIDRO, Document::UDocumentSegment_Glossary_NC_NOV_BAALISIDRO_Dealer);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroInfo);
            }
        }
        
        
        class UChoiceBaalisidroProblem : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0xaf189be871087e71);
            default Caption = LocText("DIA_BAALISIDRO_PROBLEM_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalisidroGimmekraut);
            default Rules.HideIfKnows(UChoiceBaalisidroProblem);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_BAALKAGAN_WANNAHELP_13_05"), int64(0xaf189be871087e71));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c12de30dd07f54d), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f54e), EConversationDebugInfo::Executing);
                // Hey, there's something you should know. Baal Kagan wants ...
                Hero.AI.Say(LocText("DIA_BAALISIDRO_PROBLEM_15_00"));
                DC(int64(0x1c12de30dd07f54e), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f54f), EConversationDebugInfo::Executing);
                
                // What? Ah, by the Sleeper, I really gotta sell that stuff ...
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_PROBLEM_03_01"));
                DC(int64(0x1c12de30dd07f54f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_KaganPlan);
            }
        }
        
        
        class UChoiceBaalisidroRunning : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f588);
            default Caption = LocText("DIA_BAALISIDRO_RUNNING_15_00");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_BAALISIDRO_THINKAGAIN_03_06"), int64(0x1c12de30dd07f588));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c12de30dd07f589), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && Quest::NewCamp_NCCHAPTER1_DEALERJOB.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f58a), EConversationDebugInfo::Executing);
                // I sold those herbs.
                Hero.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_15_00"));
                DC(int64(0x1c12de30dd07f58a), EConversationDebugInfo::Done);
                DC(int64(0x1c12de30dd07f58b), EConversationDebugInfo::Executing);
                
                // Hm? Oh, me cut?
                BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_03_01"));
                DC(int64(0x1c12de30dd07f58b), EConversationDebugInfo::Done);
                DB(int64(0x1c12de30dd07f58d), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0))
                {
                    DC(int64(0x1c12de30dd07f58e), EConversationDebugInfo::Executing);
                    // Here. Two hundred.
                    Hero.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_15_02"));
                    DC(int64(0x1c12de30dd07f58e), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f58f), EConversationDebugInfo::Executing);
                    
                    // Good ... good! Now Baal Kagan can piss right off. ...
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_03_03"));
                    DC(int64(0x1c12de30dd07f58f), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f590), EConversationDebugInfo::Executing);
                    // Great idea doin' business with you. 
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_03_04"));
                    DC(int64(0x1c12de30dd07f590), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DEALERJOB, Document::UDocumentSegment_CH1_DEALERJOB_Success);
                    DC(int64(0x9c096e8facaf9130), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(BaalIsidro, UItMi_Orenugget, 200);
                    DC(int64(0x9c096e8facaf9130), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9132), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_DEALERJOB_DEALERJOB_OBJ_SELL.SucceedQuest();
                    DC(int64(0x9c096e8facaf9132), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_running_exit_1");
                }
                else
                {
                    DC(int64(0x1c12de30dd07f595), EConversationDebugInfo::Executing);
                    // I don't have it with me. 
                    Hero.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_NOORE_15_05"));
                    DC(int64(0x1c12de30dd07f595), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f596), EConversationDebugInfo::Executing);
                    
                    // Then go get it!
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_RUNNING_NOORE_03_06"));
                    DC(int64(0x1c12de30dd07f596), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_running_exit_2");
                    DC(int64(0x1c12de30dd07f597), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1c12de30dd07f597), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBaalisidroThinkagain : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f56f);
            default Caption = LocText("DIA_BAALISIDRO_THINKAGAIN_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalisidroGimmekraut);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("DIA_BAALISIDRO_THINKAGAIN_03_01"), int64(0x1c12de30dd07f56f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c12de30dd07f570), Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_DEALERJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_DEALERJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f572), EConversationDebugInfo::Executing);
                // Mhh, give it a think. Fifty-fifty, and I sell the rolls ...
                Hero.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_15_00"));
                DC(int64(0x1c12de30dd07f572), EConversationDebugInfo::Done);
                DB(int64(0x9c096e8facafd5f4), G1R.BaalIsidro_GotDrink != 0);
                DB(int64(0xd22f0664a188e178), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALISIDRO_PROBLEM_03_01")));
                
                if (G1R.BaalIsidro_GotDrink != 0 && Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALISIDRO_PROBLEM_03_01")))
                {
                    DC(int64(0x1c12de30dd07f576), EConversationDebugInfo::Executing);
                    // Oh, man, quit puttin' ideas in me head, will you? You're ...
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_03_01"));
                    DC(int64(0x1c12de30dd07f576), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f577), EConversationDebugInfo::Executing);
                    
                    // This isn't a con. You have my word.
                    Hero.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_15_02"));
                    DC(int64(0x1c12de30dd07f577), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f578), EConversationDebugInfo::Executing);
                    
                    // Ah, shite ... fine, here's the stuff. It should earn you ...
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_03_03"));
                    DC(int64(0x1c12de30dd07f578), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f579), EConversationDebugInfo::Executing);
                    
                    // All right. Who are the takers?
                    Hero.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_15_04"));
                    DC(int64(0x1c12de30dd07f579), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f57a), EConversationDebugInfo::Executing);
                    
                    // Hah...If I knew that, I'd have sold it long ago.
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_03_05"));
                    DC(int64(0x1c12de30dd07f57a), EConversationDebugInfo::Done);
                    DC(int64(0x1c12de30dd07f57b), EConversationDebugInfo::Executing);
                    // Good luck - I already feel a lot better.
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_THINKAGAIN_03_06"));
                    DC(int64(0x1c12de30dd07f57b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DEALERJOB, Document::UDocumentSegment_CH1_DEALERJOB_Start);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    BaalIsidro.AddItemToInventory(UItMi_Joint_03, 20);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9146), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_DEALERJOB.StartQuest();
                    DC(int64(0x9c096e8facaf9146), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9148), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Joint_01, 10);
                    DC(int64(0x9c096e8facaf9148), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf914a), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Joint_02, 20);
                    DC(int64(0x9c096e8facaf914a), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9152), EConversationDebugInfo::Executing);
                    BaalIsidro.AI.GiveItemTo(Hero, UItMi_Joint_03, 20);
                    DC(int64(0x9c096e8facaf9152), EConversationDebugInfo::Done);
                    DC(int64(0x3ff33637dc5ec79a), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_LARES_GET400ORE_LARES_GET_400ORE_OBJ_WEED.SucceedQuest();
                    DC(int64(0x3ff33637dc5ec79a), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a11a), EConversationDebugInfo::Executing);
                    BaalIsidro.RemoveImmortality();
                    DC(int64(0x7858bf075764a11a), EConversationDebugInfo::Done);
                    DC(int64(0x34f8df3e3c3feb6b), EConversationDebugInfo::Executing);
                    BaalIsidro.ExchangeDailyRoutineToClass(UDailyRoutine_NC_NOV_BaalIsidro_1333_DeliverWeed);
                    DC(int64(0x34f8df3e3c3feb6b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_thinkagain_exit_1");
                    DC(int64(0x1c12de30dd07f585), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1c12de30dd07f585), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x1c12de30dd07f586), EConversationDebugInfo::Executing);
                    // Nah, mate. Nah, I can do this ...
                    BaalIsidro.AI.Say(LocText("DIA_BAALISIDRO_REFUSE_THINKAGAIN_03_00"));
                    DC(int64(0x1c12de30dd07f586), EConversationDebugInfo::Done);
                    DB(int64(0x3ff33637dc5ec87b), G1R.BaalIsidro_GotDrink != 0);
                    DB(int64(0x3ff33637dc5ec885), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALISIDRO_PROBLEM_03_01")));
                    
                    if (G1R.BaalIsidro_GotDrink != 0)
                    {
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroNot);
                        
                        Other.Remember(n"choice_baalisidro_thinkagain_exit_2");
                    }
                    else if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_BAALISIDRO_PROBLEM_03_01")))
                    {
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LARES_GET400ORE, Document::UDocumentSegment_CH1_LARES_GET400ORE_IsidroPlan);
                        
                        Other.Remember(n"choice_baalisidro_thinkagain_exit_3");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_baalisidro_thinkagain_exit_4");
                    }
                }
            }
        }
        
        
        class UChoiceBaalisidroTrade : UTopic_Hero__NC_NOV_BAALISIDRO_1333
        {
            default DebugId = int64(0x1c12de30dd07f543);
            default Caption = LocText("DIA_BAALISIDRO_TRADE_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalisidroHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c12de30dd07f544), EConversationDebugInfo::Executing);
                // Show me what you have.
                Hero.AI.Say(LocText("DIA_BAALISIDRO_TRADE_15_00"));
                DC(int64(0x1c12de30dd07f544), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc7211688b1), BaalIsidro != nullptr && BaalIsidro.IsAngryTowards(Hero));
                
                if (BaalIsidro != nullptr && BaalIsidro.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc7211688e2), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    BaalIsidro.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_103752_1924"));
                    DC(int64(0x7ec56dc7211688e2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_trade_exit_1");
                    DC(int64(0x7ec56dc7211688fd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc7211688fd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc7211688ce), EConversationDebugInfo::Executing);
                    // Sure...
                    BaalIsidro.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_103737_2238"));
                    DC(int64(0x7ec56dc7211688ce), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9160), EConversationDebugInfo::Executing);
                    BaalIsidro.AI.StartTradingWith(Hero);
                    DC(int64(0x9c096e8facaf9160), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_baalisidro_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */