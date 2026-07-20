#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_GORNATOTH_1402 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_GORNATOTH_1402";
        }
        
        
        class UTopic_Hero__SC_TPL_GORNATOTH_1402 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_GORNATOTH_1402";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaToth() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGornatoth156846 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x14e8115e07a95d0d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGornatoth156846);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(GorNaToth, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(GorNaToth, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95d06), EConversationDebugInfo::Executing);
                // I.. I'm ready to take on the orcs, if t hat's what it ...
                GorNaToth.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_161922_3984"));
                DC(int64(0x14e8115e07a95d06), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornatothAngartalked : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232e6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGornatothAngartalked);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xde773d1fb42d761c), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JGNROOD_20241111_140633")));
                    DB(int64(0xde773d1fb42d761c), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JGNROOD_20241111_140541")));
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JGNROOD_20241111_140633")))
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_JGNROOD_20241111_140541")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232e7), EConversationDebugInfo::Executing);
                // Cor Angar spoke to you? What did he say?
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_11_00"));
                DC(int64(0x454feea8e6c232e7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Introduction);
                Subdialog(
                    UChoiceGornatothAngartalkedUnworthy,
                    UChoiceGornatothAngartalkedShark,
                    UChoiceGornatothAngartalkedNormal
                );
            }
        }
        
        
        class UChoiceGornatothAngartalkedUnworthy : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232e9);
            default Caption = LocText("DIA_GORNATOTH_ANGARTALKED_UNWORTHY_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232ea), EConversationDebugInfo::Executing);
                // Only that you're unworthy of a templar's armor.
                Hero.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_UNWORTHY_15_00"));
                DC(int64(0x454feea8e6c232ea), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232eb), EConversationDebugInfo::Executing);
                
                // What? No, never! He would never say that, not about ME!
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_UNWORTHY_11_01"));
                DC(int64(0x454feea8e6c232eb), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232ed), EConversationDebugInfo::Executing);
                GorNaToth.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x454feea8e6c232ed), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232ee), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x454feea8e6c232ee), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornatothAngartalkedShark : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232ef);
            default Caption = LocText("DIA_GORNATOTH_ANGARTALKED_SHARK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232f0), EConversationDebugInfo::Executing);
                // Just how much he HATES those pesky swampsharks.
                Hero.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_SHARK_15_00"));
                DC(int64(0x454feea8e6c232f0), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232f1), EConversationDebugInfo::Executing);
                
                // ... What? Oh, oh, I see. His wish shell be me command! 
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_SHARK_11_01"));
                DC(int64(0x454feea8e6c232f1), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232f2), EConversationDebugInfo::Executing);
                // Onwards, Gor Na Toth! A holy quist awaits you!
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_SHARK_11_02"));
                DC(int64(0x454feea8e6c232f2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornatothAngartalkedNormal : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232f3);
            default Caption = LocText("DIA_GORNATOTH_ANGARTALKED_NORMAL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232f4), EConversationDebugInfo::Executing);
                
                // He told me to return once I'm a templar.
                Hero.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_NORMAL_15_00"));
                DC(int64(0x454feea8e6c232f4), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232f5), EConversationDebugInfo::Executing);
                
                // I see. He must have a high opinion of you - he hardly ...
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_NORMAL_11_01"));
                DC(int64(0x454feea8e6c232f5), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232f6), EConversationDebugInfo::Executing);
                // It's a great honor that he noticed you at all. The last ...
                GorNaToth.AI.Say(LocText("DIA_GORNATOTH_ANGARTALKED_NORMAL_11_02"));
                DC(int64(0x454feea8e6c232f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothArmor : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c23301);
            default Caption = LocText("INFO_GORNATOTH_ARMOR_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1402GornatothArmor);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3e9d2f5631dc47c4), Hero != nullptr && Hero.HasItem(UTpl_Armor, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UTpl_Armor, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c23302), EConversationDebugInfo::Executing);
                
                // I need better armor.
                Hero.AI.Say(LocText("INFO_GORNATOTH_ARMOR_15_01"));
                DC(int64(0x454feea8e6c23302), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c23303), EConversationDebugInfo::Executing);
                
                // Understandable. I cant help you with it, but Darrion ...
                GorNaToth.AI.Say(LocText("INFO_GORNATOTH_ARMOR_11_02"));
                DC(int64(0x454feea8e6c23303), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothExit : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232e0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x454feea8e6c232e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1402GornatothGetstuff : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c232f7);
            default Caption = LocText("TPL_1402_GORNATOTH_GETSTUFF_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1402GornatothGetstuff);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_GNPRNBE_20250116_155920"), int64(0x454feea8e6c232f7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c232f8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c232f9), EConversationDebugInfo::Executing);
                // I came to get my templar's armor.
                Hero.AI.Say(LocText("TPL_1402_GORNATOTH_GETSTUFF_INFO_15_01"));
                DC(int64(0x454feea8e6c232f9), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232fa), EConversationDebugInfo::Executing);
                
                // Then you came to the right man! It shell be me delate ...
                GorNaToth.AI.Say(LocText("TPL_1402_GORNATOTH_GETSTUFF_INFO_11_02"));
                DC(int64(0x454feea8e6c232fa), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c232fb), EConversationDebugInfo::Executing);
                // Here! May it protect you like the Sleeper protects the ...
                GorNaToth.AI.Say(LocText("TPL_1402_GORNATOTH_GETSTUFF_INFO_11_03"));
                DC(int64(0x454feea8e6c232fb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Armor);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPTEMPLAR, Document::UDocumentSegment_CH3_RANKUPTEMPLAR_Armor);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Introduction);
                DC(int64(0x454feea8e6c232fc), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UTpl_Armor, 1);
                DC(int64(0x454feea8e6c232fc), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c23300), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UTpl_Armor);
                DC(int64(0x454feea8e6c23300), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeach : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c23304);
            default Caption = LocText("TPL_1402_GORNATOTH_TEACH_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x118acb5747a17da6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x959938528b9a1e7), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x959938528b9a1e8), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c23305), EConversationDebugInfo::Executing);
                // Can you train me?
                Hero.AI.Say(LocText("TPL_1402_GORNATOTH_TEACH_15_00"));
                DC(int64(0x454feea8e6c23305), EConversationDebugInfo::Done);
                DC(int64(0x454feea8e6c23306), EConversationDebugInfo::Executing);
                
                // You're one of us, so yes, I can. Strength and dexterity ...
                GorNaToth.AI.Say(LocText("TPL_1402_GORNATOTH_TEACH_11_01"));
                DC(int64(0x454feea8e6c23306), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_TeachStats);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Introduction);
                DB(int64(0x664aa9ea65f55e8b), G1R.LogGornatothtrain == 0);
                
                if (G1R.LogGornatothtrain == 0)
                {
                    DC(int64(0x664aa9ea65f55e8c), EConversationDebugInfo::Executing);
                    G1R.LogGornatothtrain = 1;
                    DC(int64(0x664aa9ea65f55e8c), EConversationDebugInfo::Done);
                }
                DC(int64(0x5225337a9d9cdcf4), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(GorNaToth);
                DC(int64(0x5225337a9d9cdcf4), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceTpl1402GornatothTeachStr5,
                    UChoiceTpl1402GornatothTeachStr1,
                    UChoiceTpl1402GornatothTeachDex5,
                    UChoiceTpl1402GornatothTeachDex1,
                    UChoiceTpl1402GornatothTeachMan5,
                    UGorNaToth_78306,
                    UChoiceTpl1402GornatothTeachBack
                );
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachStr5 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e7c);
            default Caption = LocText("TEXT_CHOICE_TPL_1402_GORNATOTH_TEACH_STR_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(GorNaToth, 1);
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c18), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c18), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachStr1 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e7f);
            default Caption = LocText("TEXT_CHOICE_TPL_1402_GORNATOTH_TEACH_STR_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e80), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(GorNaToth, 5);
                DC(int64(0x664aa9ea65f55e80), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c46), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachDex5 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e82);
            default Caption = LocText("TEXT_CHOICE_TPL_1402_GORNATOTH_TEACH_DEX_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e83), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(GorNaToth, 1);
                DC(int64(0x664aa9ea65f55e83), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c4b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c4b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachDex1 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e85);
            default Caption = LocText("TEXT_CHOICE_TPL_1402_GORNATOTH_TEACH_DEX_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e86), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(GorNaToth, 5);
                DC(int64(0x664aa9ea65f55e86), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c50), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c50), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachMan5 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e88);
            default Caption = LocText("TEXT_CHOICE_TPL_1402_GORNATOTH_TEACH_MAN_5");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e89), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(GorNaToth, 1);
                DC(int64(0x664aa9ea65f55e89), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c55), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c55), EConversationDebugInfo::Done);
            }
        }
        
        
        class UGorNaToth_78306 : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0xde773d1fb42d762a);
            default Caption = LocText("TEXT_GROMEU_20240117_145026");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e89), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(GorNaToth, 5);
                DC(int64(0x664aa9ea65f55e89), EConversationDebugInfo::Done);
                DC(int64(0x118acb5747a17c5a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x118acb5747a17c5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTeachBack : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x664aa9ea65f55e7b);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5225337a9d9cdd47), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(GorNaToth);
                DC(int64(0x5225337a9d9cdd47), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1402GornatothTrain : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c2330a);
            default Caption = LocText("TEXT_WIP_AKSDKDL_20241210_121405_2301");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2330b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                    DB(int64(0xc3316dceccaaedd9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x1a491ba842e9958c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0x959938528b9a1e9), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x959938528b9a1ea), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xde773d1fb42d7634), EConversationDebugInfo::Executing);
                // I want to be better with one-handed weapons. 
                Hero.AI.Say(LocText("TEXT_GROMEU_20240117_150807"));
                DC(int64(0xde773d1fb42d7634), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNATOTH, Document::UDocumentSegment_Glossary_SC_TPL_GORNATOTH_TeachWeapon);
                DB(int64(0x454feea8e6c2330d), G1R.LogGornatothfight == 0);
                
                if (G1R.LogGornatothfight == 0)
                {
                    DC(int64(0x454feea8e6c2330e), EConversationDebugInfo::Executing);
                    G1R.LogGornatothfight = 1;
                    DC(int64(0x454feea8e6c2330e), EConversationDebugInfo::Done);
                }
                DB(int64(0x1dfe82dfe349d629), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                {
                    DB(int64(0x118acb5747a17e56), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                    {
                        DC(int64(0xa7deef969d1e37d0), EConversationDebugInfo::Executing);
                        // Hmm.. a noble choice. Most of it comes down to your ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164707"));
                        DC(int64(0xa7deef969d1e37d0), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d1), EConversationDebugInfo::Executing);
                        // For the fight itself, memontum is the key. When you've ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164709"));
                        DC(int64(0xa7deef969d1e37d1), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d2), EConversationDebugInfo::Executing);
                        // You may also use your sword to parry. If your opponent ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164710"));
                        DC(int64(0xa7deef969d1e37d2), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d3), EConversationDebugInfo::Executing);
                        // Now, when you're about to swing, but already see the ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164712"));
                        DC(int64(0xa7deef969d1e37d3), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d4), EConversationDebugInfo::Executing);
                        // Finally, some blows do more harm than others. You'll ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164713"));
                        DC(int64(0xa7deef969d1e37d4), EConversationDebugInfo::Done);
                        DC(int64(0x454feea8e6c23317), EConversationDebugInfo::Executing);
                        // You'll get better with time, and shell be a great ...
                        GorNaToth.AI.Say(LocText("DIA_SCATTY_TRAIN_1H_01_07"));
                        DC(int64(0x454feea8e6c23317), EConversationDebugInfo::Done);
                        DC(int64(0x454feea8e6c23318), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Trained);
                        DC(int64(0x454feea8e6c23318), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_tpl_1402_gornatoth_train_exit_1");
                        DC(int64(0x454feea8e6c23319), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x454feea8e6c23319), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x118acb5747a17e60), EConversationDebugInfo::Executing);
                        // You lack the ore. Return when you have enough.
                        GorNaToth.AI.Say(LocText("TEXT_WIP_AKSDKDL_20241210_155634_1609"));
                        DC(int64(0x118acb5747a17e60), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_tpl_1402_gornatoth_train_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xde773d1fb42d7631), EConversationDebugInfo::Executing);
                    // You're not ready for this holy endive ... endow- Best ...
                    GorNaToth.AI.Say(LocText("TEXT_GROMEU_20240117_145913"));
                    DC(int64(0xde773d1fb42d7631), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_tpl_1402_gornatoth_train_exit_3");
                }
            }
        }
        
        
        class UChoiceTpl1402GornatothTrainagain : UTopic_Hero__SC_TPL_GORNATOTH_1402
        {
            default DebugId = int64(0x454feea8e6c2331a);
            default Caption = LocText("TEXT_WIP_AKSDKDL_20241210_121405_2672");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2331b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0xc3316dceccaaedda), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x118acb5747a17de9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                    DB(int64(0x959938528b9a1eb), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x959938528b9a1ec), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x454feea8e6c2331c), EConversationDebugInfo::Executing);
                // Show me how to get even better with one-handed weapons.
                Hero.AI.Say(LocText("TPL_1402_GORNATOTH_TRAINAGAIN_INFO_15_01"));
                DC(int64(0x454feea8e6c2331c), EConversationDebugInfo::Done);
                DB(int64(0x1dfe82dfe349d63e), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                {
                    DB(int64(0x118acb5747a17e2d), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                    {
                        DC(int64(0xa7deef969d1e37d5), EConversationDebugInfo::Executing);
                        // That I shell, Brother. You already know it's all about ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164821"));
                        DC(int64(0xa7deef969d1e37d5), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d6), EConversationDebugInfo::Executing);
                        // The next step is to create a proper sequins. Channel the ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164823"));
                        DC(int64(0xa7deef969d1e37d6), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d7), EConversationDebugInfo::Executing);
                        // It's like a dance, really. Don't let your opponent catch ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164824"));
                        DC(int64(0xa7deef969d1e37d7), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d8), EConversationDebugInfo::Executing);
                        // Attacking like this won't just make it more likely ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164825"));
                        DC(int64(0xa7deef969d1e37d8), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1e37d9), EConversationDebugInfo::Executing);
                        // Finally: re ... um ... what's that word? Right. ...
                        GorNaToth.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_164827"));
                        DC(int64(0xa7deef969d1e37d9), EConversationDebugInfo::Done);
                        DC(int64(0x454feea8e6c23322), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Master);
                        DC(int64(0x454feea8e6c23322), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_tpl_1402_gornatoth_trainagain_exit_1");
                        DC(int64(0x454feea8e6c23323), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x454feea8e6c23323), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x118acb5747a17e35), EConversationDebugInfo::Executing);
                        // You lack the ore. Return when you have enough.
                        GorNaToth.AI.Say(LocText("TEXT_WIP_AKSDKDL_20241210_154845_3984"));
                        DC(int64(0x118acb5747a17e35), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_tpl_1402_gornatoth_trainagain_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xde773d1fb42d7635), EConversationDebugInfo::Executing);
                    // You're not ready for this holy endive ... endow- Best ...
                    GorNaToth.AI.Say(LocText("TEXT_GROMEU_20240117_145913"));
                    DC(int64(0xde773d1fb42d7635), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_tpl_1402_gornatoth_trainagain_exit_3");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */