#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_VLK_SNIPES_584 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_VLK_SNIPES_584";
        }
        
        
        class UTopic_Hero__OM_VLK_SNIPES_584 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_VLK_SNIPES_584";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSnipes() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetAaron() const property
            {
                return GetCharacter(n"OM_GRD_AARON_262");
            }
        }
        
        
        class UChoiceVlk584SnipesDeal : UTopic_Hero__OM_VLK_SNIPES_584
        {
            default DebugId = int64(0xbe4cbd43eb79552a);
            default Caption = LocText("VLK_584_SNIPES_DEAL_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceVlk584SnipesDeal);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbe4cbd43eb79552b), Quest::OldMine_OMCHAPTER2_SNIPESDEAL != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL.HasBeenStarted());
                }
                
                return Quest::OldMine_OMCHAPTER2_SNIPESDEAL != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbe4cbd43eb79552c), EConversationDebugInfo::Executing);
                // You look as though you're about to say something. 
                Hero.AI.Say(LocText("VLK_584_SNIPES_DEAL_INFO_15_01"));
                DC(int64(0xbe4cbd43eb79552c), EConversationDebugInfo::Done);
                DC(int64(0xbe4cbd43eb79552d), EConversationDebugInfo::Executing);
                
                // Very perceptive. I want to make you an offer.
                Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_INFO_07_02"));
                DC(int64(0xbe4cbd43eb79552d), EConversationDebugInfo::Done);
                DC(int64(0xbe4cbd43eb79552e), EConversationDebugInfo::Executing);
                // If you get Aaron to move his ass from that chest for a ...
                Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_INFO_07_03"));
                DC(int64(0xbe4cbd43eb79552e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_SNIPES, Document::UDocumentSegment_Glossary_OM_VLK_SNIPES_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_Start);
                DC(int64(0xc9bbf0de13e7d86b), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL.StartQuest();
                DC(int64(0xc9bbf0de13e7d86b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk584SnipesDeal2 : UTopic_Hero__OM_VLK_SNIPES_584
        {
            default DebugId = int64(0xbe4cbd43eb79553a);
            default Caption = LocText("TEXT_CHOICE_VLK_584_SNIPES_DEAL_2");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk584SnipesDealRun);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbe4cbd43eb79553b), Snipes != nullptr && Snipes.HasItem(UItKe_Om_02, 1, 1));
                }
                
                return Snipes != nullptr && Snipes.HasItem(UItKe_Om_02, 1, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x34cd6856310691cc), EConversationDebugInfo::Executing);
                // Give me that key. 
                Hero.AI.Say(LocText("VLK_584_SNIPES_DEAL_2_INFO_15_01"));
                DC(int64(0x34cd6856310691cc), EConversationDebugInfo::Done);
                DB(int64(0xbe4cbd43eb79553e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0))
                {
                    DC(int64(0xbe4cbd43eb795540), EConversationDebugInfo::Executing);
                    // A wise choice.
                    Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_2_INFO_07_02"));
                    DC(int64(0xbe4cbd43eb795540), EConversationDebugInfo::Done);
                    DC(int64(0xbe4cbd43eb795541), EConversationDebugInfo::Executing);
                    
                    // If you have the key, why don't you plunder it yourself?
                    Hero.AI.Say(LocText("VLK_584_SNIPES_DEAL_2_INFO_15_03"));
                    DC(int64(0xbe4cbd43eb795541), EConversationDebugInfo::Done);
                    DC(int64(0xbe4cbd43eb795542), EConversationDebugInfo::Executing);
                    
                    // Because, unlike you, I'm down here all day - and if ...
                    Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_2_INFO_07_04"));
                    DC(int64(0xbe4cbd43eb795542), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_KeyBought);
                    DC(int64(0xc9bbf0de13e7d874), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Snipes, UItMi_Orenugget, 30);
                    DC(int64(0xc9bbf0de13e7d874), EConversationDebugInfo::Done);
                    DC(int64(0xc9bbf0de13e7d876), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItKe_Om_02, 1);
                    DC(int64(0xc9bbf0de13e7d876), EConversationDebugInfo::Done);
                    DC(int64(0xc9bbf0de13e7d878), EConversationDebugInfo::Executing);
                    G1R.VLK_584_Snipes_DEAL_2_permanent = 0;
                    DC(int64(0xc9bbf0de13e7d878), EConversationDebugInfo::Done);
                    DC(int64(0x767ee3c694514d09), EConversationDebugInfo::Executing);
                    Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY.SucceedQuest();
                    DC(int64(0x767ee3c694514d09), EConversationDebugInfo::Done);
                    DC(int64(0x3beee4cd5da8f34d), EConversationDebugInfo::Executing);
                    Snipes.RemoveItemFromInventory(UItKe_Om_02, 1, 1);
                    DC(int64(0x3beee4cd5da8f34d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_vlk_584_snipes_deal_2_exit_1");
                }
                else
                {
                    DC(int64(0xbe4cbd43eb795546), EConversationDebugInfo::Executing);
                    // I said thirty, no haggling. Get me the ore, and I get ...
                    Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_2_INFO_07_05"));
                    DC(int64(0xbe4cbd43eb795546), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_vlk_584_snipes_deal_2_exit_2");
                }
            }
        }
        
        
        class UChoiceVlk584SnipesDealRun : UTopic_Hero__OM_VLK_SNIPES_584
        {
            default DebugId = int64(0xbe4cbd43eb795531);
            default Caption = LocText("VLK_584_SNIPES_DEAL_RUN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceVlk584SnipesDealRun);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbe4cbd43eb795532), Quest::OldMine_OMCHAPTER2_SNIPESDEAL != nullptr && Quest::OldMine_OMCHAPTER2_SNIPESDEAL.IsRunning());
                    DB(int64(0x40636d8cd9fb3b84), Aaron != nullptr && Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Trick));
                }
                
                if (Quest::OldMine_OMCHAPTER2_SNIPESDEAL != nullptr && !Quest::OldMine_OMCHAPTER2_SNIPESDEAL.IsRunning())
                    return false;
                
                if (Aaron != nullptr && !Aaron.HasAssignedDailyRoutine(UDailyRoutine_OM_GRD_Aaron_262_Trick))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbe4cbd43eb795533), EConversationDebugInfo::Executing);
                // Aaron's gone. You owe me ten nuggets.
                Hero.AI.Say(LocText("VLK_584_SNIPES_DEAL_RUN_INFO_15_01"));
                DC(int64(0xbe4cbd43eb795533), EConversationDebugInfo::Done);
                DB(int64(0xef70c033aff3207), Snipes != nullptr && Snipes.HasItem(UItKe_Om_02, 1, 1));
                
                if (Snipes != nullptr && Snipes.HasItem(UItKe_Om_02, 1, 1))
                {
                    DC(int64(0xef70c033aff3201), EConversationDebugInfo::Executing);
                    // And I'll honor my promise.
                    Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_RUN_INFO_07_02"));
                    DC(int64(0xef70c033aff3201), EConversationDebugInfo::Done);
                    DC(int64(0xbe4cbd43eb795535), EConversationDebugInfo::Executing);
                    // You don't happen to be interested in the key for his ...
                    Snipes.AI.Say(LocText("VLK_584_SNIPES_DEAL_RUN_INFO_07_03"));
                    DC(int64(0xbe4cbd43eb795535), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SNIPESDEAL, Document::UDocumentSegment_CH1_SNIPESDEAL_KeyOffered);
                }
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Snipes.AddItemToInventory(UItMi_Orenugget, 10);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d885), EConversationDebugInfo::Executing);
                Snipes.AI.GiveItemTo(Hero, UItMi_Orenugget, 10);
                DC(int64(0xc9bbf0de13e7d885), EConversationDebugInfo::Done);
                DC(int64(0x767ee3c694514ce9), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_ORE.SucceedQuest();
                DC(int64(0x767ee3c694514ce9), EConversationDebugInfo::Done);
                DC(int64(0x42386345169991f4), EConversationDebugInfo::Executing);
                Quest::OldMine_OMCHAPTER2_SNIPESDEAL_SNIPESDEAL_OBJ_BUYKEY.StartQuest();
                DC(int64(0x42386345169991f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVlk584SnipesExit : UTopic_Hero__OM_VLK_SNIPES_584
        {
            default DebugId = int64(0xbe4cbd43eb795526);
            default Caption = LocText("INFO_EXIT_INFO_15_001");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbe4cbd43eb795527), EConversationDebugInfo::Executing);
                // I'll be seeing you.
                Hero.AI.Say(LocText("INFO_EXIT_INFO_15_001"));
                DC(int64(0xbe4cbd43eb795527), EConversationDebugInfo::Done);
                DC(int64(0xbe4cbd43eb795528), EConversationDebugInfo::Executing);
                
                // I hope so.
                Snipes.AI.Say(LocText("INFO_EXIT_INFO_07_02"));
                DC(int64(0xbe4cbd43eb795528), EConversationDebugInfo::Done);
                DC(int64(0xbe4cbd43eb795529), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbe4cbd43eb795529), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */