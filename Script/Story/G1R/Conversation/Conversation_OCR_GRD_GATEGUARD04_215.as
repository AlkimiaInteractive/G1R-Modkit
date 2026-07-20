#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_GATEGUARD04_215 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD04_215";
        }
        
        
        class UTopic_Hero__OCR_GRD_GATEGUARD04_215 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_GATEGUARD04_215";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGateGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd215TorwacheExit : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0x5c571693a069d2c2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2c3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c571693a069d2c3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd215TorwacheFirst : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0x5c571693a069d2c4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::CloseRange;
            
            default Rules.HideIfKnows(UChoiceGrd215TorwacheFirst);
            default Rules.HideIfKnows(UChoiceGrd216First);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5c571693a069d2c5), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2c6), EConversationDebugInfo::Executing);
                // Where do you think you're goin'?
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_06_00"));
                DC(int64(0x5c571693a069d2c6), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2c7), EConversationDebugInfo::Executing);
                
                // In there. 
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_15_01"));
                DC(int64(0x5c571693a069d2c7), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2c8), EConversationDebugInfo::Executing);
                
                // No shit. You're not here to start trouble, are you?
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_06_02"));
                DC(int64(0x5c571693a069d2c8), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrd215TorwacheFirstTrouble,
                    UChoiceGrd215TorwacheFirstJustlooking
                );
            }
        }
        
        
        class UChoiceGrd215TorwacheFirstTrouble : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xe8603e87342be9e4);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_TROUBLE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2cb), EConversationDebugInfo::Executing);
                // I sure I am. I'm gonna burn down the whole camp.
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_TROUBLE_15_00"));
                DC(int64(0x5c571693a069d2cb), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2cc), EConversationDebugInfo::Executing);
                
                // Ahh, we got ourselves a funny one ... I HATE the funny ...
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_TROUBLE_06_01"));
                DC(int64(0x5c571693a069d2cc), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2ce), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x5c571693a069d2ce), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2cf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c571693a069d2cf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd215TorwacheFirstJustlooking : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xe8603e87342be9eb);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_JUSTLOOKING_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2d1), EConversationDebugInfo::Executing);
                // I just wanna take a look around.
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_JUSTLOOKING_15_00"));
                DC(int64(0x5c571693a069d2d1), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2d2), EConversationDebugInfo::Executing);
                
                // That's gonna cost you ten nuggs. 
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_JUSTLOOKING_06_01"));
                DC(int64(0x5c571693a069d2d2), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrd215TorwacheFirstNopay,
                    UChoiceGrd215TorwacheFirstPay,
                    UChoiceGrd215TorwacheFirstDiego,
                    UChoice66465
                );
            }
        }
        
        
        class UChoiceGrd215TorwacheFirstNopay : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xe8603e87342be9ed);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_NOPAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2d5), EConversationDebugInfo::Executing);
                // I'm not paying that.
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_NOPAY_15_00"));
                DC(int64(0x5c571693a069d2d5), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2d6), EConversationDebugInfo::Executing);
                
                // Then piss off.
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_NOPAY_06_01"));
                DC(int64(0x5c571693a069d2d6), EConversationDebugInfo::Done);
                DC(int64(0x34c88374ccaa20e7), EConversationDebugInfo::Executing);
                GateGuard.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x34c88374ccaa20e7), EConversationDebugInfo::Done);
                DC(int64(0x34c88374ccaa20e8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x34c88374ccaa20e8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd215TorwacheFirstPay : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xe8603e87342be9f1);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb2e05d74894c4349), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2da), EConversationDebugInfo::Executing);
                // Fine. Here's your ore. 
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_15_00"));
                DC(int64(0x5c571693a069d2da), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2dc), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(GateGuard, UItMi_Orenugget, 10);
                DC(int64(0x5c571693a069d2dc), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2db), EConversationDebugInfo::Executing);
                // Good lad. Go on in, then.
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_06_01"));
                DC(int64(0x5c571693a069d2db), EConversationDebugInfo::Done);
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd215TorwacheFirstDiego : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xe8603e87342be9fe);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_DIEGO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_UFXCIAC_20240902_215658"), int64(0xe8603e87342be9fe));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2e3), EConversationDebugInfo::Executing);
                // Diego told me to meet him in there. 
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_DIEGO_15_00"));
                DC(int64(0x5c571693a069d2e3), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2e4), EConversationDebugInfo::Executing);
                
                // Diego, eh? Fine. Go on in.
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_DIEGO_06_01"));
                DC(int64(0x5c571693a069d2e4), EConversationDebugInfo::Done);
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoice66465 : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0xb2e05d74894c433f);
            default Caption = LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_NOORE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb2e05d74894c4349), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2e05d74894c4340), EConversationDebugInfo::Executing);
                // I don't have that much on me.
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_NOORE_15_00"));
                DC(int64(0xb2e05d74894c4340), EConversationDebugInfo::Done);
                DC(int64(0xb2e05d74894c4342), EConversationDebugInfo::Executing);
                
                // Hm ... fine, go on in - see it as a welcome gift. But ...
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_FIRST_PAY_NOORE_06_01"));
                DC(int64(0xb2e05d74894c4342), EConversationDebugInfo::Done);
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3a621f640afed0b2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd215TorwachePerm : UTopic_Hero__OCR_GRD_GATEGUARD04_215
        {
            default DebugId = int64(0x5c571693a069d2e5);
            default Caption = LocText("DIA_GRD_215_TORWACHE_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5c571693a069d2e6), EConversationDebugInfo::Executing);
                // What's the latest?
                Hero.AI.Say(LocText("DIA_GRD_215_TORWACHE_PERM_15_00"));
                DC(int64(0x5c571693a069d2e6), EConversationDebugInfo::Done);
                DC(int64(0x5c571693a069d2e7), EConversationDebugInfo::Executing);
                
                // Nothing new. Same shit as always. 
                GateGuard.AI.Say(LocText("DIA_GRD_215_TORWACHE_PERM_06_01"));
                DC(int64(0x5c571693a069d2e7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */