#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_GRD_AARON_262 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_GRD_AARON_262";
        }
        
        
        class UTopic_Hero__OM_GRD_AARON_262 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_GRD_AARON_262";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetAaron() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd262AaronBluff : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e23);
            default Caption = LocText("TEXT_CHOICE_GRD_262_AARON_BLUFF");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd262AaronChest);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("VLK_584_SNIPES_DEAL_INFO_07_03"), int64(0xd6a51f41e7897e23));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd6a51f41e7897e24), Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE.HasSucceeded());
                    DB(int64(0xae34c5512d5ef8f4), Aaron != nullptr && !Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed));
                }
                
                if (Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE != nullptr && Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE.HasSucceeded())
                    return false;
                
                if (Aaron != nullptr && Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xd07eb1bb4c444481), Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_262_AARON_BLUFF_IAN_15_01")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_262_AARON_BLUFF_IAN_15_01")))
                {
                    DC(int64(0xd6a51f41e7897e28), EConversationDebugInfo::Executing);
                    // Ian sent me. He needs you, right now.
                    Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_IAN_15_01"));
                    DC(int64(0xd6a51f41e7897e28), EConversationDebugInfo::Done);
                    DC(int64(0xd6a51f41e7897e29), EConversationDebugInfo::Executing);
                    
                    // Why?
                    Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_IAN_09_02"));
                    DC(int64(0xd6a51f41e7897e29), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UChoiceGrd262AaronBluffUgly,
                    UChoiceGrd262AaronBluffBad,
                    UChoiceGrd262AaronBluffGood,
                    UChoiceGrd262AaronBluffBandit,
                    UChoiceGrd262AaronBluffOre,
                    UChoiceGrd262AaronBluffBack
                );
            }
        }
        
        
        class UChoiceGrd262AaronBluffUgly : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xe8603e87342bebbd);
            default Caption = LocText("GRD_262_AARON_BLUFF_UGLY_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluffUgly);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e2c), EConversationDebugInfo::Executing);
                // Why would he tell me? Go ask him yourself.
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_UGLY_15_01"));
                DC(int64(0xd6a51f41e7897e2c), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e2d), EConversationDebugInfo::Executing);
                
                // Oh, but - all right, fine. I'll go see him.
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_UGLY_09_02"));
                DC(int64(0xd6a51f41e7897e2d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_AARON, Document::UDocumentSegment_Glossary_OM_GRD_AARON_Deceived);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_Lure);
                DC(int64(0xc9bbf0de13e7d3b7), EConversationDebugInfo::Executing);
                Aaron.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Aaron_262_Trick);
                DC(int64(0xc9bbf0de13e7d3b7), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3bb), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_LURE.SucceedQuest();
                DC(int64(0xc9bbf0de13e7d3bb), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e32), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6a51f41e7897e32), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd262AaronBluffBad : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xe8603e87342bebc6);
            default Caption = LocText("GRD_262_AARON_BLUFF_BAD_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluffBad);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e34), EConversationDebugInfo::Executing);
                // He said he's going to kick your ass for being such a ...
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_BAD_15_01"));
                DC(int64(0xd6a51f41e7897e34), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e35), EConversationDebugInfo::Executing);
                
                // Nothin' new there. Go away.
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_BAD_09_02"));
                DC(int64(0xd6a51f41e7897e35), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e36), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6a51f41e7897e36), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd262AaronBluffGood : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xe8603e87342bebcb);
            default Caption = LocText("GRD_262_AARON_BLUFF_GOOD_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluffGood);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e38), EConversationDebugInfo::Executing);
                // He said something about rewarding you for your faithful ...
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_GOOD_15_01"));
                DC(int64(0xd6a51f41e7897e38), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e39), EConversationDebugInfo::Executing);
                
                // That so? You better go now, freshie. 
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_GOOD_09_02"));
                DC(int64(0xd6a51f41e7897e39), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3c9), EConversationDebugInfo::Executing);
                Aaron.SetRelationshipUntilDefeat(Hero, ERelationship::Angry);
                DC(int64(0xc9bbf0de13e7d3c9), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e3b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6a51f41e7897e3b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd262AaronBluffBandit : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xe8603e87342bebd1);
            default Caption = LocText("GRD_262_AARON_BLUFF_BANDIT_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluffBandit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e3d), EConversationDebugInfo::Executing);
                // Apparently there's New Campers in the mine. They're ...
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_BANDIT_15_01"));
                DC(int64(0xd6a51f41e7897e3d), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e3e), EConversationDebugInfo::Executing);
                
                // Oh, horseshit. They'd never dare. 
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_BANDIT_09_02"));
                DC(int64(0xd6a51f41e7897e3e), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e3f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd6a51f41e7897e3f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd262AaronBluffOre : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xe8603e87342bebd6);
            default Caption = LocText("GRD_262_AARON_BLUFF_ORE_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluffOre);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e41), EConversationDebugInfo::Executing);
                // Apparently the diggers found a massive ore nugget.
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_ORE_15_01"));
                DC(int64(0xd6a51f41e7897e41), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e42), EConversationDebugInfo::Executing);
                
                // So?
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_ORE_09_02"));
                DC(int64(0xd6a51f41e7897e42), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e43), EConversationDebugInfo::Executing);
                
                // He wants you to take a look.
                Hero.AI.Say(LocText("GRD_262_AARON_BLUFF_ORE_15_03"));
                DC(int64(0xd6a51f41e7897e43), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e44), EConversationDebugInfo::Executing);
                
                // Oh, bullshit. Sod off.
                Aaron.AI.Say(LocText("GRD_262_AARON_BLUFF_ORE_09_04"));
                DC(int64(0xd6a51f41e7897e44), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e45), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd6a51f41e7897e45), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd262AaronBluffBack : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xb8d5d0d8e7d55bfd);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceGrd262AaronChest : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e1f);
            default Caption = LocText("GRD_262_AARON_CHEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd262AaronBluff);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_OM_GUARD_04", 400.0f, int64(0xd6a51f41e7897e1f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e21), EConversationDebugInfo::Executing);
                // What's your job here?
                Hero.AI.Say(LocText("GRD_262_AARON_CHEST_INFO_15_01"));
                DC(int64(0xd6a51f41e7897e21), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e22), EConversationDebugInfo::Executing);
                
                // Makin' sure blokes like that Snipes over there keep ...
                Aaron.AI.Say(LocText("GRD_262_AARON_CHEST_INFO_09_02"));
                DC(int64(0xd6a51f41e7897e22), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_GRD_AARON, Document::UDocumentSegment_Glossary_OM_GRD_AARON_Introduction);
            }
        }
        
        
        class UChoiceGrd262AaronExit : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e1d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e1e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd6a51f41e7897e1e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd262AaronPissed : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e46);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd262AaronBluff);
            default Rules.HideIfKnows(UChoiceGrd262AaronPissed);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OM_TRICK_AARON", 1000.0f, int64(0xd6a51f41e7897e46));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd6a51f41e7897e47), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9bbf0de13e7d3ee), EConversationDebugInfo::Executing);
                Aaron.AI.DrawCombatWeapon();
                DC(int64(0xc9bbf0de13e7d3ee), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_Mad);
                DC(int64(0xd6a51f41e7897e4a), EConversationDebugInfo::Executing);
                // Oy, you! If you ever pull somethin' like that again, I'm ...
                Aaron.AI.Say(LocText("INFO_AARON_PISSED_09_01"));
                DC(int64(0xd6a51f41e7897e4a), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234de), EConversationDebugInfo::Executing);
                
                // Calm down ... 
                Hero.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_155819"));
                DC(int64(0x9d1cf82c343234de), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234df), EConversationDebugInfo::Executing);
                
                // A- Just shut up.
                Aaron.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_155829"));
                DC(int64(0x9d1cf82c343234df), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3e7), EConversationDebugInfo::Executing);
                Aaron.AI.UndrawWeapon();
                DC(int64(0xc9bbf0de13e7d3e7), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3e9), EConversationDebugInfo::Executing);
                Aaron.ExchangeDailyRoutineToClass(UDailyRoutine_OM_GRD_Aaron_262_Start);
                DC(int64(0xc9bbf0de13e7d3e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd262AaronSell : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e4e);
            default Caption = LocText("INFO_AARON_SELL_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd262AaronChest);
            default Rules.HideIfKnows(UChoiceGrd262AaronSell);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd6a51f41e7897e4f), Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE != nullptr && Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.HasSucceeded());
                    DB(int64(0xae34c5512d5ef8f6), Aaron != nullptr && !Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed));
                    DB(int64(0x4238634516999227), Hero != nullptr && Hero.HasItem(UItKe_Om_02, 1, 0));
                }
                
                if (Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.HasSucceeded())
                    return false;
                
                if (Aaron != nullptr && Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_Om_02, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e50), EConversationDebugInfo::Executing);
                // Is there a chance you've lost the key to your chest?
                Hero.AI.Say(LocText("INFO_AARON_SELL_15_01"));
                DC(int64(0xd6a51f41e7897e50), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e51), EConversationDebugInfo::Executing);
                
                // ... I did. How do you-
                Aaron.AI.Say(LocText("INFO_AARON_SELL_09_02"));
                DC(int64(0xd6a51f41e7897e51), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e52), EConversationDebugInfo::Executing);
                // You know what, it's probably better I don't ask. Twenty ...
                Aaron.AI.Say(LocText("INFO_AARON_SELL_09_03"));
                DC(int64(0xd6a51f41e7897e52), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_SellKey);
            }
        }
        
        
        class UChoiceGrd262AaronSellnow : UTopic_Hero__OM_GRD_AARON_262
        {
            default DebugId = int64(0xd6a51f41e7897e53);
            default Caption = LocText("INFO_AARON_SELLNOW_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd262AaronSell);
            default Rules.HideIfKnows(UChoiceGrd262AaronSellnow);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd6a51f41e7897e4f), Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE != nullptr && Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.HasSucceeded());
                    DB(int64(0xae34c5512d5ef8f6), Aaron != nullptr && !Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed));
                    DB(int64(0x4238634516999227), Hero != nullptr && Hero.HasItem(UItKe_Om_02, 1, 0));
                }
                
                if (Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.HasSucceeded())
                    return false;
                
                if (Aaron != nullptr && Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Collapsed))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_Om_02, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd6a51f41e7897e56), EConversationDebugInfo::Executing);
                // Here's your key. 
                Hero.AI.Say(LocText("INFO_AARON_SELLNOW_15_01"));
                DC(int64(0xd6a51f41e7897e56), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e57), EConversationDebugInfo::Executing);
                
                // There it is indeed. Here, twenty nuggs, like we said. 
                Aaron.AI.Say(LocText("INFO_AARON_SELLNOW_09_02"));
                DC(int64(0xd6a51f41e7897e57), EConversationDebugInfo::Done);
                DC(int64(0xd6a51f41e7897e58), EConversationDebugInfo::Executing);
                // You should tread lightly from now on, though. I got me ...
                Aaron.AI.Say(LocText("INFO_AARON_SELLNOW_09_03"));
                DC(int64(0xd6a51f41e7897e58), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_KeySold);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Aaron.AddItemToInventory(UItMi_Orenugget, 20);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3f9), EConversationDebugInfo::Executing);
                Aaron.AI.GiveItemTo(Hero, UItMi_Orenugget, 20);
                DC(int64(0xc9bbf0de13e7d3f9), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3fb), EConversationDebugInfo::Executing);
                Aaron.AddItemToInventory(UItKe_Om_02, 1);
                DC(int64(0xc9bbf0de13e7d3fb), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d3ff), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_SELLKEY.SucceedQuest();
                DC(int64(0xc9bbf0de13e7d3ff), EConversationDebugInfo::Done);
                DC(int64(0x767ee3c694514d0e), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL.SucceedQuest();
                DC(int64(0x767ee3c694514d0e), EConversationDebugInfo::Done);
                DC(int64(0xf55edacb2ce2ce74), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItKe_Om_02, 1, 0);
                DC(int64(0xf55edacb2ce2ce74), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */