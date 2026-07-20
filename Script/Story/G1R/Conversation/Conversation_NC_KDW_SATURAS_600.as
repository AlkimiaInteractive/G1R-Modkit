#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_SATURAS_600 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_SATURAS_600";
        }
        
        
        class UTopic_Hero__NC_KDW_SATURAS_600 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_SATURAS_600";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSaturas() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGOLEM_STONE_BRIDGE() const property
            {
                return GetCharacter(n"GOLEM_STONE_BRIDGE");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetHomer() const property
            {
                return GetCharacter(n"NC_BAU_HOMER_935");
            }
            
            AGothicCharacterState GetRogue04() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE04_807");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetLee() const property
            {
                return GetCharacter(n"NC_SLD_LEE_700");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY09_723() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY09_723");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY15_732() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY15_732");
            }
            
            AGothicCharacterState GetArto() const property
            {
                return GetCharacter(n"OC_EBR_ARTO_102");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetRaven() const property
            {
                return GetCharacter(n"OC_EBR_RAVEN_105");
            }
            
            AGothicCharacterState GetScar() const property
            {
                return GetCharacter(n"OC_EBR_SCAR_101");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD08_223() const property
            {
                return GetCharacter(n"OC_GRD_GUARD08_223");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetSyra() const property
            {
                return GetCharacter(n"OC_WOC_SYRA_109");
            }
            
            AGothicCharacterState GetVelaya() const property
            {
                return GetCharacter(n"OC_WOC_VELAYA_108");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetTC_TROLLADULT_01() const property
            {
                return GetCharacter(n"TC_TROLLADULT_01");
            }
        }
        
        
        class UTopic_NC_SLD_LEE_700__NC_KDW_SATURAS_600 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_SATURAS_600";
            default WithCharacter = n"NC_SLD_LEE_700";
            
            AGothicCharacterState GetSaturas() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGOLEM_STONE_BRIDGE() const property
            {
                return GetCharacter(n"GOLEM_STONE_BRIDGE");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetHomer() const property
            {
                return GetCharacter(n"NC_BAU_HOMER_935");
            }
            
            AGothicCharacterState GetRogue04() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE04_807");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetLee() const property
            {
                return GetCharacter(n"NC_SLD_LEE_700");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY09_723() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY09_723");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY15_732() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY15_732");
            }
            
            AGothicCharacterState GetArto() const property
            {
                return GetCharacter(n"OC_EBR_ARTO_102");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetRaven() const property
            {
                return GetCharacter(n"OC_EBR_RAVEN_105");
            }
            
            AGothicCharacterState GetScar() const property
            {
                return GetCharacter(n"OC_EBR_SCAR_101");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD08_223() const property
            {
                return GetCharacter(n"OC_GRD_GUARD08_223");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetSyra() const property
            {
                return GetCharacter(n"OC_WOC_SYRA_109");
            }
            
            AGothicCharacterState GetVelaya() const property
            {
                return GetCharacter(n"OC_WOC_VELAYA_108");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetTC_TROLLADULT_01() const property
            {
                return GetCharacter(n"TC_TROLLADULT_01");
            }
        }
        
        
        class UChoiceKdw600SaturasGotolee : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2083);
            default Caption = LocText("KDW_600_SATURAS_GOTOLEE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasNomoreoc);
            default Rules.HideIfKnows(UChoiceKdw600SaturasGotolee);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2084), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x8840daf1ff7c2085), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2086), EConversationDebugInfo::Executing);
                // So I'm a mercenary now?
                Hero.AI.Say(LocText("KDW_600_SATURAS_GOTOLEE_INFO_15_01"));
                DC(int64(0x8840daf1ff7c2086), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2087), EConversationDebugInfo::Executing);
                
                // You will once you talk to Lee. Explain the situation, ...
                Saturas.AI.Say(LocText("KDW_600_SATURAS_GOTOLEE_INFO_14_02"));
                DC(int64(0x8840daf1ff7c2087), EConversationDebugInfo::Done);
                DC(int64(0x26601998927be43a), EConversationDebugInfo::Executing);
                // We have something to discuss. 
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192938"));
                DC(int64(0x26601998927be43a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BANNEDFROMOC, Document::UDocumentSegment_CH4_BANNEDFROMOC_Lee);
                DC(int64(0x6c528962981e99ac), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE.StartQuest();
                DC(int64(0x6c528962981e99ac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw600SaturasHeavyarmor : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20f3);
            default Caption = LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_15_01");
            default PriorityRank = 4;
            default PropertyTags.AddTag(GameplayTag::Conversation_BuyItem_Kdw_Armor_H);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_04"), int64(0x8840daf1ff7c20f3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20f4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xb965a65bdefa8eb5), G1R != nullptr && !G1R.IsInChapter(6));
                    DB(int64(0x65ffc29e5365245a), G1R.KDW_600_Saturas_HEAVYARMOR_permanent == 0);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (G1R != nullptr && G1R.IsInChapter(6))
                    return false;
                
                if (G1R.KDW_600_Saturas_HEAVYARMOR_permanent != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20f5), EConversationDebugInfo::Executing);
                // Can I get a robe like the one you're wearing?
                Hero.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20f5), EConversationDebugInfo::Done);
                DB(int64(0x3100064b10913c90), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                {
                    DB(int64(0x3100064b10913dc8), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5));
                    
                    if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5))
                    {
                        DC(int64(0x65ffc29e53652443), EConversationDebugInfo::Executing);
                        // You can - but it is too early still. These are the robes ...
                        Saturas.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_02"));
                        DC(int64(0x65ffc29e53652443), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_kdw_600_saturas_heavyarmor_exit_1");
                    }
                    else
                    {
                        DB(int64(0x8840daf1ff7c20fa), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDW_ARMOR_H, 0));
                        
                        if (Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDW_ARMOR_H, 0))
                        {
                            DC(int64(0x8840daf1ff7c20fb), EConversationDebugInfo::Executing);
                            // Hmm ... yes, you're ready to wear it. For a price. Come ...
                            Saturas.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_03"));
                            DC(int64(0x8840daf1ff7c20fb), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_kdw_600_saturas_heavyarmor_exit_2");
                        }
                        else
                        {
                            DB(int64(0x8840daf1ff7c20fa), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDW_ARMOR_H, 0));
                            
                            if (Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDW_ARMOR_H, 0))
                            {
                                DC(int64(0x8840daf1ff7c20fb), EConversationDebugInfo::Executing);
                                // Hmm ... yes, you're ready to wear it. For a price. Come ...
                                Saturas.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_03"));
                                DC(int64(0x8840daf1ff7c20fb), EConversationDebugInfo::Done);
                                
                                Other.Remember(n"choice_kdw_600_saturas_heavyarmor_exit_3");
                            }
                            else
                            {
                                DC(int64(0x8840daf1ff7c20fc), EConversationDebugInfo::Executing);
                                // Hmm ... very well, you've proven yourself worthy. Here - ...
                                Saturas.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_04"));
                                DC(int64(0x8840daf1ff7c20fc), EConversationDebugInfo::Done);
                                DC(int64(0x64682365a32f9c4e), EConversationDebugInfo::Executing);
                                G1R.KDW_600_Saturas_HEAVYARMOR_permanent = 1;
                                DC(int64(0x64682365a32f9c4e), EConversationDebugInfo::Done);
                                DC(int64(0x64682365a32f9c50), EConversationDebugInfo::Executing);
                                Hero.AI.GiveItemTo(Saturas, UItMi_Orenugget, G1R.VALUE_KDW_ARMOR_H);
                                DC(int64(0x64682365a32f9c50), EConversationDebugInfo::Done);
                                DC(int64(0x64682365a32f9c52), EConversationDebugInfo::Executing);
                                Hero.AddItemToInventory(UKdw_Armor_H, 1);
                                DC(int64(0x64682365a32f9c52), EConversationDebugInfo::Done);
                                DC(int64(0x64682365a32f9c5a), EConversationDebugInfo::Executing);
                                Hero.Inventory.EquipArmorOfClass(UKdw_Armor_H);
                                DC(int64(0x64682365a32f9c5a), EConversationDebugInfo::Done);
                                
                                Other.Remember(n"choice_kdw_600_saturas_heavyarmor_exit_4");
                            }
                        }
                    }
                }
                else
                {
                    DC(int64(0x8840daf1ff7c20f9), EConversationDebugInfo::Executing);
                    // You can - but it is too early still. These are the robes ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_HEAVYARMOR_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20f9), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_heavyarmor_exit_5");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasKreis1 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20b5);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_2512");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_First);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20b7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc076f5), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x18a68a0908039348), G1R.Magician_Level < 1);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (G1R.Magician_Level >= 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20b8), EConversationDebugInfo::Executing);
                // I'm ready to be initiated into the First Circle of ...
                Hero.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20b8), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349a3cc), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1))
                {
                    DC(int64(0x8840daf1ff7c20ba), EConversationDebugInfo::Executing);
                    // Where Adanos stood was both order and chaos. And such ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20ba), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20bb), EConversationDebugInfo::Executing);
                    // The magic of water is given to us by Adanos. Its force ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_03"));
                    DC(int64(0x8840daf1ff7c20bb), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20bc), EConversationDebugInfo::Executing);
                    // Like the water, Adanos' magic is malleable too. It may ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_04"));
                    DC(int64(0x8840daf1ff7c20bc), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20bd), EConversationDebugInfo::Executing);
                    // And with every Circle of magic you pursue, you will be ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_05"));
                    DC(int64(0x8840daf1ff7c20bd), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20be), EConversationDebugInfo::Executing);
                    // Use it to establish order where chaos reigns, and to sow ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_06"));
                    DC(int64(0x8840daf1ff7c20be), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20bf), EConversationDebugInfo::Executing);
                    // But for now, go and apply your new-found knowledge.
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS1_INFO_14_07"));
                    DC(int64(0x8840daf1ff7c20bf), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_1);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    DC(int64(0x18a68a090803934a), EConversationDebugInfo::Executing);
                    G1R.Magician_Level = 1;
                    DC(int64(0x18a68a090803934a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis1_exit_1");
                    DC(int64(0x31cfd98d4dc077f2), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x31cfd98d4dc077f2), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x31cfd98d4dc07954), EConversationDebugInfo::Executing);
                    // No, you're not. Come back when you've opened your mind. 
                    Saturas.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_092855"));
                    DC(int64(0x31cfd98d4dc07954), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis1_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasKreis2 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20c3);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_571");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Second);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20c5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc076f6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x31cfd98d4dc076f7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20c6), EConversationDebugInfo::Executing);
                // I'm ready for the Second Circle.
                Hero.AI.Say(LocText("KDW_600_SATURAS_KREIS2_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20c6), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349a3dc), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2))
                {
                    DC(int64(0x8840daf1ff7c20c8), EConversationDebugInfo::Executing);
                    // Adanos looked at the world. And he was content with what ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS2_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20c8), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20c9), EConversationDebugInfo::Executing);
                    // A chosen of Adanos learns that everything must be ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS2_INFO_14_03"));
                    DC(int64(0x8840daf1ff7c20c9), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20ca), EConversationDebugInfo::Executing);
                    // Not everyone on the receiving end of a spell should be ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS2_INFO_14_04"));
                    DC(int64(0x8840daf1ff7c20ca), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20cb), EConversationDebugInfo::Executing);
                    // Use this knowledge wisely.
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS2_INFO_14_05"));
                    DC(int64(0x8840daf1ff7c20cb), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_2);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis2_exit_1");
                    DC(int64(0x31cfd98d4dc0790e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x31cfd98d4dc0790e), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x31cfd98d4dc07976), EConversationDebugInfo::Executing);
                    // No, you're not. Come back when you've opened your mind. 
                    Saturas.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_092855"));
                    DC(int64(0x31cfd98d4dc07976), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis2_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasKreis3 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20d0);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_3189");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Third);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20c5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc076f6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dc076f7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20d3), EConversationDebugInfo::Executing);
                // I'm ready to enter the Third Circle.
                Hero.AI.Say(LocText("KDW_600_SATURAS_KREIS3_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20d3), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349a3eb), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_3));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_3))
                {
                    DC(int64(0x8840daf1ff7c20d5), EConversationDebugInfo::Executing);
                    // Adanos resides in every drop of water, in the few wells ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS3_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20d5), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20d6), EConversationDebugInfo::Executing);
                    // When his brothers went too far with their quarrel, he ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS3_INFO_14_03"));
                    DC(int64(0x8840daf1ff7c20d6), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20d7), EConversationDebugInfo::Executing);
                    // But they appear in other shapes too - or even shapeless. ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS3_INFO_14_04"));
                    DC(int64(0x8840daf1ff7c20d7), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20d8), EConversationDebugInfo::Executing);
                    // Now go and become acquainted with their power.
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS3_INFO_14_05"));
                    DC(int64(0x8840daf1ff7c20d8), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_3);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis3_exit_1");
                    DC(int64(0x31cfd98d4dc078fc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x31cfd98d4dc078fc), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x31cfd98d4dc07998), EConversationDebugInfo::Executing);
                    // No, you're not. Come back when you've opened your mind. 
                    Saturas.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_092855"));
                    DC(int64(0x31cfd98d4dc07998), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis3_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasKreis4 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20dc);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_262");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Fourth);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20c5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc076f6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0x31cfd98d4dc076f7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20df), EConversationDebugInfo::Executing);
                // I'm ready for the Fourth Circle.
                Hero.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20df), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349a3f9), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_4));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_4))
                {
                    DC(int64(0x8840daf1ff7c20e1), EConversationDebugInfo::Executing);
                    // Adanos is the god of equilibirum. He is the scales of ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20e1), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20e2), EConversationDebugInfo::Executing);
                    // But he too is the raging sea, the eternal storm.
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_14_03"));
                    DC(int64(0x8840daf1ff7c20e2), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20e3), EConversationDebugInfo::Executing);
                    // As you share part of his magic, you share part of this ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_14_04"));
                    DC(int64(0x8840daf1ff7c20e3), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20e4), EConversationDebugInfo::Executing);
                    // If you find yourself in the eye of a storm of opponents, ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_14_05"));
                    DC(int64(0x8840daf1ff7c20e4), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_4);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis4_exit_1");
                    DC(int64(0x31cfd98d4dc078d8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x31cfd98d4dc078d8), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x31cfd98d4dc079dc), EConversationDebugInfo::Executing);
                    // No, you're not. Come back when you've opened your mind. 
                    Saturas.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_092855"));
                    DC(int64(0x31cfd98d4dc079dc), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis4_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasKreis5 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20e7);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_140");
            default PriorityRank = 5;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Fifth);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20c5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x31cfd98d4dc076f6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                    DB(int64(0x31cfd98d4dc076f7), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_5))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20ea), EConversationDebugInfo::Executing);
                // I'm ready for the Fifth Circle.
                Hero.AI.Say(LocText("KDW_600_SATURAS_KREIS5_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20ea), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349a406), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_5));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_5))
                {
                    DC(int64(0x8840daf1ff7c20ec), EConversationDebugInfo::Executing);
                    // When Adanos saw that order and chaos were uneven, he ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS5_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c20ec), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20ed), EConversationDebugInfo::Executing);
                    // Adanos commands the power of alteration. But without ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS5_INFO_14_03"));
                    DC(int64(0x8840daf1ff7c20ed), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20ee), EConversationDebugInfo::Executing);
                    // Such as none of the divine brothers can exist on his ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS5_INFO_14_04"));
                    DC(int64(0x8840daf1ff7c20ee), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20ef), EConversationDebugInfo::Executing);
                    // Not without the gods' help. When alone you achieve ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS5_INFO_14_05"));
                    DC(int64(0x8840daf1ff7c20ef), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c20f0), EConversationDebugInfo::Executing);
                    // Use it carefully.
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_KREIS4_INFO_14_06"));
                    DC(int64(0x8840daf1ff7c20f0), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_5);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis5_exit_1");
                    DC(int64(0x31cfd98d4dc078ea), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x31cfd98d4dc078ea), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x31cfd98d4dc079ba), EConversationDebugInfo::Executing);
                    // No, you're not. Come back when you've opened your mind. 
                    Saturas.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_092855"));
                    DC(int64(0x31cfd98d4dc079ba), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_kreis5_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw600SaturasLesson : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c20ab);
            default Caption = LocText("KDW_600_SATURAS_LESSON_INFO_15_01");
            default PriorityRank = 5;
            
            default Rules.HideIfKnows(UChoiceKdw600SaturasLesson);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c20ac), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c20ad), EConversationDebugInfo::Executing);
                // Can you instruct me in the magic arts?
                Hero.AI.Say(LocText("KDW_600_SATURAS_LESSON_INFO_15_01"));
                DC(int64(0x8840daf1ff7c20ad), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_SATURAS, Document::UDocumentSegment_Glossary_NC_KDW_SATURAS_Teach);
            }
        }
        
        
        class UChoiceKdw600SaturasNomoreoc : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c207d);
            default Caption = LocText("KDW_600_SATURAS_NOMOREOC_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasMurder);
            default Rules.HideIfKnows(UChoiceKdw600SaturasNomoreoc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58033ea88f98db0f), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_143620_731")));
                    DB(int64(0x58033ea88f98db23), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted());
                    DB(int64(0x58033ea88f98db24), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xf7fe73424d213f34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xf7fe73424d213f35), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted());
                    DB(int64(0x5b7b18e2528c9561), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_122854_41")));
                    DB(int64(0xf7fe73424d213f34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xf7fe73424d213f35), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted());
                    DB(int64(0x5b7b18e2528c9561), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_124131_443")));
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_143620_731")) && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_122854_41")))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasBeenStarted() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MRZXSLD_20241031_124131_443")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c207f), EConversationDebugInfo::Executing);
                // Now that Gomez has thrown me out - can I join you?
                Hero.AI.Say(LocText("KDW_600_SATURAS_NOMOREOC_INFO_15_01"));
                DC(int64(0x8840daf1ff7c207f), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2080), EConversationDebugInfo::Executing);
                
                // Hm. It feels strange to take in one of Gomez's former ...
                Saturas.AI.Say(LocText("KDW_600_SATURAS_NOMOREOC_INFO_14_02"));
                DC(int64(0x8840daf1ff7c2080), EConversationDebugInfo::Done);
                DC(int64(0x26601998927be438), EConversationDebugInfo::Executing);
                // But after all you've done for us, how could I deny your ...
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192828"));
                DC(int64(0x26601998927be438), EConversationDebugInfo::Done);
                DC(int64(0x26601998927be439), EConversationDebugInfo::Executing);
                // The answer is yes - we will arrange it. 
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192839"));
                DC(int64(0x26601998927be439), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BANNEDFROMOC, Document::UDocumentSegment_CH4_BANNEDFROMOC_Start);
                DC(int64(0x64682365a32f9cfc), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.StartQuest();
                DC(int64(0x64682365a32f9cfc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw600SaturasTimesup : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c213f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceKdw600SaturasTimesup);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2141), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded());
                    DB(int64(0x9720fc4dba61836a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0xb965a65bdefa8eb9), G1R != nullptr && !G1R.IsInChapter(6));
                    DB(int64(0x8840daf1ff7c2140), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning());
                    DB(int64(0x9720fc4dba61836b), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0xb965a65bdefa8eba), G1R != nullptr && !G1R.IsInChapter(6));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && G1R != nullptr && !G1R.IsInChapter(6))
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && G1R != nullptr && !G1R.IsInChapter(6))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2142), EConversationDebugInfo::Executing);
                // There you are! Did you find Xardas? 
                Saturas.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00"));
                DC(int64(0x8840daf1ff7c2142), EConversationDebugInfo::Done);
                DB(int64(0xc13a8675c0b16cbd), Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_DISTURB_14_03")));
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("INFO_XARDAS_DISTURB_14_03")))
                {
                    DC(int64(0x8840daf1ff7c2145), EConversationDebugInfo::Executing);
                    // Not yet.
                    Hero.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_15_01"));
                    DC(int64(0x8840daf1ff7c2145), EConversationDebugInfo::Done);
                    DC(int64(0x8840daf1ff7c2146), EConversationDebugInfo::Executing);
                    
                    // Then what are you waiting for? We need him for the ...
                    Saturas.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_02"));
                    DC(int64(0x8840daf1ff7c2146), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_600_saturas_timesup_exit_1");
                }
                else
                {
                    Subdialog(
                        UChoiceKdw600SaturasTimesupJa2,
                        UChoiceKdw600SaturasTimesupJa3
                    );
                }
            }
        }
        
        
        class UChoiceKdw600SaturasTimesupJa2 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2148);
            default Caption = LocText("TEXT_CHOICE_KDW_600_SATURAS_TIMESUP_JA2");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2149), EConversationDebugInfo::Executing);
                // (lie) I couldn't find him. 
                Hero.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_15_05"));
                DC(int64(0x8840daf1ff7c2149), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c214a), EConversationDebugInfo::Executing);
                
                // How do you mean?
                Saturas.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_06"));
                DC(int64(0x8840daf1ff7c214a), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c214b), EConversationDebugInfo::Executing);
                
                // I couldn't make it past his golems. 
                Hero.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_15_07"));
                DC(int64(0x8840daf1ff7c214b), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c214c), EConversationDebugInfo::Executing);
                
                // So you just ... what, gave up? I don't understand. You ...
                Saturas.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_08"));
                DC(int64(0x8840daf1ff7c214c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_Lie);
                Subdialog(
                    UTopic_Saturas_106653,
                    UTopic_Saturas_106673
                );
            }
        }
        
        
        class UChoiceKdw600SaturasTimesupJa3 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c214f);
            default Caption = LocText("TEXT_CHOICE_KDW_600_SATURAS_TIMESUP_JA3");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2150), EConversationDebugInfo::Executing);
                // I found him. Your plan isn't going to work. 
                Hero.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_15_09"));
                DC(int64(0x8840daf1ff7c2150), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2151), EConversationDebugInfo::Executing);
                
                // ... How so? 
                Saturas.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_10"));
                DC(int64(0x8840daf1ff7c2151), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2152), EConversationDebugInfo::Executing);
                
                // You can't control this much magic all at once. And even ...
                Hero.AI.Say(LocText("KDW_600_SATURAS_TIMESUP_INFO_15_11"));
                DC(int64(0x8840daf1ff7c2152), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d57eb), EConversationDebugInfo::Executing);
                // The Sleeper. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142543"));
                DC(int64(0x89230389776d57eb), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d57ec), EConversationDebugInfo::Executing);
                
                // Is this a joke? 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142550"));
                DC(int64(0x89230389776d57ec), EConversationDebugInfo::Done);
                DC(int64(0x12982a48f058efdb), EConversationDebugInfo::Executing);
                
                // No. The Sleeper is real, and he disrupted the magic. ...
                Hero.AI.Say(LocText("TEXT_WIP_GFALUPJ_20240812_160516"));
                DC(int64(0x12982a48f058efdb), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16e28), EConversationDebugInfo::Executing);
                // We need to stop him, and we need to do it now. 
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_141323"));
                DC(int64(0xc13a8675c0b16e28), EConversationDebugInfo::Done);
                DC(int64(0x12982a48f058efdd), EConversationDebugInfo::Executing);
                
                // But ... we can't ... 
                Saturas.AI.Say(LocText("TEXT_WIP_GFALUPJ_20240812_160609"));
                DC(int64(0x12982a48f058efdd), EConversationDebugInfo::Done);
                DC(int64(0x12982a48f058efde), EConversationDebugInfo::Executing);
                // No. No, Xardas is playing us. He doesn't want us to ...
                Saturas.AI.Say(LocText("TEXT_WIP_GFALUPJ_20240812_160632"));
                DC(int64(0x12982a48f058efde), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d57ed), EConversationDebugInfo::Executing);
                // Don't believe a word he says. This man never cared for ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144334"));
                DC(int64(0x89230389776d57ed), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9d1e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT.SucceedQuest();
                DC(int64(0x64682365a32f9d1e), EConversationDebugInfo::Done);
                DC(int64(0xe61ad584b3394672), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS.SucceedQuest();
                DC(int64(0xe61ad584b3394672), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Saturas_111670,
                    UTopic_Saturas_111690,
                    UTopic_Saturas_112156
                );
            }
        }
        
        
        class UTopic_Saturas_106653 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xc13a8675c0b16d4f);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_135412_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_106653);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16d50), EConversationDebugInfo::Executing);
                // I know. I'll try again. 
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_135412_41"));
                DC(int64(0xc13a8675c0b16d50), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16dc0), EConversationDebugInfo::Executing);
                
                // (sighs) Fine. What can I say? You've done more than ...
                Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_140121"));
                DC(int64(0xc13a8675c0b16dc0), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16dc3), EConversationDebugInfo::Executing);
                // We will be waiting. 
                Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_140510"));
                DC(int64(0xc13a8675c0b16dc3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_106673 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xc13a8675c0b16d53);
            default Caption = LocText("TEXT_WIP_CPWDQLC_20240827_135412_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_106673);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc13a8675c0b16dc1), EConversationDebugInfo::Executing);
                
                // I found the focus stones, played messenger for the Fire ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_140301"));
                DC(int64(0xc13a8675c0b16dc1), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16dc2), EConversationDebugInfo::Executing);
                // I'm done running other people's errands. I need to go my ...
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_140359"));
                DC(int64(0xc13a8675c0b16dc2), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16dd9), EConversationDebugInfo::Executing);
                
                // (sighs) Quite dramatic. 
                Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_140616"));
                DC(int64(0xc13a8675c0b16dd9), EConversationDebugInfo::Done);
                DB(int64(0x89230389776d56ec), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                DB(int64(0x89230389776d5703), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                {
                    DC(int64(0x89230389776d5746), EConversationDebugInfo::Executing);
                    // I have to say, I expected more from a Brother of Adanos. 
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_141634"));
                    DC(int64(0x89230389776d5746), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                {
                    DC(int64(0x89230389776d575e), EConversationDebugInfo::Executing);
                    // I have to say, I expected more from a fighter for our ...
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_141637"));
                    DC(int64(0x89230389776d575e), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x89230389776d57bb), EConversationDebugInfo::Executing);
                    // I have to say, I expected more from you. 
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142256"));
                    DC(int64(0x89230389776d57bb), EConversationDebugInfo::Done);
                }
                DC(int64(0x89230389776d5778), EConversationDebugInfo::Executing);
                // Then again, you ARE right - you already did a lot for ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142221_3436"));
                DC(int64(0x89230389776d5778), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d57e9), EConversationDebugInfo::Executing);
                // We will find another way to contact Xardas. This ritual ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142325"));
                DC(int64(0x89230389776d57e9), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d57ea), EConversationDebugInfo::Executing);
                // Leave me be. I need time to think. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_142351"));
                DC(int64(0x89230389776d57ea), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9d15), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT.SucceedQuest();
                DC(int64(0x64682365a32f9d15), EConversationDebugInfo::Done);
                DC(int64(0xe61ad584b3394674), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS.FailQuest();
                DC(int64(0xe61ad584b3394674), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c214e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8840daf1ff7c214e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Saturas_111670 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5805);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_144432_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_111670);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d5806), EConversationDebugInfo::Executing);
                // Why wouldn't Xardas want the barrier to go?
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144432_686"));
                DC(int64(0x89230389776d5806), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5839), EConversationDebugInfo::Executing);
                
                // I don't know, but there has to be a reason.
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144501"));
                DC(int64(0x89230389776d5839), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d583a), EConversationDebugInfo::Executing);
                // Maybe he doesn't want the King to mess with whatever ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144602"));
                DC(int64(0x89230389776d583a), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5808), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x89230389776d5808), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_111690 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5809);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_144432_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_111690);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_LEVDOTI_20240701_114520"), int64(0x89230389776d5809));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d580a), EConversationDebugInfo::Executing);
                // The Sleeper IS real. The orcs confirmed it. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144432_3984"));
                DC(int64(0x89230389776d580a), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58dd), EConversationDebugInfo::Executing);
                
                // You spoke to the orcs? 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145337"));
                DC(int64(0x89230389776d58dd), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58de), EConversationDebugInfo::Executing);
                
                // It's complicated. But the Sleeper is down there in the ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145358"));
                DC(int64(0x89230389776d58de), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58df), EConversationDebugInfo::Executing);
                // This is real, Saturas. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145454"));
                DC(int64(0x89230389776d58df), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58e0), EConversationDebugInfo::Executing);
                
                // By Adanos. You're telling the truth, aren't you? 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145511"));
                DC(int64(0x89230389776d58e0), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58e1), EConversationDebugInfo::Executing);
                // I ... I will think about what you said. We'll have to ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145527"));
                DC(int64(0x89230389776d58e1), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d58e2), EConversationDebugInfo::Executing);
                // Thank you for your efforts. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_145540"));
                DC(int64(0x89230389776d58e2), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2155), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8840daf1ff7c2155), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Saturas_112156 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5851);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_144614_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_112156);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d5852), EConversationDebugInfo::Executing);
                // What will you do now? 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144614_1609"));
                DC(int64(0x89230389776d5852), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5881), EConversationDebugInfo::Executing);
                
                // We'll find another way to conduct the ritual. It'll be ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144642"));
                DC(int64(0x89230389776d5881), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5898), EConversationDebugInfo::Executing);
                // Thank you for your efforts. I ... I need time to think. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_144702"));
                DC(int64(0x89230389776d5898), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2155), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8840daf1ff7c2155), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSaturas104762 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe14c05e090897b3b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceSaturas104762);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_OREMOUNT_SATURAS", 300.0f, int64(0xe14c05e090897b3b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe14c05e090897b26), EConversationDebugInfo::Executing);
                // What by Adanos are you doing?!
                Saturas.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_175455_3436"));
                DC(int64(0xe14c05e090897b26), EConversationDebugInfo::Done);
                DC(int64(0xe14c05e090897b3d), EConversationDebugInfo::Executing);
                
                // What has to be done. The Sleeper is going to end us all, ...
                Hero.AI.Say(LocText("TEXT_WIP_VACYRLF_20240725_175521"));
                DC(int64(0xe14c05e090897b3d), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5926), EConversationDebugInfo::Executing);
                // I need this magic. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_151807"));
                DC(int64(0x89230389776d5926), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5925), EConversationDebugInfo::Executing);
                
                // Then you'll have to get past me.
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_151736"));
                DC(int64(0x89230389776d5925), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Saturas_113560,
                    UTopic_Saturas_113693,
                    UTopic_Saturas_113580,
                    UTopic_Saturas_113813
                );
                DC(int64(0x89230389776d5a06), EConversationDebugInfo::Executing);
                // But can't you see that-
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_152120"));
                DC(int64(0x89230389776d5a06), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5a5e), EConversationDebugInfo::Executing);
                // (long sigh) Oh, by the gods. I just can't convince you, ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153136"));
                DC(int64(0x89230389776d5a5e), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5a07), EConversationDebugInfo::Executing);
                
                // No. But you CAN speed this up if you just trust me and ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_152120_3750"));
                DC(int64(0x89230389776d5a07), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5a5f), EConversationDebugInfo::Executing);
                
                // Upfront as ever. For fuck's sake, fine. I guess I have ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153241"));
                DC(int64(0x89230389776d5a5f), EConversationDebugInfo::Done);
                DB(int64(0xc13a8675c0b16e3f), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded())
                {
                    DC(int64(0xc13a8675c0b16e6b), EConversationDebugInfo::Executing);
                    // You're right - you were honest with me, and I respect ...
                    Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215638_1924"));
                    DC(int64(0xc13a8675c0b16e6b), EConversationDebugInfo::Done);
                    DC(int64(0xc13a8675c0b16ec2), EConversationDebugInfo::Executing);
                    // I will find a way to explain this to the others. I hope.
                    Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215759"));
                    DC(int64(0xc13a8675c0b16ec2), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xc13a8675c0b16e82), EConversationDebugInfo::Executing);
                    // Just know that the others won't be as understanding. It ...
                    Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215646_2785"));
                    DC(int64(0xc13a8675c0b16e82), EConversationDebugInfo::Done);
                }
                DC(int64(0xc13a8675c0b16eee), EConversationDebugInfo::Executing);
                // I will pray to Adanos that defeating this "Sleeper" will ...
                Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215818_3436"));
                DC(int64(0xc13a8675c0b16eee), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f2e), EConversationDebugInfo::Executing);
                
                // We'll find out.
                Hero.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215931"));
                DC(int64(0xc13a8675c0b16f2e), EConversationDebugInfo::Done);
                DC(int64(0xc13a8675c0b16f2f), EConversationDebugInfo::Executing);
                
                // ... Do it. Before I change my mind.
                Saturas.AI.Say(LocText("TEXT_WIP_CPWDQLC_20240827_215936"));
                DC(int64(0xc13a8675c0b16f2f), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cf2b), EConversationDebugInfo::Executing);
                Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.StartQuest();
                DC(int64(0xd47f896dcbb4cf2b), EConversationDebugInfo::Done);
                DC(int64(0xd47f896dcbb4cf40), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd47f896dcbb4cf40), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Saturas_113560 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d593c);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_151923");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_113560);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89230389776d596d), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d593d), EConversationDebugInfo::Executing);
                // Don't be stupid, Saturas. I was honest with you, but you ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_151923_3569"));
                DC(int64(0x89230389776d593d), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5a30), EConversationDebugInfo::Executing);
                // You just don't want to admit that plan of yours isn't ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_152532"));
                DC(int64(0x89230389776d5a30), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_113693 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5996);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_152001");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_113693);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d5997), EConversationDebugInfo::Executing);
                // This is a mistake, Saturas. You know your plan won't ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_152001_1769"));
                DC(int64(0x89230389776d5997), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_113580 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5940);
            default Caption = LocText("TEXT_WIP_DPWDQLC_20240826_151923_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_113580);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d5941), EConversationDebugInfo::Executing);
                // Don't do this, Saturas. The Sleeper is the enemy, not ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_151923_443"));
                DC(int64(0x89230389776d5941), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_113813 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d59da);
            default Caption = LocText("TEXT_WIP_MRAUAIK_20241010_210005_2055");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_113813);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d59db), EConversationDebugInfo::Executing);
                // Don't do this, Saturas. I'll fight you if I have to. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_152047_2995"));
                DC(int64(0x89230389776d59db), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas105435 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x9720fc4dba61831f);
            default Caption = LocText("TEXT_WIP_QIXCDZL_20240805_091935");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSaturas105435);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9720fc4dba61833b), Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE.IsRunning());
                    DB(int64(0x89fda7a60123ddf), Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.HasSucceeded());
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_CHARGE.IsRunning())
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_CINEMATIC.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9720fc4dba618309), EConversationDebugInfo::Executing);
                // I need the magic of the ore pile. 
                Hero.AI.Say(LocText("TEXT_WIP_QIXCDZL_20240805_091935"));
                DC(int64(0x9720fc4dba618309), EConversationDebugInfo::Done);
                DC(int64(0x9720fc4dba61830a), EConversationDebugInfo::Executing);
                
                // You - what?
                Saturas.AI.Say(LocText("TEXT_WIP_QIXCDZL_20240805_091935_41"));
                DC(int64(0x9720fc4dba61830a), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d55a9), EConversationDebugInfo::Executing);
                
                // I made it into the Sleeper Temple, but the only way to ...
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134008"));
                DC(int64(0x89230389776d55a9), EConversationDebugInfo::Done);
                DC(int64(0x12982a48f058eff8), EConversationDebugInfo::Executing);
                // It's a magical sword - well, not right now, it isn't, ...
                Hero.AI.Say(LocText("TEXT_WIP_GFALUPJ_20240812_162332"));
                DC(int64(0x12982a48f058eff8), EConversationDebugInfo::Done);
                DB(int64(0x89230389776d55ee), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasSucceeded())
                {
                    DC(int64(0x89230389776d5606), EConversationDebugInfo::Executing);
                    // This again.
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134321_41"));
                    DC(int64(0x89230389776d5606), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56c7), EConversationDebugInfo::Executing);
                    
                    // The Sleeper IS a threat. Why won't you believe me?
                    Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134537"));
                    DC(int64(0x89230389776d56c7), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56c8), EConversationDebugInfo::Executing);
                    
                    // Because I know Xardas. And Xardas only ever cares about ...
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134607"));
                    DC(int64(0x89230389776d56c8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x89230389776d561e), EConversationDebugInfo::Executing);
                    // Sleeper? Uriziel? What by Adanos have you been smoking?
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134323_2083"));
                    DC(int64(0x89230389776d561e), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56c9), EConversationDebugInfo::Executing);
                    
                    // It's a long story. The short version is, the Sleeper is ...
                    Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134704"));
                    DC(int64(0x89230389776d56c9), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56ca), EConversationDebugInfo::Executing);
                    // If we don't stop him, he'll kill us all. 
                    Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134727"));
                    DC(int64(0x89230389776d56ca), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56cb), EConversationDebugInfo::Executing);
                    
                    // (sighs) Let me guess: Xardas put you up to this? 
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134735"));
                    DC(int64(0x89230389776d56cb), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56cc), EConversationDebugInfo::Executing);
                    
                    // It's the truth.
                    Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134746"));
                    DC(int64(0x89230389776d56cc), EConversationDebugInfo::Done);
                    DC(int64(0x89230389776d56cd), EConversationDebugInfo::Executing);
                    
                    // Maybe. Maybe not. What I DO know to be true, however, is ...
                    Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_135331"));
                    DC(int64(0x89230389776d56cd), EConversationDebugInfo::Done);
                }
                DC(int64(0x89230389776d5680), EConversationDebugInfo::Executing);
                // But even if he isn't just using you for his own ends, it ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_134505_2238"));
                DC(int64(0x89230389776d5680), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Saturas_1192593,
                    UTopic_Saturas_1192452,
                    UTopic_Saturas_1192472
                );
                DC(int64(0x89230389776d56ce), EConversationDebugInfo::Executing);
                // This pile down there, it isn't just ore or magic - it's ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_135447"));
                DC(int64(0x89230389776d56ce), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d56d1), EConversationDebugInfo::Executing);
                // Hundreds of men have worked their hands bloody for this, ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_135553"));
                DC(int64(0x89230389776d56d1), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d56d2), EConversationDebugInfo::Executing);
                // And that is EXACTLY what we will do. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_135935"));
                DC(int64(0x89230389776d56d2), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d56d3), EConversationDebugInfo::Executing);
                
                // You're making a mistake. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_140032"));
                DC(int64(0x89230389776d56d3), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d56d4), EConversationDebugInfo::Executing);
                
                // We'll see about this. Now enough. I'll hear no more of ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_140038"));
                DC(int64(0x89230389776d56d4), EConversationDebugInfo::Done);
                DC(int64(0x9720fc4dba618325), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9720fc4dba618325), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Saturas_1192593 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x7a4b0b7937cb7f16);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_210636");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_1192593);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937cb7f17), EConversationDebugInfo::Executing);
                // I know it's-
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_210636_3719"));
                DC(int64(0x7a4b0b7937cb7f17), EConversationDebugInfo::Done);
                DC(int64(0x7a4b0b7937cb7fdb), EConversationDebugInfo::Executing);
                
                // You don't know anything!
                Saturas.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_212512"));
                DC(int64(0x7a4b0b7937cb7fdb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_1192452 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x7a4b0b7937cb7ef9);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_210309");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_1192452);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937cb7efa), EConversationDebugInfo::Executing);
                
                // But Uriziel-
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_210309_3750"));
                DC(int64(0x7a4b0b7937cb7efa), EConversationDebugInfo::Done);
                DC(int64(0x7a4b0b7937cb7fd9), EConversationDebugInfo::Executing);
                
                // I don't care about your bloody sword!
                Saturas.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_211019"));
                DC(int64(0x7a4b0b7937cb7fd9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_1192472 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x7a4b0b7937cb7efd);
            default Caption = LocText("TEXT_WIP_LGRCRRE_20240904_210309_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_1192472);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7a4b0b7937cb7efe), EConversationDebugInfo::Executing);
                
                // I'm just-
                Hero.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_210309_1340"));
                DC(int64(0x7a4b0b7937cb7efe), EConversationDebugInfo::Done);
                DC(int64(0x7a4b0b7937cb7fda), EConversationDebugInfo::Executing);
                
                // This is not about you!
                Saturas.AI.Say(LocText("TEXT_WIP_LGRCRRE_20240904_212326"));
                DC(int64(0x7a4b0b7937cb7fda), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas106469_0 : UTopic_NC_SLD_LEE_700__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xbb86ef867931ef0f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceSaturas106469);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_TELEPORT_01", 800.0f, int64(0xbb86ef867931ef0f));
            default Rules.HideIfKnows(UChoiceSaturas106469_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2075), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0xbb86ef867931efd7), Saturas != nullptr && Saturas.IsCloseToCharacter(Lee, 500.0f));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return false;
                
                if (Saturas != nullptr && !Saturas.IsCloseToCharacter(Lee, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb86ef867931eefc), EConversationDebugInfo::Executing);
                // ... just a single one of us dies, that's it. We won't be ...
                Saturas.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_145542_41"));
                DC(int64(0xbb86ef867931eefc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas106469_1 : UTopic_NC_SLD_LEE_700__NC_KDW_SATURAS_600
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas106469_0);
            default Rules.HideIfKnows(UChoiceSaturas106469_1);
            default DebugId = int64(0xbb86ef867931ef0f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb86ef867931ef35), EConversationDebugInfo::Executing);
                
                // And if we don't deal with Gomez's men, they're coming ...
                Lee.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_145808"));
                DC(int64(0xbb86ef867931ef35), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas106469_2 : UTopic_NC_SLD_LEE_700__NC_KDW_SATURAS_600
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas106469_1);
            default Rules.HideIfKnows(UChoiceSaturas106469_2);
            default DebugId = int64(0xbb86ef867931ef0f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb86ef867931ef36), EConversationDebugInfo::Executing);
                
                // I ... I'll consider it. 
                Saturas.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_145820"));
                DC(int64(0xbb86ef867931ef36), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas106469 : UTopic_NC_SLD_LEE_700__NC_KDW_SATURAS_600
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas106469_2);
            default Rules.HideIfKnows(UChoiceSaturas106469);
            default DebugId = int64(0xbb86ef867931ef0f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbb86ef867931eff4), EConversationDebugInfo::Executing);
                
                // I'll leave you to it. 
                Lee.AI.Say(LocText("TEXT_WIP_QACNPYL_20241023_152437"));
                DC(int64(0xbb86ef867931eff4), EConversationDebugInfo::Done);
                DC(int64(0xbb86ef867931f040), EConversationDebugInfo::Executing);
                Lee.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Lee_700_Start);
                DC(int64(0xbb86ef867931f040), EConversationDebugInfo::Done);
                DC(int64(0x9fb520c599e704e7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Homer))) { Homer.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Homer_935_Damnpast); }
                DC(int64(0x9fb520c599e704e7), EConversationDebugInfo::Done);
                DC(int64(0xde2da8b755930040), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_Start);
                DC(int64(0xde2da8b755930040), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas108301 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb88114656d);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_144755");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturas108301);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c1ff5), Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x50028f2ea692bf11), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb881146547), EConversationDebugInfo::Executing);
                // I have Y'Berion's focus stone with me. Here.
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_144755"));
                DC(int64(0xe6361cb881146547), EConversationDebugInfo::Done);
                DC(int64(0x55f4b65ae2ef8662), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemToLook(Saturas, UItMs_Focus_01, 1);
                DC(int64(0x55f4b65ae2ef8662), EConversationDebugInfo::Done);
                DC(int64(0x55f4b65ae2ef868c), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMs_Focus_01, 1, 0);
                DC(int64(0x55f4b65ae2ef868c), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146548), EConversationDebugInfo::Executing);
                // ... So this is how they feel. Fascinating. Such power. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_144755_3902"));
                DC(int64(0xe6361cb881146548), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811465db), EConversationDebugInfo::Executing);
                // Thank you. Now all we need are the others. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_144950"));
                DC(int64(0xe6361cb8811465db), EConversationDebugInfo::Done);
                DC(int64(0xfc2c77dc4d727cc4), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_YBERIONFOCUS.SucceedQuest();
                DC(int64(0xfc2c77dc4d727cc4), EConversationDebugInfo::Done);
                DC(int64(0x8195c672d0c780ad), EConversationDebugInfo::Executing);
                G1R.Saturas_BringFoci = 1;
                DC(int64(0x8195c672d0c780ad), EConversationDebugInfo::Done);
                DC(int64(0x91a034cd9ce0e62d), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_Start);
                DC(int64(0x91a034cd9ce0e62d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas116026 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x89230389776d5b1a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSaturas116026);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_OREMOUNT_SATURAS", 500.0f, int64(0x89230389776d5b1a));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_CPWDQLC_20240827_215936"), int64(0x89230389776d5b1a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb657d3b7103e192b), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xa4ba9cf5f3ffeb7f), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89230389776d5b05), EConversationDebugInfo::Executing);
                // All this power ... gone. I ... I can't believe it. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153644_731"));
                DC(int64(0x89230389776d5b05), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5b30), EConversationDebugInfo::Executing);
                
                // Actually, it's still here. In Uriziel. 
                Hero.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153821"));
                DC(int64(0x89230389776d5b30), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5b31), EConversationDebugInfo::Executing);
                
                // You know what I mean. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153903"));
                DC(int64(0x89230389776d5b31), EConversationDebugInfo::Done);
                DC(int64(0x89230389776d5b32), EConversationDebugInfo::Executing);
                // Please go now. I have a lot of explaining ahead of me ...
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_153912"));
                DC(int64(0x89230389776d5b32), EConversationDebugInfo::Done);
                DC(int64(0xa4ba9cf5f3ffeb6a), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_Start);
                DC(int64(0xa4ba9cf5f3ffeb6a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas136787 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x79c9060c1952ffd2);
            default Caption = LocText("TEXT_WIP_KTDQKAE_20250110_174248");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSaturas136787);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x79c9060c1952fff7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                    DB(int64(0xb965a65bdefa8eb7), G1R != nullptr && !G1R.HasReachedChapter(6));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79c9060c1952ffbf), EConversationDebugInfo::Executing);
                // Lee took me in as a Mercenary.
                Hero.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_174248"));
                DC(int64(0x79c9060c1952ffbf), EConversationDebugInfo::Done);
                DC(int64(0x79c9060c1952ffc0), EConversationDebugInfo::Executing);
                
                //  Good. Very good. Then you are a part of our fellowship.
                Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_174248_2238"));
                DC(int64(0x79c9060c1952ffc0), EConversationDebugInfo::Done);
                DC(int64(0x79c9060c19530074), EConversationDebugInfo::Executing);
                
                // Right - that's why I want to join your order.
                Hero.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_175329"));
                DC(int64(0x79c9060c19530074), EConversationDebugInfo::Done);
                DC(int64(0x79c9060c19530128), EConversationDebugInfo::Executing);
                
                // Ah. And why do you think you are ready to join the ...
                Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_175845"));
                DC(int64(0x79c9060c19530128), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Start);
                DC(int64(0x5526157df3d6830f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES.StartQuest();
                DC(int64(0x5526157df3d6830f), EConversationDebugInfo::Done);
                DB(int64(0x79c9060c19530087), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_NEFARIUS_OCNEWS_04_05")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_NEFARIUS_OCNEWS_04_05")))
                {
                    DC(int64(0x8840daf1ff7c2158), EConversationDebugInfo::Executing);
                    // Nefarius said I've proven myself worthy of the Water ...
                    Hero.AI.Say(LocText("KDW_600_SATURAS_HOGEAUFNAHME_15_00"));
                    DC(int64(0x8840daf1ff7c2158), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x79c9060c19530129), EConversationDebugInfo::Executing);
                    // I think I've done enough for you all to at least have ...
                    Hero.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_175916"));
                    DC(int64(0x79c9060c19530129), EConversationDebugInfo::Done);
                }
                DC(int64(0x79c9060c19530152), EConversationDebugInfo::Executing);
                // Very well.
                Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_180030_2386"));
                DC(int64(0x79c9060c19530152), EConversationDebugInfo::Done);
                DC(int64(0x79c9060c195301dc), EConversationDebugInfo::Executing);
                // But you understand I can't admit you just like that. It ...
                Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_180417"));
                DC(int64(0x79c9060c195301dc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas136913 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f431369);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_084753");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KTDQKAE_20250110_180417"), int64(0x330b31419f431369));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_KTDQKAE_20250110_181447"), int64(0x330b31419f431369));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f431353), EConversationDebugInfo::Executing);
                
                // I followed your advice and I'm ready now.
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_084753"));
                DC(int64(0x330b31419f431353), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431354), EConversationDebugInfo::Executing);
                
                // Ah, well, then.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_084753_41"));
                DC(int64(0x330b31419f431354), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas137049 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f43145d);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_090139");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSaturas137049);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KTDQKAE_20250110_181447"), int64(0x330b31419f43145d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5526157df3d68491), Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES != nullptr && Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES != nullptr && Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f431447), EConversationDebugInfo::Executing);
                
                // About the Trial of Adanos ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_090139"));
                DC(int64(0x330b31419f431447), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431448), EConversationDebugInfo::Executing);
                
                // The time has come.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_090139_2238"));
                DC(int64(0x330b31419f431448), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas137180 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f431489);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas137049);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f431474), EConversationDebugInfo::Executing);
                // In order to enter the Circle, you need Adanos' blessing. ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_091911_2785"));
                DC(int64(0x330b31419f431474), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43148b), EConversationDebugInfo::Executing);
                // Follow the riverbed. You will find his altar where it ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_091923"));
                DC(int64(0x330b31419f43148b), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43148c), EConversationDebugInfo::Executing);
                // And after making a worthy offering, you will receive his ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_091932"));
                DC(int64(0x330b31419f43148c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Saturas_137190,
                    UTopic_Saturas_137210,
                    UTopic_Saturas_137240
                );
            }
        }
        
        
        class UTopic_Saturas_137190 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f43148e);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_092222_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_137190);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f43148f), EConversationDebugInfo::Executing);
                // What do you mean by "a worthy offering?"
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092222_3286"));
                DC(int64(0x330b31419f43148f), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f4314aa), EConversationDebugInfo::Executing);
                
                // I can't say. It is up to you to understand what Adanos ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092542"));
                DC(int64(0x330b31419f4314aa), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431491), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x330b31419f431491), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_137210 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f431492);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_092222_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_137210);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f431493), EConversationDebugInfo::Executing);
                // Can you mark on the map where the altar is?
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092222_2386"));
                DC(int64(0x330b31419f431493), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f4314ab), EConversationDebugInfo::Executing);
                
                // No. Take it as part of your trial to find this place.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092602"));
                DC(int64(0x330b31419f4314ab), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431495), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x330b31419f431495), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_137240 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f4314ac);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_092610_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_137240);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f4314ad), EConversationDebugInfo::Executing);
                // I'll follow the river, find the altar, and make an ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092610_3984"));
                DC(int64(0x330b31419f4314ad), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f4314c4), EConversationDebugInfo::Executing);
                
                // Adanos be your guide.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092618"));
                DC(int64(0x330b31419f4314c4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Ritual);
                DC(int64(0x5526157df3d6834d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.StartQuest();
                DC(int64(0x5526157df3d6834d), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f4314d9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x330b31419f4314d9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSaturas137218 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x79c9060c1953021b);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas136787);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturas136913);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x79c9060c1953026d), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy))
                {
                    DC(int64(0x79c9060c1953034c), EConversationDebugInfo::Executing);
                    // You're well-versed in alchemy - a useful occupation. ...
                    Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_180736"));
                    DC(int64(0x79c9060c1953034c), EConversationDebugInfo::Done);
                    DC(int64(0x6c528962981e9274), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY.SucceedQuest();
                    DC(int64(0x6c528962981e9274), EConversationDebugInfo::Done);
                    DB(int64(0x79c9060c195303c2), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription));
                    
                    if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription))
                    {
                        DC(int64(0x79c9060c195303d5), EConversationDebugInfo::Executing);
                        // And you're quite proficient with inscriptions, aren't ...
                        Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_181135_2801"));
                        DC(int64(0x79c9060c195303d5), EConversationDebugInfo::Done);
                        DC(int64(0x79c9060c195303e9), EConversationDebugInfo::Executing);
                        // The inevitability of armed struggles in here makes it a ...
                        Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_181155"));
                        DC(int64(0x79c9060c195303e9), EConversationDebugInfo::Done);
                        DC(int64(0x79c9060c1953045a), EConversationDebugInfo::Executing);
                        // I believe you are ready to be tested by Adanos himself.
                        Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_181447"));
                        DC(int64(0x79c9060c1953045a), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Professions);
                        DC(int64(0x6c528962981e92db), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION.SucceedQuest();
                        DC(int64(0x6c528962981e92db), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_saturas_137218_exit_1");
                    }
                    else
                    {
                        DC(int64(0x79c9060c195303eb), EConversationDebugInfo::Executing);
                        // But do you know how to produce spell scrolls? No?
                        Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_181210_443"));
                        DC(int64(0x79c9060c195303eb), EConversationDebugInfo::Done);
                        DC(int64(0x79c9060c19530400), EConversationDebugInfo::Executing);
                        // Well, nothing to worry about - just consult Merdarion, ...
                        Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_181350"));
                        DC(int64(0x79c9060c19530400), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Inscription);
                        DC(int64(0x6c528962981e92b1), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_INSCRIPTION.StartQuest();
                        DC(int64(0x6c528962981e92b1), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_saturas_137218_exit_2");
                        DC(int64(0x79c9060c19530401), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x79c9060c19530401), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0x79c9060c1953036d), EConversationDebugInfo::Executing);
                    // Alchemy is essential to us, but you don't seem to be ...
                    Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_180824_3569"));
                    DC(int64(0x79c9060c1953036d), EConversationDebugInfo::Done);
                    DC(int64(0x79c9060c195303ac), EConversationDebugInfo::Executing);
                    // But that can be remedied: Riordian is an excellent ...
                    Saturas.AI.Say(LocText("TEXT_WIP_KTDQKAE_20250110_180945"));
                    DC(int64(0x79c9060c195303ac), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Alchemy);
                    DC(int64(0x6c528962981e9237), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_ALCHEMY.StartQuest();
                    DC(int64(0x6c528962981e9237), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_137218_exit_3");
                    DC(int64(0x79c9060c195303ad), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x79c9060c195303ad), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceSaturas137282 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x330b31419f431504);
            default Caption = LocText("TEXT_WIP_JTDQKAE_20250113_092700");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSaturas137282);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5526157df3d684a8), Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL != nullptr && Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.HasSucceeded());
                }
                
                return Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL != nullptr && Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RITUAL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x330b31419f4314ee), EConversationDebugInfo::Executing);
                // I've received Adanos's blessing.
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092700"));
                DC(int64(0x330b31419f4314ee), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f4314ef), EConversationDebugInfo::Executing);
                
                // You did ... I can feel it.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_092700_1609"));
                DC(int64(0x330b31419f4314ef), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43151a), EConversationDebugInfo::Executing);
                
                // Does that mean I'm in?
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_095211"));
                DC(int64(0x330b31419f43151a), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43151c), EConversationDebugInfo::Executing);
                
                // Yes, as soon as you've taken the oath.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_095239"));
                DC(int64(0x330b31419f43151c), EConversationDebugInfo::Done);
                DB(int64(0x330b31419f431537), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded())
                {
                    DC(int64(0x330b31419f43151d), EConversationDebugInfo::Executing);
                    // But I've already taken an oath to Innos.
                    Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_095612"));
                    DC(int64(0x330b31419f43151d), EConversationDebugInfo::Done);
                    DC(int64(0x330b31419f43151e), EConversationDebugInfo::Executing);
                    
                    // And you won't be breaking it by swearing on Adanos.
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_095612_2801"));
                    DC(int64(0x330b31419f43151e), EConversationDebugInfo::Done);
                    DC(int64(0x330b31419f431535), EConversationDebugInfo::Executing);
                    // See it as an extension. And cherish it - it's quite rare ...
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_095633"));
                    DC(int64(0x330b31419f431535), EConversationDebugInfo::Done);
                }
                DC(int64(0x330b31419f43160f), EConversationDebugInfo::Executing);
                // Now repeat after me the words of the sacred bond.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103437_1769"));
                DC(int64(0x330b31419f43160f), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431638), EConversationDebugInfo::Executing);
                // I shall put my life into service to Adanos. I am ready ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103522"));
                DC(int64(0x330b31419f431638), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431639), EConversationDebugInfo::Executing);
                
                // I shall put my life into service to Adanos. I am ready ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103529"));
                DC(int64(0x330b31419f431639), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163a), EConversationDebugInfo::Executing);
                
                // I shall be granted the power of the sacred water, so ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103531"));
                DC(int64(0x330b31419f43163a), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163b), EConversationDebugInfo::Executing);
                
                // I shall be granted the power of the sacred water, so ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103540"));
                DC(int64(0x330b31419f43163b), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163c), EConversationDebugInfo::Executing);
                
                // My life and my deeds shall from now on be one with the ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103542"));
                DC(int64(0x330b31419f43163c), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163d), EConversationDebugInfo::Executing);
                
                // My life and my deeds shall from now on be one with the ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103549"));
                DC(int64(0x330b31419f43163d), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163e), EConversationDebugInfo::Executing);
                
                // Until the wellspring of life will dry out and my body ...
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103556"));
                DC(int64(0x330b31419f43163e), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43163f), EConversationDebugInfo::Executing);
                
                // Until the wellspring of life will dry out and my body ...
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103600"));
                DC(int64(0x330b31419f43163f), EConversationDebugInfo::Done);
                DC(int64(0xbb2f9b0f04abeb7e), EConversationDebugInfo::Executing);
                
                // Adanos, Scales of Justice, arbitrator in the eternal war ...
                Saturas.AI.Say(LocText("TEXT_WIP_RHVTSEI_20250124_161812"));
                DC(int64(0xbb2f9b0f04abeb7e), EConversationDebugInfo::Done);
                DB(int64(0x330b31419f431641), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded())
                {
                    DC(int64(0x330b31419f431656), EConversationDebugInfo::Executing);
                    // With this oath, you have sealed your bond with the ...
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103647"));
                    DC(int64(0x330b31419f431656), EConversationDebugInfo::Done);
                    DC(int64(0x330b31419f43166c), EConversationDebugInfo::Executing);
                    // You are joining what used to be apart. Fire and water ...
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103752"));
                    DC(int64(0x330b31419f43166c), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_CompletedAfterFireMage);
                }
                else
                {
                    DC(int64(0x330b31419f4316cf), EConversationDebugInfo::Executing);
                    // With this oath, you have sealed your bond with the ...
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103925"));
                    DC(int64(0x330b31419f4316cf), EConversationDebugInfo::Done);
                    DC(int64(0x330b31419f4316fb), EConversationDebugInfo::Executing);
                    // May your deeds be a sign of the godly powers.
                    Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103957"));
                    DC(int64(0x330b31419f4316fb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Complete);
                }
                DC(int64(0x330b31419f43166d), EConversationDebugInfo::Executing);
                //  Wear this robe as a sign of your bond with Adanos.
                Saturas.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103808"));
                DC(int64(0x330b31419f43166d), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43166e), EConversationDebugInfo::Executing);
                
                // I will. Thank you, Master.
                Hero.AI.Say(LocText("TEXT_WIP_JTDQKAE_20250113_103808_2995"));
                DC(int64(0x330b31419f43166e), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Saturas.AddItemToInventory(UKdw_Armor_L, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431713), EConversationDebugInfo::Executing);
                Saturas.AI.GiveItemTo(Hero, UKdw_Armor_L, 1);
                DC(int64(0x330b31419f431713), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f431715), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_NewCamp_WaterMage);
                DC(int64(0x330b31419f431715), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43175b), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UKdw_Armor_L);
                DC(int64(0x330b31419f43175b), EConversationDebugInfo::Done);
                DC(int64(0x330b31419f43175d), EConversationDebugInfo::Executing);
                Hero.Character.Heal();
                DC(int64(0x330b31419f43175d), EConversationDebugInfo::Done);
                DC(int64(0x5526157df3d684be), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN.SucceedQuest();
                DC(int64(0x5526157df3d684be), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas157881 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xee660343e7b51921);
            default Caption = LocText("TEXT_WIP_PFZFBUC_20250214_112813");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasMurder);
            default Rules.HideIfKnows(UChoiceSaturas157881);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xee660343e7b51924), G1R.TeleportToWaterMagesBlockedDone != 0);
                }
                
                return G1R.TeleportToWaterMagesBlockedDone != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xee660343e7b5190b), EConversationDebugInfo::Executing);
                // The rune you gave me teleported me to a different ...
                Hero.AI.Say(LocText("TEXT_WIP_PFZFBUC_20250214_112813"));
                DC(int64(0xee660343e7b5190b), EConversationDebugInfo::Done);
                DC(int64(0xee660343e7b5190c), EConversationDebugInfo::Executing);
                
                // Oh. Right, of course. We ... modified it for the time ...
                Saturas.AI.Say(LocText("TEXT_WIP_PFZFBUC_20250214_112813_3286"));
                DC(int64(0xee660343e7b5190c), EConversationDebugInfo::Done);
                DC(int64(0x3e11acf0bc5b533), EConversationDebugInfo::Executing);
                // Especially seeing as YOU were carrying one of those ...
                Saturas.AI.Say(LocText("TEXT_WIP_TLOOBMH_20250214_142153"));
                DC(int64(0x3e11acf0bc5b533), EConversationDebugInfo::Done);
                DC(int64(0x3e11acf0bc5b532), EConversationDebugInfo::Executing);
                
                // Hm. Convenient. 
                Hero.AI.Say(LocText("TEXT_WIP_TLOOBMH_20250214_142135"));
                DC(int64(0x3e11acf0bc5b532), EConversationDebugInfo::Done);
                DC(int64(0x3e11acf0bc5b534), EConversationDebugInfo::Executing);
                
                // It's temporary. 
                Saturas.AI.Say(LocText("TEXT_WIP_TLOOBMH_20250214_142236"));
                DC(int64(0x3e11acf0bc5b534), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturas92703 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x79cc809a374aeb7b);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasBringfocus2);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasBringfocus3);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasBringfocus4);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasBringfocus5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x1a494c3f7de95f87), G1R.Saturas_BringFoci == 1);
                DB(int64(0x1a494c3f7de95f88), G1R.Saturas_BringFoci == 2);
                DB(int64(0x1a494c3f7de95f89), G1R.Saturas_BringFoci == 3);
                DB(int64(0x1a494c3f7de95f8a), G1R.Saturas_BringFoci == 4);
                
                if (G1R.Saturas_BringFoci == 1)
                {
                    DC(int64(0x1a494c3f7de95f8c), EConversationDebugInfo::Executing);
                    // That's a good start, but we still have three more to go. 
                    Saturas.AI.Say(LocText("TEXT_DDIAZ_20231212_161019_2386"));
                    DC(int64(0x1a494c3f7de95f8c), EConversationDebugInfo::Done);
                    DC(int64(0x1a494c3f7de95f8e), EConversationDebugInfo::Executing);
                    // Come back when you have them. 
                    Saturas.AI.Say(LocText("TEXT_DDIAZ_20231212_161035"));
                    DC(int64(0x1a494c3f7de95f8e), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dfc), EConversationDebugInfo::Executing);
                    G1R.Saturas_BringFoci = 2;
                    DC(int64(0x64682365a32f9dfc), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_92703_exit_1");
                }
                else if (G1R.Saturas_BringFoci == 2)
                {
                    DC(int64(0xadfaf3150bc994a1), EConversationDebugInfo::Executing);
                    // That still leaves two foci to be found. You know where ...
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104421_41"));
                    DC(int64(0xadfaf3150bc994a1), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9e02), EConversationDebugInfo::Executing);
                    G1R.Saturas_BringFoci = 3;
                    DC(int64(0x64682365a32f9e02), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_92703_exit_2");
                }
                else if (G1R.Saturas_BringFoci == 3)
                {
                    DC(int64(0xadfaf3150bc994a7), EConversationDebugInfo::Executing);
                    // With this one, we have four foci in our possession. What ...
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104509_2083"));
                    DC(int64(0xadfaf3150bc994a7), EConversationDebugInfo::Done);
                    DC(int64(0xadfaf3150bc994a8), EConversationDebugInfo::Executing);
                    // Just one more to go. 
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104529"));
                    DC(int64(0xadfaf3150bc994a8), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9e08), EConversationDebugInfo::Executing);
                    G1R.Saturas_BringFoci = 4;
                    DC(int64(0x64682365a32f9e08), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_92703_exit_3");
                }
                else if (G1R.Saturas_BringFoci == 4)
                {
                    DC(int64(0xadfaf3150bc994ad), EConversationDebugInfo::Executing);
                    // That concludes our search. I can't tell you enough how ...
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104604_2238"));
                    DC(int64(0xadfaf3150bc994ad), EConversationDebugInfo::Done);
                    DC(int64(0xadfaf3150bc994ae), EConversationDebugInfo::Executing);
                    // Ah, well. I'm rambling. Go find Cronos and Riordian, ...
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104614"));
                    DC(int64(0xadfaf3150bc994ae), EConversationDebugInfo::Done);
                    DC(int64(0xadfaf3150bc994b0), EConversationDebugInfo::Executing);
                    // Once you're ready, let's talk. I'm afraid there's one ...
                    Saturas.AI.Say(LocText("TEXT_USUARIO_20231213_104628"));
                    DC(int64(0xadfaf3150bc994b0), EConversationDebugInfo::Done);
                    DC(int64(0x9e2e3de1230b882a), EConversationDebugInfo::Executing);
                    
                    // There always is. 
                    Hero.AI.Say(LocText("TEXT_WIP_UOQECXC_20240423_135439"));
                    DC(int64(0x9e2e3de1230b882a), EConversationDebugInfo::Done);
                    DC(int64(0x9e2e3de1230b882b), EConversationDebugInfo::Executing);
                    
                    // (snorts) The plight of the competent. 
                    Saturas.AI.Say(LocText("TEXT_WIP_UOQECXC_20240423_135511"));
                    DC(int64(0x9e2e3de1230b882b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_End);
                    DC(int64(0x64682365a32f9e0e), EConversationDebugInfo::Executing);
                    G1R.Saturas_BringFoci = 5;
                    DC(int64(0x64682365a32f9e0e), EConversationDebugInfo::Done);
                    DC(int64(0xfc2c77dc4d727d03), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_FOCUS.SucceedQuest();
                    DC(int64(0xfc2c77dc4d727d03), EConversationDebugInfo::Done);
                    DC(int64(0xa326d2a684224b7e), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.SucceedQuest();
                    DC(int64(0xa326d2a684224b7e), EConversationDebugInfo::Done);
                    DC(int64(0x1a0c7e304e9b5630), EConversationDebugInfo::Executing);
                    G1R.WaterMaguesPermission = 1;
                    DC(int64(0x1a0c7e304e9b5630), EConversationDebugInfo::Done);
                    DC(int64(0xde2da8b75592ffac), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Lee))) { Lee.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Lee_700_Ncreport); }
                    DC(int64(0xde2da8b75592ffac), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_92703_exit_3");
                    DC(int64(0xc002ec0bd95de03), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc002ec0bd95de03), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_saturas_92703_exit_5");
                }
            }
        }
        
        
        class UChoiceSaturas97988 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x7c4e575cc133daa0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSaturas97988);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_CAKMKKE_20240524_125842_2238"), int64(0x7c4e575cc133daa0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2068), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c4e575cc133dab9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lee))) { Lee.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Lee_700_Damnpast); }
                DC(int64(0x7c4e575cc133dab9), EConversationDebugInfo::Done);
                DC(int64(0x364bea57672e0cb8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rogue04))) { Rogue04.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue04_807_Start); }
                DC(int64(0x364bea57672e0cb8), EConversationDebugInfo::Done);
                DC(int64(0xee660343e7b62f9e), EConversationDebugInfo::Executing);
                G1R.WaterMaguesTeleportBlocked = 0;
                DC(int64(0xee660343e7b62f9e), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c206a), EConversationDebugInfo::Executing);
                // Adanos be praised, you're back. Please tell me you have ...
                Saturas.AI.Say(LocText("INFO_SATURAS_AMBUSH_14_01"));
                DC(int64(0x8840daf1ff7c206a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasAllfoci : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c204a);
            default Caption = LocText("INFO_SATURAS_ALLFOCI_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasAllfoci);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c204b), G1R.Saturas_BringFoci == 5);
                    DB(int64(0x8840daf1ff7c204c), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (G1R.Saturas_BringFoci != 5)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c204d), EConversationDebugInfo::Executing);
                
                // What else do you need to blow up the ore pile?
                Hero.AI.Say(LocText("INFO_SATURAS_ALLFOCI_15_01"));
                DC(int64(0x8840daf1ff7c204d), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c204e), EConversationDebugInfo::Executing);
                
                // I'll make it brief.
                Saturas.AI.Say(LocText("INFO_SATURAS_ALLFOCI_14_02"));
                DC(int64(0x8840daf1ff7c204e), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c204f), EConversationDebugInfo::Executing);
                // The focus stones will allow us to channel the magic of ...
                Saturas.AI.Say(LocText("INFO_SATURAS_ALLFOCI_14_03"));
                DC(int64(0x8840daf1ff7c204f), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2050), EConversationDebugInfo::Executing);
                // That's why we need help. 
                Saturas.AI.Say(LocText("INFO_SATURAS_ALLFOCI_14_04"));
                DC(int64(0x8840daf1ff7c2050), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2051), EConversationDebugInfo::Executing);
                
                // The Fire Mages. 
                Hero.AI.Say(LocText("INFO_SATURAS_ALLFOCI_15_05"));
                DC(int64(0x8840daf1ff7c2051), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2052), EConversationDebugInfo::Executing);
                
                // Correct. They've become ... disillusioned. 
                Saturas.AI.Say(LocText("INFO_SATURAS_ALLFOCI_14_06"));
                DC(int64(0x8840daf1ff7c2052), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d2f), EConversationDebugInfo::Executing);
                // That's why we split up all that time ago: they had made ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_130515"));
                DC(int64(0xf920f4862ea37d2f), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d30), EConversationDebugInfo::Executing);
                // That day, my friend, is now. Make Corristo see this and ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_130753"));
                DC(int64(0xf920f4862ea37d30), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_Start);
                Subdialog(
                    UTopic_Saturas_99717,
                    UTopic_Saturas_100211,
                    UTopic_Saturas_100439,
                    UTopic_Saturas_99737
                );
            }
        }
        
        
        class UTopic_Saturas_99717 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xf920f4862ea37d32);
            default Caption = LocText("TEXT_WIP_IKRDULC_20240508_130901_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_99717);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf920f4862ea37d33), EConversationDebugInfo::Executing);
                // Will Gomez go along with this?
                Hero.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_130901_41"));
                DC(int64(0xf920f4862ea37d33), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d91), EConversationDebugInfo::Executing);
                
                // Almost certainly not. His power depends on that Barrier ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_130918"));
                DC(int64(0xf920f4862ea37d91), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d93), EConversationDebugInfo::Executing);
                // They're powerful, and as long as they're willing to ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131012"));
                DC(int64(0xf920f4862ea37d93), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d94), EConversationDebugInfo::Executing);
                // All we need is for Corristo to regain his faith in a ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131022"));
                DC(int64(0xf920f4862ea37d94), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d35), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf920f4862ea37d35), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_100211 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xf920f4862ea37d95);
            default Caption = LocText("TEXT_WIP_IKRDULC_20240508_131050_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_100211);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf920f4862ea37d96), EConversationDebugInfo::Executing);
                // What if he says no?
                Hero.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131050_1924"));
                DC(int64(0xf920f4862ea37d96), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37db6), EConversationDebugInfo::Executing);
                
                // Then there's only one more person we can ask. 
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131118"));
                DC(int64(0xf920f4862ea37db6), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37db7), EConversationDebugInfo::Executing);
                // I'll pray to Adanos we won't have to. 
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131132"));
                DC(int64(0xf920f4862ea37db7), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37d98), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf920f4862ea37d98), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_100439 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xf920f4862ea37db8);
            default Caption = LocText("TEXT_WIP_IKRDULC_20240508_131153_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_100439);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf920f4862ea37db9), EConversationDebugInfo::Executing);
                // What makes you think he'd listen to me?
                Hero.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131153_2785"));
                DC(int64(0xf920f4862ea37db9), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37dd9), EConversationDebugInfo::Executing);
                
                // Frankly, I don't know if he will. 
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131206"));
                DC(int64(0xf920f4862ea37dd9), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37dda), EConversationDebugInfo::Executing);
                // But you've succeeded before where others have failed, ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131257"));
                DC(int64(0xf920f4862ea37dda), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37ddb), EConversationDebugInfo::Executing);
                // Let's hope this will be enough to sway him. 
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131442"));
                DC(int64(0xf920f4862ea37ddb), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37dbb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf920f4862ea37dbb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_99737 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xf920f4862ea37d36);
            default Caption = LocText("TEXT_WIP_IKRDULC_20240508_130901_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_99737);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf920f4862ea37d37), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_130901_2238"));
                DC(int64(0xf920f4862ea37d37), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37ddc), EConversationDebugInfo::Executing);
                
                // Good. Adanos guide your steps.
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_131454"));
                DC(int64(0xf920f4862ea37ddc), EConversationDebugInfo::Done);
                DC(int64(0xf974142bee5d9f6f), EConversationDebugInfo::Executing);
                G1R.AfterSaturasFocusCompleted();
                DC(int64(0xf974142bee5d9f6f), EConversationDebugInfo::Done);
                DC(int64(0x1a789642623074b8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.StartQuest();
                DC(int64(0x1a789642623074b8), EConversationDebugInfo::Done);
                DC(int64(0x1fd7cc0387a7bcaa), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_Ncreport);
                DC(int64(0x1fd7cc0387a7bcaa), EConversationDebugInfo::Done);
                DC(int64(0x2fab0830121ab14f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2fab0830121ab14f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSaturasBringfocus2 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2029);
            default Caption = LocText("INFO_SATURAS_BRINGFOCUS2_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasBringfocus2);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c202a), Hero != nullptr && Hero.HasItem(UItMs_Focus_02, 1, 0));
                    DB(int64(0x8840daf1ff7c202b), G1R.Saturas_BringFoci > 0);
                    DB(int64(0xc93f4123f3e7d55f), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_02, 1, 0))
                    return false;
                
                if (G1R.Saturas_BringFoci <= 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c202d), EConversationDebugInfo::Executing);
                // Here - the focus stone from the canyon. 
                Hero.AI.Say(LocText("INFO_SATURAS_BRINGFOCUS2_15_01"));
                DC(int64(0x8840daf1ff7c202d), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37c9b), EConversationDebugInfo::Executing);
                
                // Let me see ... I'm impressed. How did you get past the ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_124539"));
                DC(int64(0xf920f4862ea37c9b), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37c9c), EConversationDebugInfo::Executing);
                
                // Milten had a trick up his sleeve.
                Hero.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_124603"));
                DC(int64(0xf920f4862ea37c9c), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37c9d), EConversationDebugInfo::Executing);
                
                // The young Fire Mage? I see. 
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_124611"));
                DC(int64(0xf920f4862ea37c9d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TROLLCANYON, Document::UDocumentSegment_CH3_TROLLCANYON_End);
                DB(int64(0xfe6cd284cda5ce3d), Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted());
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted())
                {
                    DC(int64(0xfe6cd284cda5ccdd), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_TcAltar); }
                    DC(int64(0xfe6cd284cda5ccdd), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9d86), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9d86), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9d88), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_02, 1);
                    DC(int64(0x64682365a32f9d88), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9d8a), EConversationDebugInfo::Executing);
                    Saturas.RemoveItemFromInventory(UItMs_Focus_02, 1, 0);
                    DC(int64(0x64682365a32f9d8a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus2_exit_1");
                }
                else
                {
                    DC(int64(0x64682365a32f9d86), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_TROLLCANYON_TROLLCANYON_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9d86), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9d88), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_02, 1);
                    DC(int64(0x64682365a32f9d88), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9d8a), EConversationDebugInfo::Executing);
                    Saturas.RemoveItemFromInventory(UItMs_Focus_02, 1, 0);
                    DC(int64(0x64682365a32f9d8a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus2_exit_2");
                }
            }
        }
        
        
        class UChoiceSaturasBringfocus3 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2031);
            default Caption = LocText("INFO_SATURAS_BRINGFOCUS3_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasBringfocus3);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2032), Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0));
                    DB(int64(0x8840daf1ff7c2033), G1R.Saturas_BringFoci > 0);
                    DB(int64(0xc93f4123f3e7d55e), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_03, 1, 0))
                    return false;
                
                if (G1R.Saturas_BringFoci <= 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2035), EConversationDebugInfo::Executing);
                // I have another focus for you. This one's from the ...
                Hero.AI.Say(LocText("INFO_SATURAS_BRINGFOCUS3_15_01"));
                DC(int64(0x8840daf1ff7c2035), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37c99), EConversationDebugInfo::Executing);
                
                // Ah ... the old ore baron's abode. I often wonder what ...
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_124435"));
                DC(int64(0xf920f4862ea37c99), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_End);
                DB(int64(0xfe6cd284cda5ccab), Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted());
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted())
                {
                    DC(int64(0xfe6cd284cda5ccdd), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book); }
                    DC(int64(0xfe6cd284cda5ccdd), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dbb), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9dbb), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dbd), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_03, 1);
                    DC(int64(0x64682365a32f9dbd), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dbf), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMs_Focus_03, 1, 0);
                    DC(int64(0x64682365a32f9dbf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus3_exit_1");
                }
                else
                {
                    DC(int64(0x64682365a32f9dbb), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9dbb), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dbd), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_03, 1);
                    DC(int64(0x64682365a32f9dbd), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9dbf), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMs_Focus_03, 1, 0);
                    DC(int64(0x64682365a32f9dbf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus3_exit_2");
                }
            }
        }
        
        
        class UChoiceSaturasBringfocus4 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2039);
            default Caption = LocText("INFO_SATURAS_BRINGFOCUS4_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasBringfocus4);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c203a), Hero != nullptr && Hero.HasItem(UItMs_Focus_04, 1, 0));
                    DB(int64(0x8840daf1ff7c203b), G1R.Saturas_BringFoci > 0);
                    DB(int64(0xc93f4123f3e7d55d), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_04, 1, 0))
                    return false;
                
                if (G1R.Saturas_BringFoci <= 0)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c203d), EConversationDebugInfo::Executing);
                // Here - the focus stone from the old monastery.
                Hero.AI.Say(LocText("INFO_SATURAS_BRINGFOCUS4_15_01"));
                DC(int64(0x8840daf1ff7c203d), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c203e), EConversationDebugInfo::Executing);
                // One of your mercenaries, Gorn - he helped me search for ...
                Hero.AI.Say(LocText("INFO_SATURAS_BRINGFOCUS4_15_02"));
                DC(int64(0x8840daf1ff7c203e), EConversationDebugInfo::Done);
                DC(int64(0xf920f4862ea37c98), EConversationDebugInfo::Executing);
                
                // And he did well to do so.
                Saturas.AI.Say(LocText("TEXT_WIP_IKRDULC_20240508_124349"));
                DC(int64(0xf920f4862ea37c98), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_MONASTERYRUIN, Document::UDocumentSegment_CH3_MONASTERYRUIN_End);
                DB(int64(0xfe6cd284cda5caaf), Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted());
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP.HasBeenStarted())
                {
                    DC(int64(0xfe6cd284cda5cac7), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_Ruinstay); }
                    DC(int64(0xfe6cd284cda5cac7), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9df0), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9df0), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9df2), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_04, 1);
                    DC(int64(0x64682365a32f9df2), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9df4), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMs_Focus_04, 1, 0);
                    DC(int64(0x64682365a32f9df4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus4_exit_1");
                }
                else
                {
                    DC(int64(0x64682365a32f9df0), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_MONASTERYRUIN_MONASTERYRUIN_OBJ_SATURAS.SucceedQuest();
                    DC(int64(0x64682365a32f9df0), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9df2), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Saturas, UItMs_Focus_04, 1);
                    DC(int64(0x64682365a32f9df2), EConversationDebugInfo::Done);
                    DC(int64(0x64682365a32f9df4), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItMs_Focus_04, 1, 0);
                    DC(int64(0x64682365a32f9df4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_saturas_bringfocus4_exit_2");
                }
            }
        }
        
        
        class UChoiceSaturasBringfocus5 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2042);
            default Caption = LocText("INFO_SATURAS_BRINGFOCUS5_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasBringfocus5);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2043), Hero != nullptr && Hero.HasItem(UItMs_Focus_05, 1, 0));
                    DB(int64(0x8840daf1ff7c2044), G1R.Saturas_BringFoci > 0);
                    DB(int64(0x8840daf1ff7c2045), Quest::OldCamp_OCCHAPTER3_STONEHENGE != nullptr && Quest::OldCamp_OCCHAPTER3_STONEHENGE.IsRunning());
                    DB(int64(0xc93f4123f3e7d55c), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_05, 1, 0))
                    return false;
                
                if (G1R.Saturas_BringFoci <= 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_STONEHENGE != nullptr && !Quest::OldCamp_OCCHAPTER3_STONEHENGE.IsRunning())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2046), EConversationDebugInfo::Executing);
                // I found the focus stone at the stonehenge. 
                Hero.AI.Say(LocText("INFO_SATURAS_BRINGFOCUS5_15_01"));
                DC(int64(0x8840daf1ff7c2046), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb88114661a), EConversationDebugInfo::Executing);
                
                // So you have. I'm inclined to ask how you dealt with ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_153710"));
                DC(int64(0xe6361cb88114661a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_STONEHENGE, Document::UDocumentSegment_CH3_STONEHENGE_End);
                DC(int64(0x64682365a32f9e26), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS.SucceedQuest();
                DC(int64(0x64682365a32f9e26), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e28), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Saturas, UItMs_Focus_05, 1);
                DC(int64(0x64682365a32f9e28), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e2a), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMs_Focus_05, 1, 0);
                DC(int64(0x64682365a32f9e2a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasExit : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c1fd3);
            default Caption = LocText("TEXT_DDIAZ_20231219_132411");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64682365a32fe475), EConversationDebugInfo::Executing);
                // So long.  
                Hero.AI.Say(LocText("TEXT_DDIAZ_20231219_132411"));
                DC(int64(0x64682365a32fe475), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c1fd4), EConversationDebugInfo::Executing);
                
                // Don't die.
                Saturas.AI.Say(LocText("INFO_SATURAS_EXIT_14_01"));
                DC(int64(0x8840daf1ff7c1fd4), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c1fd5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8840daf1ff7c1fd5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSaturasIntruder : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c1fd6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c1fd7), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x8840daf1ff7c1fd8), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe0e28b2386f6a9c6), EConversationDebugInfo::Executing);
                // What by Adanos are you doing here? Get out, right now!
                Saturas.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_170411"));
                DC(int64(0xe0e28b2386f6a9c6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_SATURAS, Document::UDocumentSegment_Glossary_NC_KDW_SATURAS_Introduction);
                DC(int64(0x8840daf1ff7c1fda), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8840daf1ff7c1fda), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSaturasMurder : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2074);
            default Caption = LocText("INFO_SATURAS_MURDER_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasMurder);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2075), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.HasSucceeded());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2076), EConversationDebugInfo::Executing);
                // Gomez murdered the Fire Mages. All but Milten. 
                Hero.AI.Say(LocText("INFO_SATURAS_MURDER_15_01"));
                DC(int64(0x8840daf1ff7c2076), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2077), EConversationDebugInfo::Executing);
                
                // This is a bad time for jokes.
                Saturas.AI.Say(LocText("INFO_SATURAS_MURDER_14_02"));
                DC(int64(0x8840daf1ff7c2077), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2078), EConversationDebugInfo::Executing);
                
                // I'm not joking. He didn't want the fire mages joining ...
                Hero.AI.Say(LocText("INFO_SATURAS_MURDER_15_03"));
                DC(int64(0x8840daf1ff7c2078), EConversationDebugInfo::Done);
                DC(int64(0x26601998927be278), EConversationDebugInfo::Executing);
                // He was wearing this armor that protected him from their ...
                Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_191848"));
                DC(int64(0x26601998927be278), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2079), EConversationDebugInfo::Executing);
                
                // The ore armor. By Adanos, I ... I can't believe this. ...
                Saturas.AI.Say(LocText("INFO_SATURAS_MURDER_14_04"));
                DC(int64(0x8840daf1ff7c2079), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c207a), EConversationDebugInfo::Executing);
                // I presume you already know what happened at the New ...
                Saturas.AI.Say(LocText("INFO_SATURAS_MURDER_14_05"));
                DC(int64(0x8840daf1ff7c207a), EConversationDebugInfo::Done);
                DC(int64(0xee660343e7b518a5), EConversationDebugInfo::Executing);
                
                // Gomez raided the New Mine. 
                Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192001"));
                DC(int64(0xee660343e7b518a5), EConversationDebugInfo::Done);
                DC(int64(0xee660343e7b518a6), EConversationDebugInfo::Executing);
                
                // Indeed. 
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192151"));
                DC(int64(0xee660343e7b518a6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_End);
                DB(int64(0x26601998927be28e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x26601998927be2b5), EConversationDebugInfo::Executing);
                    // Did you know about that?
                    Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192107"));
                    DC(int64(0x26601998927be2b5), EConversationDebugInfo::Done);
                    DC(int64(0x26601998927be2b6), EConversationDebugInfo::Executing);
                    
                    // Would I be standing here if I did?
                    Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192107_41"));
                    DC(int64(0x26601998927be2b6), EConversationDebugInfo::Done);
                    DC(int64(0x26601998927be3e7), EConversationDebugInfo::Executing);
                    
                    // I suppose not. 
                    Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192541"));
                    DC(int64(0x26601998927be3e7), EConversationDebugInfo::Done);
                }
                DC(int64(0x26601998927be2ca), EConversationDebugInfo::Executing);
                // This is dire. Without Corristo and the Fire Mages, we ...
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192112"));
                DC(int64(0x26601998927be2ca), EConversationDebugInfo::Done);
                DC(int64(0x26601998927be436), EConversationDebugInfo::Executing);
                // I suppose we have no choice but to contact HIM. 
                Saturas.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_192647"));
                DC(int64(0x26601998927be436), EConversationDebugInfo::Done);
                DB(int64(0x40045a9bc4664c88), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded());
                DB(int64(0x2025494ce476f58d), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded());
                DB(int64(0x24cdcdda2260fdb2), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasFailed());
                DB(int64(0xf0c9d4e4e04bf669), OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf66a), OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf66b), OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf66d), Arto != nullptr && Arto.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf66e), Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf66f), Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf670), Raven != nullptr && Raven.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf671), Scar != nullptr && Scar.IsEveryoneOfThisKindDead());
                DB(int64(0xf0c9d4e4e04bf683), Hero != nullptr && Hero.IsInConversation());
                DB(int64(0x6c528962981d5b0f), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                
                if ((Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded()) || ((Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded() && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasFailed())) || ((OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead() && OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead() && OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead() && Arto != nullptr && Arto.IsEveryoneOfThisKindDead() && Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead() && Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead() && Raven != nullptr && Raven.IsEveryoneOfThisKindDead() && Scar != nullptr && Scar.IsEveryoneOfThisKindDead() && Hero != nullptr && Hero.IsInConversation() && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted())))
                {
                    
                }
                else
                {
                    DC(int64(0x40045a9bc4664cb2), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Velaya))) { Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_Finale); }
                    DC(int64(0x40045a9bc4664cb2), EConversationDebugInfo::Done);
                    DC(int64(0x40045a9bc4664cde), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Seraphia))) { Seraphia.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Finale); }
                    DC(int64(0x40045a9bc4664cde), EConversationDebugInfo::Done);
                    DC(int64(0x40045a9bc4664ce0), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Gomez))) { Gomez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Gomez_100_Ot); }
                    DC(int64(0x40045a9bc4664ce0), EConversationDebugInfo::Done);
                    DC(int64(0x40045a9bc4664ce2), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Syra))) { Syra.NPCState.RemoveFromWorld(); }
                    DC(int64(0x40045a9bc4664ce2), EConversationDebugInfo::Done);
                    DC(int64(0xf9dd277662800cb8), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("DreamedLand_Syra");
                    DC(int64(0xf9dd277662800cb8), EConversationDebugInfo::Done);
                }
                DC(int64(0x64682365a32f9e58), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_INFORM.SucceedQuest();
                DC(int64(0x64682365a32f9e58), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b564d), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b564d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasNews : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c1fdb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceSaturasNews);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x50028f2ea692bed6), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x50028f2ea692c0eb), Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC != nullptr && Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC != nullptr && !Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c1fde), EConversationDebugInfo::Executing);
                // So - Y'Berion is dead? 
                Saturas.AI.Say(LocText("INFO_SATURAS_NEWS_14_02"));
                DC(int64(0x8840daf1ff7c1fde), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881145e6f), EConversationDebugInfo::Executing);
                
                // You're well informed. 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_123329"));
                DC(int64(0xe6361cb881145e6f), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881145e70), EConversationDebugInfo::Executing);
                
                // It's tragic and troubling, especially all this about ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_123509"));
                DC(int64(0xe6361cb881145e70), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb88114622e), EConversationDebugInfo::Executing);
                // Anyway, this is not why you're here. The focus stone. ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_134525"));
                DC(int64(0xe6361cb88114622e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_SATURAS, Document::UDocumentSegment_Glossary_NC_KDW_SATURAS_Introduction);
                Subdialog(
                    UTopic_Saturas_93595,
                    UTopic_Saturas_93575
                );
            }
        }
        
        
        class UTopic_Saturas_93595 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb881145f2b);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_124049_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_93595);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb881145f2c), EConversationDebugInfo::Executing);
                // Why should I tell you? 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_124049_3286"));
                DC(int64(0xe6361cb881145f2c), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881145f55), EConversationDebugInfo::Executing);
                
                // (sighs) What? You really want to-
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_124217"));
                DC(int64(0xe6361cb881145f55), EConversationDebugInfo::Done);
                DC(int64(0x691c508cd055b7b9), EConversationDebugInfo::Executing);
                // Well ... all right, then: You want out of this barrier ...
                Saturas.AI.Say(LocText("TEXT_WIP_EPPMLJK_20241003_143419"));
                DC(int64(0x691c508cd055b7b9), EConversationDebugInfo::Done);
                DB(int64(0xe6361cb8811460ac), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xe6361cb8811460f6), EConversationDebugInfo::Executing);
                    // I'm surprised I even have to tell you this. One would ...
                    Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131010_3569"));
                    DC(int64(0xe6361cb8811460f6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe6361cb88114611c), EConversationDebugInfo::Executing);
                    // Turn it as you will, this is a mutual goal - one worth ...
                    Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131013_2801"));
                    DC(int64(0xe6361cb88114611c), EConversationDebugInfo::Done);
                }
                DC(int64(0xe6361cb881146143), EConversationDebugInfo::Executing);
                // So, let me try again: how did you get past the focus ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131306_443"));
                DC(int64(0xe6361cb881146143), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb88114618c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6361cb88114618c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_93575 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb881145f27);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_124049_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_93575);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5a4a4b23df110089), EConversationDebugInfo::Executing);
                // With this amulet. I found it in some tomb.
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_124049_2785"));
                DC(int64(0x5a4a4b23df110089), EConversationDebugInfo::Done);
                DC(int64(0x5a4a4b23df1100a1), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowAmulet);
                DC(int64(0x5a4a4b23df1100a1), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881145f54), EConversationDebugInfo::Executing);
                // ... Anulment magic. Fascinating. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_124136"));
                DC(int64(0xe6361cb881145f54), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461b1), EConversationDebugInfo::Executing);
                
                // You know how it works? 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131427"));
                DC(int64(0xe6361cb8811461b1), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461b2), EConversationDebugInfo::Executing);
                
                // More or less. It's a rare kind of power that can banish ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131439"));
                DC(int64(0xe6361cb8811461b2), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461b4), EConversationDebugInfo::Executing);
                // Either way, it doesn't matter for now. If this amulet ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_131700"));
                DC(int64(0xe6361cb8811461b4), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461b6), EConversationDebugInfo::Executing);
                // I want you to retrieve the focus stones for us. With ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_132219"));
                DC(int64(0xe6361cb8811461b6), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Saturas_101094,
                    UTopic_Saturas_101114,
                    UTopic_Saturas_104009,
                    UTopic_Saturas_104029,
                    UTopic_Saturas_106411
                );
            }
        }
        
        
        class UTopic_Saturas_101094 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb8811461dc);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_132659_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_101094);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb8811461dd), EConversationDebugInfo::Executing);
                // Y'Berion thought the Sleeper powers this amulet. 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_132659_1769"));
                DC(int64(0xe6361cb8811461dd), EConversationDebugInfo::Done);
                DC(int64(0x5a4a4b23df110034), EConversationDebugInfo::Executing);
                
                // Y'Berion was an intelligent man blinded by his faith. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_134203"));
                DC(int64(0x5a4a4b23df110034), EConversationDebugInfo::Done);
                DC(int64(0x5a4a4b23df110035), EConversationDebugInfo::Executing);
                // Even if there's a connection between the Sleeper and the ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_134224"));
                DC(int64(0x5a4a4b23df110035), EConversationDebugInfo::Done);
                DC(int64(0x5a4a4b23df110036), EConversationDebugInfo::Executing);
                // I've seen one of these relics before. A long time ago, ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_134757"));
                DC(int64(0x5a4a4b23df110036), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461df), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6361cb8811461df), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_101114 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb8811461e0);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_132659_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_101114);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb8811461e1), EConversationDebugInfo::Executing);
                // Why does everyone want me to take care of their ...
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_132659_2995"));
                DC(int64(0xe6361cb8811461e1), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146230), EConversationDebugInfo::Executing);
                
                // Because you've proven that you have a way of solving ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_134918"));
                DC(int64(0xe6361cb881146230), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146231), EConversationDebugInfo::Executing);
                // It's simple: we need those focus stones, and you've ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135015"));
                DC(int64(0xe6361cb881146231), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146232), EConversationDebugInfo::Executing);
                // And you've also proven that you're a skilled fighter. It ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135423"));
                DC(int64(0xe6361cb881146232), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811461e3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6361cb8811461e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_104009 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb881146233);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_135548_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_104009);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe0e28b2386f6a9dd), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb881146234), EConversationDebugInfo::Executing);
                // Remind me about that plan of yours. You want to blow up ...
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135548_3750"));
                DC(int64(0xe6361cb881146234), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146284), EConversationDebugInfo::Executing);
                
                // I forget how new you are to all this. Yes, we do. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135853"));
                DC(int64(0xe6361cb881146284), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146285), EConversationDebugInfo::Executing);
                // Every nugget of blue ore holds magic - and since magic ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135916"));
                DC(int64(0xe6361cb881146285), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146289), EConversationDebugInfo::Executing);
                
                // Hence that pile of ore you've dug up. 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140541"));
                DC(int64(0xe6361cb881146289), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146286), EConversationDebugInfo::Executing);
                
                // That's right. We'll use the magic it contains to break ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135940"));
                DC(int64(0xe6361cb881146286), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146288), EConversationDebugInfo::Executing);
                // But the magic accumulated is much too strong - it's ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140244"));
                DC(int64(0xe6361cb881146288), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146283), EConversationDebugInfo::Executing);
                
                // Sounds risky. 
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135750"));
                DC(int64(0xe6361cb881146283), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb88114628a), EConversationDebugInfo::Executing);
                
                // It'll work. 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140626"));
                DC(int64(0xe6361cb88114628a), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb881146236), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6361cb881146236), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_104029 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb88114625b);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_135725_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_104029);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb88114625c), EConversationDebugInfo::Executing);
                // If the amulet destroys magic, can't it also destroy the ...
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_135725_731"));
                DC(int64(0xe6361cb88114625c), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811462b3), EConversationDebugInfo::Executing);
                
                // (snorts) No. The barrier's just too massive, and the ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140808"));
                DC(int64(0xe6361cb8811462b3), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811462b4), EConversationDebugInfo::Executing);
                // If the amulet is a drop of water, the Barrier is a ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140932"));
                DC(int64(0xe6361cb8811462b4), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb88114625e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6361cb88114625e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Saturas_106411 : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0xe6361cb88114628b);
            default Caption = LocText("TEXT_WIP_VOQECXC_20240422_140736_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Saturas_106411);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6361cb88114628c), EConversationDebugInfo::Executing);
                // I'll handle it. Where can I find those focus stones?
                Hero.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_140736_1340"));
                DC(int64(0xe6361cb88114628c), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbc17), EConversationDebugInfo::Executing);
                
                // They're scattered. You'll need help - from people who ...
                Saturas.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_135537"));
                DC(int64(0xecfb6fe4d4cbbc17), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ESCAPEPLANNC, Document::UDocumentSegment_CH3_ESCAPEPLANNC_End);
                DB(int64(0xecfb6fe4d4cbbc36), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xecfb6fe4d4cbbc71), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xecfb6fe4d4cbbc72), EConversationDebugInfo::Executing);
                    // That's what Lester meant ... 
                    Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_140242"));
                    DC(int64(0xecfb6fe4d4cbbc72), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_HelpSC);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0xecfb6fe4d4cbbd06), EConversationDebugInfo::Executing);
                    // That's what Gorn meant ... 
                    Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_140319"));
                    DC(int64(0xecfb6fe4d4cbbd06), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_HelpNC);
                }
                else
                {
                    DC(int64(0xecfb6fe4d4cbbd25), EConversationDebugInfo::Executing);
                    // That's what Diego meant ... 
                    Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_140323"));
                    DC(int64(0xecfb6fe4d4cbbd25), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_HelpOC);
                }
                DC(int64(0xe6361cb8811462b7), EConversationDebugInfo::Executing);
                // What was that? 
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_141124"));
                DC(int64(0xe6361cb8811462b7), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbdd8), EConversationDebugInfo::Executing);
                
                // Nothing. I know someone who'll help me. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_140526"));
                DC(int64(0xecfb6fe4d4cbbdd8), EConversationDebugInfo::Done);
                DC(int64(0xe6361cb8811463b6), EConversationDebugInfo::Executing);
                
                // Even better. Do you still have that first focus Y'Berion ...
                Saturas.AI.Say(LocText("TEXT_WIP_VOQECXC_20240422_144439"));
                DC(int64(0xe6361cb8811463b6), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be8067e6), EConversationDebugInfo::Executing);
                // Oh, and here - take this. It's a rune that will take you ...
                Saturas.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_131441"));
                DC(int64(0xd149ca31be8067e6), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbbdda), EConversationDebugInfo::Executing);
                // Now - good luck. Our freedom depends on you. 
                Saturas.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_140704"));
                DC(int64(0xecfb6fe4d4cbbdda), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Saturas.AddItemToInventory(UItAr_Rune_TeleportToMagiciansOfWater, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e8a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_LightHouse); }
                DC(int64(0x64682365a32f9e8a), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e8e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_LightHouse); }
                DC(int64(0x64682365a32f9e8e), EConversationDebugInfo::Done);
                DC(int64(0xba730b53702c7821), EConversationDebugInfo::Executing);
                Saturas.AI.GiveItemTo(Hero, UItAr_Rune_TeleportToMagiciansOfWater, 1);
                DC(int64(0xba730b53702c7821), EConversationDebugInfo::Done);
                DC(int64(0xbedc3965c4f12b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY15_732))) { NC_SLD_MERCENARY15_732.RemoveImmortality(); }
                DC(int64(0xbedc3965c4f12b), EConversationDebugInfo::Done);
                DC(int64(0xbedc3965c4f12d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY09_723))) { NC_SLD_MERCENARY09_723.RemoveImmortality(); }
                DC(int64(0xbedc3965c4f12d), EConversationDebugInfo::Done);
                DB(int64(0x8840daf1ff7c201d), GOLEM_STONE_BRIDGE != nullptr && GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead());
                
                if (GOLEM_STONE_BRIDGE != nullptr && GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead())
                {
                    
                }
                DC(int64(0x64682365a32f9e76), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LightHouse); }
                DC(int64(0x64682365a32f9e76), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e7a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_LightHouse); }
                DC(int64(0x64682365a32f9e7a), EConversationDebugInfo::Done);
                DB(int64(0xc563bd104bd8b3d6), Rodriguez != nullptr && !Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Kdfritual));
                
                if (Rodriguez != nullptr && !Rodriguez.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Rodriguez_400_Kdfritual))
                {
                    DC(int64(0xc563bd104bd8b404), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Door); }
                    DC(int64(0xc563bd104bd8b404), EConversationDebugInfo::Done);
                }
                DB(int64(0x8840daf1ff7c2024), TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead());
                
                if (TC_TROLLADULT_01 != nullptr && TC_TROLLADULT_01.IsEveryoneOfThisKindDead())
                {
                    
                }
                DC(int64(0x64682365a32f9e6c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC_ESCAPEPLANNC_OBJ_SATURAS.SucceedQuest();
                DC(int64(0x64682365a32f9e6c), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e6e), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI.StartQuest();
                DC(int64(0x64682365a32f9e6e), EConversationDebugInfo::Done);
                DC(int64(0x64682365a32f9e70), EConversationDebugInfo::Executing);
                G1R.Saturas_BringFoci = 0;
                DC(int64(0x64682365a32f9e70), EConversationDebugInfo::Done);
                DC(int64(0x91a034cd9ce0e62b), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_NoSeated);
                DC(int64(0x91a034cd9ce0e62b), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b55bb), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b55bb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasNowsld : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2104);
            default Caption = LocText("INFO_SATURAS_NOWSLD_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasNowsld);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2105), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasSucceeded());
                    DB(int64(0xb965a65bdefa8eb6), G1R != nullptr && !G1R.IsInChapter(6));
                    DB(int64(0x2c99cf2d7f6a6ee), G1R.PlaceholderCondition != 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.IsInChapter(6))
                    return false;
                
                if (G1R.PlaceholderCondition == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2106), EConversationDebugInfo::Executing);
                // Lee made me one of his mercenaries.
                Hero.AI.Say(LocText("INFO_SATURAS_NOWSLD_15_01"));
                DC(int64(0x8840daf1ff7c2106), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2107), EConversationDebugInfo::Executing);
                
                // Ah, good - very good. That officially makes you a member ...
                Saturas.AI.Say(LocText("INFO_SATURAS_NOWSLD_14_02"));
                DC(int64(0x8840daf1ff7c2107), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2108), EConversationDebugInfo::Executing);
                // Welcome to the winners, my friend.
                Saturas.AI.Say(LocText("INFO_SATURAS_NOWSLD_14_03"));
                DC(int64(0x8840daf1ff7c2108), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasXardas : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c210a);
            default Caption = LocText("INFO_SATURAS_XARDAS_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSaturasXardas);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_BPBBQAJ_20240613_192647"), int64(0x8840daf1ff7c210a));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c210b), EConversationDebugInfo::Executing);
                
                // When you sent me to the Fire Mages, you mentioned a ...
                Hero.AI.Say(LocText("INFO_SATURAS_XARDAS_15_01"));
                DC(int64(0x8840daf1ff7c210b), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c210c), EConversationDebugInfo::Executing);
                
                // So you remember. Of course. I was hoping we could do ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_02"));
                DC(int64(0x8840daf1ff7c210c), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c210d), EConversationDebugInfo::Executing);
                
                // Who is this man?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDAS_15_03"));
                DC(int64(0x8840daf1ff7c210d), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c210e), EConversationDebugInfo::Executing);
                
                // All right, all right.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_04"));
                DC(int64(0x8840daf1ff7c210e), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c210f), EConversationDebugInfo::Executing);
                // Many, many years ago ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_05"));
                DC(int64(0x8840daf1ff7c210f), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2110), EConversationDebugInfo::Executing);
                
                // The short version, please.
                Hero.AI.Say(LocText("INFO_SATURAS_XARDAS_15_06"));
                DC(int64(0x8840daf1ff7c2110), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2111), EConversationDebugInfo::Executing);
                
                // Patience. As you may have heard, we were eleven mages ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_07"));
                DC(int64(0x8840daf1ff7c2111), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2112), EConversationDebugInfo::Executing);
                
                // Six Fire Mages ... But Milten didn't become a Fire Mage ...
                Hero.AI.Say(LocText("INFO_SATURAS_XARDAS_15_08"));
                DC(int64(0x8840daf1ff7c2112), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2113), EConversationDebugInfo::Executing);
                
                // That's correct. The original sixth Fire Mage was someone ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_09"));
                DC(int64(0x8840daf1ff7c2113), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2115), EConversationDebugInfo::Executing);
                // He was - or rather, he IS - a complicated character. He ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDAS_14_11"));
                DC(int64(0x8840daf1ff7c2115), EConversationDebugInfo::Done);
                DC(int64(0xbc1f8e992105306e), EConversationDebugInfo::Executing);
                // His name is Xardas. 
                Saturas.AI.Say(LocText("TEXT_WIP_DPWDQLC_20240826_161414"));
                DC(int64(0xbc1f8e992105306e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_Start);
            }
        }
        
        
        class UChoiceSaturasXardasgo : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2137);
            default Caption = LocText("INFO_SATURAS_XARDASGO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasXardasproblem);
            default Rules.HideIfKnows(UChoiceSaturasXardasgo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2138), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2139), EConversationDebugInfo::Executing);
                // How can I prepare against those creatures of his?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASGO_15_01"));
                DC(int64(0x8840daf1ff7c2139), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c213a), EConversationDebugInfo::Executing);
                
                // I'd tell you if I knew.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASGO_14_02"));
                DC(int64(0x8840daf1ff7c213a), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c213b), EConversationDebugInfo::Executing);
                // But perhaps you'll find some answers in our library.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASGO_14_03"));
                DC(int64(0x8840daf1ff7c213b), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c213c), EConversationDebugInfo::Executing);
                // There are several tomes that deal with summoned ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASGO_14_04"));
                DC(int64(0x8840daf1ff7c213c), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c213d), EConversationDebugInfo::Executing);
                
                // I'll take a look. And don't worry -
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASGO_15_05"));
                DC(int64(0x8840daf1ff7c213d), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c213e), EConversationDebugInfo::Executing);
                // I'll be back.
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASGO_15_06"));
                DC(int64(0x8840daf1ff7c213e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasXardashelp : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2124);
            default Caption = LocText("INFO_SATURAS_XARDASHELP_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasXardaswhere, UChoiceSaturasXardaswhy);
            default Rules.HideIfKnows(UChoiceSaturasXardashelp);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2125), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2126), EConversationDebugInfo::Executing);
                // So you want me to find Xardas and ask him for help with ...
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASHELP_15_01"));
                DC(int64(0x8840daf1ff7c2126), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2127), EConversationDebugInfo::Executing);
                
                // I'm afraid he's the only one left. 
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASHELP_14_02"));
                DC(int64(0x8840daf1ff7c2127), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2128), EConversationDebugInfo::Executing);
                // If he won't help us ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASHELP_14_03"));
                DC(int64(0x8840daf1ff7c2128), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2129), EConversationDebugInfo::Executing);
                
                // He will. I'll talk to him. 
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASHELP_15_04"));
                DC(int64(0x8840daf1ff7c2129), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c212a), EConversationDebugInfo::Executing);
                
                // Adanos bless your optimism. However, there is one more ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASHELP_14_05"));
                DC(int64(0x8840daf1ff7c212a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_DiscoverXardas);
                DC(int64(0x64682365a32f9eb9), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_FINDXARDAS.StartQuest();
                DC(int64(0x64682365a32f9eb9), EConversationDebugInfo::Done);
                DC(int64(0x5bdb150b2df00610), EConversationDebugInfo::Executing);
                G1R.ChangeChapter(4);
                DC(int64(0x5bdb150b2df00610), EConversationDebugInfo::Done);
                DC(int64(0xf5c217f1eb9641d7), EConversationDebugInfo::Executing);
                Saturas.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Saturas_600_Start);
                DC(int64(0xf5c217f1eb9641d7), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b564f), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b564f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasXardasproblem : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c212e);
            default Caption = LocText("INFO_SATURAS_XARDASPROBLEM_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasXardashelp);
            default Rules.HideIfKnows(UChoiceSaturasXardasproblem);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c212f), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2130), EConversationDebugInfo::Executing);
                // What now?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_15_01"));
                DC(int64(0x8840daf1ff7c2130), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2131), EConversationDebugInfo::Executing);
                
                // We've tried to contact Xardas several times over the ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_14_02"));
                DC(int64(0x8840daf1ff7c2131), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2132), EConversationDebugInfo::Executing);
                // It seems he truly values his privacy.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_14_03"));
                DC(int64(0x8840daf1ff7c2132), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2133), EConversationDebugInfo::Executing);
                
                // What exactly does that mean?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_15_04"));
                DC(int64(0x8840daf1ff7c2133), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2134), EConversationDebugInfo::Executing);
                
                // That none of our couriers ever returned.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_14_05"));
                DC(int64(0x8840daf1ff7c2134), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2135), EConversationDebugInfo::Executing);
                // I'm assuming his creatures played a role in that. You'll ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_14_06"));
                DC(int64(0x8840daf1ff7c2135), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2136), EConversationDebugInfo::Executing);
                
                // At least it stays interesting.
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASPROBLEM_15_07"));
                DC(int64(0x8840daf1ff7c2136), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FINDXARDAS, Document::UDocumentSegment_CH4_FINDXARDAS_Golems);
            }
        }
        
        
        class UChoiceSaturasXardaswhere : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c2120);
            default Caption = LocText("INFO_SATURAS_XARDASWHERE_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasXardas);
            default Rules.HideIfKnows(UChoiceSaturasXardaswhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c2121), EConversationDebugInfo::Executing);
                // Where can I find him?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASWHERE_15_01"));
                DC(int64(0x8840daf1ff7c2121), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2122), EConversationDebugInfo::Executing);
                
                // He lives in a secluded tower right in the heart of the ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASWHERE_14_02"));
                DC(int64(0x8840daf1ff7c2122), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c2123), EConversationDebugInfo::Executing);
                // That's in the very south of the Colony.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASWHERE_14_03"));
                DC(int64(0x8840daf1ff7c2123), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSaturasXardaswhy : UTopic_Hero__NC_KDW_SATURAS_600
        {
            default DebugId = int64(0x8840daf1ff7c211a);
            default Caption = LocText("INFO_SATURAS_XARDASWHY_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSaturasXardas);
            default Rules.HideIfKnows(UChoiceSaturasXardaswhy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8840daf1ff7c211b), EConversationDebugInfo::Executing);
                
                // Why did this Xardas break with the path of Innos? 
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASWHY_15_01"));
                DC(int64(0x8840daf1ff7c211b), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c211c), EConversationDebugInfo::Executing);
                
                // Mostly due to his studies. After the formation of the ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASWHY_14_02"));
                DC(int64(0x8840daf1ff7c211c), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c211d), EConversationDebugInfo::Executing);
                // He didn't just unsettle Gomez and his men in doing that. ...
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASWHY_14_03"));
                DC(int64(0x8840daf1ff7c211d), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c211e), EConversationDebugInfo::Executing);
                
                // And so he left?
                Hero.AI.Say(LocText("INFO_SATURAS_XARDASWHY_15_04"));
                DC(int64(0x8840daf1ff7c211e), EConversationDebugInfo::Done);
                DC(int64(0x8840daf1ff7c211f), EConversationDebugInfo::Executing);
                
                // Exactly.
                Saturas.AI.Say(LocText("INFO_SATURAS_XARDASWHY_14_05"));
                DC(int64(0x8840daf1ff7c211f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */