#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_WOLF_855 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_WOLF_855";
        }
        
        
        class UTopic_Hero__NC_ORG_WOLF_855 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_WOLF_855";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetWolf() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg855WolfExit : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba42);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba43), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d2936a6af7eba43), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg855WolfSellbow : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7ebabd);
            default Caption = LocText("ORG_855_WOLF_SELLBOW_INFO_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfHello);
            default Rules.HideIfKnows(UChoiceOrg855WolfSellbow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7ebabe), EConversationDebugInfo::Executing);
                // Where can I get a bow around here?
                Hero.AI.Say(LocText("ORG_855_WOLF_SELLBOW_INFO_15_01"));
                DC(int64(0x3d2936a6af7ebabe), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebabf), EConversationDebugInfo::Executing);
                
                // From me. If the nuggs are right, I can make you whatever ...
                Wolf.AI.Say(LocText("ORG_855_WOLF_SELLBOW_INFO_09_02"));
                DC(int64(0x3d2936a6af7ebabf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WOLF, Document::UDocumentSegment_Glossary_NC_ORG_WOLF_TradeBow);
            }
        }
        
        
        class UChoiceOrg855WolfTrade : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba4a);
            default Caption = LocText("ORG_855_WOLF_TRADE_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba4b), EConversationDebugInfo::Executing);
                // Is armor all you trade in? 
                Hero.AI.Say(LocText("ORG_855_WOLF_TRADE_15_00"));
                DC(int64(0x3d2936a6af7eba4b), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba4c), EConversationDebugInfo::Executing);
                
                // Nah, I'd be broke if I did. I buy animal hides and ...
                Wolf.AI.Say(LocText("ORG_855_WOLF_TRADE_09_01"));
                DC(int64(0x3d2936a6af7eba4c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WOLF, Document::UDocumentSegment_Glossary_NC_ORG_WOLF_TradeSkins_Trader);
                DC(int64(0x4cf51b7fbcc010ab), EConversationDebugInfo::Executing);
                Wolf.AI.StartTradingWith(Hero);
                DC(int64(0x4cf51b7fbcc010ab), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg855WolfTrain : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba5d);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_2191");
            default PriorityRank = 2;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg855WolfTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba5e), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                    DB(int64(0xf8e1e94826260b3f), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba5f), EConversationDebugInfo::Executing);
                // Teach me archery.
                Hero.AI.Say(LocText("ORG_855_WOLF_TRAIN_INFO_15_01"));
                DC(int64(0x3d2936a6af7eba5f), EConversationDebugInfo::Done);
                DB(int64(0x15516e6848921fb5), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Trained))
                {
                    DB(int64(0x3d2936a6af7eba61), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Trained))
                    {
                        DC(int64(0xa7deef969d1dd717), EConversationDebugInfo::Executing);
                        // All right. 
                        Wolf.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_163720"));
                        DC(int64(0xa7deef969d1dd717), EConversationDebugInfo::Done);
                        DC(int64(0x3d2936a6af7eba63), EConversationDebugInfo::Executing);
                        // The biggest mistake almost every beginner makes is ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_12_01"));
                        DC(int64(0x3d2936a6af7eba63), EConversationDebugInfo::Done);
                        DC(int64(0x3d2936a6af7eba64), EConversationDebugInfo::Executing);
                        // Also, keep your shoulders relaxed - it's hard, but it'll ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_12_02"));
                        DC(int64(0x3d2936a6af7eba64), EConversationDebugInfo::Done);
                        DC(int64(0x93da39ba6ec8d3e4), EConversationDebugInfo::Executing);
                        // That should be enough for a start. Now practice, ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_12_03"));
                        DC(int64(0x93da39ba6ec8d3e4), EConversationDebugInfo::Done);
                        DC(int64(0x93da39ba6ec8d3e5), EConversationDebugInfo::Executing);
                        // You'll figure it out. 
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_12_04"));
                        DC(int64(0x93da39ba6ec8d3e5), EConversationDebugInfo::Done);
                        DC(int64(0x4cf51b7fbcc010b7), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Bow_Trained);
                        DC(int64(0x4cf51b7fbcc010b7), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_org_855_wolf_train_exit_1");
                        DC(int64(0x31cfd98d4dc07adc), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x31cfd98d4dc07adc), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xf8e1e94826260b43), EConversationDebugInfo::Executing);
                        // You're not ready yet, mate. Go practice and come back ...
                        Wolf.AI.Say(LocText("TEXT_DDIAZ_20231211_105608"));
                        DC(int64(0xf8e1e94826260b43), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_org_855_wolf_train_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x15516e6848921fc6), EConversationDebugInfo::Executing);
                    // Not without pay. Come back once you've got the ore.
                    Wolf.AI.Say(LocText("TEXT_WIP_LOJNYB_20250619_113933"));
                    DC(int64(0x15516e6848921fc6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_855_wolf_train_exit_3");
                }
            }
        }
        
        
        class UChoiceOrg855WolfTrainagain : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba66);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_3367");
            default PriorityRank = 2;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg855WolfTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba67), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                    DB(int64(0xf8e1e94826260b46), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba68), EConversationDebugInfo::Executing);
                // I want to become a better archer.
                Hero.AI.Say(LocText("ORG_855_WOLF_TRAINAGAIN_INFO_15_01"));
                DC(int64(0x3d2936a6af7eba68), EConversationDebugInfo::Done);
                DB(int64(0x15516e6848921f58), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Master));
                
                if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Master))
                {
                    DB(int64(0x3d2936a6af7eba6a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Master))
                    {
                        DC(int64(0x3d2936a6af7eba6c), EConversationDebugInfo::Executing);
                        // Fair enough. You've got some skill already, I can work ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_2_INFO_12_02"));
                        DC(int64(0x3d2936a6af7eba6c), EConversationDebugInfo::Done);
                        DC(int64(0x3d2936a6af7eba6d), EConversationDebugInfo::Executing);
                        // First of all, don't strain too much when you're aimin' - ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_2_INFO_12_03"));
                        DC(int64(0x3d2936a6af7eba6d), EConversationDebugInfo::Done);
                        DC(int64(0x3d2936a6af7eba6e), EConversationDebugInfo::Executing);
                        // Second, try to really root yourself to the ground when ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_2_INFO_12_04"));
                        DC(int64(0x3d2936a6af7eba6e), EConversationDebugInfo::Done);
                        DC(int64(0x3d2936a6af7eba6f), EConversationDebugInfo::Executing);
                        // Finally, control your breathin'. Hold it right until you ...
                        Wolf.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_2_INFO_12_05"));
                        DC(int64(0x3d2936a6af7eba6f), EConversationDebugInfo::Done);
                        DC(int64(0x4cf51b7fbcc010ca), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Bow_Master);
                        DC(int64(0x4cf51b7fbcc010ca), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_org_855_wolf_trainagain_exit_1");
                        DC(int64(0x31cfd98d4dc07af1), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x31cfd98d4dc07af1), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xf8e1e94826260b47), EConversationDebugInfo::Executing);
                        // You're not ready yet, mate. Go practice and come back ...
                        Wolf.AI.Say(LocText("TEXT_DDIAZ_20231211_105608"));
                        DC(int64(0xf8e1e94826260b47), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_org_855_wolf_trainagain_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x15516e6848921fac), EConversationDebugInfo::Executing);
                    // Not without pay. Come back once you've got the ore.
                    Wolf.AI.Say(LocText("TEXT_WIP_LOJNYB_20250619_113933"));
                    DC(int64(0x15516e6848921fac), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_855_wolf_trainagain_exit_3");
                }
            }
        }
        
        
        class UChoiceOrg855WolfTrainoffer : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba57);
            default Caption = LocText("ORG_855_WOLF_TRAINOFFER_INFO_15_01");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceOrg855WolfTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba58), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba59), EConversationDebugInfo::Executing);
                // You're an archer, right? Can you teach me a thing or ...
                Hero.AI.Say(LocText("ORG_855_WOLF_TRAINOFFER_INFO_15_01"));
                DC(int64(0x3d2936a6af7eba59), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba5a), EConversationDebugInfo::Executing);
                
                // Sure. Gotta charge you, though - a man has to eat, ...
                Wolf.AI.Say(LocText("ORG_855_WOLF_TRAINOFFER_INFO_09_02"));
                DC(int64(0x3d2936a6af7eba5a), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba5b), EConversationDebugInfo::Executing);
                
                // How much?
                Hero.AI.Say(LocText("ORG_855_WOLF_TRAINOFFER_INFO_15_03"));
                DC(int64(0x3d2936a6af7eba5b), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba5c), EConversationDebugInfo::Executing);
                
                // Fifty nuggs every lesson. No hagglin'.
                Wolf.AI.Say(LocText("ORG_855_WOLF_TRAINOFFER_INFO_09_04"));
                DC(int64(0x3d2936a6af7eba5c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WOLF, Document::UDocumentSegment_Glossary_NC_ORG_WOLF_TeachBow);
            }
        }
        
        
        class UChoiceOrg855WolfWherehunter : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba4e);
            default Caption = LocText("ORG_855_WOLF_WHEREHUNTER_15_00");
            default PriorityRank = 4;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("ORG_855_WOLF_TRADE_09_01"), int64(0x3d2936a6af7eba4e));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba4f), EConversationDebugInfo::Executing);
                // How do I get hides and skins?
                Hero.AI.Say(LocText("ORG_855_WOLF_WHEREHUNTER_15_00"));
                DC(int64(0x3d2936a6af7eba4f), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba50), EConversationDebugInfo::Executing);
                
                // Well, first off, you gotta know how to skin. Aidan, one ...
                Wolf.AI.Say(LocText("ORG_855_WOLF_WHEREHUNTER_09_01"));
                DC(int64(0x3d2936a6af7eba50), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba51), EConversationDebugInfo::Executing);
                // Or Ratford and Drax - they're usually knockin' about up ...
                Wolf.AI.Say(LocText("ORG_855_WOLF_WHEREHUNTER_09_02"));
                DC(int64(0x3d2936a6af7eba51), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_AIDAN, Document::UDocumentSegment_Glossary_UL_ORG_AIDAN_Teacher);
            }
        }
        
        
        class UChoiceWolfArmorfinished : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7ebab0);
            default Caption = LocText("INFO_WOLF_ARMORFINISHED_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceWolfArmorfinished);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7ebab1), G1R.MCPlatesDelivered != 0);
                    DB(int64(0x3d2936a6af7ebab2), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0x9e167951eb8411be), G1R.Wolf_Crafting_Armor.IsValid() && G1R.Wolf_Crafting_Armor.IsAtLeastXDaysAgo(1));
                }
                
                if (G1R.MCPlatesDelivered == 0)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R.Wolf_Crafting_Armor.IsValid() && !G1R.Wolf_Crafting_Armor.IsAtLeastXDaysAgo(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7ebab3), EConversationDebugInfo::Executing);
                // Any progress on that special armor?
                Hero.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_15_01"));
                DC(int64(0x3d2936a6af7ebab3), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebab4), EConversationDebugInfo::Executing);
                
                // Actually, yes - I found a way to connect the plates. ...
                Wolf.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_09_02"));
                DC(int64(0x3d2936a6af7ebab4), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebab5), EConversationDebugInfo::Executing);
                
                // So ...?
                Hero.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_15_03"));
                DC(int64(0x3d2936a6af7ebab5), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebab6), EConversationDebugInfo::Executing);
                
                // So, the thing's done, and it's tougher than just about ...
                Wolf.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_09_04"));
                DC(int64(0x3d2936a6af7ebab6), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebab7), EConversationDebugInfo::Executing);
                
                // Thanks! I owe you one.
                Hero.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_15_05"));
                DC(int64(0x3d2936a6af7ebab7), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebab8), EConversationDebugInfo::Executing);
                
                // Don't mention it. Good luck out there!
                Wolf.AI.Say(LocText("INFO_WOLF_ARMORFINISHED_09_06"));
                DC(int64(0x3d2936a6af7ebab8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_MCPLATEARMOR, Document::UDocumentSegment_CH4_MCPLATEARMOR_Completed);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Wolf.AddItemToInventory(UCrw_Armor_H, 1);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0x4cf51b7fbcc010e4), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT.SucceedQuest();
                DC(int64(0x4cf51b7fbcc010e4), EConversationDebugInfo::Done);
                DC(int64(0x4cf51b7fbcc010ea), EConversationDebugInfo::Executing);
                Wolf.AI.GiveItemTo(Hero, UCrw_Armor_H, 1);
                DC(int64(0x4cf51b7fbcc010ea), EConversationDebugInfo::Done);
                DC(int64(0x45b6742bd032c265), EConversationDebugInfo::Executing);
                Wolf.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wolf_855_Start);
                DC(int64(0x45b6742bd032c265), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWolfArmorinwork : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7ebaa9);
            default Caption = LocText("INFO_WOLF_ARMORINWORK_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7ebaaa), G1R.MCPlatesDelivered != 0);
                    DB(int64(0x3d2936a6af7ebaab), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0x40640248135ced94), G1R.Wolf_Crafting_Armor.IsValid() && G1R.Wolf_Crafting_Armor.IsLessThanXDaysAgo(1));
                    DB(int64(0x3d2936a6af7ebaaa), G1R.MCPlatesDelivered != 0);
                    DB(int64(0x3d2936a6af7ebaab), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0x40640248135ced94), G1R.Wolf_Crafting_Armor.IsValid() && G1R.Wolf_Crafting_Armor.IsLessThanXDaysAgo(1));
                }
                
                if (G1R.MCPlatesDelivered != 0 && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded() && G1R.Wolf_Crafting_Armor.IsValid() && G1R.Wolf_Crafting_Armor.IsLessThanXDaysAgo(1))
                    return true;
                
                if (G1R.MCPlatesDelivered != 0 && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded() && G1R.Wolf_Crafting_Armor.IsValid() && G1R.Wolf_Crafting_Armor.IsLessThanXDaysAgo(1))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7ebaac), EConversationDebugInfo::Executing);
                // How's the armor coming along? 
                Hero.AI.Say(LocText("INFO_WOLF_ARMORINWORK_15_01"));
                DC(int64(0x3d2936a6af7ebaac), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaad), EConversationDebugInfo::Executing);
                
                // Not quite there, mate. Those plates are bloody damn hard ...
                Wolf.AI.Say(LocText("INFO_WOLF_ARMORINWORK_09_02"));
                DC(int64(0x3d2936a6af7ebaad), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaae), EConversationDebugInfo::Executing);
                // But I will, sooner or later. 
                Wolf.AI.Say(LocText("INFO_WOLF_ARMORINWORK_09_03"));
                DC(int64(0x3d2936a6af7ebaae), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaaf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d2936a6af7ebaaf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWolfGreetorg : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba47);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceWolfGreetorg);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba48), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba49), EConversationDebugInfo::Executing);
                // Look at him - just got in and already one of us.
                Wolf.AI.Say(LocText("DIA_WOLF_GREETORG_09_00"));
                DC(int64(0x3d2936a6af7eba49), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b7cd), EConversationDebugInfo::Executing);
                // Good job, mate. 
                Wolf.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_175153"));
                DC(int64(0x233794188ff4b7cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWolfHello : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba44);
            default Caption = LocText("DIA_WOLF_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceWolfHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba45), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("DIA_WOLF_HELLO_15_00"));
                DC(int64(0x3d2936a6af7eba45), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba46), EConversationDebugInfo::Executing);
                
                // Wolf. I make the armors round here.
                Wolf.AI.Say(LocText("DIA_WOLF_HELLO_09_01"));
                DC(int64(0x3d2936a6af7eba46), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_WOLF, Document::UDocumentSegment_Glossary_NC_ORG_WOLF_Introduction_Armor);
            }
        }
        
        
        class UChoiceWolfMcplatesenough : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba9c);
            default Caption = LocText("INFO_WOLF_MCPLATESENOUGH_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfSkin);
            default Rules.HideIfKnows(UChoiceWolfMcplatesenough);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba9d), G1R.Knows_GetMCPlates != 0);
                    DB(int64(0x3d2936a6af7eba9e), Hero != nullptr && Hero.HasItem(UItAt_Crawler_02, 15, 0));
                    DB(int64(0x3d2936a6af7eba9f), Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR != nullptr && Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR.IsRunning());
                }
                
                if (G1R.Knows_GetMCPlates == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawler_02, 15, 0))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR != nullptr && !Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7ebaa0), EConversationDebugInfo::Executing);
                // I found some crawler plates. Is that enough? 
                Hero.AI.Say(LocText("INFO_WOLF_MCPLATESENOUGH_15_01"));
                DC(int64(0x3d2936a6af7ebaa0), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaa1), EConversationDebugInfo::Executing);
                
                // Look at that. Good job. I'll get right to it. 
                Wolf.AI.Say(LocText("INFO_WOLF_MCPLATESENOUGH_09_02"));
                DC(int64(0x3d2936a6af7ebaa1), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaa2), EConversationDebugInfo::Executing);
                
                // How long is it gonna take?
                Hero.AI.Say(LocText("INFO_WOLF_MCPLATESENOUGH_15_03"));
                DC(int64(0x3d2936a6af7ebaa2), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaa3), EConversationDebugInfo::Executing);
                
                // No clue, mate, I told you, this is a first.
                Wolf.AI.Say(LocText("INFO_WOLF_MCPLATESENOUGH_09_04"));
                DC(int64(0x3d2936a6af7ebaa3), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaa4), EConversationDebugInfo::Executing);
                // Just swing by whenever you're in the area. I'll work as ...
                Wolf.AI.Say(LocText("INFO_WOLF_MCPLATESENOUGH_09_05"));
                DC(int64(0x3d2936a6af7ebaa4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_MCPLATEARMOR, Document::UDocumentSegment_CH4_MCPLATEARMOR_Enough);
                DC(int64(0x4cf51b7fbcc0110c), EConversationDebugInfo::Executing);
                G1R.MCPlatesDelivered = 1;
                DC(int64(0x4cf51b7fbcc0110c), EConversationDebugInfo::Done);
                DC(int64(0x4cf51b7fbcc01110), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Wolf, UItAt_Crawler_02, 15);
                DC(int64(0x4cf51b7fbcc01110), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142628102b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_DELIVER.SucceedQuest();
                DC(int64(0x8c29f1142628102b), EConversationDebugInfo::Done);
                DC(int64(0x9e167951eb8411bd), EConversationDebugInfo::Executing);
                G1R.Wolf_Crafting_Armor = FInGameTime::Now();
                DC(int64(0x9e167951eb8411bd), EConversationDebugInfo::Done);
                DC(int64(0x45b6742bd032c263), EConversationDebugInfo::Executing);
                Wolf.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Wolf_855_CraftingArmor);
                DC(int64(0x45b6742bd032c263), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7ebaa8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d2936a6af7ebaa8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWolfMcplatesfew : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba95);
            default Caption = LocText("INFO_WOLF_MCPLATESFEW_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceWolfMcplatesfew);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba96), G1R.Knows_GetMCPlates != 0);
                    DB(int64(0x3d2936a6af7eba97), Hero != nullptr && Hero.HasItem(UItAt_Crawler_02, 1, 0));
                    DB(int64(0x3d2936a6af7eba98), Hero != nullptr && !Hero.HasItem(UItAt_Crawler_02, 15, 0));
                    DB(int64(0x40640248135cedaa), G1R.MCPlatesDelivered == 0);
                }
                
                if (G1R.Knows_GetMCPlates == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawler_02, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawler_02, 15, 0))
                    return false;
                
                if (G1R.MCPlatesDelivered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba99), EConversationDebugInfo::Executing);
                // I found some of those crawler plates.
                Hero.AI.Say(LocText("INFO_WOLF_MCPLATESFEW_15_01"));
                DC(int64(0x3d2936a6af7eba99), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba9a), EConversationDebugInfo::Executing);
                
                // Good, mate, but not enough for the armor.
                Wolf.AI.Say(LocText("INFO_WOLF_MCPLATESFEW_09_02"));
                DC(int64(0x3d2936a6af7eba9a), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba9b), EConversationDebugInfo::Executing);
                // Go find more.
                Wolf.AI.Say(LocText("INFO_WOLF_MCPLATESFEW_09_03"));
                DC(int64(0x3d2936a6af7eba9b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWolfProfit : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba92);
            default Caption = LocText("INFO_WOLF_PROFIT_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfSpeak);
            default Rules.HideIfKnows(UChoiceWolfProfit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba93), EConversationDebugInfo::Executing);
                
                // What are you getting out of this?
                Hero.AI.Say(LocText("INFO_WOLF_PROFIT_15_01"));
                DC(int64(0x3d2936a6af7eba93), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba94), EConversationDebugInfo::Executing);
                
                // You mean besides keeping the bloke alive who Lee says is ...
                Wolf.AI.Say(LocText("INFO_WOLF_PROFIT_09_02"));
                DC(int64(0x3d2936a6af7eba94), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceWolfSellarmor : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba52);
            default Caption = LocText("DIA_WOLF_SELLARMOR_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfHello);
            default Rules.HideIfKnows(UChoiceWolfArmorfinished);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba53), EConversationDebugInfo::Executing);
                
                // I need a better armor.
                Hero.AI.Say(LocText("DIA_WOLF_SELLARMOR_15_00"));
                DC(int64(0x3d2936a6af7eba53), EConversationDebugInfo::Done);
                DB(int64(0x4cf51b7fbcc04ea4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DB(int64(0x7ec56dc721168ae5), Wolf != nullptr && Wolf.IsAngryTowards(Hero));
                    
                    if (Wolf != nullptr && Wolf.IsAngryTowards(Hero))
                    {
                        DC(int64(0x7ec56dc721168aef), EConversationDebugInfo::Executing);
                        // I only sell to people who respect the rules. Get lost!
                        Wolf.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_111050_491"));
                        DC(int64(0x7ec56dc721168aef), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_wolf_sellarmor_exit_1");
                        DC(int64(0x7ec56dc721168af4), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x7ec56dc721168af4), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DB(int64(0x3e9d2f5631dc4548), Hero != nullptr && Hero.Inventory.HasEquippedItem(UOrg_Armor));
                        
                        if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UOrg_Armor))
                        {
                            DC(int64(0x3d2936a6af7eba55), EConversationDebugInfo::Executing);
                            // Well, now that you're one of us, I'm happy to sell you ...
                            Wolf.AI.Say(LocText("DIA_WOLF_SELLARMOR_09_01"));
                            DC(int64(0x3d2936a6af7eba55), EConversationDebugInfo::Done);
                            DC(int64(0x233794188ff4b7ce), EConversationDebugInfo::Executing);
                            // What's it gonna be? 
                            Wolf.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_175340"));
                            DC(int64(0x233794188ff4b7ce), EConversationDebugInfo::Done);
                            DC(int64(0x3e9d2f5631dc44ce), EConversationDebugInfo::Executing);
                            Wolf.AI.StartCustomizingArmorWith(Hero);
                            DC(int64(0x3e9d2f5631dc44ce), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_wolf_sellarmor_exit_2");
                        }
                        else
                        {
                            DC(int64(0x3e9d2f5631dc4563), EConversationDebugInfo::Executing);
                            // I only work with rogues' armor. They are light and very ...
                            Wolf.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_121341_41"));
                            DC(int64(0x3e9d2f5631dc4563), EConversationDebugInfo::Done);
                            DC(int64(0x3e9d2f5631dc4575), EConversationDebugInfo::Executing);
                            // Equip yours and then we'll talk.
                            Wolf.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_121556"));
                            DC(int64(0x3e9d2f5631dc4575), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_wolf_sellarmor_exit_3");
                            DC(int64(0x3e9d2f5631dc456c), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x3e9d2f5631dc456c), EConversationDebugInfo::Done);
                            return;
                        }
                    }
                }
                else
                {
                    DC(int64(0xf67ccce6af922c5e), EConversationDebugInfo::Executing);
                    // No can do, mate ... Lares is gonna rip me head off if he ...
                    Wolf.AI.Say(LocText("DIA_WOLF_SELLARMOR_WRONGGUILD_09_00"));
                    DC(int64(0xf67ccce6af922c5e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_wolf_sellarmor_exit_4");
                }
            }
        }
        
        
        class UChoiceWolfSkin : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba89);
            default Caption = LocText("INFO_WOLF_SKIN_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceWolfSpeak);
            default Rules.HideIfKnows(UChoiceWolfSkin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3d2936a6af7eba8a), Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR != nullptr && !Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR != nullptr && !Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3d2936a6af7eba8b), EConversationDebugInfo::Executing);
                // Deal. How do I cut the plates off the bodies? 
                Hero.AI.Say(LocText("INFO_WOLF_SKIN_15_01"));
                DC(int64(0x3d2936a6af7eba8b), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba8c), EConversationDebugInfo::Executing);
                
                // Piece of cake. There's just a thin line of tissue that ...
                Wolf.AI.Say(LocText("INFO_WOLF_SKIN_09_02"));
                DC(int64(0x3d2936a6af7eba8c), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba8d), EConversationDebugInfo::Executing);
                // Just take a skinnin' knife and saw along the edges, and ...
                Wolf.AI.Say(LocText("INFO_WOLF_SKIN_09_03"));
                DC(int64(0x3d2936a6af7eba8d), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba8e), EConversationDebugInfo::Executing);
                
                // Got it. I'll get you some of those plates.
                Hero.AI.Say(LocText("INFO_WOLF_SKIN_15_04"));
                DC(int64(0x3d2936a6af7eba8e), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b7e2), EConversationDebugInfo::Executing);
                
                // Music to me ears. 
                Wolf.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_182131"));
                DC(int64(0x233794188ff4b7e2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_MCPLATEARMOR, Document::UDocumentSegment_CH4_MCPLATEARMOR_Start);
                DC(int64(0x4cf51b7fbcc01157), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_MCPlate_Trained);
                DC(int64(0x4cf51b7fbcc01157), EConversationDebugInfo::Done);
                DC(int64(0x4cf51b7fbcc01159), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_MCPLATEARMOR.StartQuest();
                DC(int64(0x4cf51b7fbcc01159), EConversationDebugInfo::Done);
                DC(int64(0x4cf51b7fbcc0115b), EConversationDebugInfo::Executing);
                G1R.Knows_GetMCPlates = 1;
                DC(int64(0x4cf51b7fbcc0115b), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3d2936a6af7eba91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceWolfSpeak : UTopic_Hero__NC_ORG_WOLF_855
        {
            default DebugId = int64(0x3d2936a6af7eba80);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceWolfSpeak);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x44e9931de0369a5c), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd1b38339089a839d), EConversationDebugInfo::Executing);
                // Hey, freshie. I was lookin' for you.
                Wolf.AI.Say(LocText("TEXT_WIP_AMEKYPF_20240618_143033"));
                DC(int64(0xd1b38339089a839d), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba81), EConversationDebugInfo::Executing);
                
                // Why? 
                Hero.AI.Say(LocText("INFO_WOLF_SPEAK_15_01"));
                DC(int64(0x3d2936a6af7eba81), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba82), EConversationDebugInfo::Executing);
                
                // Cause a week ago in the pub, I had an idea for a new ...
                Wolf.AI.Say(LocText("INFO_WOLF_SPEAK_09_02"));
                DC(int64(0x3d2936a6af7eba82), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba83), EConversationDebugInfo::Executing);
                
                // You could say that. 
                Hero.AI.Say(LocText("INFO_WOLF_SPEAK_15_03"));
                DC(int64(0x3d2936a6af7eba83), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba84), EConversationDebugInfo::Executing);
                
                // Then you know their plates are pretty solid. What you ...
                Wolf.AI.Say(LocText("INFO_WOLF_SPEAK_09_04"));
                DC(int64(0x3d2936a6af7eba84), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba85), EConversationDebugInfo::Executing);
                // And as I was sittin' there sippin' me pint, I was ...
                Wolf.AI.Say(LocText("INFO_WOLF_SPEAK_09_05"));
                DC(int64(0x3d2936a6af7eba85), EConversationDebugInfo::Done);
                DC(int64(0x233794188ff4b7e1), EConversationDebugInfo::Executing);
                
                // That sounds like a good idea.
                Hero.AI.Say(LocText("TEXT_WIP_ISMIFZI_20240625_181240"));
                DC(int64(0x233794188ff4b7e1), EConversationDebugInfo::Done);
                DC(int64(0x3d2936a6af7eba88), EConversationDebugInfo::Executing);
                
                // Right? So, here's the deal: you get me some of those ...
                Wolf.AI.Say(LocText("INFO_WOLF_SPEAK_09_08"));
                DC(int64(0x3d2936a6af7eba88), EConversationDebugInfo::Done);
                DC(int64(0x2a9130fe431287a8), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF.SucceedQuest();
                DC(int64(0x2a9130fe431287a8), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */