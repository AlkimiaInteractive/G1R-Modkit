#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_RUFUS_903 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_RUFUS_903";
        }
        
        
        class UTopic_Hero__NC_BAU_RUFUS_903 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_RUFUS_903";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRufus() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceRufus79090 : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0xc937a22c9f012081);
            default Caption = LocText("TEXT_DDIAZ_20240206_144937");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRufusHello);
            default Rules.HideIfKnows(UChoiceRufus79090);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a1f), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc937a22c9f01207f), EConversationDebugInfo::Executing);
                // Have you seen Bran? 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_144937"));
                DC(int64(0xc937a22c9f01207f), EConversationDebugInfo::Done);
                DC(int64(0xc937a22c9f012080), EConversationDebugInfo::Executing);
                
                // Huh? No. And if you're working for the Rice Lord, please ...
                Rufus.AI.Say(LocText("TEXT_DDIAZ_20240206_144937_2238"));
                DC(int64(0xc937a22c9f012080), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRufusExit : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0x845b44a6a1c5bc51);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x845b44a6a1c5bc52), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x845b44a6a1c5bc52), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRufusHello : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0x845b44a6a1c5bc64);
            default Caption = LocText("DIA_RUFUS_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRufusHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x845b44a6a1c5bc65), EConversationDebugInfo::Executing);
                // Hey - I'm new here. What's the latest?
                Hero.AI.Say(LocText("DIA_RUFUS_HELLO_15_00"));
                DC(int64(0x845b44a6a1c5bc65), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc66), EConversationDebugInfo::Executing);
                
                // Ahh, and just how in Beliar's name would I know? All I ...
                Rufus.AI.Say(LocText("DIA_RUFUS_HELLO_02_01"));
                DC(int64(0x845b44a6a1c5bc66), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc67), EConversationDebugInfo::Executing);
                // You got no idea how much I'd love to go tell the Rice ...
                Rufus.AI.Say(LocText("DIA_RUFUS_HELLO_02_02"));
                DC(int64(0x845b44a6a1c5bc67), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RUFUS, Document::UDocumentSegment_Glossary_NC_BAU_RUFUS_Introduction);
            }
        }
        
        
        class UChoiceRufusRicelord : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0x845b44a6a1c5bc72);
            default Caption = LocText("DIA_RUFUS_RICELORD_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRufusWhy);
            default Rules.HideIfKnows(UChoiceRufusRicelord);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_VFHDBGC_20240301_174650"), int64(0x845b44a6a1c5bc72));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x845b44a6a1c5bc73), EConversationDebugInfo::Executing);
                // Who's the Rice Lord?
                Hero.AI.Say(LocText("DIA_RUFUS_RICELORD_15_00"));
                DC(int64(0x845b44a6a1c5bc73), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc74), EConversationDebugInfo::Executing);
                
                // Don't know him yet? Lucky you. He was one of the guys ...
                Rufus.AI.Say(LocText("DIA_RUFUS_RICELORD_02_01"));
                DC(int64(0x845b44a6a1c5bc74), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc75), EConversationDebugInfo::Executing);
                // These days, all he does is stand in his fortress and ...
                Rufus.AI.Say(LocText("DIA_RUFUS_RICELORD_02_02"));
                DC(int64(0x845b44a6a1c5bc75), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRufusWasser : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0x845b44a6a1c5bc53);
            default Caption = LocText("INFO_RUFUS_WASSER_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe9d2afc3c1b4560d), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223c), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0xa086f46286fe223d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0x3fa7e33579bb6a80), Rufus != nullptr && !Rufus.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0xe9d2afc3c1b4560e), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223b), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0x3fa7e33579bb6a81), Rufus != nullptr && !Rufus.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Rufus != nullptr && !Rufus.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Rufus != nullptr && !Rufus.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x845b44a6a1c5bc55), EConversationDebugInfo::Executing);
                
                // Lefty sent me. I've got water for you.
                Hero.AI.Say(LocText("INFO_RUFUS_WASSER_15_00"));
                DC(int64(0x845b44a6a1c5bc55), EConversationDebugInfo::Done);
                DB(int64(0x845b44a6a1c5bc57), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0x845b44a6a1c5bc58), EConversationDebugInfo::Executing);
                    // Ah, thanks, mate ... I'm bloody parched. 
                    Rufus.AI.Say(LocText("INFO_RUFUS_WASSER_02_01"));
                    DC(int64(0x845b44a6a1c5bc58), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6d22c), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Rufus, UItFo_Potion_Water_01, 1);
                    DC(int64(0x61a39c21bde6d22c), EConversationDebugInfo::Done);
                    DB(int64(0x845b44a6a1c5bc5b), Rufus != nullptr && Rufus.IsSitting());
                    
                    if (Rufus != nullptr && Rufus.IsSitting())
                    {
                        DC(int64(0x123f53d08c63c5ca), EConversationDebugInfo::Executing);
                        Rufus.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c5ca), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x123f53d08c63c5d6), EConversationDebugInfo::Executing);
                        Rufus.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c5d6), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                    G1R.Peasants_have_water += 1;
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                    Rufus.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                    Rufus.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                    DB(int64(0x845b44a6a1c5bc61), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                    
                    if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                    {
                        DC(int64(0x61a39c21bde6d21c), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                        DC(int64(0x61a39c21bde6d21c), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_rufus_wasser_exit_1");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_rufus_wasser_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x845b44a6a1c5bc63), EConversationDebugInfo::Executing);
                    // Ah, you're a lifes-
                    Rufus.AI.Say(LocText("INFO_RUFUS_WASSER_NOWATER_02_00"));
                    DC(int64(0x845b44a6a1c5bc63), EConversationDebugInfo::Done);
                    DC(int64(0xdb8408dae1cc14ff), EConversationDebugInfo::Executing);
                    // Wait, you ain't got none! Oh, don't tell me they've ...
                    Rufus.AI.Say(LocText("TEXT_WIP_IETOSNL_20240327_163847"));
                    DC(int64(0xdb8408dae1cc14ff), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rufus_wasser_exit_3");
                }
            }
        }
        
        
        class UChoiceRufusWhy : UTopic_Hero__NC_BAU_RUFUS_903
        {
            default DebugId = int64(0x845b44a6a1c5bc68);
            default Caption = LocText("DIA_RUFUS_WHY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRufusHello);
            default Rules.HideIfKnows(UChoiceRufusWhy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x845b44a6a1c5bc69), EConversationDebugInfo::Executing);
                // If you hate this job so much, why do you work here?
                Hero.AI.Say(LocText("DIA_RUFUS_WHY_15_00"));
                DC(int64(0x845b44a6a1c5bc69), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6a), EConversationDebugInfo::Executing);
                
                // Ahh, Lefty, that's why. He's one of the Rice Lord's ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_01"));
                DC(int64(0x845b44a6a1c5bc6a), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6b), EConversationDebugInfo::Executing);
                // "Sure," I say. I mean, I'm new, and I wanna make ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_02"));
                DC(int64(0x845b44a6a1c5bc6b), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6c), EConversationDebugInfo::Executing);
                // Well, guess what: next day I'm in me bunk tryin' to get ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_03"));
                DC(int64(0x845b44a6a1c5bc6c), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6d), EConversationDebugInfo::Executing);
                // "You ain't gonna let your mates down, are you?" he says. 
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_04"));
                DC(int64(0x845b44a6a1c5bc6d), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6e), EConversationDebugInfo::Executing);
                // I tell him I'm knackered from the day before and that I ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_05"));
                DC(int64(0x845b44a6a1c5bc6e), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc6f), EConversationDebugInfo::Executing);
                // Just grabs me by the collar and drags me back to the ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_06"));
                DC(int64(0x845b44a6a1c5bc6f), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc70), EConversationDebugInfo::Executing);
                // He did the same the next day, and the day after that, ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_07"));
                DC(int64(0x845b44a6a1c5bc70), EConversationDebugInfo::Done);
                DC(int64(0x845b44a6a1c5bc71), EConversationDebugInfo::Executing);
                // Anyway, bottom line is: the Rice Lord and his boys are a ...
                Rufus.AI.Say(LocText("DIA_RUFUS_WHY_02_08"));
                DC(int64(0x845b44a6a1c5bc71), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LEFTY, Document::UDocumentSegment_Glossary_NC_ORG_LEFTY_BullyAdvice);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */