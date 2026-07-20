#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ULMAR_881N : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ULMAR_881N";
        }
        
        
        class UTopic_Hero__NC_ORG_ULMAR_881N : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ULMAR_881N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUlmar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetLefty() const property
            {
                return GetCharacter(n"NC_ORG_LEFTY_844");
            }
        }
        
        
        class UChoiceUlmar81075 : UTopic_Hero__NC_ORG_ULMAR_881N
        {
            default DebugId = int64(0xb65e3afb30380fe3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb65e3afb30380fe2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb65e3afb30380fe2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUlmar81091 : UTopic_Hero__NC_ORG_ULMAR_881N
        {
            default DebugId = int64(0xb65e3afb30380fe7);
            default Caption = LocText("TEXT_WIP_RJSKLDM_20240213_133215_41");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VFHDBGC_20240301_172731"), int64(0xb65e3afb30380fe7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb65e3afb30380ffe), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.IsRunning());
                    DB(int64(0xb65e3afb30380fff), G1R.Ricelord_AskedForWater != 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.IsRunning())
                    return false;
                
                if (G1R.Ricelord_AskedForWater == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb65e3afb30380fe5), EConversationDebugInfo::Executing);
                // You gonna give me that water or not?
                Hero.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_133215_41"));
                DC(int64(0xb65e3afb30380fe5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ULMAR, Document::UDocumentSegment_Glossary_NC_ORG_ULMAR_Introduction);
                DB(int64(0xb65e3afb30380fea), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                DB(int64(0xb65e3afb30380feb), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsYesterday());
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday())
                {
                    DC(int64(0xb65e3afb30380fec), EConversationDebugInfo::Executing);
                    // Sure, here. There ain't enough for the whole of 'em ...
                    Ulmar.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_134447"));
                    DC(int64(0xb65e3afb30380fec), EConversationDebugInfo::Done);
                    DC(int64(0x6cb95be92da295e8), EConversationDebugInfo::Executing);
                    
                    // Got it. 
                    Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_173222"));
                    DC(int64(0x6cb95be92da295e8), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_WaterGiven);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                    Ulmar.AddItemToInventory(UItFo_Potion_Water_01, 10);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                    DC(int64(0xb65e3afb30380ff9), EConversationDebugInfo::Executing);
                    Ulmar.AI.GiveItemTo(Hero, UItFo_Potion_Water_01, 10);
                    DC(int64(0xb65e3afb30380ff9), EConversationDebugInfo::Done);
                    DC(int64(0xb65e3afb30380ffb), EConversationDebugInfo::Executing);
                    G1R.Ricelord_AskedForWater = 0;
                    DC(int64(0xb65e3afb30380ffb), EConversationDebugInfo::Done);
                    DC(int64(0xaab0a550d57550f4), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.SucceedQuest();
                    DC(int64(0xaab0a550d57550f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_ulmar_81091_exit_1");
                    DC(int64(0xb65e3afb30380ff7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65e3afb30380ff7), EConversationDebugInfo::Done);
                    return;
                }
                else if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsYesterday())
                {
                    DC(int64(0xb65e3afb30380fee), EConversationDebugInfo::Executing);
                    // Afraid not, mate - you ain't showed up, so we had ...
                    Ulmar.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_134453"));
                    DC(int64(0xb65e3afb30380fee), EConversationDebugInfo::Done);
                    DC(int64(0x6cb95be92da295eb), EConversationDebugInfo::Executing);
                    
                    // Can't I do it today?
                    Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_173703"));
                    DC(int64(0x6cb95be92da295eb), EConversationDebugInfo::Done);
                    DC(int64(0x6cb95be92da295ec), EConversationDebugInfo::Executing);
                    
                    // No. Get lost.
                    Ulmar.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_173740"));
                    DC(int64(0x6cb95be92da295ec), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_ulmar_81091_exit_2");
                    DC(int64(0xb65e3afb30380ff4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65e3afb30380ff4), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xb65e3afb30380ff0), EConversationDebugInfo::Executing);
                    // Nah, mate, we needed someone days ago. Get lost. 
                    Ulmar.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_134502"));
                    DC(int64(0xb65e3afb30380ff0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_ulmar_81091_exit_3");
                    DC(int64(0xb65e3afb30380ff3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65e3afb30380ff3), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceUlmar81201 : UTopic_Hero__NC_ORG_ULMAR_881N
        {
            default DebugId = int64(0xb65e3afb30381002);
            default Caption = LocText("TEXT_WIP_RJSKLDM_20240213_143431");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VFHDBGC_20240301_174650"), int64(0xb65e3afb30381002));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb65e3afb3038100e), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb65e3afb30381004), EConversationDebugInfo::Executing);
                // What's your job around here?
                Hero.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_143431"));
                DC(int64(0xb65e3afb30381004), EConversationDebugInfo::Done);
                DC(int64(0xb65e3afb30381005), EConversationDebugInfo::Executing);
                
                // Guess.
                Ulmar.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_143441"));
                DC(int64(0xb65e3afb30381005), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295ed), EConversationDebugInfo::Executing);
                
                // You work for the Rice Lord.
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_174010"));
                DC(int64(0x6cb95be92da295ed), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295ee), EConversationDebugInfo::Executing);
                
                // Exactly.
                Ulmar.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_174118"));
                DC(int64(0x6cb95be92da295ee), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ULMAR, Document::UDocumentSegment_Glossary_NC_ORG_ULMAR_Introduction);
                DB(int64(0xb65e3afb30381007), Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead());
                
                if (Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0xb65e3afb30381009), EConversationDebugInfo::Executing);
                    // Talk to Lefty if you wanna make yourself useful.
                    Ulmar.AI.Say(LocText("TEXT_WIP_RJSKLDM_20240213_151255_2386"));
                    DC(int64(0xb65e3afb30381009), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_ulmar_81201_exit_1");
                    DC(int64(0xb65e3afb3038100b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65e3afb3038100b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_ulmar_81201_exit_2");
                    DC(int64(0xb65e3afb3038100a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65e3afb3038100a), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceUlmar81815 : UTopic_Hero__NC_ORG_ULMAR_881N
        {
            default DebugId = int64(0x653d12cc4be39627);
            default Caption = LocText("TEXT_WIP_BKSKLDM_20240219_111020");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceUlmar81815);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x653d12cc4be3962a), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning());
                    DB(int64(0x653d12cc4be3962b), G1R.Ricelord_AskedForWater != 0);
                    DB(int64(0x653d12cc4be3962c), Lefty != nullptr && !Lefty.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning())
                    return false;
                
                if (G1R.Ricelord_AskedForWater == 0)
                    return false;
                
                if (Lefty != nullptr && Lefty.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x653d12cc4be39625), EConversationDebugInfo::Executing);
                // Lefty sent me. I'm here to-
                Hero.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_111020"));
                DC(int64(0x653d12cc4be39625), EConversationDebugInfo::Done);
                DC(int64(0x653d12cc4be39626), EConversationDebugInfo::Executing);
                
                // Help him with the water?
                Ulmar.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_111020_2801"));
                DC(int64(0x653d12cc4be39626), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295e6), EConversationDebugInfo::Executing);
                
                // How did you know?
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_172703"));
                DC(int64(0x6cb95be92da295e6), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295e7), EConversationDebugInfo::Executing);
                
                // Ah, well. Let's just say you ain't the first. 
                Ulmar.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_172731"));
                DC(int64(0x6cb95be92da295e7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_ULMAR, Document::UDocumentSegment_Glossary_NC_ORG_ULMAR_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */