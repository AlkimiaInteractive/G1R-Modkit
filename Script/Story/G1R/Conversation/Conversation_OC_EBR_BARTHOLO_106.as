#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_EBR_BARTHOLO_106 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_EBR_BARTHOLO_106";
        }
        
        
        class UTopic_Hero__OC_EBR_BARTHOLO_106 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_BARTHOLO_106";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBartholo() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBartholo221528 : UTopic_Hero__OC_EBR_BARTHOLO_106
        {
            default DebugId = int64(0xde3e894eb4b335ab);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceBartholo221528);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_BARTHOLO_12_02"), int64(0xde3e894eb4b335ab));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa01db6987b80625), G1R.ExploreSunkenTower != 0);
                    DB(int64(0x82ad480cbb29c230), G1R.Bartholo_Teleport_Conversation == 0);
                }
                
                if (G1R.ExploreSunkenTower == 0)
                    return false;
                
                if (G1R.Bartholo_Teleport_Conversation != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa01db6987b80628), EConversationDebugInfo::Executing);
                // Well, well, would you look at that. I had a hunch ...
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_12_01"));
                DC(int64(0xa01db6987b80628), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b80629), EConversationDebugInfo::Executing);
                // Any last words?
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_12_02"));
                DC(int64(0xa01db6987b80629), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee6015), EConversationDebugInfo::Executing);
                
                // This won't end well for you. 
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_161701"));
                DC(int64(0x45f83621a0ee6015), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee6016), EConversationDebugInfo::Executing);
                
                // We'll see about that. Get him!
                Bartholo.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_161710"));
                DC(int64(0x45f83621a0ee6016), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b8062d), EConversationDebugInfo::Executing);
                Bartholo.AI.StartAttackingImmediately(Hero);
                DC(int64(0xa01db6987b8062d), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b8062e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa01db6987b8062e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBartholo231639 : UTopic_Hero__OC_EBR_BARTHOLO_106
        {
            default DebugId = int64(0x82ad480cbb29c21b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceBartholo231639);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_BARTHOLO_12_02"), int64(0x82ad480cbb29c21b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x82ad480cbb29c22c), G1R.Bartholo_Teleport_Conversation != 0);
                    DB(int64(0x82ad480cbb29c22f), G1R.ExploreSunkenTower != 0);
                }
                
                if (G1R.Bartholo_Teleport_Conversation == 0)
                    return false;
                
                if (G1R.ExploreSunkenTower == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82ad480cbb29c21d), EConversationDebugInfo::Executing);
                // Any last words?
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_12_02"));
                DC(int64(0x82ad480cbb29c21d), EConversationDebugInfo::Done);
                DC(int64(0x82ad480cbb29c220), EConversationDebugInfo::Executing);
                
                // This won't end well for you. 
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_161701"));
                DC(int64(0x82ad480cbb29c220), EConversationDebugInfo::Done);
                DC(int64(0x82ad480cbb29c221), EConversationDebugInfo::Executing);
                
                // We'll see about that. Get him!
                Bartholo.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_161710"));
                DC(int64(0x82ad480cbb29c221), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b8062d), EConversationDebugInfo::Executing);
                Bartholo.AI.StartAttackingImmediately(Hero);
                DC(int64(0xa01db6987b8062d), EConversationDebugInfo::Done);
                DC(int64(0x82ad480cbb29c228), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x82ad480cbb29c228), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBartholoExit : UTopic_Hero__OC_EBR_BARTHOLO_106
        {
            default DebugId = int64(0xa01db6987b8060b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa01db6987b8060c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa01db6987b8060c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBartholoHallo : UTopic_Hero__OC_EBR_BARTHOLO_106
        {
            default DebugId = int64(0xa01db6987b8060d);
            default Caption = LocText("INFO_BARTHOLO_HALLO_15_00");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBartholoHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa01db6987b8060e), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("INFO_BARTHOLO_HALLO_15_00"));
                DC(int64(0xa01db6987b8060e), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b8060f), EConversationDebugInfo::Executing);
                
                // Bartholo. You'd do well to remember that name. 
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_HALLO_12_01"));
                DC(int64(0xa01db6987b8060f), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b80610), EConversationDebugInfo::Executing);
                // I manage everything around here. Trade with the other ...
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_HALLO_12_02"));
                DC(int64(0xa01db6987b80610), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b80611), EConversationDebugInfo::Executing);
                // Lately, I've been making sure our two imbecile chefs ...
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_HALLO_12_03"));
                DC(int64(0xa01db6987b80611), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b80612), EConversationDebugInfo::Executing);
                // He's quite sensitive when it comes to that, you know? He ...
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_HALLO_12_04"));
                DC(int64(0xa01db6987b80612), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_BARTHOLO, Document::UDocumentSegment_Glossary_OC_EBR_BARTHOLO_Introduction);
            }
        }
        
        
        class UChoiceBartholoKrautbote : UTopic_Hero__OC_EBR_BARTHOLO_106
        {
            default DebugId = int64(0xa01db6987b80613);
            default Caption = LocText("INFO_BARTHOLO_KRAUTBOTE_15_00");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_BARTHOLO_KRAUTBOTE_12_05"), int64(0xa01db6987b80613));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa01db6987b80614), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa01db6987b80615), EConversationDebugInfo::Executing);
                // I have some swamp herbs. From Cor Kalom, for Gomez. 
                Hero.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_15_00"));
                DC(int64(0xa01db6987b80615), EConversationDebugInfo::Done);
                DC(int64(0xa01db6987b80616), EConversationDebugInfo::Executing);
                
                // Show me.
                Bartholo.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_12_01"));
                DC(int64(0xa01db6987b80616), EConversationDebugInfo::Done);
                DB(int64(0xa01db6987b80618), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 30, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 30, 0))
                {
                    DC(int64(0xa01db6987b80619), EConversationDebugInfo::Executing);
                    // Hmm ... 
                    Bartholo.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_12_02"));
                    DC(int64(0xa01db6987b80619), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b8061a), EConversationDebugInfo::Executing);
                    // Yes, that looks all right. You came at the right time - ...
                    Bartholo.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_12_03"));
                    DC(int64(0xa01db6987b8061a), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b8061b), EConversationDebugInfo::Executing);
                    
                    // How about payment? 
                    Hero.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_15_04"));
                    DC(int64(0xa01db6987b8061b), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b8061c), EConversationDebugInfo::Executing);
                    
                    // I was getting to that. Here you go - five hundred ...
                    Bartholo.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_12_05"));
                    DC(int64(0xa01db6987b8061c), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_KRAUTBOTE, Document::UDocumentSegment_CH2_KRAUTBOTE_Bartholo);
                    DC(int64(0xa01db6987b8061d), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Bartholo, UItMi_Joint_03, 30);
                    DC(int64(0xa01db6987b8061d), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b8061f), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Orenugget, 500);
                    DC(int64(0xa01db6987b8061f), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b80620), EConversationDebugInfo::Executing);
                    G1R.Kalom_DeliveredWeed = 1;
                    DC(int64(0xa01db6987b80620), EConversationDebugInfo::Done);
                    DC(int64(0xa01db6987b80622), EConversationDebugInfo::Executing);
                    G1R.Info_Bartholo_Krautbote_permanent = 0;
                    DC(int64(0xa01db6987b80622), EConversationDebugInfo::Done);
                    DC(int64(0x3123f33416031f28), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE_KRAUBOTE_OBJ_DELIVERWEED.SucceedQuest();
                    DC(int64(0x3123f33416031f28), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bartholo_krautbote_exit_1");
                }
                else
                {
                    DC(int64(0xa01db6987b80623), EConversationDebugInfo::Executing);
                    // That's not nearly what we agreed on. I hope for your ...
                    Bartholo.AI.Say(LocText("INFO_BARTHOLO_KRAUTBOTE_NOKRAUT_12_00"));
                    DC(int64(0xa01db6987b80623), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bartholo_krautbote_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */