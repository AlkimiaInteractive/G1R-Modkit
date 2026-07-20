#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_TORREZ_405 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_TORREZ_405";
        }
        
        
        class UTopic_Hero__OC_KDF_TORREZ_405 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_TORREZ_405";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTorrez() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetCorristo() const property
            {
                return GetCharacter(n"OC_KDF_CORRISTO_402");
            }
        }
        
        
        class UChoiceKdf405TorrezBook : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad56388);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdf405TorrezBook);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("KDF_403_DRAGO_RUNE_INFO_13_01"), int64(0xc59c9bdddad56388));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5c5254a4f15ecc4), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56389), EConversationDebugInfo::Executing);
                // Welcome to our circle, brother. 
                Torrez.AI.Say(LocText("KDF_405_TORREZ_BOOK_INFO_04_01"));
                DC(int64(0xc59c9bdddad56389), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b2b8), EConversationDebugInfo::Executing);
                // Here, take this - it's a book that will introduce you to ...
                Torrez.AI.Say(LocText("TEXT_WIP_VBJDHIL_20241218_004507"));
                DC(int64(0xb0f6a0636896b2b8), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5638a), EConversationDebugInfo::Executing);
                // Knowledge is power - so earn it. 
                Torrez.AI.Say(LocText("KDF_405_TORREZ_BOOK_INFO_04_02"));
                DC(int64(0xc59c9bdddad5638a), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItWr_Book_Circle_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f442), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItWr_Book_Circle_01, 1);
                DC(int64(0xf7969d2e8d21f442), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5638d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc59c9bdddad5638d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf405TorrezGreet : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad56391);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKdf405TorrezGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5c5254a4f15ec55), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb0f6a0636896b289), EConversationDebugInfo::Executing);
                // Well, well, a new face. Innos be with you.
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_232335"));
                DC(int64(0xb0f6a0636896b289), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56393), EConversationDebugInfo::Executing);
                
                // Thanks. I'm just looking around.
                Hero.AI.Say(LocText("KDF_405_TORREZ_GREET_INFO_15_01"));
                DC(int64(0xc59c9bdddad56393), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56394), EConversationDebugInfo::Executing);
                
                // An inquisitive soul - how commendable. I'm Torrez, and, ...
                Torrez.AI.Say(LocText("KDF_405_TORREZ_GREET_INFO_04_02"));
                DC(int64(0xc59c9bdddad56394), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b28a), EConversationDebugInfo::Executing);
                // If you'd like to trade, you're welcome to make an offer.
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_232907"));
                DC(int64(0xb0f6a0636896b28a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_Introduction);
            }
        }
        
        
        class UChoiceKdf405TorrezSellbooks : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad5638e);
            default Caption = LocText("KDF_405_TORREZ_SELLBOOKS_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2e6b0f87e82c5a47), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0x2e6b0f87e82c5a43), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasSucceeded());
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad5638f), EConversationDebugInfo::Executing);
                // I'm looking for magical items. 
                Hero.AI.Say(LocText("KDF_405_TORREZ_SELLBOOKS_INFO_15_01"));
                DC(int64(0xc59c9bdddad5638f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_Dealer);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_Introduction);
                DB(int64(0x7ec56dc721168b85), Torrez != nullptr && Torrez.IsAngryTowards(Hero));
                
                if (Torrez != nullptr && Torrez.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168b8a), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Torrez.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_113500"));
                    DC(int64(0x7ec56dc721168b8a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_405_torrez_sellbooks_exit_1");
                    DC(int64(0x7ec56dc721168bb0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168bb0), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf7969d2e8d21f45a), EConversationDebugInfo::Executing);
                    Torrez.AI.StartTradingWith(Hero);
                    DC(int64(0xf7969d2e8d21f45a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_405_torrez_sellbooks_exit_2");
                }
            }
        }
        
        
        class UChoiceTorrez107584 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x48d99f52769d9fcc);
            default Caption = LocText("TEXT_WIP_ERKEQW_20241119_130922");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdf405TorrezGreet);
            default Rules.HideIfKnows(UChoiceTorrez107584);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xab42bc70774c459f), G1R != nullptr && G1R.IsInChapter(1));
                    DB(int64(0x1eef95525eb76ba1), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                    DB(int64(0x1eef95525eb76ba2), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xab42bc70774c459f), G1R != nullptr && G1R.IsInChapter(1));
                    DB(int64(0x1eef95525eb76ba1), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0x1eef95525eb76ba2), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                }
                
                if (G1R != nullptr && G1R.IsInChapter(1) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return true;
                
                if (G1R != nullptr && G1R.IsInChapter(1) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab42bc70774c4587), EConversationDebugInfo::Executing);
                // I have a letter for the Fire Mages.
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_130922"));
                DC(int64(0xab42bc70774c4587), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c4588), EConversationDebugInfo::Executing);
                
                // Corristo takes care of that. He'll be in the mage's ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_130922_41"));
                DC(int64(0xab42bc70774c4588), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c45a3), EConversationDebugInfo::Executing);
                
                // Will they let me in?
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_131934"));
                DC(int64(0xab42bc70774c45a3), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c45a4), EConversationDebugInfo::Executing);
                
                // Well, usually not - the castle grounds are accessible to ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_132029"));
                DC(int64(0xab42bc70774c45a4), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c45aa), EConversationDebugInfo::Executing);
                
                // You could tell them to let me through.
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_132544"));
                DC(int64(0xab42bc70774c45aa), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c458e), EConversationDebugInfo::Executing);
                
                // If only it were that simple. I'm but a humble servant of ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_131152"));
                DC(int64(0xab42bc70774c458e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_BasicMagic);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_TorrezNo);
                Subdialog(
                    UTopic_Torrez_220767,
                    UTopic_Torrez_220787
                );
                DC(int64(0xcf5b47c23bf3cc0e), EConversationDebugInfo::Executing);
                // I'm seeking someone who deserves a chance. Admittedly, ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_040746_41"));
                DC(int64(0xcf5b47c23bf3cc0e), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc14), EConversationDebugInfo::Executing);
                // You are sincere - but we shall see if that suffices to ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_041437"));
                DC(int64(0xcf5b47c23bf3cc14), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc0d), EConversationDebugInfo::Executing);
                
                // You want to make me a mage?
                Hero.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_040746"));
                DC(int64(0xcf5b47c23bf3cc0d), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc15), EConversationDebugInfo::Executing);
                
                // There's no need for haste. And it isn't quite that easy ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_041617"));
                DC(int64(0xcf5b47c23bf3cc15), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc16), EConversationDebugInfo::Executing);
                
                // And what's the catch?
                Hero.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_041854"));
                DC(int64(0xcf5b47c23bf3cc16), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc17), EConversationDebugInfo::Executing);
                
                // No such thing. It's my duty to act on behalf of and for ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_041903"));
                DC(int64(0xcf5b47c23bf3cc17), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b263), EConversationDebugInfo::Executing);
                // Which is why I'm talking to the convicts in the first ...
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_213410"));
                DC(int64(0xb0f6a0636896b263), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc18), EConversationDebugInfo::Executing);
                // But this is about you. You seem capable of more than ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_042359"));
                DC(int64(0xcf5b47c23bf3cc18), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc19), EConversationDebugInfo::Executing);
                // And I'm offering you a chance to prove it. Think about ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_042827"));
                DC(int64(0xcf5b47c23bf3cc19), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Torrez_220767 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c82670310);
            default Caption = LocText("TEXT_WIP_ETRAKS_20241120_163202_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_220767);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x48d99f52769d9ec4), EConversationDebugInfo::Executing);
                
                // Well, I'm in here, so ...
                Hero.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163202_1769"));
                DC(int64(0x48d99f52769d9ec4), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f17), EConversationDebugInfo::Executing);
                
                // A man who is not afraid to speak the truth - a rare kind ...
                Torrez.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163308"));
                DC(int64(0x48d99f52769d9f17), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f18), EConversationDebugInfo::Executing);
                // Such as the Path of Innos is paved with fire, such it is ...
                Torrez.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163312"));
                DC(int64(0x48d99f52769d9f18), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f20), EConversationDebugInfo::Executing);
                // And even though everyone carries a spark of this fire ...
                Torrez.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163324_731"));
                DC(int64(0x48d99f52769d9f20), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f24), EConversationDebugInfo::Executing);
                // To be quite honest ... they wouldn't even realize it if ...
                Torrez.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163333"));
                DC(int64(0x48d99f52769d9f24), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f1f), EConversationDebugInfo::Executing);
                
                // Why are you telling me all that?
                Hero.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163324"));
                DC(int64(0x48d99f52769d9f1f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Torrez_220787 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c82670314);
            default Caption = LocText("TEXT_WIP_ETRAKS_20241120_163202_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_220787);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x48d99f52769d9ec8), EConversationDebugInfo::Executing);
                // To be honest, I could be more ... educated.
                Hero.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163202_2995"));
                DC(int64(0x48d99f52769d9ec8), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f70), EConversationDebugInfo::Executing);
                
                // Self-awareness. A first step that few dare take in this ...
                Torrez.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163354"));
                DC(int64(0x48d99f52769d9f70), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9f71), EConversationDebugInfo::Executing);
                
                // What are you trying to say?
                Hero.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163357"));
                DC(int64(0x48d99f52769d9f71), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrez107752 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xbbc83d71c172cccb);
            default Caption = LocText("TEXT_WIP_ERKEQW_20241119_142216");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Torrez_108259);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Torrez_221070);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Torrez_221070);
            default Rules.HideIfKnows(UChoiceTorrez107752);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbbc83d71c172ccce), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning());
                    DB(int64(0xbbc83d71c172ccd2), Hero != nullptr && Hero.HasItem(UItMi_Inscription_Parchment, 1, 0));
                    DB(int64(0xbbc83d71c172ccd3), Hero != nullptr && Hero.HasItem(UItAt_Wolf_03, 2, 0));
                    DB(int64(0x1eef95525eb76ba4), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x5c5254a4f15ecaf), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Inscription_Parchment, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Wolf_03, 2, 0))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbbc83d71c172ccc6), EConversationDebugInfo::Executing);
                // Here are the things you asked for.
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_142216"));
                DC(int64(0xbbc83d71c172ccc6), EConversationDebugInfo::Done);
                DC(int64(0xbbc83d71c172ccc7), EConversationDebugInfo::Executing);
                
                // Very good. Show me. 
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_142216_41"));
                DC(int64(0xbbc83d71c172ccc7), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a46), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Torrez, UItAt_Wolf_03, 2);
                DC(int64(0xa3752faa1ed19a46), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a4d), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAr_Rune_FireBolt, 1);
                DC(int64(0xa3752faa1ed19a4d), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a4f), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAr_Rune_Light, 1);
                DC(int64(0xa3752faa1ed19a4f), EConversationDebugInfo::Done);
                DC(int64(0x12f475b5917c70bf), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItMi_Inscription_Parchment, 1);
                DC(int64(0x12f475b5917c70bf), EConversationDebugInfo::Done);
                DC(int64(0x12f475b5917c71d9), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMi_Inscription_Parchment, 1, 0);
                DC(int64(0x12f475b5917c71d9), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a56), EConversationDebugInfo::Executing);
                // Well then, I suppose you already know there are two ways ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145429_41"));
                DC(int64(0xa3752faa1ed19a56), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc1d), EConversationDebugInfo::Executing);
                // Most will be capable of using a scroll, but mastery of ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_121917"));
                DC(int64(0xcf5b47c23bf3cc1d), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a5a), EConversationDebugInfo::Executing);
                // However, ther are exceptions. Teleportation runes, for ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145454"));
                DC(int64(0xa3752faa1ed19a5a), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc1c), EConversationDebugInfo::Executing);
                // And then there are basic runes which can be mastered ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_121604"));
                DC(int64(0xcf5b47c23bf3cc1c), EConversationDebugInfo::Done);
                DC(int64(0x5e725713107bd316), EConversationDebugInfo::Executing);
                
                // Like me.
                Hero.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_153346"));
                DC(int64(0x5e725713107bd316), EConversationDebugInfo::Done);
                DC(int64(0x5e725713107bd317), EConversationDebugInfo::Executing);
                
                // I should think so. A rune's inscription functions as a ...
                Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_153352"));
                DC(int64(0x5e725713107bd317), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b266), EConversationDebugInfo::Executing);
                // And as with the scrolls, you must access that spark to ...
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_215948"));
                DC(int64(0xb0f6a0636896b266), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc1e), EConversationDebugInfo::Executing);
                // Let's try it then, shall we?
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_122140"));
                DC(int64(0xcf5b47c23bf3cc1e), EConversationDebugInfo::Done);
                DC(int64(0xe8f7c8ffa6d6732b), EConversationDebugInfo::Executing);
                // Choose a rune - commit to the craft and you may even ...
                Torrez.AI.Say(LocText("TEXT_WIP_LEQZAEL_20241221_001221"));
                DC(int64(0xe8f7c8ffa6d6732b), EConversationDebugInfo::Done);
                DC(int64(0x2e6b0f87e82c59b9), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN.SucceedQuest();
                DC(int64(0x2e6b0f87e82c59b9), EConversationDebugInfo::Done);
                DC(int64(0x391214a72fa79ecc), EConversationDebugInfo::Executing);
                Hero.GiveExperience(100);
                DC(int64(0x391214a72fa79ecc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrez109266 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x668dc368d5f42e8a);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123925_153");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorrez110367);
            default Rules.HideIfKnows(UChoiceTorrez109266);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5c5254a4f15eca7), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                return G1R != nullptr && G1R.IsInChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2eeaef1b2155186e), EConversationDebugInfo::Executing);
                // What do you need? 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123925_153"));
                DC(int64(0x2eeaef1b2155186e), EConversationDebugInfo::Done);
                DC(int64(0x2eeaef1b2155199e), EConversationDebugInfo::Executing);
                
                // It's quite simple. Find a blank piece of scroll paper ...
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123933"));
                DC(int64(0x2eeaef1b2155199e), EConversationDebugInfo::Done);
                DC(int64(0x5e725713107bd309), EConversationDebugInfo::Executing);
                
                // Interesting combination. 
                Hero.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_152226"));
                DC(int64(0x5e725713107bd309), EConversationDebugInfo::Done);
                DC(int64(0x48d99f52769d9faf), EConversationDebugInfo::Executing);
                
                // Bring them to me and I will craft them into a scroll. ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_044137"));
                DC(int64(0x48d99f52769d9faf), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Torrez_108259,
                    UTopic_Torrez_108279,
                    UTopic_Torrez_220875
                );
            }
        }
        
        
        class UTopic_Torrez_108259 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xab42bc70774c45bc);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123925_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_108259);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab42bc70774c45bd), EConversationDebugInfo::Executing);
                // I'll take care of it. 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123925_94"));
                DC(int64(0xab42bc70774c45bd), EConversationDebugInfo::Done);
                DC(int64(0x1abb43d780f8a51c), EConversationDebugInfo::Executing);
                
                // Good. A blank piece of paper and two wolf claws.
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_124122"));
                DC(int64(0x1abb43d780f8a51c), EConversationDebugInfo::Done);
                DC(int64(0x668dc368d5f42eb1), EConversationDebugInfo::Executing);
                // And I will show you how to work magic through it.
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_044307"));
                DC(int64(0x668dc368d5f42eb1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MAGICTRANSACTION, Document::UDocumentSegment_CH1_MAGICTRANSACTION_Start);
                DC(int64(0x7b925fe72fa00e9a), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.StartQuest();
                DC(int64(0x7b925fe72fa00e9a), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c45cd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xab42bc70774c45cd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Torrez_108279 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xab42bc70774c45c0);
            default Caption = LocText("TEXT_WIP_ERKEQW_20241119_133045_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_108279);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab42bc70774c45c1), EConversationDebugInfo::Executing);
                // Tell me more about scrolls. 
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_133045_1609"));
                DC(int64(0xab42bc70774c45c1), EConversationDebugInfo::Done);
                DC(int64(0xab42bc70774c45d8), EConversationDebugInfo::Executing);
                
                // Producing and inscribing scrolls is no less part of ...
                Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_135952"));
                DC(int64(0xab42bc70774c45d8), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b279), EConversationDebugInfo::Executing);
                // In fact, it is quite a useful talent. Perhaps you will ...
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_230128"));
                DC(int64(0xb0f6a0636896b279), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b27b), EConversationDebugInfo::Executing);
                // But let's not get ahead of ourselves.
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_230241"));
                DC(int64(0xb0f6a0636896b27b), EConversationDebugInfo::Done);
                DC(int64(0x2eeaef1b2155185a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2eeaef1b2155185a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Torrez_220875 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c82670362);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123538_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_220875);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c82670363), EConversationDebugInfo::Executing);
                // Maybe later. 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123538_2995"));
                DC(int64(0x9ab60e5c82670363), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c82670369), EConversationDebugInfo::Executing);
                
                // Innos chooses his servants ... 
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123544"));
                DC(int64(0x9ab60e5c82670369), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c8267036d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9ab60e5c8267036d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorrez110367 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x48d99f52769d9fbf);
            default Caption = LocText("TEXT_WIP_ETRAKS_20241120_163706");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorrez107584);
            default Rules.HideIfKnows(UChoiceTorrez110367);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1eef95525eb76ba3), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x5c5254a4f15ec5d), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x48d99f52769d9fba), EConversationDebugInfo::Executing);
                // Offer me the magic.
                Hero.AI.Say(LocText("TEXT_WIP_ETRAKS_20241120_163706"));
                DC(int64(0x48d99f52769d9fba), EConversationDebugInfo::Done);
                DB(int64(0x2e6b0f87e82c59c9), G1R.Thorus_Permission_Interior == 1);
                
                if (G1R.Thorus_Permission_Interior == 1)
                {
                    DC(int64(0x5e725713107b5976), EConversationDebugInfo::Executing);
                    // Well, having access to the castle speaks in your favor. ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_151002"));
                    DC(int64(0x5e725713107b5976), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107b5977), EConversationDebugInfo::Executing);
                    
                    // I'm ready.
                    Hero.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_151031"));
                    DC(int64(0x5e725713107b5977), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107b5978), EConversationDebugInfo::Executing);
                    
                    // Determined. That bodes well. But I need a few things ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_151038"));
                    DC(int64(0x5e725713107b5978), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107b5979), EConversationDebugInfo::Executing);
                    // Take care of it, then we'll speak about magic.
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_151048"));
                    DC(int64(0x5e725713107b5979), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107b597a), EConversationDebugInfo::Executing);
                    // And I might even teach you some of the basics if you do ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_151102"));
                    DC(int64(0x5e725713107b597a), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107b597b), EConversationDebugInfo::Executing);
                    // No circle magic, of course - THAT is privy to us mages. ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_145931"));
                    DC(int64(0x5e725713107b597b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torrez_110367_exit_1");
                }
                else
                {
                    DC(int64(0xe8f7c8ffa6d6732a), EConversationDebugInfo::Executing);
                    // Please, Innos, don't let this one fail as well.
                    Torrez.AI.Say(LocText("TEXT_WIP_LEQZAEL_20241221_000641"));
                    DC(int64(0xe8f7c8ffa6d6732a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torrez_110367_exit_2");
                }
            }
        }
        
        
        class UChoiceTorrez114863 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x14197298145f7242);
            default Caption = LocText("TEXT_WIP_XHHWUEL_20241202_110048_3286");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTorrez114863);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Torrez, 500.0f));
                    DB(int64(0x5c5254a4f15ecc5), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Torrez, 500.0f))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f7241), EConversationDebugInfo::Executing);
                // You recognized your capabilities, Brother. Innos shine ...
                Torrez.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_110048_3286"));
                DC(int64(0x14197298145f7241), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrez133944 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xb34551c5b1e1e357);
            default Caption = LocText("TEXT_WIP_PAQIAM_20251007_160827_3548");
            default PriorityRank = 3;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Amateur);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorrez107752);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb34551c5b1e1e366), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x63ca372f5fe9083e), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_Amateur));
                    DB(int64(0x5c5254a4f15ecae), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x7c2a40c1168759b3), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x7c2a40c1168759b4), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0x7c2a40c1168759b5), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                    DB(int64(0x7c2a40c1168759b6), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5));
                    DB(int64(0x7c2a40c1168759b7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_Amateur))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34551c5b1e1e353), EConversationDebugInfo::Executing);
                
                // All right.
                Hero.AI.Say(LocText("TEXT_WIP_EILDIL_20241218_110120"));
                DC(int64(0xb34551c5b1e1e353), EConversationDebugInfo::Done);
                DB(int64(0xb34551c5b1e1e227), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_Amateur));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_Amateur))
                {
                    DC(int64(0xa3752faa1ed19a5c), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_Amateur);
                    DC(int64(0xa3752faa1ed19a5c), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MAGICTRANSACTION, Document::UDocumentSegment_CH1_MAGICTRANSACTION_Completed);
                    DC(int64(0xa3752faa1ed19a65), EConversationDebugInfo::Executing);
                    // Innos is the god of justice, blessings, and fire. Part ...
                    Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145619"));
                    DC(int64(0xa3752faa1ed19a65), EConversationDebugInfo::Done);
                    DC(int64(0xa3752faa1ed19a61), EConversationDebugInfo::Executing);
                    // Therefore, you may choose between these two runes: one ...
                    Torrez.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145546_2083"));
                    DC(int64(0xa3752faa1ed19a61), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Torrez_107861,
                        UTopic_Torrez_107881
                    );
                    DC(int64(0x5e725713107bd31a), EConversationDebugInfo::Executing);
                    // Very well. May Innos illuminate your spirit and kindle ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_153941"));
                    DC(int64(0x5e725713107bd31a), EConversationDebugInfo::Done);
                    DC(int64(0xa3752faa1ed19a83), EConversationDebugInfo::Executing);
                    
                    // And that's it? I can use this rune now? 
                    Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_150236_3436"));
                    DC(int64(0xa3752faa1ed19a83), EConversationDebugInfo::Done);
                    DC(int64(0xcf5b47c23bf3cc1f), EConversationDebugInfo::Executing);
                    
                    // (amused) It'll take some practice, but yes, in essence, ...
                    Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_122713"));
                    DC(int64(0xcf5b47c23bf3cc1f), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107bd31b), EConversationDebugInfo::Executing);
                    // Use it wisely, however - every spell will explete a ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_154007"));
                    DC(int64(0x5e725713107bd31b), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107bd31c), EConversationDebugInfo::Executing);
                    
                    // Where can I get more runes? 
                    Hero.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_154040"));
                    DC(int64(0x5e725713107bd31c), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107bd31d), EConversationDebugInfo::Executing);
                    
                    // I can offer what I have on hand.
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_154149"));
                    DC(int64(0x5e725713107bd31d), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107bd327), EConversationDebugInfo::Executing);
                    
                    // I see. 
                    Hero.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_154256"));
                    DC(int64(0x5e725713107bd327), EConversationDebugInfo::Done);
                    DC(int64(0x5e725713107bd328), EConversationDebugInfo::Executing);
                    
                    // Stay alive, will you? One rune doesn't make you ...
                    Torrez.AI.Say(LocText("TEXT_WIP_BPMSWZD_20241218_154300"));
                    DC(int64(0x5e725713107bd328), EConversationDebugInfo::Done);
                    DB(int64(0x2d0b0d17dbaca422), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN.IsRunning());
                    
                    if (Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN.IsRunning())
                    {
                        DC(int64(0x2e6b0f87e82c59b9), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION_MAGICTRANSACTION_OBJ_RETURN.SucceedQuest();
                        DC(int64(0x2e6b0f87e82c59b9), EConversationDebugInfo::Done);
                        DC(int64(0x391214a72fa79ecc), EConversationDebugInfo::Executing);
                        Hero.GiveExperience(100);
                        DC(int64(0x391214a72fa79ecc), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x2d0b0d17dbaca430), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2d0b0d17dbaca430), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xb34551c5b1e1e22d), EConversationDebugInfo::Executing);
                    // But your talents are lacking as of now. Come back ...
                    Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162633_3677"));
                    DC(int64(0xb34551c5b1e1e22d), EConversationDebugInfo::Done);
                    DC(int64(0xb34551c5b1e1e23b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb34551c5b1e1e23b), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Torrez_107861 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xa3752faa1ed19a67);
            default Caption = LocText("TEXT_WIP_ERKEQW_20241119_145643_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_107861);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3752faa1ed19a68), EConversationDebugInfo::Executing);
                // I'll take the Healing Rune. 
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145643_2238"));
                DC(int64(0xa3752faa1ed19a68), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAr_Rune_Heal, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a79), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItAr_Rune_Heal, 1);
                DC(int64(0xa3752faa1ed19a79), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Torrez_107881 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xa3752faa1ed19a6b);
            default Caption = LocText("TEXT_WIP_ERKEQW_20241119_145643_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_107881);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3752faa1ed19a6c), EConversationDebugInfo::Executing);
                // I'll take the Firebolt Rune. 
                Hero.AI.Say(LocText("TEXT_WIP_ERKEQW_20241119_145643_2785"));
                DC(int64(0xa3752faa1ed19a6c), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAr_Rune_FireBolt, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xa3752faa1ed19a7e), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItAr_Rune_FireBolt, 1);
                DC(int64(0xa3752faa1ed19a7e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrez220951 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c82670376);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123620");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTorrez110367);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BRYAMKL_20241121_123544"), int64(0x9ab60e5c82670376));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_GTRAKS_20241122_104845_2083"), int64(0x9ab60e5c82670376));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ab60e5c82670418), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasBeenStarted());
                    DB(int64(0x5c5254a4f15eca5), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c82670371), EConversationDebugInfo::Executing);
                // About that chance you offered ...
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123620"));
                DC(int64(0x9ab60e5c82670371), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c82670372), EConversationDebugInfo::Executing);
                
                // Yes?
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123620_3750"));
                DC(int64(0x9ab60e5c82670372), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Torrez_221070,
                    UTopic_Torrez_221050,
                    UTopic_Torrez_221237
                );
            }
        }
        
        
        class UTopic_Torrez_221070 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c826703af);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123925_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Torrez_221070);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x1eef95525eb76c47), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                {
                    DC(int64(0x1eef95525eb76c4a), EConversationDebugInfo::Executing);
                    // I'd like to take you up on that offer.
                    Hero.AI.Say(LocText("TEXT_WIP_GTRAKS_20241122_104845"));
                    DC(int64(0x1eef95525eb76c4a), EConversationDebugInfo::Done);
                    DC(int64(0x1eef95525eb76c4b), EConversationDebugInfo::Executing);
                    
                    // NOW? Don't ridicule yourself. I can offer you wares, but ...
                    Torrez.AI.Say(LocText("TEXT_WIP_GTRAKS_20241122_104845_2083"));
                    DC(int64(0x1eef95525eb76c4b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9ab60e5c826703b0), EConversationDebugInfo::Executing);
                    
                    // I'll take care of it. 
                    Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123925_94"));
                    DC(int64(0x9ab60e5c826703b0), EConversationDebugInfo::Done);
                    DC(int64(0x9ab60e5c826703be), EConversationDebugInfo::Executing);
                    
                    // Good. A blank piece of paper and two wolf claws.
                    Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_124122"));
                    DC(int64(0x9ab60e5c826703be), EConversationDebugInfo::Done);
                    DC(int64(0xcf5b47c23bf3cc1b), EConversationDebugInfo::Executing);
                    // And I will show you how to work magic through it.
                    Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_044307"));
                    DC(int64(0xcf5b47c23bf3cc1b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MAGICTRANSACTION, Document::UDocumentSegment_CH1_MAGICTRANSACTION_Start);
                    DC(int64(0x7b925fe72fa00e9a), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.StartQuest();
                    DC(int64(0x7b925fe72fa00e9a), EConversationDebugInfo::Done);
                    DC(int64(0x9ab60e5c826703d2), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9ab60e5c826703d2), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Torrez_221050 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c826703ab);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_123925_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ab60e5c8267041a), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c826703ac), EConversationDebugInfo::Executing);
                // What do you need? 
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123925_153"));
                DC(int64(0x9ab60e5c826703ac), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826703b6), EConversationDebugInfo::Executing);
                
                // It's quite simple. Find a blank piece of scroll paper ...
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_123933"));
                DC(int64(0x9ab60e5c826703b6), EConversationDebugInfo::Done);
                DC(int64(0xcf5b47c23bf3cc1a), EConversationDebugInfo::Executing);
                // Bring them to me and I will craft them into a scroll. ...
                Torrez.AI.Say(LocText("TEXT_WIP_TBJDHIL_20241216_044137"));
                DC(int64(0xcf5b47c23bf3cc1a), EConversationDebugInfo::Done);
                DC(int64(0xb0f6a0636896b264), EConversationDebugInfo::Executing);
                // For now, at least.
                Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_215106"));
                DC(int64(0xb0f6a0636896b264), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826703ae), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9ab60e5c826703ae), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Torrez_221237 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c826703b7);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_124113_1037");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9ab60e5c8267041a), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && !Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c826703b8), EConversationDebugInfo::Executing);
                // Maybe later.
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_124113_1037"));
                DC(int64(0x9ab60e5c826703b8), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826703bf), EConversationDebugInfo::Executing);
                
                // Mhh, of course.
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_124150"));
                DC(int64(0x9ab60e5c826703bf), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c826703c3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9ab60e5c826703c3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorrez221376 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x9ab60e5c8267042a);
            default Caption = LocText("TEXT_WIP_BRYAMKL_20241121_140823");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2e6b0f87e82c5a3f), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9ab60e5c82670425), EConversationDebugInfo::Executing);
                // Could you teach me anything?
                Hero.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_140823"));
                DC(int64(0x9ab60e5c82670425), EConversationDebugInfo::Done);
                DC(int64(0x9ab60e5c82670426), EConversationDebugInfo::Executing);
                
                // What are you looking for?
                Torrez.AI.Say(LocText("TEXT_WIP_BRYAMKL_20241121_140823_2332"));
                DC(int64(0x9ab60e5c82670426), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_Teacher);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_TORREZ, Document::UDocumentSegment_Glossary_OC_KDF_TORREZ_Introduction);
                Subdialog(
                    UTopic_Torrez_110735,
                    UTopic_Torrez_110755,
                    UTopic_Torrez_110785
                );
            }
        }
        
        
        class UTopic_Torrez_110735 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xdf95ad3ef3de935a);
            default Caption = LocText("TEXT_WIP_PAQIAM_20251007_160827_2862");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5405ad02abf7941c), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56396), EConversationDebugInfo::Executing);
                // I want to strengthen my mind. 
                Hero.AI.Say(LocText("KDF_405_TORREZ_MANA_INFO_15_01"));
                DC(int64(0xc59c9bdddad56396), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56397), EConversationDebugInfo::Executing);
                
                // Very well. 
                Torrez.AI.Say(LocText("KDF_405_TORREZ_MANA_INFO_04_02"));
                DC(int64(0xc59c9bdddad56397), EConversationDebugInfo::Done);
                DC(int64(0xdd8771734a082168), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Torrez);
                DC(int64(0xdd8771734a082168), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKdf405TorrezManaMan1,
                    UChoiceKdf405TorrezManaMan5,
                    UChoiceKdf405TorrezManaBack
                );
            }
        }
        
        
        class UTopic_Torrez_110755 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xdf95ad3ef3de935e);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_132717_3507");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Inscription);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63ca372f5fe9082a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb66a), EConversationDebugInfo::Executing);
                // I want to learn how to craft scrolls.
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162515"));
                DC(int64(0xa7deef969d1cb66a), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb66b), EConversationDebugInfo::Executing);
                
                // Ahh ... a fine endeavor. It will stoke the spark of ...
                Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162515_2853"));
                DC(int64(0xa7deef969d1cb66b), EConversationDebugInfo::Done);
                DB(int64(0xa7deef969d1cb674), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Inscription))
                {
                    DB(int64(0x5405ad02abf79424), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Inscription))
                    {
                        DB(int64(0xb0f6a0636896b290), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasSucceeded());
                        
                        if (Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.HasSucceeded())
                        {
                            DC(int64(0xb0f6a0636896b294), EConversationDebugInfo::Executing);
                            // You know what you need, don't you?
                            Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_235549_2785"));
                            DC(int64(0xb0f6a0636896b294), EConversationDebugInfo::Done);
                        }
                        else
                        {
                            DC(int64(0xb0f6a0636896b29d), EConversationDebugInfo::Executing);
                            // Very well, you first need an empty scroll and the ...
                            Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_235607_3436"));
                            DC(int64(0xb0f6a0636896b29d), EConversationDebugInfo::Done);
                        }
                        DC(int64(0xa7deef969d1cb67f), EConversationDebugInfo::Executing);
                        // The real magic occurs at the writing desk.
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162725_971"));
                        DC(int64(0xa7deef969d1cb67f), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb68b), EConversationDebugInfo::Executing);
                        // Follow your intuition, that magical spark - watch how it ...
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162755"));
                        DC(int64(0xa7deef969d1cb68b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb68c), EConversationDebugInfo::Executing);
                        // The ingredients will help you understand a spell's ...
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162757"));
                        DC(int64(0xa7deef969d1cb68c), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb695), EConversationDebugInfo::Executing);
                        // Once you do, you must seal it into the scroll.
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162803"));
                        DC(int64(0xa7deef969d1cb695), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb69e), EConversationDebugInfo::Executing);
                        // It requires patience and time to master.
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162810"));
                        DC(int64(0xa7deef969d1cb69e), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb6af), EConversationDebugInfo::Executing);
                        // First and foremost owing to the scracity of materials in ...
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162821"));
                        DC(int64(0xa7deef969d1cb6af), EConversationDebugInfo::Done);
                        DC(int64(0x5405ad02abf79427), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Inscription);
                        DC(int64(0x5405ad02abf79427), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358414c), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Control);
                        DC(int64(0x9733703e8358414c), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e8358414e), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_Charm);
                        DC(int64(0x9733703e8358414e), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584150), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMeatbug);
                        DC(int64(0x9733703e83584150), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584152), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformMolerat);
                        DC(int64(0x9733703e83584152), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584154), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformScavenger);
                        DC(int64(0x9733703e83584154), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e83584156), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReAr_Scroll_TransformWolf);
                        DC(int64(0x9733703e83584156), EConversationDebugInfo::Done);
                        DC(int64(0x5405ad02abf79428), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x5405ad02abf79428), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb67b), EConversationDebugInfo::Executing);
                        // I must insist on a small donation for the Order of ...
                        Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162704_2772"));
                        DC(int64(0xa7deef969d1cb67b), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb677), EConversationDebugInfo::Executing);
                    // But your talents are lacking as of now. Come back ...
                    Torrez.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_162633_3677"));
                    DC(int64(0xa7deef969d1cb677), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Torrez_110785 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xdf95ad3ef3de937c);
            default Caption = LocText("TEXT_WIP_ORCBQEI_20251127_140900_2604");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceKdf405TorrezManaMan1 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x1bc3bda0e2561606);
            default Caption = LocText("TEXT_CHOICE_KDF_405_TORREZ_MANA_MAN_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7969d2e8d21f44e), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Torrez, 1);
                DC(int64(0xf7969d2e8d21f44e), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d22216f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf7969d2e8d22216f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf405TorrezManaMan5 : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x1bc3bda0e2561603);
            default Caption = LocText("TEXT_CHOICE_KDF_405_TORREZ_MANA_MAN_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf7969d2e8d21f452), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Torrez, 5);
                DC(int64(0xf7969d2e8d21f452), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d222170), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf7969d2e8d222170), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf405TorrezManaBack : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0x1bc3bda0e2561602);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd8771734a082176), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Torrez);
                DC(int64(0xdd8771734a082176), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrezBelohnung : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad5634d);
            default Caption = LocText("DIA_TORREZ_BELOHNUNG_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTorrezBelohnung);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38e3477028edfb49), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YLCTYHF_20241217_130500")));
                    DB(int64(0x2fe5c2252c5d781e), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x91d92469945fb9fc), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_MILTEN_COMESBACK_02_02")));
                    DB(int64(0x2fe5c2252c5d781f), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YLCTYHF_20241217_130500")) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_MILTEN_COMESBACK_02_02")) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad5634f), EConversationDebugInfo::Executing);
                // Corristo sent me. I delivered a letter from the outside, ...
                Hero.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_15_00"));
                DC(int64(0xc59c9bdddad5634f), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56350), EConversationDebugInfo::Executing);
                
                // A letter from the outside? Then you did us a great ...
                Torrez.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_04_01"));
                DC(int64(0xc59c9bdddad56350), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceTorrezBelohnungManamax,
                    UChoiceTorrezBelohnungScrolls,
                    UChoiceTorrezBelohnungDex,
                    UChoiceTorrezBelohnungStr
                );
            }
        }
        
        
        class UChoiceTorrezBelohnungManamax : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xe8603e87342bdc82);
            default Caption = LocText("DIA_TORREZ_BELOHNUNG_MANAMAX_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56353), EConversationDebugInfo::Executing);
                // I want the potion.
                Hero.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_MANAMAX_15_00"));
                DC(int64(0xc59c9bdddad56353), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56354), EConversationDebugInfo::Executing);
                
                // Well chosen - that was the most valuable item of all. ...
                Torrez.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_MANAMAX_04_01"));
                DC(int64(0xc59c9bdddad56354), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItFo_Potion_Mana_Perma_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f467), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItFo_Potion_Mana_Perma_01, 1);
                DC(int64(0xf7969d2e8d21f467), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrezBelohnungScrolls : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xe8603e87342bdc88);
            default Caption = LocText("DIA_TORREZ_BELOHNUNG_SCROLLS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56358), EConversationDebugInfo::Executing);
                // Give me the scrolls.
                Hero.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_SCROLLS_15_00"));
                DC(int64(0xc59c9bdddad56358), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56359), EConversationDebugInfo::Executing);
                
                // Very well. Use them wisely - each can only be cast once.
                Torrez.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_SCROLLS_04_01"));
                DC(int64(0xc59c9bdddad56359), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAr_Scroll_FireBall, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f46f), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItAr_Scroll_FireBall, 1);
                DC(int64(0xf7969d2e8d21f46f), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f473), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAr_Scroll_BallLightning, 1);
                DC(int64(0xf7969d2e8d21f473), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f475), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAr_Scroll_TransformFireLizard, 1);
                DC(int64(0xf7969d2e8d21f475), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrezBelohnungDex : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xe8603e87342bdc91);
            default Caption = LocText("DIA_TORREZ_BELOHNUNG_DEX_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56360), EConversationDebugInfo::Executing);
                // I choose the Ring of Dexterity.
                Hero.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_DEX_15_00"));
                DC(int64(0xc59c9bdddad56360), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56361), EConversationDebugInfo::Executing);
                
                // Hmm, speed often beats strength. A wise choice.
                Torrez.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_DEX_04_01"));
                DC(int64(0xc59c9bdddad56361), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAt_Ring_Skill_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f47d), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItAt_Ring_Skill_01, 1);
                DC(int64(0xf7969d2e8d21f47d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrezBelohnungStr : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xe8603e87342bdc97);
            default Caption = LocText("DIA_TORREZ_BELOHNUNG_STR_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56365), EConversationDebugInfo::Executing);
                // Give me the Ring of Strength.
                Hero.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_STR_15_00"));
                DC(int64(0xc59c9bdddad56365), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56366), EConversationDebugInfo::Executing);
                
                // Hmm, just what I expected. Here - it is yours.
                Torrez.AI.Say(LocText("DIA_TORREZ_BELOHNUNG_STR_04_01"));
                DC(int64(0xc59c9bdddad56366), EConversationDebugInfo::Done);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Torrez.AddItemToInventory(UItAt_Ring_Strong_01, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xf7969d2e8d21f485), EConversationDebugInfo::Executing);
                Torrez.AI.GiveItemTo(Hero, UItAt_Ring_Strong_01, 1);
                DC(int64(0xf7969d2e8d21f485), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTorrezBrieftausch : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad56369);
            default Caption = LocText("DIA_TORREZ_BRIEFTAUSCH_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceTorrezBrieftausch);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_MILTEN_COMESBACK_02_00"), int64(0xc59c9bdddad56369));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2fe5c2252c5d781d), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad5636b), EConversationDebugInfo::Executing);
                // I have a letter for you. But I want my reward first.
                Hero.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_15_00"));
                DC(int64(0xc59c9bdddad5636b), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5636c), EConversationDebugInfo::Executing);
                
                // Then you should speak to Milten.
                Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_01"));
                DC(int64(0xc59c9bdddad5636c), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5636d), EConversationDebugInfo::Executing);
                
                // I already have. Corristo said I'll get my reward first.
                Hero.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_15_02"));
                DC(int64(0xc59c9bdddad5636d), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5636e), EConversationDebugInfo::Executing);
                
                // ... I see. Well, I have something right here. But first, ...
                Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_03"));
                DC(int64(0xc59c9bdddad5636e), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad5636f), EConversationDebugInfo::Executing);
                
                // Here it is. 
                Hero.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_15_04"));
                DC(int64(0xc59c9bdddad5636f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_CareOfMessengers);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FIREMAGESLETTER, Document::UDocumentSegment_CH1_FIREMAGESLETTER_DeliveredTorrez);
                DB(int64(0xc59c9bdddad56371), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                DB(int64(0xc59c9bdddad56379), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                {
                    DC(int64(0xc59c9bdddad56372), EConversationDebugInfo::Executing);
                    // Thank you. Take this - it's a ring that will make you ...
                    Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_05"));
                    DC(int64(0xc59c9bdddad56372), EConversationDebugInfo::Done);
                    DC(int64(0xc59c9bdddad56373), EConversationDebugInfo::Executing);
                    // Now go.
                    Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_06"));
                    DC(int64(0xc59c9bdddad56373), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f493), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Torrez, UItWr_Scroll_Letter_01, 1);
                    DC(int64(0xf7969d2e8d21f493), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f495), EConversationDebugInfo::Executing);
                    Torrez.RemoveItemFromInventory(UItWr_Scroll_Letter_01, 1, 0);
                    DC(int64(0xf7969d2e8d21f495), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f499), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItAt_Ring_Strong_01, 1);
                    DC(int64(0xf7969d2e8d21f499), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f49b), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_FIREMAGESLETTER_COMPLETE);
                    DC(int64(0xf7969d2e8d21f49b), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0))
                {
                    DC(int64(0xc59c9bdddad5637a), EConversationDebugInfo::Executing);
                    // What's that? The seal's been broken!
                    Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_07"));
                    DC(int64(0xc59c9bdddad5637a), EConversationDebugInfo::Done);
                    DC(int64(0xc59c9bdddad5637b), EConversationDebugInfo::Executing);
                    
                    // Accidents happen.
                    Hero.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_15_08"));
                    DC(int64(0xc59c9bdddad5637b), EConversationDebugInfo::Done);
                    DC(int64(0xc59c9bdddad5637c), EConversationDebugInfo::Executing);
                    
                    // Do they? In that case, this potion is all you'll get. Be ...
                    Torrez.AI.Say(LocText("DIA_TORREZ_BRIEFTAUSCH_04_09"));
                    DC(int64(0xc59c9bdddad5637c), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f4a0), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Torrez, UItWr_Scroll_Letter_02, 1);
                    DC(int64(0xf7969d2e8d21f4a0), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f4a2), EConversationDebugInfo::Executing);
                    Torrez.RemoveItemFromInventory(UItWr_Scroll_Letter_02, 1, 0);
                    DC(int64(0xf7969d2e8d21f4a2), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f4a6), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItFo_Potion_Health_03, 1);
                    DC(int64(0xf7969d2e8d21f4a6), EConversationDebugInfo::Done);
                    DC(int64(0xf7969d2e8d21f4a8), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_OC_FIREMAGESLETTER_OPENED);
                    DC(int64(0xf7969d2e8d21f4a8), EConversationDebugInfo::Done);
                }
                DC(int64(0xf7969d2e8d21f48f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Corristo))) { Corristo.AddItemToInventory(UItWr_Scroll_Letter_02, 1); }
                DC(int64(0xf7969d2e8d21f48f), EConversationDebugInfo::Done);
                DC(int64(0x90f69e33d9b49557), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FIREMAGESLETTER.SucceedQuest();
                DC(int64(0x90f69e33d9b49557), EConversationDebugInfo::Done);
                DC(int64(0xc59c9bdddad56383), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc59c9bdddad56383), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorrezExit : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad56344);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xc59c9bdddad56346), Torrez != nullptr && !Torrez.HasItem(UItAr_Rune_FireBolt, 1, 0));
                
                if (Torrez != nullptr && !Torrez.HasItem(UItAr_Rune_FireBolt, 1, 0))
                {
                    DC(int64(0xf7969d2e8d21f4ba), EConversationDebugInfo::Executing);
                    Torrez.AddItemToInventory(UItAr_Rune_FireBolt, 1);
                    DC(int64(0xf7969d2e8d21f4ba), EConversationDebugInfo::Done);
                }
                DC(int64(0xc59c9bdddad56348), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc59c9bdddad56348), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTorrezPerm : UTopic_Hero__OC_KDF_TORREZ_405
        {
            default DebugId = int64(0xc59c9bdddad56384);
            default Caption = LocText("DIA_TORREZ_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc59c9bdddad56385), EConversationDebugInfo::Executing);
                // How are things?
                Hero.AI.Say(LocText("DIA_TORREZ_PERM_15_00"));
                DC(int64(0xc59c9bdddad56385), EConversationDebugInfo::Done);
                DB(int64(0xb0f6a0636896b27d), G1R != nullptr && G1R.HasReachedChapter(3));
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                {
                    DC(int64(0xb0f6a0636896b27f), EConversationDebugInfo::Executing);
                    // Darkness is eager to spread, but Innos' light will ...
                    Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_231349_2238"));
                    DC(int64(0xb0f6a0636896b27f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torrez_perm_exit_1");
                }
                else
                {
                    DC(int64(0xb0f6a0636896b281), EConversationDebugInfo::Executing);
                    // Innos is with us.
                    Torrez.AI.Say(LocText("TEXT_WIP_SBJDHIL_20241217_231355_1924"));
                    DC(int64(0xb0f6a0636896b281), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_torrez_perm_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */