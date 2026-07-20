#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_RIORDIAN_605 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_RIORDIAN_605";
        }
        
        
        class UTopic_Hero__NC_KDW_RIORDIAN_605 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_RIORDIAN_605";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRiordian() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetCronos() const property
            {
                return GetCharacter(n"NC_KDW_CRONOS_604");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY06_708() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY06_708");
            }
        }
        
        
        class UChoiceKdw605RiordianGreet : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde515);
            default Caption = LocText("KDW_605_RIORDIAN_GREET_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKdw605RiordianGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde517), EConversationDebugInfo::Executing);
                // Greetings. Who are you?
                Hero.AI.Say(LocText("KDW_605_RIORDIAN_GREET_INFO_15_01"));
                DC(int64(0x528f8bdfd4fde517), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde518), EConversationDebugInfo::Executing);
                
                // I'm Riordian, the alchemist. Are you looking for ...
                Riordian.AI.Say(LocText("KDW_605_RIORDIAN_GREET_INFO_14_02"));
                DC(int64(0x528f8bdfd4fde518), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_RIORDIAN, Document::UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_RIORDIAN, Document::UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Dealer);
            }
        }
        
        
        class UChoiceKdw605RiordianHeal : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde50b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw605RiordianWelcome);
            default Rules.HideIfKnows(UChoiceKdw605RiordianHeal);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x528f8bdfd4fde50c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde50d), EConversationDebugInfo::Executing);
                // If you're injured, come see me - my magic will take care ...
                Riordian.AI.Say(LocText("KDW_605_RIORDIAN_HEAL_INFO_14_01"));
                DC(int64(0x528f8bdfd4fde50d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_RIORDIAN, Document::UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Heal);
            }
        }
        
        
        class UChoiceKdw605RiordianHealinfo : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde50e);
            default Caption = LocText("KDW_605_RIORDIAN_HEALINFO_INFO_15_01");
            default PriorityRank = 5;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x528f8bdfd4fde50f), Hero != nullptr && Hero.IsInjured(99));
                    DB(int64(0x528f8bdfd4fde510), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                if (Hero != nullptr && !Hero.IsInjured(99))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde511), EConversationDebugInfo::Executing);
                // I'm wounded. Can you heal me?
                Hero.AI.Say(LocText("KDW_605_RIORDIAN_HEALINFO_INFO_15_01"));
                DC(int64(0x528f8bdfd4fde511), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde512), EConversationDebugInfo::Executing);
                
                // Of course. Hold still. Through my word, I invoke the ...
                Riordian.AI.Say(LocText("KDW_605_RIORDIAN_HEALINFO_INFO_14_02"));
                DC(int64(0x528f8bdfd4fde512), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de9175e), EConversationDebugInfo::Executing);
                Hero.Character.Heal();
                DC(int64(0x1a494c3f7de9175e), EConversationDebugInfo::Done);
                Print("Skipped sound.PlaySound()");
            }
        }
        
        
        class UChoiceKdw605RiordianTrade : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde519);
            default Caption = LocText("KDW_605_RIORDIAN_TRADE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw605RiordianGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde51a), EConversationDebugInfo::Executing);
                // Show me your wares.
                Hero.AI.Say(LocText("KDW_605_RIORDIAN_TRADE_INFO_15_01"));
                DC(int64(0x528f8bdfd4fde51a), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168a80), Riordian != nullptr && Riordian.IsAngryTowards(Hero));
                
                if (Riordian != nullptr && Riordian.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168a92), EConversationDebugInfo::Executing);
                    // See, I would trade with you, but I can't.
                    Riordian.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_110252"));
                    DC(int64(0x7ec56dc721168a92), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231629520), EConversationDebugInfo::Executing);
                    // You were causing too much trouble. Best if you come back ...
                    Riordian.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_142331"));
                    DC(int64(0x81b634f231629520), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_605_riordian_trade_exit_1");
                    DC(int64(0x7ec56dc721168aa4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168aa4), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x1a494c3f7de91766), EConversationDebugInfo::Executing);
                    Riordian.AI.StartTradingWith(Hero);
                    DC(int64(0x1a494c3f7de91766), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_605_riordian_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw605RiordianWelcome : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde508);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdw605RiordianWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x528f8bdfd4fde509), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde50a), EConversationDebugInfo::Executing);
                // Look, look, it's our new brother. Welcome to the Circle ...
                Riordian.AI.Say(LocText("KDW_605_RIORDIAN_WELCOME_INFO_14_01"));
                DC(int64(0x528f8bdfd4fde50a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordian114886 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x14197298145f7256);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRiordian114886);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Riordian, 500.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Riordian, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f7250), EConversationDebugInfo::Executing);
                // Brother. Well met.
                Riordian.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_110525_686"));
                DC(int64(0x14197298145f7250), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordian137795 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x278b5506532ac492);
            default Caption = LocText("TEXT_WIP_MEUGPYB_20250317_091805_3561");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRiordian137795);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x278b5506532ac4ae), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac48b), EConversationDebugInfo::Executing);
                
                // Found something unusual in the mines.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_122243"));
                DC(int64(0x278b5506532ac48b), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Riordian, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac520), EConversationDebugInfo::Executing);
                // Extraordinary... A minecrawler pheromone gland, yes? But ...
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123341"));
                DC(int64(0x278b5506532ac520), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac527), EConversationDebugInfo::Executing);
                // The alchemical possibilities... this could advance my ...
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123351"));
                DC(int64(0x278b5506532ac527), EConversationDebugInfo::Done);
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Executing);
                G1R.Riordian_GlandNegotiation = 1;
                DC(int64(0xc37fd20aa2f91eba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordian138058 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0xc37fd20aa2f91eb2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRiordian137795);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb34d531f120bd0a1), G1R.Riordian_GlandNegotiation != 0);
                    DB(int64(0xb34d531f120bd0a7), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                if (G1R.Riordian_GlandNegotiation == 0)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && !Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac521), EConversationDebugInfo::Executing);
                // How much would you offer?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123341_686"));
                DC(int64(0x278b5506532ac521), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac528), EConversationDebugInfo::Executing);
                
                // For a specimen this unique... 300 ore seems appropriate.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123357"));
                DC(int64(0x278b5506532ac528), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac529), EConversationDebugInfo::Executing);
                // Or perhaps you'd prefer something more valuable? I have ...
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123404"));
                DC(int64(0x278b5506532ac529), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac52a), EConversationDebugInfo::Executing);
                // Quite useful for surviving the perils of the colony.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123405"));
                DC(int64(0x278b5506532ac52a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Riordian_137848,
                    UTopic_Riordian_137868,
                    UTopic_Riordian_137890
                );
            }
        }
        
        
        class UTopic_Riordian_137848 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x278b5506532ac52d);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_123421_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Riordian_137848);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac52e), EConversationDebugInfo::Executing);
                // I'll take the ore.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123421_3984"));
                DC(int64(0x278b5506532ac52e), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac60b), EConversationDebugInfo::Executing);
                
                // Splendid.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_133909_443"));
                DC(int64(0x278b5506532ac60b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_SoldToRiordian);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Riordian.AddItemToInventory(UItMi_Orenugget, 300);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac55d), EConversationDebugInfo::Executing);
                Riordian.AI.GiveItemTo(Hero, UItMi_Orenugget, 300);
                DC(int64(0x278b5506532ac55d), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac55f), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x278b5506532ac55f), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac561), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0x278b5506532ac561), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Riordian_137868 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x278b5506532ac531);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_123421_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Riordian_137868);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac532), EConversationDebugInfo::Executing);
                // I'll take the potion.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_123421_3569"));
                DC(int64(0x278b5506532ac532), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac544), EConversationDebugInfo::Executing);
                
                // Splendid, you must drink it all for it to take effect.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_124738"));
                DC(int64(0x278b5506532ac544), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_SoldToRiordian);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Riordian.AddItemToInventory(UItFo_Potion_Health_Perma_01, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac68a), EConversationDebugInfo::Executing);
                Riordian.AI.GiveItemTo(Hero, UItFo_Potion_Health_Perma_01, 1);
                DC(int64(0x278b5506532ac68a), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac6bd), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x278b5506532ac6bd), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac6bf), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0x278b5506532ac6bf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Riordian_137890 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x278b5506532ac53a);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_124713_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac53b), EConversationDebugInfo::Executing);
                // I'll think about it.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_124713_2801"));
                DC(int64(0x278b5506532ac53b), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac545), EConversationDebugInfo::Executing);
                
                // Don't wait too long.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_125105"));
                DC(int64(0x278b5506532ac545), EConversationDebugInfo::Done);
                DC(int64(0xb34d531f120bd0ae), EConversationDebugInfo::Executing);
                G1R.Riordian_GlandNegotiation = 0;
                DC(int64(0xb34d531f120bd0ae), EConversationDebugInfo::Done);
                DB(int64(0x64406eb9075a2c14), Riordian != nullptr && Riordian.HasItem(UItAt_Minecrawlerqueen_01, 1, 0));
                
                if (Riordian != nullptr && Riordian.HasItem(UItAt_Minecrawlerqueen_01, 1, 0))
                {
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                    Riordian.AddItemToInventory(UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                    Riordian.AI.GiveItemTo(Hero, UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                    DC(int64(0x64406eb9075a2bf7), EConversationDebugInfo::Executing);
                    // These organs require special preservation.
                    Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_144827_3286"));
                    DC(int64(0x64406eb9075a2bf7), EConversationDebugInfo::Done);
                }
                DC(int64(0x278b5506532ac6b6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x278b5506532ac6b6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRiordian138198 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0xc37fd20aa2f91ea7);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_134518");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Riordian_137890);
            default Rules.HideIfKnows(UChoiceRiordian138198);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x278b5506532ac6b5), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x278b5506532ac632), EConversationDebugInfo::Executing);
                // About the pheromone gland.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_134518"));
                DC(int64(0x278b5506532ac632), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac633), EConversationDebugInfo::Executing);
                
                // Are you prepared to part with it?
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_134518_2995"));
                DC(int64(0x278b5506532ac633), EConversationDebugInfo::Done);
                DC(int64(0xb34d531f120bd0ba), EConversationDebugInfo::Executing);
                G1R.Riordian_GlandNegotiation = 1;
                DC(int64(0xb34d531f120bd0ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordian138323 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x278b5506532ac6a4);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Riordian_137848);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Riordian_137868);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x278b5506532ac5c1), Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0))
                {
                    DC(int64(0x278b5506532ac5c7), EConversationDebugInfo::Executing);
                    // Here, take the gland.
                    Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_133909"));
                    DC(int64(0x278b5506532ac5c7), EConversationDebugInfo::Done);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Riordian, UItAt_Minecrawlerqueen_01, 1);
                    DC(int64(0x8921c2ef02815208), EConversationDebugInfo::Done);
                }
                DC(int64(0x278b5506532ac61d), EConversationDebugInfo::Executing);
                // Pleasure doing business with you.
                Riordian.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_134333_491"));
                DC(int64(0x278b5506532ac61d), EConversationDebugInfo::Done);
                DC(int64(0x278b5506532ac562), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x278b5506532ac562), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRiordian146428 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x36d532d724ac1853);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRiordian146428);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1817), Hero != nullptr && Hero.IsCloseToCharacter(Riordian, 800.0f));
                    DB(int64(0x36d532d724ac1818), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x36d532d724ac1841), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Riordian, 800.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x36d532d724ac184d), EConversationDebugInfo::Executing);
                // We're counting on you.
                Riordian.AI.Say(LocText("TEXT_WIP_JTMZBQ_20250130_084133_2238"));
                DC(int64(0x36d532d724ac184d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordian235462 : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0xa7deef969d1d16a8);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_121503_1184");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Alchemy);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf11f5810a95022b3), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1d16a4), EConversationDebugInfo::Executing);
                
                // Can you teach me to become an alchemist?
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163002"));
                DC(int64(0xa7deef969d1d16a4), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1d16a5), EConversationDebugInfo::Executing);
                
                // Hmm ... yes, I suppose I could. You do show some ...
                Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163002_3068"));
                DC(int64(0xa7deef969d1d16a5), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1d76a8), EConversationDebugInfo::Executing);
                // However, I must ask for a small donation ... 
                Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163150"));
                DC(int64(0xa7deef969d1d76a8), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1d76c2), EConversationDebugInfo::Executing);
                
                // Teach me alchemy. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163239"));
                DC(int64(0xa7deef969d1d76c2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_RIORDIAN, Document::UDocumentSegment_Glossary_NC_KDW_RIORDIAN_Teacher);
                DB(int64(0xa7deef969d1d76aa), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Alchemy));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Alchemy))
                {
                    DB(int64(0xf11f5810a9502302), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Alchemy));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Alchemy))
                    {
                        DC(int64(0xa7deef969d1d76b9), EConversationDebugInfo::Executing);
                        // Very well, then. Let us begin. 
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163209_571"));
                        DC(int64(0xa7deef969d1d76b9), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1d76d3), EConversationDebugInfo::Executing);
                        // The power of a potion lies in its herbs - everyone knows ...
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163342"));
                        DC(int64(0xa7deef969d1d76d3), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1d76dc), EConversationDebugInfo::Executing);
                        // What many do not know is the importance of dosage. Too ...
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163353"));
                        DC(int64(0xa7deef969d1d76dc), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1d76e5), EConversationDebugInfo::Executing);
                        // Too much, and the cure becomes the poison. 
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163359"));
                        DC(int64(0xa7deef969d1d76e5), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1d76ee), EConversationDebugInfo::Executing);
                        // What I'm telling you is, ALWAYS respect the recipe, and ...
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163404"));
                        DC(int64(0xa7deef969d1d76ee), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1d76f7), EConversationDebugInfo::Executing);
                        // With enough patience and experience, every plant could ...
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163410"));
                        DC(int64(0xa7deef969d1d76f7), EConversationDebugInfo::Done);
                        DC(int64(0xf11f5810a9502311), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Alchemy);
                        DC(int64(0xf11f5810a9502311), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584117), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReFo_Potion_Health_01);
                        DC(int64(0x9733703e83584117), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584119), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReFo_Potion_Mana_01);
                        DC(int64(0x9733703e83584119), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_riordian_235462_exit_1");
                        DC(int64(0xf11f5810a9502317), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a9502317), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1d76b3), EConversationDebugInfo::Executing);
                        // Like I said, I will need a small donation. 
                        Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163207_3653"));
                        DC(int64(0xa7deef969d1d76b3), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_riordian_235462_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1d76af), EConversationDebugInfo::Executing);
                    // I would - but I believe it'd be too complex for the time ...
                    Riordian.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163205_4085"));
                    DC(int64(0xa7deef969d1d76af), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_riordian_235462_exit_3");
                }
            }
        }
        
        
        class UChoiceRiordianExit : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde4d3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x528f8bdfd4fde4d5), Riordian != nullptr && !Riordian.HasItem(UItAr_Rune_BallLightning, 1, 0));
                
                if (Riordian != nullptr && !Riordian.HasItem(UItAr_Rune_BallLightning, 1, 0))
                {
                    DC(int64(0x1a494c3f7de91771), EConversationDebugInfo::Executing);
                    Riordian.AddItemToInventory(UItAr_Rune_BallLightning, 1);
                    DC(int64(0x1a494c3f7de91771), EConversationDebugInfo::Done);
                }
                DC(int64(0x528f8bdfd4fde4d7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x528f8bdfd4fde4d7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRiordianMessage : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x3f3055364bb57041);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceRiordianMessage);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_GORN_POST_09_02"), int64(0x3f3055364bb57041));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9317a6ed9c2dae1), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde500), EConversationDebugInfo::Executing);
                // Ahh, you're here. I've been looking for you!
                Riordian.AI.Say(LocText("INFO_RIORDIAN_MESSAGE_14_01"));
                DC(int64(0x528f8bdfd4fde500), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRiordianMessagewhy : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x3f3055364bb57042);
            default Caption = LocText("INFO_RIORDIAN_MESSAGEWHY_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRiordianMessage);
            default Rules.HideIfKnows(UChoiceRiordianMessagewhy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde502), EConversationDebugInfo::Executing);
                
                // You've been looking for me? Why?
                Hero.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_15_01"));
                DC(int64(0x528f8bdfd4fde502), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde503), EConversationDebugInfo::Executing);
                
                // Because of Gorn - he asked me to send for you as soon as ...
                Riordian.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_14_02"));
                DC(int64(0x528f8bdfd4fde503), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde504), EConversationDebugInfo::Executing);
                
                // Any idea why?
                Hero.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_15_03"));
                DC(int64(0x528f8bdfd4fde504), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde505), EConversationDebugInfo::Executing);
                
                // Yes - I believe he has a plan to free the occupied mine. 
                Riordian.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_14_04"));
                DC(int64(0x528f8bdfd4fde505), EConversationDebugInfo::Done);
                DB(int64(0xe449908c8b4f4d62), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_GORN_GUARDNC_09_06")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_GORN_GUARDNC_09_06")))
                {
                    DC(int64(0x528f8bdfd4fde506), EConversationDebugInfo::Executing);
                    // Okay. Is he still at the ravine?
                    Hero.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_15_05"));
                    DC(int64(0x528f8bdfd4fde506), EConversationDebugInfo::Done);
                    DC(int64(0x528f8bdfd4fde507), EConversationDebugInfo::Executing);
                    
                    // Yes. Go find him at once.
                    Riordian.AI.Say(LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"));
                    DC(int64(0x528f8bdfd4fde507), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe449908c8b4f4d71), EConversationDebugInfo::Executing);
                    
                    // Where can I find him?
                    Hero.AI.Say(LocText("TEXT_WIP_HHOYLVC_20250221_103338"));
                    DC(int64(0xe449908c8b4f4d71), EConversationDebugInfo::Done);
                    DC(int64(0xe449908c8b4f4d72), EConversationDebugInfo::Executing);
                    
                    // He is in the ravine near the Free Mine. Go find him.
                    Riordian.AI.Say(LocText("TEXT_WIP_HHOYLVC_20250221_103338_41"));
                    DC(int64(0xe449908c8b4f4d72), EConversationDebugInfo::Done);
                }
                DC(int64(0xf9317a6ed9c2db23), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY06_708))) { NC_SLD_MERCENARY06_708.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary06_708_FMOre); }
                DC(int64(0xf9317a6ed9c2db23), EConversationDebugInfo::Done);
                DC(int64(0x3f3055364bb5704b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Cronos))) { Cronos.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Cronos_604_FMOre); }
                DC(int64(0x3f3055364bb5704b), EConversationDebugInfo::Done);
                DC(int64(0x3f3055364bb5704d), EConversationDebugInfo::Executing);
                Riordian.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Riordian_605_Start);
                DC(int64(0x3f3055364bb5704d), EConversationDebugInfo::Done);
                DC(int64(0x3f3055364bb57066), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3f3055364bb57066), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRiordianReward : UTopic_Hero__NC_KDW_RIORDIAN_605
        {
            default DebugId = int64(0x528f8bdfd4fde4e8);
            default Caption = LocText("INFO_RIORDIAN_REWARD_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRiordianReward);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x528f8bdfd4fde4e9), G1R.Saturas_BringFoci == 5);
                    DB(int64(0x528f8bdfd4fde4ea), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (G1R.Saturas_BringFoci != 5)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x528f8bdfd4fde4eb), EConversationDebugInfo::Executing);
                // Saturas said you have a reward for me. 
                Hero.AI.Say(LocText("INFO_RIORDIAN_REWARD_15_01"));
                DC(int64(0x528f8bdfd4fde4eb), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde4ec), EConversationDebugInfo::Executing);
                
                // Wait. Does that mean ...?
                Riordian.AI.Say(LocText("INFO_RIORDIAN_REWARD_14_02"));
                DC(int64(0x528f8bdfd4fde4ec), EConversationDebugInfo::Done);
                DC(int64(0x9e2e3de1230b8851), EConversationDebugInfo::Executing);
                
                // I got you the focus stones. Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_UOQECXC_20240423_140154"));
                DC(int64(0x9e2e3de1230b8851), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde4ed), EConversationDebugInfo::Executing);
                
                // Adanos be blessed ... that's ... that's incredible! We ...
                Riordian.AI.Say(LocText("INFO_RIORDIAN_REWARD_14_03"));
                DC(int64(0x528f8bdfd4fde4ed), EConversationDebugInfo::Done);
                DC(int64(0x9e2e3de1230b8866), EConversationDebugInfo::Executing);
                
                // Well, that's why I did it. Now about that reward ... 
                Hero.AI.Say(LocText("TEXT_WIP_UOQECXC_20240423_141222"));
                DC(int64(0x9e2e3de1230b8866), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde4ee), EConversationDebugInfo::Executing);
                
                // Right, right, of course! Here - it is but a token, but ...
                Riordian.AI.Say(LocText("INFO_RIORDIAN_REWARD_14_04"));
                DC(int64(0x528f8bdfd4fde4ee), EConversationDebugInfo::Done);
                DC(int64(0x528f8bdfd4fde4ef), EConversationDebugInfo::Executing);
                // Thank you, stranger. I mean it. Let me know if you ever ...
                Riordian.AI.Say(LocText("INFO_RIORDIAN_REWARD_14_05"));
                DC(int64(0x528f8bdfd4fde4ef), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_RiordianReward);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Riordian.AddItemToInventory(UItFo_Potion_Health_02, 2);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917a6), EConversationDebugInfo::Executing);
                Riordian.AI.GiveItemTo(Hero, UItFo_Potion_Health_02, 2);
                DC(int64(0x1a494c3f7de917a6), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917aa), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Mana_02, 2);
                DC(int64(0x1a494c3f7de917aa), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917ac), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Health_03, 1);
                DC(int64(0x1a494c3f7de917ac), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917ae), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Mana_03, 1);
                DC(int64(0x1a494c3f7de917ae), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917b4), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Health_Perma_01, 1);
                DC(int64(0x1a494c3f7de917b4), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de917b6), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Mana_Perma_01, 1);
                DC(int64(0x1a494c3f7de917b6), EConversationDebugInfo::Done);
                DB(int64(0x528f8bdfd4fde4fb), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_CRONOS_REWARD_08_02")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_CRONOS_REWARD_08_02")))
                {
                    DC(int64(0x1a494c3f7de917a0), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_BRINGFOCI.SucceedQuest();
                    DC(int64(0x1a494c3f7de917a0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_riordian_reward_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_riordian_reward_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */