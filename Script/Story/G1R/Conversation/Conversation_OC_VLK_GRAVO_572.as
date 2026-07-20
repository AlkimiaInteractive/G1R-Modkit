#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_GRAVO_572 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_GRAVO_572";
        }
        
        
        class UTopic_Hero__OC_VLK_GRAVO_572 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_GRAVO_572";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGravo() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetThorus() const property
            {
                return GetCharacter(n"OC_GRD_THORUS_200");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
        }
        
        
        class UChoiceGravoExit : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xa010b06d1b7a4c29);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa010b06d1b7a4c2a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa010b06d1b7a4c2a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGravoHallo : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xa010b06d1b7a4c2b);
            default Caption = LocText("DIA_GRAVO_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGravoHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa010b06d1b7a4c2c), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("DIA_GRAVO_HALLO_15_00"));
                DC(int64(0xa010b06d1b7a4c2c), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0de7), EConversationDebugInfo::Executing);
                
                // Who's askin'? 
                Gravo.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_154003"));
                DC(int64(0x423c311dbf8d0de7), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0de8), EConversationDebugInfo::Executing);
                
                // I'm new here. Just trying to get to know people. 
                Hero.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_154011"));
                DC(int64(0x423c311dbf8d0de8), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c2d), EConversationDebugInfo::Executing);
                
                // Ah, I get ya. This place'd make you distrust your own ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HALLO_04_01"));
                DC(int64(0xa010b06d1b7a4c2d), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c2e), EConversationDebugInfo::Executing);
                
                // How do you get by, then?
                Hero.AI.Say(LocText("DIA_GRAVO_HALLO_15_02"));
                DC(int64(0xa010b06d1b7a4c2e), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c2f), EConversationDebugInfo::Executing);
                
                // I'm helpin' folks solve their problems. 
                Gravo.AI.Say(LocText("DIA_GRAVO_HALLO_04_03"));
                DC(int64(0xa010b06d1b7a4c2f), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c30), EConversationDebugInfo::Executing);
                // If you ever find yourself in trouble with the wrong ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HALLO_04_04"));
                DC(int64(0xa010b06d1b7a4c30), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_GRAVO, Document::UDocumentSegment_Glossary_OC_VLK_GRAVO_Introduction);
            }
        }
        
        
        class UChoiceGravoHelpangrynow : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xa010b06d1b7a4c39);
            default Caption = LocText("DIA_GRAVO_HELPANGRYNOW_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGravoHelphow);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2c4f5a25f9787841), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa010b06d1b7a4c3a), EConversationDebugInfo::Executing);
                // Can you help me, then? I think I'm in trouble.
                Hero.AI.Say(LocText("DIA_GRAVO_HELPANGRYNOW_15_00"));
                DC(int64(0xa010b06d1b7a4c3a), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c3b), EConversationDebugInfo::Executing);
                
                // I think I can. But I'm warning you - it'll cost you. 
                Gravo.AI.Say(LocText("DIA_GRAVO_HELPANGRYNOW_04_01"));
                DC(int64(0xa010b06d1b7a4c3b), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGravoHelpangrynowDiego,
                    UChoiceGravoHelpangrynowThorus,
                    UChoiceGravoHelpangrynowGomez,
                    UChoiceGravoHelpangrynowBack
                );
            }
        }
        
        
        class UChoiceGravoHelpangrynowDiego : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xe8603e87342be538);
            default Caption = LocText("TEXT_CHOICE_GRAVO_HELPANGRYNOW_DIEGO");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x73f1d34e20cf3b17), Diego != nullptr && Diego.IsAngryTowards(Hero));
                DB(int64(0x73f1d34e20cf3b19), Diego != nullptr && Diego.IsEnemyTowards(Hero));
                
                if (Diego != nullptr && Diego.IsAngryTowards(Hero))
                {
                    DC(int64(0x73f1d34e20cf3b1e), EConversationDebugInfo::Executing);
                    // Right ... rubbed him the wrong way, have you?
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092006_443"));
                    DC(int64(0x73f1d34e20cf3b1e), EConversationDebugInfo::Done);
                    DC(int64(0x73f1d34e20cf3b1f), EConversationDebugInfo::Executing);
                    // I know someone who can smooth this out. That'll be a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092036"));
                    DC(int64(0x73f1d34e20cf3b1f), EConversationDebugInfo::Done);
                    DB(int64(0xb4a1c7ed8448392), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                    {
                        DC(int64(0x1ee539a0ef4f3c82), EConversationDebugInfo::Executing);
                        // Lemme see ... ah, yeah, that should do. All right, I'll ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112822_2238"));
                        DC(int64(0x1ee539a0ef4f3c82), EConversationDebugInfo::Done);
                        DC(int64(0x1ee539a0ef4f3c83), EConversationDebugInfo::Executing);
                        // Just act normal, okay? Pretend like nothing's happened. 
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112844"));
                        DC(int64(0x1ee539a0ef4f3c83), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cbf3), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 100);
                        DC(int64(0x877f3299d790cbf3), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cbf5), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Diego))) { Diego.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790cbf5), EConversationDebugInfo::Done);
                        DC(int64(0x1ee539a0ef4f3c84), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x1ee539a0ef4f3c84), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1ee539a0ef4f3c87), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0x1ee539a0ef4f3c87), EConversationDebugInfo::Done);
                        DC(int64(0x1ee539a0ef4f3c86), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0x1ee539a0ef4f3c86), EConversationDebugInfo::Done);
                        DC(int64(0x1ee539a0ef4f3c88), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x1ee539a0ef4f3c88), EConversationDebugInfo::Done);
                    }
                }
                else if (Diego != nullptr && Diego.IsEnemyTowards(Hero))
                {
                    DC(int64(0x73f1d34e20cf3b21), EConversationDebugInfo::Executing);
                    // Trouble is one way to put it. What by Beliar did you do, ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092108_1769"));
                    DC(int64(0x73f1d34e20cf3b21), EConversationDebugInfo::Done);
                    DC(int64(0x73f1d34e20cf3b22), EConversationDebugInfo::Executing);
                    // Anyways, this is gonna cost you. Five hundred, cold and ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092159"));
                    DC(int64(0x73f1d34e20cf3b22), EConversationDebugInfo::Done);
                    DB(int64(0xb4a1c7ed8448393), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0))
                    {
                        DC(int64(0xb4a1c7ed8448397), EConversationDebugInfo::Executing);
                        // Let's see if you got that much ... well, I'll be damned, ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114525_41"));
                        DC(int64(0xb4a1c7ed8448397), EConversationDebugInfo::Done);
                        DC(int64(0xb4a1c7ed8448398), EConversationDebugInfo::Executing);
                        // Just remember, don't tell anyone I pulled some strings - ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114552"));
                        DC(int64(0xb4a1c7ed8448398), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc04), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 500);
                        DC(int64(0x877f3299d790cc04), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc06), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Diego))) { Diego.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790cc06), EConversationDebugInfo::Done);
                        DC(int64(0xb4a1c7ed8448399), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xb4a1c7ed8448399), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xb4a1c7ed844839a), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0xb4a1c7ed844839a), EConversationDebugInfo::Done);
                        DC(int64(0xb4a1c7ed844839b), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0xb4a1c7ed844839b), EConversationDebugInfo::Done);
                        DC(int64(0xb4a1c7ed844839c), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xb4a1c7ed844839c), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x73f1d34e20cf3b1b), EConversationDebugInfo::Executing);
                    // Do you? I ain't heard nothin'. You're probably makin' a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_085318_2801"));
                    DC(int64(0x73f1d34e20cf3b1b), EConversationDebugInfo::Done);
                    DC(int64(0x73f1d34e20cf3b1c), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x73f1d34e20cf3b1c), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGravoHelpangrynowThorus : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xe8603e87342be53b);
            default Caption = LocText("TEXT_CHOICE_GRAVO_HELPANGRYNOW_THORUS");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xb4a1c7ed84483ad), Thorus != nullptr && Thorus.IsAngryTowards(Hero));
                DB(int64(0xb4a1c7ed84483af), Thorus != nullptr && Thorus.IsEnemyTowards(Hero));
                
                if (Thorus != nullptr && Thorus.IsAngryTowards(Hero))
                {
                    DC(int64(0xb4a1c7ed84483b3), EConversationDebugInfo::Executing);
                    // Right ... rubbed him the wrong way, have you?
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092006_443"));
                    DC(int64(0xb4a1c7ed84483b3), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483b4), EConversationDebugInfo::Executing);
                    // I know someone who can smooth this out. That'll be a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092036"));
                    DC(int64(0xb4a1c7ed84483b4), EConversationDebugInfo::Done);
                    DB(int64(0xa0f312063c38dd1), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                    {
                        DC(int64(0xa0f312063c38dd9), EConversationDebugInfo::Executing);
                        // Lemme see ... ah, yeah, that should do. All right, I'll ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112822_2238"));
                        DC(int64(0xa0f312063c38dd9), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38dda), EConversationDebugInfo::Executing);
                        // Just act normal, okay? Pretend like nothing's happened. 
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112844"));
                        DC(int64(0xa0f312063c38dda), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc1d), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 100);
                        DC(int64(0x877f3299d790cc1d), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc1f), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Thorus))) { Thorus.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790cc1f), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38dea), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38dea), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa0f312063c38ddb), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0xa0f312063c38ddb), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38ddc), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0xa0f312063c38ddc), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38ddd), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38ddd), EConversationDebugInfo::Done);
                    }
                }
                else if (Thorus != nullptr && Thorus.IsEnemyTowards(Hero))
                {
                    DC(int64(0xb4a1c7ed84483b6), EConversationDebugInfo::Executing);
                    // Trouble is one way to put it. What by Beliar did you do, ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092108_1769"));
                    DC(int64(0xb4a1c7ed84483b6), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483b7), EConversationDebugInfo::Executing);
                    // Anyways, this is gonna cost you. Five hundred, cold and ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092159"));
                    DC(int64(0xb4a1c7ed84483b7), EConversationDebugInfo::Done);
                    DB(int64(0xa0f312063c38dd7), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0))
                    {
                        DC(int64(0xa0f312063c38dfd), EConversationDebugInfo::Executing);
                        // Let's see if you got that much ... well, I'll be damned, ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114525_41"));
                        DC(int64(0xa0f312063c38dfd), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38dfe), EConversationDebugInfo::Executing);
                        // Just remember, don't tell anyone I pulled some strings - ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114552"));
                        DC(int64(0xa0f312063c38dfe), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc2e), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 500);
                        DC(int64(0x877f3299d790cc2e), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc30), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Thorus))) { Thorus.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790cc30), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38deb), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38deb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa0f312063c38dff), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0xa0f312063c38dff), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38e00), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0xa0f312063c38e00), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38e01), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38e01), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xb4a1c7ed84483b9), EConversationDebugInfo::Executing);
                    // Do you? I ain't heard nothin'. You're probably makin' a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_085318_2801"));
                    DC(int64(0xb4a1c7ed84483b9), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483ba), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb4a1c7ed84483ba), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGravoHelpangrynowGomez : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xe8603e87342be53e);
            default Caption = LocText("TEXT_CHOICE_GRAVO_HELPANGRYNOW_GOMEZ");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xb4a1c7ed84483bc), Gomez != nullptr && Gomez.IsAngryTowards(Hero));
                DB(int64(0xb4a1c7ed84483be), Gomez != nullptr && Gomez.IsEnemyTowards(Hero));
                
                if (Gomez != nullptr && Gomez.IsAngryTowards(Hero))
                {
                    DC(int64(0xb4a1c7ed84483c0), EConversationDebugInfo::Executing);
                    // Right ... rubbed him the wrong way, have you?
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092006_443"));
                    DC(int64(0xb4a1c7ed84483c0), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483c1), EConversationDebugInfo::Executing);
                    // I know someone who can smooth this out. That'll be a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092036"));
                    DC(int64(0xb4a1c7ed84483c1), EConversationDebugInfo::Done);
                    DB(int64(0xa0f312063c38dd3), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                    {
                        DC(int64(0xe6c7a4d8c8f91be2), EConversationDebugInfo::Executing);
                        // Lemme see ... ah, yeah, that should do. All right, I'll ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112822_2238"));
                        DC(int64(0xe6c7a4d8c8f91be2), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38de3), EConversationDebugInfo::Executing);
                        // Just act normal, okay? Pretend like nothing's happened. 
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112844"));
                        DC(int64(0xa0f312063c38de3), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc47), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 100);
                        DC(int64(0x877f3299d790cc47), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790cc49), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Gomez))) { Gomez.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790cc49), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38df4), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38df4), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa0f312063c38dde), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0xa0f312063c38dde), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38ddf), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0xa0f312063c38ddf), EConversationDebugInfo::Done);
                        DC(int64(0xa0f312063c38de0), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa0f312063c38de0), EConversationDebugInfo::Done);
                    }
                }
                else if (Gomez != nullptr && Gomez.IsEnemyTowards(Hero))
                {
                    DC(int64(0xb4a1c7ed84483c3), EConversationDebugInfo::Executing);
                    // Trouble is one way to put it. What by Beliar did you do, ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092108_1769"));
                    DC(int64(0xb4a1c7ed84483c3), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483c4), EConversationDebugInfo::Executing);
                    // Anyways, this is gonna cost you. Five hundred, cold and ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_092159"));
                    DC(int64(0xb4a1c7ed84483c4), EConversationDebugInfo::Done);
                    DB(int64(0xa0f312063c38dd5), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 500, 0))
                    {
                        DC(int64(0xe6c7a4d8c8f91be4), EConversationDebugInfo::Executing);
                        // Let's see if you got that much ... well, I'll be damned, ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114525_41"));
                        DC(int64(0xe6c7a4d8c8f91be4), EConversationDebugInfo::Done);
                        DC(int64(0xe6c7a4d8c8f91be5), EConversationDebugInfo::Executing);
                        // Just remember, don't tell anyone I pulled some strings - ...
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231127_114552"));
                        DC(int64(0xe6c7a4d8c8f91be5), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790eeb5), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Gravo, UItMi_Orenugget, 500);
                        DC(int64(0x877f3299d790eeb5), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790eeb7), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Gomez))) { Gomez.SetRelationshipTowards(Hero, ERelationship::Neutral); }
                        DC(int64(0x877f3299d790eeb7), EConversationDebugInfo::Done);
                        DC(int64(0x877f3299d790eeb8), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x877f3299d790eeb8), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xc61d2756805fba24), EConversationDebugInfo::Executing);
                        // I don't have that much ore. 
                        Hero.AI.Say(LocText("TEXT_GROMEU_20231123_113029"));
                        DC(int64(0xc61d2756805fba24), EConversationDebugInfo::Done);
                        DC(int64(0xc61d2756805fba25), EConversationDebugInfo::Executing);
                        
                        // Then there's nothin' I can do. Sorry, lad.
                        Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_112922_1924"));
                        DC(int64(0xc61d2756805fba25), EConversationDebugInfo::Done);
                        DC(int64(0xc61d2756805fba26), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xc61d2756805fba26), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xb4a1c7ed84483c6), EConversationDebugInfo::Executing);
                    // Do you? I ain't heard nothin'. You're probably makin' a ...
                    Gravo.AI.Say(LocText("TEXT_GROMEU_20231123_085318_2801"));
                    DC(int64(0xb4a1c7ed84483c6), EConversationDebugInfo::Done);
                    DC(int64(0xb4a1c7ed84483c7), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb4a1c7ed84483c7), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGravoHelpangrynowBack : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xb8d5d0d8e7d55c1d);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceGravoHelphow : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xa010b06d1b7a4c31);
            default Caption = LocText("DIA_GRAVO_HELPHOW_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGravoHallo);
            default Rules.HideIfKnows(UChoiceGravoHelphow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa010b06d1b7a4c33), EConversationDebugInfo::Executing);
                // How can you set things straight? 
                Hero.AI.Say(LocText("DIA_GRAVO_HELPHOW_15_00"));
                DC(int64(0xa010b06d1b7a4c33), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c34), EConversationDebugInfo::Executing);
                
                // All right, let's say you've gotten yourself into trouble ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HELPHOW_04_01"));
                DC(int64(0xa010b06d1b7a4c34), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c35), EConversationDebugInfo::Executing);
                // Thorus is stubborn as a mule and if you fall outta favor ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HELPHOW_04_02"));
                DC(int64(0xa010b06d1b7a4c35), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c36), EConversationDebugInfo::Executing);
                // Lucky for you, there's me, Gravo, and I know everyone - ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HELPHOW_04_03"));
                DC(int64(0xa010b06d1b7a4c36), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c37), EConversationDebugInfo::Executing);
                // I tell 'em you're a fine lad, they pass it on to Thorus, ...
                Gravo.AI.Say(LocText("DIA_GRAVO_HELPHOW_04_04"));
                DC(int64(0xa010b06d1b7a4c37), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0de9), EConversationDebugInfo::Executing);
                
                // Just like that?
                Hero.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_154839"));
                DC(int64(0x423c311dbf8d0de9), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0dea), EConversationDebugInfo::Executing);
                
                // Well, these folks'll be wantin' to see some ore for ...
                Gravo.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_154842"));
                DC(int64(0x423c311dbf8d0dea), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGravoInfluence : UTopic_Hero__OC_VLK_GRAVO_572
        {
            default DebugId = int64(0xa010b06d1b7a4c43);
            default Caption = LocText("DIA_GRAVO_INFLUENCE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGravoHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa010b06d1b7a4c45), EConversationDebugInfo::Executing);
                
                // Can you point me to the key players here in the camp? ...
                Hero.AI.Say(LocText("DIA_GRAVO_INFLUENCE_15_00"));
                DC(int64(0xa010b06d1b7a4c45), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c46), EConversationDebugInfo::Executing);
                
                // Ahh ... lookin' to score a few points, are you?
                Gravo.AI.Say(LocText("DIA_GRAVO_INFLUENCE_04_01"));
                DC(int64(0xa010b06d1b7a4c46), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c47), EConversationDebugInfo::Executing);
                // Well, Diego's the top dog, but you know that already. ...
                Gravo.AI.Say(LocText("DIA_GRAVO_INFLUENCE_04_02"));
                DC(int64(0xa010b06d1b7a4c47), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c48), EConversationDebugInfo::Executing);
                // Then there's Dexter and Fisk, our fences - they sell ...
                Gravo.AI.Say(LocText("DIA_GRAVO_INFLUENCE_04_03"));
                DC(int64(0xa010b06d1b7a4c48), EConversationDebugInfo::Done);
                DC(int64(0xa010b06d1b7a4c49), EConversationDebugInfo::Executing);
                // Last but not least, we got Scatty - runs the arena and ...
                Gravo.AI.Say(LocText("DIA_GRAVO_INFLUENCE_04_04"));
                DC(int64(0xa010b06d1b7a4c49), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */