#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_MERCENARY11_726 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_MERCENARY11_726";
        }
        
        
        class UTopic_Hero__NC_SLD_MERCENARY11_726 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_MERCENARY11_726";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary11() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMercenary11105101 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b33c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b33b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b33b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMercenary11105117 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b340);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMercenary11105117);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b33f), EConversationDebugInfo::Executing);
                // Hold it. No one past this point.
                Mercenary11.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_112442_2083"));
                DC(int64(0x753266f72e54b33f), EConversationDebugInfo::Done);
                DC(int64(0xfa651c556acfc553), EConversationDebugInfo::Executing);
                //  How did you even get down here? 
                Mercenary11.AI.Say(LocText("TEXT_WIP_VHPDFRJ_20240802_133925"));
                DC(int64(0xfa651c556acfc553), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Mercenary11_105274,
                    UTopic_Mercenary11_105294,
                    UTopic_Mercenary11_105411,
                    UTopic_Mercenary11_105540
                );
            }
        }
        
        
        class UTopic_Mercenary11_105274 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b353);
            default Caption = LocText("TEXT_WIP_UIXCDZL_20240801_113704_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mercenary11_105274);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b354), EConversationDebugInfo::Executing);
                // Saturas sends me.
                Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113704_3436"));
                DC(int64(0x753266f72e54b354), EConversationDebugInfo::Done);
                DC(int64(0xfa651c556acfc554), EConversationDebugInfo::Executing);
                
                // If that was true, I'd know about it. Who do you think I ...
                Mercenary11.AI.Say(LocText("TEXT_WIP_VHPDFRJ_20240802_134006"));
                DC(int64(0xfa651c556acfc554), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b356), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x753266f72e54b356), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Mercenary11_105294 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b357);
            default Caption = LocText("TEXT_WIP_UIXCDZL_20240801_113704_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mercenary11_105294);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b358), EConversationDebugInfo::Executing);
                // Look, this is important. I need the magic of the ore to-
                Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113704_686"));
                DC(int64(0x753266f72e54b358), EConversationDebugInfo::Done);
                DC(int64(0xfa651c556acfc555), EConversationDebugInfo::Executing);
                
                // You know what? I've heard just about enough. 
                Mercenary11.AI.Say(LocText("TEXT_WIP_VHPDFRJ_20240802_134044"));
                DC(int64(0xfa651c556acfc555), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0115), EConversationDebugInfo::Executing);
                // Prepare to die. 
                Mercenary11.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_152720"));
                DC(int64(0x45f83621a0ee0115), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b366), EConversationDebugInfo::Executing);
                Mercenary11.AI.StartPettyFightWeaponToDeath(Hero);
                DC(int64(0x753266f72e54b366), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b371), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b371), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Mercenary11_105411 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b35b);
            default Caption = LocText("TEXT_WIP_UIXCDZL_20240801_113748_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mercenary11_105411);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b35c), EConversationDebugInfo::Executing);
                // Move it or I'll move you. 
                Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113748_2386"));
                DC(int64(0x753266f72e54b35c), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b35f), EConversationDebugInfo::Executing);
                
                // What a stupid man. 
                Mercenary11.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113810"));
                DC(int64(0x753266f72e54b35f), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b366), EConversationDebugInfo::Executing);
                Mercenary11.AI.StartPettyFightWeaponToDeath(Hero);
                DC(int64(0x753266f72e54b366), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b371), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x753266f72e54b371), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Mercenary11_105540 : UTopic_Hero__NC_SLD_MERCENARY11_726
        {
            default DebugId = int64(0x753266f72e54b360);
            default Caption = LocText("TEXT_WIP_UIXCDZL_20240801_113827_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Mercenary11_105540);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x753266f72e54b361), EConversationDebugInfo::Executing);
                // Guards don't get paid enough these days.
                Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113827_3984"));
                DC(int64(0x753266f72e54b361), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0116), EConversationDebugInfo::Executing);
                
                // What are you saying? You think you can just buy me off ...
                Mercenary11.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_152828"));
                DC(int64(0x45f83621a0ee0116), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0117), EConversationDebugInfo::Executing);
                
                // Exactly.
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_152909"));
                DC(int64(0x45f83621a0ee0117), EConversationDebugInfo::Done);
                DC(int64(0x753266f72e54b364), EConversationDebugInfo::Executing);
                
                // YOU-
                Mercenary11.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_113844"));
                DC(int64(0x753266f72e54b364), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee0118), EConversationDebugInfo::Executing);
                // (long sigh) What's your deal? Seriously? Does it have to ...
                Mercenary11.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_153126"));
                DC(int64(0x45f83621a0ee0118), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee011a), EConversationDebugInfo::Executing);
                
                // He's our best chance of getting out of here. 
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_153755"));
                DC(int64(0x45f83621a0ee011a), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee011b), EConversationDebugInfo::Executing);
                
                // ... Fuck. Fuck, I don't know why, but I believe you. All ...
                Mercenary11.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_153827"));
                DC(int64(0x45f83621a0ee011b), EConversationDebugInfo::Done);
                DB(int64(0x753266f72e54b368), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 200, 0))
                {
                    DC(int64(0x753266f72e54b369), EConversationDebugInfo::Executing);
                    // Here. 
                    Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_114753"));
                    DC(int64(0x753266f72e54b369), EConversationDebugInfo::Done);
                    DC(int64(0xfa651c556acfc556), EConversationDebugInfo::Executing);
                    
                    // Lemme see. 
                    Mercenary11.AI.Say(LocText("TEXT_WIP_VHPDFRJ_20240802_134343"));
                    DC(int64(0xfa651c556acfc556), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b36e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Mercenary11, UItMi_Orenugget, 200);
                    DC(int64(0x753266f72e54b36e), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b36f), EConversationDebugInfo::Executing);
                    // Okay, then. Just ... don't do anything drastic, all ...
                    Mercenary11.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_114930"));
                    DC(int64(0x753266f72e54b36f), EConversationDebugInfo::Done);
                    DC(int64(0x45f83621a0ee011c), EConversationDebugInfo::Executing);
                    
                    // I'll handle it. 
                    Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_153927"));
                    DC(int64(0x45f83621a0ee011c), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b370), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x753266f72e54b370), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x753266f72e54b36b), EConversationDebugInfo::Executing);
                    // I don't have that much.
                    Hero.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_114755"));
                    DC(int64(0x753266f72e54b36b), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b36c), EConversationDebugInfo::Executing);
                    
                    // Well. You've had your chance. 
                    Mercenary11.AI.Say(LocText("TEXT_WIP_UIXCDZL_20240801_114755_3569"));
                    DC(int64(0x753266f72e54b36c), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b373), EConversationDebugInfo::Executing);
                    Mercenary11.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0x753266f72e54b373), EConversationDebugInfo::Done);
                    DC(int64(0x753266f72e54b374), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x753266f72e54b374), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */