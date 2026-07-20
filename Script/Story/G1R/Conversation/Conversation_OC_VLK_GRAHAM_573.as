#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_GRAHAM_573 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_GRAHAM_573";
        }
        
        
        class UTopic_Hero__OC_VLK_GRAHAM_573 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_GRAHAM_573";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGraham() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGraham141860 : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0x3ccf879ff8762b20);
            default Caption = LocText("TEXT_WIP_MTDQKAE_20250116_091242");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrahamHello);
            default Rules.HideIfKnows(UChoiceGraham141860);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ccf879ff8762b31), Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION != nullptr && Quest::OldCamp_OCCHAPTER1_MAGICTRANSACTION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ccf879ff8762b1e), EConversationDebugInfo::Executing);
                // I'm looking for a blank piece of paper. 
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_091242"));
                DC(int64(0x3ccf879ff8762b1e), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b1f), EConversationDebugInfo::Executing);
                
                // Uh- And you want me to sell you one?
                Graham.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_091242_41"));
                DC(int64(0x3ccf879ff8762b1f), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b22), EConversationDebugInfo::Executing);
                
                // Could you?
                Hero.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_091448"));
                DC(int64(0x3ccf879ff8762b22), EConversationDebugInfo::Done);
                DC(int64(0x3ccf879ff8762b23), EConversationDebugInfo::Executing);
                
                // Sure. Won't be cheap, though.
                Graham.AI.Say(LocText("TEXT_WIP_MTDQKAE_20250116_091455"));
                DC(int64(0x3ccf879ff8762b23), EConversationDebugInfo::Done);
                DC(int64(0x8e7c9b8fe465bcfe), EConversationDebugInfo::Executing);
                // Paper's scarce in here and every blank I'm sellin' is a ...
                Graham.AI.Say(LocText("TEXT_WIP_DPPCYMI_20250122_144321"));
                DC(int64(0x8e7c9b8fe465bcfe), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777425), EConversationDebugInfo::Executing);
                Graham.AI.StartTradingWith(Hero);
                DC(int64(0x969d786523777425), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGraham215216 : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0xe1d0d96edfa301f3);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_184206");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrahamHello);
            default Rules.HideIfKnows(UChoiceGraham215216);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe1d0d96edfa301ef), EConversationDebugInfo::Executing);
                // You seem to know your way around out there, don't you?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184206"));
                DC(int64(0xe1d0d96edfa301ef), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301f0), EConversationDebugInfo::Executing);
                
                // Not really. There are a few good men out there who ...
                Graham.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184206_2238"));
                DC(int64(0xe1d0d96edfa301f0), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301f5), EConversationDebugInfo::Executing);
                // Cohsel did a lot of work on the maps. THAT guy really ...
                Graham.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184411"));
                DC(int64(0xe1d0d96edfa301f5), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301f6), EConversationDebugInfo::Executing);
                // You should look him up. He's near the old tower, close ...
                Graham.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184415"));
                DC(int64(0xe1d0d96edfa301f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrahamBuymaps : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0x969d786523777422);
            default Caption = LocText("DIA_GRAHAM_BUYMAPS_15_00");
            default PriorityRank = 5;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrahamHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d786523777423), EConversationDebugInfo::Executing);
                
                // I want to buy a map. 
                Hero.AI.Say(LocText("DIA_GRAHAM_BUYMAPS_15_00"));
                DC(int64(0x969d786523777423), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168b25), Graham != nullptr && Graham.IsAngryTowards(Hero));
                
                if (Graham != nullptr && Graham.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168b27), EConversationDebugInfo::Executing);
                    // Sorry, man. It's not gonna reflect well on me if I trade ...
                    Graham.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_112726_1340"));
                    DC(int64(0x7ec56dc721168b27), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231631ed0), EConversationDebugInfo::Executing);
                    // But you know what: just wait a bit until everyone's ...
                    Graham.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_144643"));
                    DC(int64(0x81b634f231631ed0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_graham_buymaps_exit_1");
                    DC(int64(0x7ec56dc721168b28), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168b28), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168b2a), EConversationDebugInfo::Executing);
                    // Sure thing. What sort? The more they show, the steeper ...
                    Graham.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_112738_3719"));
                    DC(int64(0x7ec56dc721168b2a), EConversationDebugInfo::Done);
                    DC(int64(0x969d786523777425), EConversationDebugInfo::Executing);
                    Graham.AI.StartTradingWith(Hero);
                    DC(int64(0x969d786523777425), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_graham_buymaps_exit_2");
                }
            }
        }
        
        
        class UChoiceGrahamExit : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0x969d7865237773fe);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d7865237773ff), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x969d7865237773ff), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrahamHello : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0x969d786523777400);
            default Caption = LocText("DIA_GRAHAM_HELLO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceGrahamHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d786523777402), EConversationDebugInfo::Executing);
                // Hey. I'm new here. 
                Hero.AI.Say(LocText("DIA_GRAHAM_HELLO_15_00"));
                DC(int64(0x969d786523777402), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777403), EConversationDebugInfo::Executing);
                
                // Oh, how proper of you to introduce yourself. I'm Graham, ...
                Graham.AI.Say(LocText("DIA_GRAHAM_HELLO_02_01"));
                DC(int64(0x969d786523777403), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRAHAM, Document::UDocumentSegment_Glossary_OC_VLK_GRAHAM_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRAHAM, Document::UDocumentSegment_Glossary_OC_VLK_GRAHAM_MapMaker);
            }
        }
        
        
        class UChoiceGrahamSellmap : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0x969d786523777404);
            default Caption = LocText("DIA_GRAHAM_SELLMAP_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrahamHello);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_DIEGO_MAPTOOLDMINE_INFO_11_01"), int64(0x969d786523777404));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x969d786523777405), G1R.Graham_OMMapSold == 0);
                    DB(int64(0x21bfe02ff1899753), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (G1R.Graham_OMMapSold != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d786523777407), EConversationDebugInfo::Executing);
                // Diego sends me. He says you could give me a map that ...
                Hero.AI.Say(LocText("DIA_GRAHAM_SELLMAP_15_00"));
                DC(int64(0x969d786523777407), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777408), EConversationDebugInfo::Executing);
                
                // Ah, a friend of Diego's. Sure. That'll be twenty nuggs. 
                Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_02_01"));
                DC(int64(0x969d786523777408), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrahamSellmapPay,
                    UChoiceGrahamSellmapAufsmaul,
                    UChoiceGrahamSellmapGivenotsell,
                    UChoiceGrahamSellmapBack
                );
            }
        }
        
        
        class UChoiceGrahamSellmapPay : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0xe8603e87342be4f7);
            default Caption = LocText("DIA_GRAHAM_SELLMAP_PAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d78652377740d), EConversationDebugInfo::Executing);
                // Here are the nuggets. 
                Hero.AI.Say(LocText("DIA_GRAHAM_SELLMAP_PAY_15_00"));
                DC(int64(0x969d78652377740d), EConversationDebugInfo::Done);
                DB(int64(0x969d78652377740f), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 20, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 20, 0))
                {
                    DC(int64(0x969d786523777410), EConversationDebugInfo::Executing);
                    // Cheers. Trust me, that was a right good price. 
                    Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_PAY_02_01"));
                    DC(int64(0x969d786523777410), EConversationDebugInfo::Done);
                    DC(int64(0x969d786523777411), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Graham, UItMi_Orenugget, 20);
                    DC(int64(0x969d786523777411), EConversationDebugInfo::Done);
                    DC(int64(0x969d786523777412), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItWr_Map_OldMine, 1);
                    DC(int64(0x969d786523777412), EConversationDebugInfo::Done);
                    DC(int64(0x969d786523777413), EConversationDebugInfo::Executing);
                    G1R.Graham_OMMapSold = 1;
                    DC(int64(0x969d786523777413), EConversationDebugInfo::Done);
                    DC(int64(0x5af8348209a3b368), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP.StartQuest();
                    DC(int64(0x5af8348209a3b368), EConversationDebugInfo::Done);
                    DC(int64(0x3beee4cd5da8f343), EConversationDebugInfo::Executing);
                    Graham.RemoveItemFromInventory(UItWr_Map_OldMine, 1, 0);
                    DC(int64(0x3beee4cd5da8f343), EConversationDebugInfo::Done);
                    DC(int64(0x9c15fd505ae3035f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9c15fd505ae3035f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x969d786523777414), EConversationDebugInfo::Executing);
                    // Where? Go get your nuggets first, then we'll talk. Maybe ...
                    Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_PAY_NOORE_02_00"));
                    DC(int64(0x969d786523777414), EConversationDebugInfo::Done);
                    DC(int64(0x969d786523777415), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x969d786523777415), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGrahamSellmapAufsmaul : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0xe8603e87342be504);
            default Caption = LocText("DIA_GRAHAM_SELLMAP_AUFSMAUL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrahamSellmapAufsmaul);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d786523777417), EConversationDebugInfo::Executing);
                // I'm not paying. Give me that map or I'll just take it ...
                Hero.AI.Say(LocText("DIA_GRAHAM_SELLMAP_AUFSMAUL_15_00"));
                DC(int64(0x969d786523777417), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777418), EConversationDebugInfo::Executing);
                
                // Whoa! Calm down, will you? Here - take the bloody thing ...
                Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_AUFSMAUL_02_01"));
                DC(int64(0x969d786523777418), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Graham.AddItemToInventory(UItWr_Map_OldMine, 1);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777419), EConversationDebugInfo::Executing);
                Graham.AI.GiveItemTo(Hero, UItWr_Map_OldMine, 1);
                DC(int64(0x969d786523777419), EConversationDebugInfo::Done);
                DC(int64(0x969d78652377741b), EConversationDebugInfo::Executing);
                G1R.Graham_OMMapSold = 1;
                DC(int64(0x969d78652377741b), EConversationDebugInfo::Done);
                DC(int64(0x5af8348209a3b366), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP.StartQuest();
                DC(int64(0x5af8348209a3b366), EConversationDebugInfo::Done);
                DC(int64(0x969d78652377741c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x969d78652377741c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrahamSellmapGivenotsell : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0xe8603e87342be50c);
            default Caption = LocText("DIA_GRAHAM_SELLMAP_GIVENOTSELL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceGrahamSellmapGivenotsell);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d78652377741e), EConversationDebugInfo::Executing);
                // Wait a minute. Diego said you'd GIVE me a map. Not sell ...
                Hero.AI.Say(LocText("DIA_GRAHAM_SELLMAP_GIVENOTSELL_15_00"));
                DC(int64(0x969d78652377741e), EConversationDebugInfo::Done);
                DC(int64(0x969d78652377741f), EConversationDebugInfo::Executing);
                
                // Diego can say what he likes. D'you even know how long it ...
                Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_GIVENOTSELL_02_01"));
                DC(int64(0x969d78652377741f), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777420), EConversationDebugInfo::Executing);
                // Twenty's already a special price. Normally, you'd be ...
                Graham.AI.Say(LocText("DIA_GRAHAM_SELLMAP_GIVENOTSELL_02_02"));
                DC(int64(0x969d786523777420), EConversationDebugInfo::Done);
                DC(int64(0x969d786523777421), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x969d786523777421), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrahamSellmapBack : UTopic_Hero__OC_VLK_GRAHAM_573
        {
            default DebugId = int64(0xe8603e87342be4f4);
            default Caption = LocText("DIA_GRAHAM_SELLMAP_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x969d78652377740b), EConversationDebugInfo::Executing);
                // I'll see you later.
                Hero.AI.Say(LocText("DIA_GRAHAM_SELLMAP_BACK_15_00"));
                DC(int64(0x969d78652377740b), EConversationDebugInfo::Done);
                DC(int64(0xb7d0dd58a916ab2f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb7d0dd58a916ab2f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */