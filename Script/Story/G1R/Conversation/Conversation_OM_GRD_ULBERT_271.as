#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_ULBERT_271 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_ULBERT_271";
        }
        
        
        class UTopic_Hero__OM_GRD_ULBERT_271 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_ULBERT_271";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUlbert() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd271UlbertAngry : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d1244);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd271UlbertLock);
            default Rules.HideIfKnows(UChoiceGrd271UlbertAngry);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OM_GUARD_28", 500.0f, int64(0xfeeb57e5103d1244));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeeb57e5103d1246), Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE.HasSucceeded());
                }
                
                return Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d1247), EConversationDebugInfo::Executing);
                // Hey, you! You lied! There was no feast! 
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_ANGRY_INFO_07_01"));
                DC(int64(0xfeeb57e5103d1247), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d1248), EConversationDebugInfo::Executing);
                
                // Oh, um ... I must have gotten that mixed up. Bye!
                Hero.AI.Say(LocText("GRD_271_ULBERT_ANGRY_INFO_15_02"));
                DC(int64(0xfeeb57e5103d1248), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_Mad);
                DC(int64(0xd1c40b7d82faec0f), EConversationDebugInfo::Executing);
                Ulbert.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Ulbert_271_Start);
                DC(int64(0xd1c40b7d82faec0f), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d124c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfeeb57e5103d124c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd271UlbertDrink : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d121e);
            default Caption = LocText("GRD_271_ULBERT_DRINK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd271UlbertTrick);
            default Rules.HideIfKnows(UChoiceGrd271UlbertDrink);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbcbaed2edaaed398), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0));
                    DB(int64(0xbcbaed2edaaed399), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                    DB(int64(0xbcbaed2edaaed39a), Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0));
                }
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d1220), EConversationDebugInfo::Executing);
                // Here. Cheers. 
                Hero.AI.Say(LocText("GRD_271_ULBERT_DRINK_INFO_15_01"));
                DC(int64(0xfeeb57e5103d1220), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d1221), EConversationDebugInfo::Executing);
                
                // Hmm ... okay, I guess a sip won't hurt. But don't you ...
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_DRINK_INFO_07_02"));
                DC(int64(0xfeeb57e5103d1221), EConversationDebugInfo::Done);
                DB(int64(0xfeeb57e5103d1223), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                DB(int64(0xfeeb57e5103d122a), Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0));
                DB(int64(0xfeeb57e5103d1231), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                {
                    DC(int64(0xd1c40b7d82faec21), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Ulbert, UItFo_Potion_Beer, 1);
                    DC(int64(0xd1c40b7d82faec21), EConversationDebugInfo::Done);
                    DC(int64(0xf57d25ff3e85399b), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK.SucceedQuest();
                    DC(int64(0xf57d25ff3e85399b), EConversationDebugInfo::Done);
                    DB(int64(0xfeeb57e5103d1226), Ulbert != nullptr && Ulbert.IsSitting());
                    
                    if (Ulbert != nullptr && Ulbert.IsSitting())
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                    Ulbert.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_271_ulbert_drink_exit_1");
                }
                else if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0))
                {
                    DC(int64(0xd1c40b7d82faec2e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Ulbert, UItFo_Potion_Wine, 1);
                    DC(int64(0xd1c40b7d82faec2e), EConversationDebugInfo::Done);
                    DC(int64(0xf57d25ff3e85399d), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK.SucceedQuest();
                    DC(int64(0xf57d25ff3e85399d), EConversationDebugInfo::Done);
                    DB(int64(0xfeeb57e5103d122d), Ulbert != nullptr && Ulbert.IsSitting());
                    
                    if (Ulbert != nullptr && Ulbert.IsSitting())
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Executing);
                    G1R.BaalIsidro_GotDrink = 1;
                    DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Done);
                    DC(int64(0xfaadadd2b4e39678), EConversationDebugInfo::Executing);
                    Ulbert.RemoveItemFromInventory(UItFo_Potion_Wine, 1, 0);
                    DC(int64(0xfaadadd2b4e39678), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_271_ulbert_drink_exit_2");
                }
                else if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0))
                {
                    DC(int64(0xd1c40b7d82faec3b), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Ulbert, UItFo_Potion_Booze, 1);
                    DC(int64(0xd1c40b7d82faec3b), EConversationDebugInfo::Done);
                    DC(int64(0xf57d25ff3e85399f), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK.SucceedQuest();
                    DC(int64(0xf57d25ff3e85399f), EConversationDebugInfo::Done);
                    DB(int64(0xfeeb57e5103d1234), Ulbert != nullptr && Ulbert.IsSitting());
                    
                    if (Ulbert != nullptr && Ulbert.IsSitting())
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Executing);
                        Ulbert.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c83c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Executing);
                    G1R.BaalIsidro_GotDrink = 1;
                    DC(int64(0x9c096e8facaf90e5), EConversationDebugInfo::Done);
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Executing);
                    Ulbert.RemoveItemFromInventory(UItFo_Potion_Booze, 1, 0);
                    DC(int64(0xfaadadd2b4e39665), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_271_ulbert_drink_exit_3");
                }
                else
                {
                    
                    Other.Remember(n"choice_grd_271_ulbert_drink_exit_4");
                }
            }
        }
        
        
        class UChoiceGrd271UlbertDrunk : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d1238);
            default Caption = LocText("GRD_271_ULBERT_DRUNK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd271UlbertDrink);
            default Rules.HideIfKnows(UChoiceGrd271UlbertDrunk);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeeb57e5103d1239), Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning());
                }
                
                return Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d123a), EConversationDebugInfo::Executing);
                // So - what are you guarding?
                Hero.AI.Say(LocText("GRD_271_ULBERT_DRUNK_INFO_15_01"));
                DC(int64(0xfeeb57e5103d123a), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d123b), EConversationDebugInfo::Executing);
                
                // Ah, just some chests with supplies. Key went missing ...
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_DRUNK_INFO_07_02"));
                DC(int64(0xfeeb57e5103d123b), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d123c), EConversationDebugInfo::Executing);
                
                // It did? 
                Hero.AI.Say(LocText("GRD_271_ULBERT_DRUNK_INFO_15_03"));
                DC(int64(0xfeeb57e5103d123c), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d123d), EConversationDebugInfo::Executing);
                
                // Yeah. I bet Aleph's behind it somehow. Can't trust that ...
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_DRUNK_INFO_07_04"));
                DC(int64(0xfeeb57e5103d123d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_GetKey);
                DC(int64(0x3eed5775e7b5de8d), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_KEY.StartQuest();
                DC(int64(0x3eed5775e7b5de8d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd271UlbertExit : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d1214);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d1215), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfeeb57e5103d1215), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd271UlbertKey : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d1216);
            default Caption = LocText("GRD_271_ULBERT_KEY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd271UlbertKey);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d1217), EConversationDebugInfo::Executing);
                // What are you guarding?
                Hero.AI.Say(LocText("GRD_271_ULBERT_KEY_INFO_15_01"));
                DC(int64(0xfeeb57e5103d1217), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d1218), EConversationDebugInfo::Executing);
                
                // None of your business. 
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_KEY_INFO_07_02"));
                DC(int64(0xfeeb57e5103d1218), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_ULBERT, Document::UDocumentSegment_Glossary_OM_GRD_ULBERT_Introduction);
            }
        }
        
        
        class UChoiceGrd271UlbertLock : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d123e);
            default Caption = LocText("GRD_271_ULBERT_LOCK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd271UlbertDrunk);
            default Rules.HideIfKnows(UChoiceGrd271UlbertLock);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeeb57e5103d123f), Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning());
                    DB(int64(0x1b672654c1559616), Hero != nullptr && Hero.HasItem(UItKe_Om_03, 1, 0));
                }
                
                if (Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && !Quest::OldMine_OMCHAPTER2_STORAGESHED.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_Om_03, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d1240), EConversationDebugInfo::Executing);
                // Ian sent me. They're having a feast down there and are ...
                Hero.AI.Say(LocText("GRD_271_ULBERT_LOCK_INFO_15_01"));
                DC(int64(0xfeeb57e5103d1240), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d1241), EConversationDebugInfo::Executing);
                
                // A feast? But ... why didn't they tell me? Ah, I'll go ...
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_LOCK_INFO_07_02"));
                DC(int64(0xfeeb57e5103d1241), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_Lure);
                DC(int64(0xd1c40b7d82faec53), EConversationDebugInfo::Executing);
                Ulbert.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Ulbert_271_Away);
                DC(int64(0xd1c40b7d82faec53), EConversationDebugInfo::Done);
                DC(int64(0xa2bcb717f59ae817), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE.SucceedQuest();
                DC(int64(0xa2bcb717f59ae817), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d1243), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfeeb57e5103d1243), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd271UlbertTrick : UTopic_Hero__OM_GRD_ULBERT_271
        {
            default DebugId = int64(0xfeeb57e5103d1219);
            default Caption = LocText("GRD_271_ULBERT_TRICK_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd271UlbertKey);
            default Rules.HideIfKnows(UChoiceGrd271UlbertTrick);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeeb57e5103d121a), Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && !Quest::OldMine_OMCHAPTER2_STORAGESHED.HasBeenStarted());
                }
                
                return Quest::OldMine_OMCHAPTER2_STORAGESHED != nullptr && !Quest::OldMine_OMCHAPTER2_STORAGESHED.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfeeb57e5103d121b), EConversationDebugInfo::Executing);
                // You've got be thirsty, standing around all day ... 
                Hero.AI.Say(LocText("GRD_271_ULBERT_TRICK_INFO_15_01"));
                DC(int64(0xfeeb57e5103d121b), EConversationDebugInfo::Done);
                DC(int64(0xfeeb57e5103d121c), EConversationDebugInfo::Executing);
                
                // None of your- Wait. You have a drink?
                Ulbert.AI.Say(LocText("GRD_271_ULBERT_TRICK_INFO_07_02"));
                DC(int64(0xfeeb57e5103d121c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_STORAGESHED, Document::UDocumentSegment_CH1_STORAGESHED_Start);
                DC(int64(0xd1c40b7d82faec59), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_STORAGESHED.StartQuest();
                DC(int64(0xd1c40b7d82faec59), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */