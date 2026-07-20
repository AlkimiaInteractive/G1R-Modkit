#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_THORUS_200 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_THORUS_200";
        }
        
        
        class UTopic_Hero__OC_GRD_THORUS_200 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_THORUS_200";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetThorus() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetBC_BAN_QUENTIN() const property
            {
                return GetCharacter(n"BC_BAN_QUENTIN");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_ORG_ROGUE01_800() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE01_800");
            }
            
            AGothicCharacterState GetRogue12() const property
            {
                return GetCharacter(n"NC_ORG_ROGUE12_822");
            }
            
            AGothicCharacterState GetKirgo() const property
            {
                return GetCharacter(n"OC_GRD_KIRGO_251");
            }
            
            AGothicCharacterState GetCorristo() const property
            {
                return GetCharacter(n"OC_KDF_CORRISTO_402");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_Mordrag_826");
            }
            
            AGothicCharacterState GetBullit() const property
            {
                return GetCharacter(n"OCR_GRD_BULLIT_203");
            }
        }
        
        
        class UChoiceGrd200ThorusAufnahme : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f93);
            default Caption = LocText("GRD_200_THORUS_AUFNAHME_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusAufnahme);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_200_THORUS_GARDIST_INFO_09_03"), int64(0x9fe4174460845f93));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f94), Hero.GetLevelAttribute() >= 10);
                    DB(int64(0x9fe4174460845f95), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x2fab0830121ab286), G1R.FireMagesDead == 0);
                    DB(int64(0x84d011413d331ea8), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                if (Hero.GetLevelAttribute() < 10)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (G1R.FireMagesDead != 0)
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f96), EConversationDebugInfo::Executing);
                // I want to be a warder. 
                Hero.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_15_01"));
                DC(int64(0x9fe4174460845f96), EConversationDebugInfo::Done);
                DC(int64(0xdbbe1a7af531fa51), EConversationDebugInfo::Executing);
                
                // Good. Like I said, the fact that we're having this ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_131002"));
                DC(int64(0xdbbe1a7af531fa51), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d3676c), EConversationDebugInfo::Executing);
                // Which is even getting considered for this job. That ...
                Thorus.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_152557"));
                DC(int64(0xac7c76cc07d3676c), EConversationDebugInfo::Done);
                DC(int64(0xac7c76cc07d3676d), EConversationDebugInfo::Executing);
                // Call it a test if you want. 
                Thorus.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_152628"));
                DC(int64(0xac7c76cc07d3676d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusGardist : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44869f122f483b44);
            default Caption = LocText("GRD_200_THORUS_GARDIST_INFO_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd214TorwacheSeethorus);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd216TorwacheSeethorus);
            default Rules.HideIfKnows(UChoiceGrd200ThorusGardist);
            default Rules.HideIfKnows(UChoiceGrd200ThorusWannabemage);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_HKQHPDM_20241218_131737_2238"), int64(0x44869f122f483b44));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x31e17e614b8c3e39), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x2fab0830121ab281), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x84d011413d331ea7), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f8a), EConversationDebugInfo::Executing);
                
                // You said there's something you wanted to talk about?
                Hero.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_15_01"));
                DC(int64(0x9fe4174460845f8a), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f8b), EConversationDebugInfo::Executing);
                
                // That's right. What you did in the mine proved you not ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_02"));
                DC(int64(0x9fe4174460845f8b), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f8c), EConversationDebugInfo::Executing);
                // Long story short. I'm offering to make you one of us: a ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_03"));
                DC(int64(0x9fe4174460845f8c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusNochwas : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a582);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorus132770);
            default Rules.HideIfKnows(UChoiceGrd200ThorusNochwas);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845fa3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845fa4), EConversationDebugInfo::Executing);
                // Oh. And one more thing.
                Thorus.AI.Say(LocText("GRD_200_THORUS_NOCHWAS_INFO_09_01"));
                DC(int64(0x9fe4174460845fa4), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845fa5), EConversationDebugInfo::Executing);
                // Welcome to the warders.
                Thorus.AI.Say(LocText("GRD_200_THORUS_NOCHWAS_INFO_09_02"));
                DC(int64(0x9fe4174460845fa5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_THORUS, Document::UDocumentSegment_Glossary_OC_GRD_THORUS_RankUpGuard);
            }
        }
        
        
        class UChoiceGrd200ThorusTeach : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845fac);
            default Caption = LocText("GRD_200_THORUS_TEACH_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845fad), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x2fab0830121ab283), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x959938528b9a1ce), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
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
                DC(int64(0x9fe4174460845fae), EConversationDebugInfo::Executing);
                // Can you train me?
                Hero.AI.Say(LocText("GRD_200_THORUS_TEACH_15_00"));
                DC(int64(0x9fe4174460845fae), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845faf), EConversationDebugInfo::Executing);
                
                // Depends on what you're looking to learn. I can show you ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_TEACH_09_01"));
                DC(int64(0x9fe4174460845faf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_THORUS, Document::UDocumentSegment_Glossary_OC_GRD_THORUS_Teacher);
                DB(int64(0x9fe4174460845fb1), G1R.LogThorustrain == 0);
                
                if (G1R.LogThorustrain == 0)
                {
                    DC(int64(0x3324a0310d74f731), EConversationDebugInfo::Executing);
                    G1R.LogThorustrain = 1;
                    DC(int64(0x3324a0310d74f731), EConversationDebugInfo::Done);
                }
                DC(int64(0x2a2b6e49b3261a36), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Thorus);
                DC(int64(0x2a2b6e49b3261a36), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceGrd200ThorusTeachDex1,
                    UChoiceGrd200ThorusTeachStr11,
                    UChoiceGrd200ThorusTeachDex51,
                    UChoiceGrd200ThorusTeachDex11,
                    UChoiceGrd200ThorusTeachBack
                );
            }
        }
        
        
        class UChoiceGrd200ThorusTeachDex1 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x898b39995343e02);
            default Caption = LocText("TEXT_CHOICE_GRD_200_THORUS_TEACH_DEX_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d74f71e), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Thorus, 1);
                DC(int64(0x3324a0310d74f71e), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99418), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99418), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusTeachStr11 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x898b39995343e04);
            default Caption = LocText("TEXT_CHOICE_GRD_200_THORUS_TEACH_STR_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d74f718), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Thorus, 5);
                DC(int64(0x3324a0310d74f718), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99424), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99424), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusTeachDex51 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x898b39995343e06);
            default Caption = LocText("TEXT_CHOICE_GRD_200_THORUS_TEACH_DEX_5_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d74f72a), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Thorus, 1);
                DC(int64(0x3324a0310d74f72a), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e99430), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e99430), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusTeachDex11 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x898b39995343e08);
            default Caption = LocText("TEXT_CHOICE_GRD_200_THORUS_TEACH_DEX_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3324a0310d74f724), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Thorus, 5);
                DC(int64(0x3324a0310d74f724), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e9943c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e9943c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusTeachBack : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x898b39995343df8);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a2b6e49b3261a88), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Thorus);
                DC(int64(0x2a2b6e49b3261a88), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd200ThorusWannabemage : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845fa7);
            default Caption = LocText("GRD_200_THORUS_WANNABEMAGE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusAufnahme);
            default Rules.HideIfKnows(UChoiceGrd200ThorusWannabemage);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_200_THORUS_GARDIST_INFO_09_05"), int64(0x9fe4174460845fa7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2fab0830121ab282), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845fa8), EConversationDebugInfo::Executing);
                // I'm more interested in becoming a mage. 
                Hero.AI.Say(LocText("GRD_200_THORUS_WANNABEMAGE_INFO_15_01"));
                DC(int64(0x9fe4174460845fa8), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845fa9), EConversationDebugInfo::Executing);
                
                // (laughs) You say that as if it's as simple as becoming a ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_WANNABEMAGE_INFO_09_02"));
                DC(int64(0x9fe4174460845fa9), EConversationDebugInfo::Done);
                DC(int64(0xa0256bc183474334), EConversationDebugInfo::Executing);
                
                // Anything is possible ... 
                Hero.AI.Say(LocText("TEXT_WIP_YDMVSBC_20240919_191324"));
                DC(int64(0xa0256bc183474334), EConversationDebugInfo::Done);
                DC(int64(0xa0256bc183474335), EConversationDebugInfo::Executing);
                
                // News to me. But if you're really serious about this, you ...
                Thorus.AI.Say(LocText("TEXT_WIP_YDMVSBC_20240919_191333"));
                DC(int64(0xa0256bc183474335), EConversationDebugInfo::Done);
                DC(int64(0xa0256bc183474336), EConversationDebugInfo::Executing);
                // He took in Milten, and the boy was wet as a washcloth ...
                Thorus.AI.Say(LocText("TEXT_WIP_YDMVSBC_20240919_191358"));
                DC(int64(0xa0256bc183474336), EConversationDebugInfo::Done);
                DC(int64(0x3324a0310d74f739), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Corristo))) { Corristo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Corristo_402_Waitforsc); }
                DC(int64(0x3324a0310d74f739), EConversationDebugInfo::Done);
                Print("Skipped Corristo.AI.ContinueDailyRoutine()");
            }
        }
        
        
        class UChoiceGrd200ThorusZweihand2 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845fc3);
            default Caption = LocText("TEXT_WIP_BKSDKDL_20241211_121208_3732");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845fc4), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained));
                    DB(int64(0x9fe4174460845fc5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x11b421d8254b88ef), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master));
                    DB(int64(0x2fab0830121ab284), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xd0510c469b93fa89), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845fc6), EConversationDebugInfo::Executing);
                // Can you teach me to be a master at two-handed combat? 
                Hero.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_15_01"));
                DC(int64(0x9fe4174460845fc6), EConversationDebugInfo::Done);
                DB(int64(0x11b421d8254b88ed), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Master))
                {
                    DB(int64(0x1a491ba842e99243), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Master))
                    {
                        DC(int64(0xd22ba0cdd0f609ba), EConversationDebugInfo::Executing);
                        // I can. 
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143218"));
                        DC(int64(0xd22ba0cdd0f609ba), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f609c7), EConversationDebugInfo::Executing);
                        // You already know about critical hits - those moments ...
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143318"));
                        DC(int64(0xd22ba0cdd0f609c7), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f609c8), EConversationDebugInfo::Executing);
                        // Try and be more precise with your attacks. Yes, you know ...
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143344"));
                        DC(int64(0xd22ba0cdd0f609c8), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f609c9), EConversationDebugInfo::Executing);
                        // Also, always keep an eye on your enemy's movements. ...
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143444"));
                        DC(int64(0xd22ba0cdd0f609c9), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f609ca), EConversationDebugInfo::Executing);
                        // And last but not least: footing. Always keep your boots ...
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143514"));
                        DC(int64(0xd22ba0cdd0f609ca), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60ca0), EConversationDebugInfo::Executing);
                        // Good luck. You've come a long way. 
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145543"));
                        DC(int64(0xd22ba0cdd0f60ca0), EConversationDebugInfo::Done);
                        DC(int64(0x1a491ba842e992c1), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_TwoHanded_Master);
                        DC(int64(0x1a491ba842e992c1), EConversationDebugInfo::Done);
                        DC(int64(0x1a491ba842e992cd), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x1a491ba842e992cd), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x1a491ba842e9928a), EConversationDebugInfo::Executing);
                        // You've got the skill, I'll give you that. But without ...
                        Thorus.AI.Say(LocText("TEXT_WIP_BKSDKDL_20241211_140621_2238"));
                        DC(int64(0x1a491ba842e9928a), EConversationDebugInfo::Done);
                        DC(int64(0x1a491ba842e992b4), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x1a491ba842e992b4), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x11b421d8254b88f0), EConversationDebugInfo::Executing);
                    // Hah! You swing a blade like a drunkard swatting flies. ...
                    Thorus.AI.Say(LocText("TEXT_DDIAZ_20231019_103333"));
                    DC(int64(0x11b421d8254b88f0), EConversationDebugInfo::Done);
                    DC(int64(0x11b421d8254b88f2), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x11b421d8254b88f2), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceThorus109983 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xd22ba0cdd0f608db);
            default Caption = LocText("TEXT_WIP_BKSDKDL_20241211_121208_2991");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845fc4), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained));
                    DB(int64(0x2fab0830121ab284), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x1a491ba842e9957b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master));
                    DB(int64(0xbf2064ccd456bd48), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0x720d4fc18a467f5e), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd22ba0cdd0f608cf), EConversationDebugInfo::Executing);
                // Show me how to properly use two-handed weapons. 
                Hero.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_142624"));
                DC(int64(0xd22ba0cdd0f608cf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_THORUS, Document::UDocumentSegment_Glossary_OC_GRD_THORUS_Teacher2);
                DB(int64(0xd22ba0cdd0f608e8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                {
                    DC(int64(0xd22ba0cdd0f60900), EConversationDebugInfo::Executing);
                    // You're one of us now, so, yeah, I can. It'll cost you, ...
                    Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_142756"));
                    DC(int64(0xd22ba0cdd0f60900), EConversationDebugInfo::Done);
                    DB(int64(0x1a491ba842e994e8), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    {
                        DB(int64(0x1a491ba842e994f4), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained));
                        
                        if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained))
                        {
                            DC(int64(0x9fe4174460845fc8), EConversationDebugInfo::Executing);
                            // Hm. Yeah. I think you're ready. First off, change your ...
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_02"));
                            DC(int64(0x9fe4174460845fc8), EConversationDebugInfo::Done);
                            DC(int64(0xd22ba0cdd0f608c4), EConversationDebugInfo::Executing);
                            // I probably don't need to tell you, but two handers need ...
                            Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_141957"));
                            DC(int64(0xd22ba0cdd0f608c4), EConversationDebugInfo::Done);
                            DC(int64(0x9fe4174460845fc9), EConversationDebugInfo::Executing);
                            // Controlling your body is one half of it - controlling ...
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_03"));
                            DC(int64(0x9fe4174460845fc9), EConversationDebugInfo::Done);
                            DC(int64(0x9fe4174460845fca), EConversationDebugInfo::Executing);
                            // That does wonders to keep your opponent at a distance.
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_04"));
                            DC(int64(0x9fe4174460845fca), EConversationDebugInfo::Done);
                            DC(int64(0x9fe4174460845fcb), EConversationDebugInfo::Executing);
                            // Also, don't just hack your opponents like you're ...
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_05"));
                            DC(int64(0x9fe4174460845fcb), EConversationDebugInfo::Done);
                            DC(int64(0x9fe4174460845fcc), EConversationDebugInfo::Executing);
                            // Once it connects, spin around for a devastating, well ...
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_06"));
                            DC(int64(0x9fe4174460845fcc), EConversationDebugInfo::Done);
                            DC(int64(0x9fe4174460845fcf), EConversationDebugInfo::Executing);
                            // Alternating attacks and proper positioning. Those are ...
                            Thorus.AI.Say(LocText("GRD_200_THORUS_ZWEIHAND2_INFO_09_09"));
                            DC(int64(0x9fe4174460845fcf), EConversationDebugInfo::Done);
                            DC(int64(0x3324a0310d74f763), EConversationDebugInfo::Executing);
                            Hero.LearnSkill(UGE_Skill_Melee_TwoHanded_Trained);
                            DC(int64(0x3324a0310d74f763), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_thorus_109983_exit_1");
                            DC(int64(0x1a491ba842e99536), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x1a491ba842e99536), EConversationDebugInfo::Done);
                            return;
                        }
                        else
                        {
                            DC(int64(0xd22ba0cdd0f60996), EConversationDebugInfo::Executing);
                            // Like I said, though - no ore, no lesson. Come back with ...
                            Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143143_2332"));
                            DC(int64(0xd22ba0cdd0f60996), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_thorus_109983_exit_2");
                        }
                    }
                    else
                    {
                        DC(int64(0xd22ba0cdd0f60987), EConversationDebugInfo::Executing);
                        // You're not in the right frame of mind to learn something ...
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143109_1037"));
                        DC(int64(0xd22ba0cdd0f60987), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60993), EConversationDebugInfo::Executing);
                        // Get some more notches on your belt, then we'll talk. 
                        Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143132"));
                        DC(int64(0xd22ba0cdd0f60993), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_thorus_109983_exit_3");
                    }
                }
                else
                {
                    DC(int64(0xd22ba0cdd0f608f4), EConversationDebugInfo::Executing);
                    // You ain't one of us, so no. 
                    Thorus.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_142737"));
                    DC(int64(0xd22ba0cdd0f608f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_109983_exit_4");
                    DC(int64(0x1a491ba842e9945f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1a491ba842e9945f), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceThorus132524 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da952);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd200ThorusAufnahme);
            default Rules.HideIfKnows(UChoiceThorus132524);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac7c76cc07d3676e), EConversationDebugInfo::Executing);
                // I'm listening. 
                Hero.AI.Say(LocText("TEXT_WIP_DSWYRII_20250115_152647"));
                DC(int64(0xac7c76cc07d3676e), EConversationDebugInfo::Done);
                DC(int64(0xdbbe1a7af531fa52), EConversationDebugInfo::Executing);
                
                // There's a new shipment from outside coming into the ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_131220"));
                DC(int64(0xdbbe1a7af531fa52), EConversationDebugInfo::Done);
                DC(int64(0xdbbe1a7af531fa53), EConversationDebugInfo::Executing);
                // I've gotten word that the rice-eaters are planning to ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_131259"));
                DC(int64(0xdbbe1a7af531fa53), EConversationDebugInfo::Done);
                DC(int64(0xdbbe1a7af531fa54), EConversationDebugInfo::Executing);
                // I was gonna send Jackal to escort the carriers, but he's ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_131342"));
                DC(int64(0xdbbe1a7af531fa54), EConversationDebugInfo::Done);
                DC(int64(0xdbbe1a7af531fa57), EConversationDebugInfo::Executing);
                // Round up three diggers and take them to the Exchange ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_131821"));
                DC(int64(0xdbbe1a7af531fa57), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Thorus_143980,
                    UTopic_Thorus_132189,
                    UTopic_Thorus_132209,
                    UTopic_Thorus_132257,
                    UTopic_Thorus_132285
                );
            }
        }
        
        
        class UTopic_Thorus_143980 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xb83604057efe1ed5);
            default Caption = LocText("TEXT_WIP_ESWYRII_20250116_142617_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_143980);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb83604057efe1ed6), EConversationDebugInfo::Executing);
                // How many New Campers are you expecting to attack? 
                Hero.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142617_41"));
                DC(int64(0xb83604057efe1ed6), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ee7), EConversationDebugInfo::Executing);
                
                // I can't say, but I doubt it'll be more than a handful. ...
                Thorus.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142642"));
                DC(int64(0xb83604057efe1ee7), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ed8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb83604057efe1ed8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_132189 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da820);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_140421_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_132189);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603da821), EConversationDebugInfo::Executing);
                // What if none of the diggers want to come with me?
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140421_41"));
                DC(int64(0xfb3a7ee8603da821), EConversationDebugInfo::Done);
                DC(int64(0xfb3a7ee8603da86f), EConversationDebugInfo::Executing);
                
                // Then you gotta convince them. Sweeten the deal for them ...
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140430"));
                DC(int64(0xfb3a7ee8603da86f), EConversationDebugInfo::Done);
                DC(int64(0xfb3a7ee8603da823), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfb3a7ee8603da823), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_132209 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da824);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_140421_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_132209);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603da825), EConversationDebugInfo::Executing);
                // What's in the shipment?
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140421_2238"));
                DC(int64(0xfb3a7ee8603da825), EConversationDebugInfo::Done);
                DC(int64(0xfb3a7ee8603da871), EConversationDebugInfo::Executing);
                
                // That's above your pay grade. 
                Thorus.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140511"));
                DC(int64(0xfb3a7ee8603da871), EConversationDebugInfo::Done);
                DC(int64(0xfb3a7ee8603da827), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfb3a7ee8603da827), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_132257 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da872);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_140528_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_132257);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603da873), EConversationDebugInfo::Executing);
                // Why not send one of the other warders? 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140528_1924"));
                DC(int64(0xfb3a7ee8603da873), EConversationDebugInfo::Done);
                DB(int64(0x84d011413d331d19), Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead());
                
                if (Bullit != nullptr && Bullit.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x84d011413d331d2a), EConversationDebugInfo::Executing);
                    // Well, before Jackal, I wanted to send Bullit, but ...
                    Thorus.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_111409"));
                    DC(int64(0x84d011413d331d2a), EConversationDebugInfo::Done);
                    DC(int64(0x84d011413d331d5f), EConversationDebugInfo::Executing);
                    // I need the others to secure the area. 
                    Thorus.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_111622"));
                    DC(int64(0x84d011413d331d5f), EConversationDebugInfo::Done);
                    DC(int64(0x84d011413d331d60), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x84d011413d331d60), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x84d011413d331d3c), EConversationDebugInfo::Executing);
                    // Because there's some bloke who wants to join us. And I ...
                    Thorus.AI.Say(LocText("TEXT_WIP_OHRCFQN_20241217_111417"));
                    DC(int64(0x84d011413d331d3c), EConversationDebugInfo::Done);
                    DC(int64(0x84d011413d331d4e), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x84d011413d331d4e), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Thorus_132285 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da888);
            default Caption = LocText("TEXT_WIP_PHRCFQN_20241216_140603_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_132285);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfb3a7ee8603da889), EConversationDebugInfo::Executing);
                // I'm on it. 
                Hero.AI.Say(LocText("TEXT_WIP_PHRCFQN_20241216_140603_2785"));
                DC(int64(0xfb3a7ee8603da889), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1e9c), EConversationDebugInfo::Executing);
                
                // That's what I wanted to hear. Good luck. 
                Thorus.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_141439"));
                DC(int64(0xb83604057efe1e9c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPGUARD, Document::UDocumentSegment_CH3_RANKUPGUARD_Start);
                DC(int64(0xdbbe1a7af531fa3f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.StartQuest();
                DC(int64(0xdbbe1a7af531fa3f), EConversationDebugInfo::Done);
                DC(int64(0x84d011413d331cdc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kirgo))) { Kirgo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Kirgo_251_Shipment); }
                DC(int64(0x84d011413d331cdc), EConversationDebugInfo::Done);
                DC(int64(0x8693f955ac6d3ed0), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnShipmentAttackFirstCombat");
                DC(int64(0x8693f955ac6d3ed0), EConversationDebugInfo::Done);
                DC(int64(0x8693f955ac6d3ed2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rogue12))) { Rogue12.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue12_822_Shipment); }
                DC(int64(0x8693f955ac6d3ed2), EConversationDebugInfo::Done);
                DC(int64(0x8693f955ac6d3ed4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_ORG_ROGUE01_800))) { NC_ORG_ROGUE01_800.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue01_800_Shipment); }
                DC(int64(0x8693f955ac6d3ed4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorus132770 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xfb3a7ee8603da9ce);
            default Caption = LocText("TEXT_WIP_LNPRNBE_20250113_132628");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceThorus132770);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_HKQHPDM_20241218_124708"), int64(0xfb3a7ee8603da9ce));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdbbe1a7af531f865), G1R.FireMagesDead == 0);
                    DB(int64(0xfb3a7ee8603dab23), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                }
                
                if (G1R.FireMagesDead != 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && !Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x18e4e823517dad95), EConversationDebugInfo::Executing);
                // The shipment's taken care of. 
                Hero.AI.Say(LocText("TEXT_WIP_LNPRNBE_20250113_132628"));
                DC(int64(0x18e4e823517dad95), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ee8), EConversationDebugInfo::Executing);
                
                // And the tip-off? The Blues made a move? 
                Thorus.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142805"));
                DC(int64(0xb83604057efe1ee8), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1ee9), EConversationDebugInfo::Executing);
                
                // They tried. 
                Hero.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142934"));
                DC(int64(0xb83604057efe1ee9), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1eea), EConversationDebugInfo::Executing);
                
                // You just made me very happy. All right, let's cut to the ...
                Thorus.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_142938"));
                DC(int64(0xb83604057efe1eea), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1eeb), EConversationDebugInfo::Executing);
                
                // So I'm a warder now? 
                Hero.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_143021"));
                DC(int64(0xb83604057efe1eeb), EConversationDebugInfo::Done);
                DC(int64(0xb83604057efe1eec), EConversationDebugInfo::Executing);
                
                // Damn right you are. 
                Thorus.AI.Say(LocText("TEXT_WIP_ESWYRII_20250116_143034"));
                DC(int64(0xb83604057efe1eec), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f97), EConversationDebugInfo::Executing);
                // Good! Few things up front though. I say this to every ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_02"));
                DC(int64(0x9fe4174460845f97), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f98), EConversationDebugInfo::Executing);
                // Until now, you tried to make it on your own. That's in ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_03"));
                DC(int64(0x9fe4174460845f98), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f99), EConversationDebugInfo::Executing);
                // The diggers dig up the nuggets, but we make sure the ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_04"));
                DC(int64(0x9fe4174460845f99), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9a), EConversationDebugInfo::Executing);
                // Day and night, we're in the Mine. Day and night, we're ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_05"));
                DC(int64(0x9fe4174460845f9a), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9b), EConversationDebugInfo::Executing);
                // When this Colony started, we were all free game, but we ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_06"));
                DC(int64(0x9fe4174460845f9b), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9c), EConversationDebugInfo::Executing);
                // And that's why I demand one thing from me lads more than ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_07"));
                DC(int64(0x9fe4174460845f9c), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9d), EConversationDebugInfo::Executing);
                // The only way we can survive.
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_08"));
                DC(int64(0x9fe4174460845f9d), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9e), EConversationDebugInfo::Executing);
                // As for the rest, you'll figure that out on the way. Just ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_09"));
                DC(int64(0x9fe4174460845f9e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f9f), EConversationDebugInfo::Executing);
                // Now, enough with the chatter: go pick up your armor and ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_10"));
                DC(int64(0x9fe4174460845f9f), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845fa0), EConversationDebugInfo::Executing);
                // You'll find him in the Inner Ring, inside the smithy.
                Thorus.AI.Say(LocText("GRD_200_THORUS_AUFNAHME_INFO_09_11"));
                DC(int64(0x9fe4174460845fa0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_STONE, Document::UDocumentSegment_Glossary_OCR_GRD_STONE_Armor);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPGUARD, Document::UDocumentSegment_CH3_RANKUPGUARD_Completed);
                DC(int64(0x3324a0310d74f6f3), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_OldCamp_Guard);
                DC(int64(0x3324a0310d74f6f3), EConversationDebugInfo::Done);
                DC(int64(0xfb3a7ee8603da8e7), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_RANKUPGUARD_RANKUPGUARD_OBJ_REPORT.SucceedQuest();
                DC(int64(0xfb3a7ee8603da8e7), EConversationDebugInfo::Done);
                DB(int64(0x192d18d4e64b118d), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning())
                {
                    DC(int64(0x192d18d4e64b11ab), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.FailQuest();
                    DC(int64(0x192d18d4e64b11ab), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_132770_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_thorus_132770_exit_2");
                }
            }
        }
        
        
        class UChoiceThorus133908 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44869f122f483b0f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGrd200ThorusWannabemage);
            default Rules.HideIfKnows(UChoiceThorus133908);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x44869f122f483b12), Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_200_THORUS_GARDIST_INFO_09_02")));
                    DB(int64(0x44869f122f483b94), Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_214_TORWACHE_SEETHORUS_INFO_07_01")));
                    DB(int64(0x44869f122f483b95), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x44869f122f483b96), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x44869f122f483b97), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x44869f122f483b99), Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_200_THORUS_GARDIST_INFO_09_02")));
                    DB(int64(0x44869f122f483bea), Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_216_TORWACHE_SEETHORUS_INFO_13_01")));
                    DB(int64(0x44869f122f483beb), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x44869f122f483bec), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x44869f122f483bed), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_200_THORUS_GARDIST_INFO_09_02")) && Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_214_TORWACHE_SEETHORUS_INFO_07_01")) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && G1R != nullptr && G1R.HasReachedChapter(3))
                    return true;
                
                if (Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_200_THORUS_GARDIST_INFO_09_02")) && Hero != nullptr && !Hero.HasListenedTo(LocText("GRD_216_TORWACHE_SEETHORUS_INFO_13_01")) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning() && G1R != nullptr && G1R.HasReachedChapter(3))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44869f122f483afe), EConversationDebugInfo::Executing);
                // There you are. Good.
                Thorus.AI.Say(LocText("TEXT_WIP_HKQHPDM_20241218_131737_2238"));
                DC(int64(0x44869f122f483afe), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483b23), EConversationDebugInfo::Executing);
                
                // You've been looking for me? 
                Hero.AI.Say(LocText("TEXT_WIP_HKQHPDM_20241218_131945"));
                DC(int64(0x44869f122f483b23), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483b24), EConversationDebugInfo::Executing);
                
                // That's right. What you did in the mine proved you not ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_02"));
                DC(int64(0x44869f122f483b24), EConversationDebugInfo::Done);
                DC(int64(0x44869f122f483b25), EConversationDebugInfo::Executing);
                // Long story short. I'm offering to make you one of us: a ...
                Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_03"));
                DC(int64(0x44869f122f483b25), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorus134048 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44869f122f483b53);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd200ThorusGardist);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorus133908);
            default Rules.HideIfKnows(UChoiceThorus134048);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x9fe4174460845f8e), Hero.GetLevelAttribute() < 10);
                
                if (Hero.GetLevelAttribute() < 10)
                {
                    DC(int64(0x9fe4174460845f8f), EConversationDebugInfo::Executing);
                    // You still need a little more experience, but not much. ...
                    Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_04"));
                    DC(int64(0x9fe4174460845f8f), EConversationDebugInfo::Done);
                    DC(int64(0xa0256bc1834742f1), EConversationDebugInfo::Executing);
                    
                    // I'll think about it. 
                    Hero.AI.Say(LocText("TEXT_WIP_YDMVSBC_20240919_190507"));
                    DC(int64(0xa0256bc1834742f1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_134048_exit_1");
                }
                else
                {
                    DC(int64(0x9fe4174460845f92), EConversationDebugInfo::Executing);
                    // What you'd say?
                    Thorus.AI.Say(LocText("GRD_200_THORUS_GARDIST_INFO_09_05"));
                    DC(int64(0x9fe4174460845f92), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_134048_exit_2");
                }
            }
        }
        
        
        class UChoiceThorus134409 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a584);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_124934");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd200ThorusNochwas);
            default Rules.HideIfKnows(UChoiceThorus134409);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x18e4e823517dae58), G1R.FireMagesDead == 0);
                    DB(int64(0x192d18d4e64b1053), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                if (G1R.FireMagesDead != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a446), EConversationDebugInfo::Executing);
                // You got any more jobs for me? As a warder? 
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_124934"));
                DC(int64(0x44ea42cc1837a446), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d3), EConversationDebugInfo::Executing);
                
                // Already? You just helped me with that shipment. Not that ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_145029"));
                DC(int64(0xa020c3390a9e19d3), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a447), EConversationDebugInfo::Executing);
                // Yeah, there is something. A couple years back, the ...
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_124934_2083"));
                DC(int64(0x44ea42cc1837a447), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d4), EConversationDebugInfo::Executing);
                
                // Where'd they go?
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_145649"));
                DC(int64(0xa020c3390a9e19d4), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a47e), EConversationDebugInfo::Executing);
                
                // That's what this is about. According to Cavalorn, ...
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_154918"));
                DC(int64(0x44ea42cc1837a47e), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d5), EConversationDebugInfo::Executing);
                // We didn't mind at first - live and let live, right - but ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_150149"));
                DC(int64(0xa020c3390a9e19d5), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d6), EConversationDebugInfo::Executing);
                
                // They're becoming a new camp. 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_150415"));
                DC(int64(0xa020c3390a9e19d6), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d7), EConversationDebugInfo::Executing);
                
                // Dead on the money. That's why I want someone to go there ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_150554"));
                DC(int64(0xa020c3390a9e19d7), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19d8), EConversationDebugInfo::Executing);
                // Get their trust, get in, and get the lay of the land. ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_150630"));
                DC(int64(0xa020c3390a9e19d8), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a480), EConversationDebugInfo::Executing);
                // I'll take that to Gomez and then we'll decide what to ...
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_154939"));
                DC(int64(0x44ea42cc1837a480), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_Start);
                Subdialog(
                    UTopic_Thorus_134136,
                    UTopic_Thorus_134156,
                    UTopic_Thorus_134242,
                    UTopic_Thorus_134286
                );
            }
        }
        
        
        class UTopic_Thorus_134136 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a4a6);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_155141_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134136);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a4a7), EConversationDebugInfo::Executing);
                // What if it turns out they're a threat? 
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155141_1924"));
                DC(int64(0x44ea42cc1837a4a7), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a4bf), EConversationDebugInfo::Executing);
                
                // You're a smart guy. You'll figure it out. 
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155144"));
                DC(int64(0x44ea42cc1837a4bf), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a4a9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x44ea42cc1837a4a9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_134156 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a4aa);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_155141_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134156);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a4ab), EConversationDebugInfo::Executing);
                // How am I supposed to find them? The mountains aren't ...
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155141_3436"));
                DC(int64(0x44ea42cc1837a4ab), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19db), EConversationDebugInfo::Executing);
                
                // That's part of the job. I'd start in the canyon that ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_151556"));
                DC(int64(0xa020c3390a9e19db), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a4c1), EConversationDebugInfo::Executing);
                // You killed a minecrawler queen. You can do this. 
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155300"));
                DC(int64(0x44ea42cc1837a4c1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_Location);
                DC(int64(0x44ea42cc1837a4ad), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x44ea42cc1837a4ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_134242 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a4c2);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_155308_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134242);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a4c3), EConversationDebugInfo::Executing);
                // Do we know why these guys fell out with Lares?
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155308_3286"));
                DC(int64(0x44ea42cc1837a4c3), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a4d7), EConversationDebugInfo::Executing);
                
                // No. Maybe you'll find out. 
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155345"));
                DC(int64(0x44ea42cc1837a4d7), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a4c5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x44ea42cc1837a4c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_134286 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a4d9);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_155440_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134286);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a4da), EConversationDebugInfo::Executing);
                // All right. I'll handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_155440_686"));
                DC(int64(0x44ea42cc1837a4da), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19dc), EConversationDebugInfo::Executing);
                
                // You know, I think you will. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_151800"));
                DC(int64(0xa020c3390a9e19dc), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a500), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.StartQuest();
                DC(int64(0x44ea42cc1837a500), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a512), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x44ea42cc1837a512), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorus134430 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a5cc);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_160919");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorus134409);
            default Rules.HideIfKnows(UChoiceThorus134430);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x44ea42cc1837a5cf), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0x44ea42cc1837a86e), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_QKQHPDM_20241213_140134")));
                    DB(int64(0x4e0b64ff40475e0c), G1R.FireMagesDead == 0);
                    DB(int64(0x44ea42cc1837a5cf), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0x44ea42cc1837a86e), BC_BAN_QUENTIN != nullptr && BC_BAN_QUENTIN.IsEveryoneOfThisKindDead());
                    DB(int64(0x4e0b64ff40475e0c), G1R.FireMagesDead == 0);
                }
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning() && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_QKQHPDM_20241213_140134")) && G1R.FireMagesDead == 0)
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning() && BC_BAN_QUENTIN != nullptr && BC_BAN_QUENTIN.IsEveryoneOfThisKindDead() && G1R.FireMagesDead == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a5b9), EConversationDebugInfo::Executing);
                // I found that ex-bandit camp.
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_160919"));
                DC(int64(0x44ea42cc1837a5b9), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a5ba), EConversationDebugInfo::Executing);
                
                // Good job. So?
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_160919_3984"));
                DC(int64(0x44ea42cc1837a5ba), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Thorus_134437,
                    UTopic_Thorus_134457,
                    UTopic_Thorus_139084
                );
            }
        }
        
        
        class UTopic_Thorus_134437 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a620);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_162422_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134437);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QKQHPDM_20241213_140134"), int64(0x44ea42cc1837a620));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a621), EConversationDebugInfo::Executing);
                // I had a chat with their leader. Quentin.
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162422_3569"));
                DC(int64(0x44ea42cc1837a621), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a6a1), EConversationDebugInfo::Executing);
                
                // I'm all ears. 
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162601"));
                DC(int64(0x44ea42cc1837a6a1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Thorus_134534,
                    UTopic_Thorus_134554,
                    UTopic_Thorus_138375
                );
            }
        }
        
        
        class UTopic_Thorus_134457 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a624);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_162422_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134457);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a625), EConversationDebugInfo::Executing);
                // They're dead now.
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162422_443"));
                DC(int64(0x44ea42cc1837a625), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19ed), EConversationDebugInfo::Executing);
                
                // ... How?
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_152923"));
                DC(int64(0xa020c3390a9e19ed), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19ee), EConversationDebugInfo::Executing);
                
                // Just happened that way.
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_152926"));
                DC(int64(0xa020c3390a9e19ee), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19ef), EConversationDebugInfo::Executing);
                
                // I ... I'm not sure if I should even ask. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_152939"));
                DC(int64(0xa020c3390a9e19ef), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19f0), EConversationDebugInfo::Executing);
                // Surely not the outcome I expected, but I guess that's ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_152956"));
                DC(int64(0xa020c3390a9e19f0), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e19f1), EConversationDebugInfo::Executing);
                // Here you go. You've earned this. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153016"));
                DC(int64(0xa020c3390a9e19f1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_CompletedDead);
            }
        }
        
        
        class UTopic_Thorus_139084 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xa020c3390a9e1ae0);
            default Caption = LocText("TEXT_WIP_UPLRCKI_20250107_153756_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_139084);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa020c3390a9e1ae1), EConversationDebugInfo::Executing);
                // I'm still on it. 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153756_2238"));
                DC(int64(0xa020c3390a9e1ae1), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1af4), EConversationDebugInfo::Executing);
                
                // Then why'd you come back already? You're a strange one. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153802"));
                DC(int64(0xa020c3390a9e1af4), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b05), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa020c3390a9e1b05), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Thorus_134534 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a6ce);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_162633_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134534);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a6cf), EConversationDebugInfo::Executing);
                // We got into a fight. They're all dead now. 
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162633_1769"));
                DC(int64(0x44ea42cc1837a6cf), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1a02), EConversationDebugInfo::Executing);
                
                // ... Well. There's a turn I didn't seen coming.
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153127"));
                DC(int64(0xa020c3390a9e1a02), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1a03), EConversationDebugInfo::Executing);
                // One problem less to worry about, I suppose. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153241"));
                DC(int64(0xa020c3390a9e1a03), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1a04), EConversationDebugInfo::Executing);
                // Good work. Here's your reward. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153250"));
                DC(int64(0xa020c3390a9e1a04), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_CompletedDead);
            }
        }
        
        
        class UTopic_Thorus_134554 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a6d2);
            default Caption = LocText("TEXT_WIP_GMXDJZL_20241220_162633_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_134554);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x44ea42cc1837a6d3), EConversationDebugInfo::Executing);
                // Honestly, he seems dangerous. I'd be on the lookout.
                Hero.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162633_2995"));
                DC(int64(0x44ea42cc1837a6d3), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a736), EConversationDebugInfo::Executing);
                
                // ... I understand. I'll pass this on to Raven. Then we'll ...
                Thorus.AI.Say(LocText("TEXT_WIP_GMXDJZL_20241220_162745"));
                DC(int64(0x44ea42cc1837a736), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1aae), EConversationDebugInfo::Executing);
                // Good work. Here's your reward. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153250"));
                DC(int64(0xa020c3390a9e1aae), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_CompletedThreat);
            }
        }
        
        
        class UTopic_Thorus_138375 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xa020c3390a9e1a05);
            default Caption = LocText("TEXT_WIP_UPLRCKI_20250107_153342");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_138375);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa020c3390a9e1a1a), EConversationDebugInfo::Executing);
                // They just want to be left alone.
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153342"));
                DC(int64(0xa020c3390a9e1a1a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_CompleteNoThreat);
                DB(int64(0x44ca2976f778507f), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_BSWYRII_20250113_132534")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_BSWYRII_20250113_132534")))
                {
                    DC(int64(0xa020c3390a9e1a06), EConversationDebugInfo::Executing);
                    // He's got a chip on his shoulder when it comes to mages, ...
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153302_41"));
                    DC(int64(0xa020c3390a9e1a06), EConversationDebugInfo::Done);
                }
                DC(int64(0xa020c3390a9e1a19), EConversationDebugInfo::Executing);
                // Hmm. Well, in that case, they should stop taking in new ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153339"));
                DC(int64(0xa020c3390a9e1a19), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1a1b), EConversationDebugInfo::Executing);
                // But thanks, that's good intelligence. I'll pass it on to ...
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153400"));
                DC(int64(0xa020c3390a9e1a1b), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1aaf), EConversationDebugInfo::Executing);
                // Good work. Here's your reward. 
                Thorus.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_153250"));
                DC(int64(0xa020c3390a9e1aaf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorus134730 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x44ea42cc1837a7e7);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Thorus_134457);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Thorus_134534);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Thorus_134554);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Thorus_138375);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Thorus.AddItemToInventory(UItMi_Orenugget, 100);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a840), EConversationDebugInfo::Executing);
                Hero.GiveExperience(1000);
                DC(int64(0x44ea42cc1837a840), EConversationDebugInfo::Done);
                DC(int64(0x44ea42cc1837a853), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_REPORT.SucceedQuest();
                DC(int64(0x44ea42cc1837a853), EConversationDebugInfo::Done);
                DC(int64(0x56529d3224c732c5), EConversationDebugInfo::Executing);
                Thorus.AI.GiveItemTo(Hero, UItMi_Orenugget, 100);
                DC(int64(0x56529d3224c732c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorus89397 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0xd84afffd503ad644);
            default Caption = LocText("TEXT_WIP_OLUUHUE_20240412_101011");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd84afffd503ad647), G1R.Thorus_AmuletShown == 0);
                    DB(int64(0xd84afffd503ad668), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Brotherhood, 1, 0));
                    DB(int64(0x2fab0830121ab276), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x63fda0a743d86ad8), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x5e669123545c66a0), G1R.Thorus_Permission_Exterior == 0);
                }
                
                if (G1R.Thorus_AmuletShown != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Amulet_Brotherhood, 1, 0))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd84afffd503ad639), EConversationDebugInfo::Executing);
                // I'm on an errand for Master Y'Berion. Can you let me ...
                Hero.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_101011"));
                DC(int64(0xd84afffd503ad639), EConversationDebugInfo::Done);
                DB(int64(0xd84afffd503ad66a), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Brotherhood, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Amulet_Brotherhood, 1, 0))
                {
                    DC(int64(0xd84afffd503ad674), EConversationDebugInfo::Executing);
                    // Then you have his amulet?
                    Thorus.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_104214"));
                    DC(int64(0xd84afffd503ad674), EConversationDebugInfo::Done);
                    DC(int64(0xd84afffd503ad675), EConversationDebugInfo::Executing);
                    
                    // Here.
                    Hero.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_104214_2238"));
                    DC(int64(0xd84afffd503ad675), EConversationDebugInfo::Done);
                    DC(int64(0x35234a6db06081f), EConversationDebugInfo::Executing);
                    
                    // Alright. Go on through. 
                    Thorus.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_231550"));
                    DC(int64(0x35234a6db06081f), EConversationDebugInfo::Done);
                    DC(int64(0xd84afffd503ad68d), EConversationDebugInfo::Executing);
                    G1R.Thorus_AmuletShown = 1;
                    DC(int64(0xd84afffd503ad68d), EConversationDebugInfo::Done);
                    DC(int64(0xd84afffd503ad69a), EConversationDebugInfo::Executing);
                    G1R.Thorus_Permission_Exterior = 1;
                    DC(int64(0xd84afffd503ad69a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_89397_exit_1");
                }
                else
                {
                    DC(int64(0xd84afffd503ad67f), EConversationDebugInfo::Executing);
                    // Then you have his amulet?
                    Thorus.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_104214"));
                    DC(int64(0xd84afffd503ad67f), EConversationDebugInfo::Done);
                    DC(int64(0xd84afffd503ad680), EConversationDebugInfo::Executing);
                    
                    // Um ... 
                    Hero.AI.Say(LocText("TEXT_WIP_OLUUHUE_20240412_104217_1924"));
                    DC(int64(0xd84afffd503ad680), EConversationDebugInfo::Done);
                    DC(int64(0x35234a6db060820), EConversationDebugInfo::Executing);
                    
                    // Come on. If you're really on an errand for Y'Berion, ...
                    Thorus.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_232015"));
                    DC(int64(0x35234a6db060820), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_89397_exit_2");
                }
            }
        }
        
        
        class UChoiceThorus97958 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x1d9a089e246f2ab3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceThorus97958);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_GatePoint3", 300.0f, int64(0x1d9a089e246f2ab3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x222dae20f194bf08), G1R.FireMagesDead == 0);
                    DB(int64(0xe860a47ab0237a31), G1R.PlaceholderCondition == 6);
                }
                
                if (G1R.FireMagesDead != 0)
                    return false;
                
                if (G1R.PlaceholderCondition != 6)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1d9a089e246f2af0), EConversationDebugInfo::Executing);
                // Ain't I just seen you walk through that gate? 
                Thorus.AI.Say(LocText("TEXT_WIP_DXKHAXF_20240523_132306"));
                DC(int64(0x1d9a089e246f2af0), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e73c), EConversationDebugInfo::Executing);
                
                // Why did you close it? 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184600"));
                DC(int64(0x19f1d0df4e41e73c), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e73d), EConversationDebugInfo::Executing);
                
                // You didn't answer my question. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184604"));
                DC(int64(0x19f1d0df4e41e73d), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e73f), EConversationDebugInfo::Executing);
                
                // Neither did you. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184620"));
                DC(int64(0x19f1d0df4e41e73f), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e740), EConversationDebugInfo::Executing);
                
                // Guess that makes us even. Just leave, freshie - there's ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184623"));
                DC(int64(0x19f1d0df4e41e740), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e741), EConversationDebugInfo::Executing);
                // You didn't wanna end up in the middle of it. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184708"));
                DC(int64(0x19f1d0df4e41e741), EConversationDebugInfo::Done);
                DC(int64(0x1d9a089e246f2ac2), EConversationDebugInfo::Executing);
                Thorus.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x1d9a089e246f2ac2), EConversationDebugInfo::Done);
                DC(int64(0x1d9a089e246f2acd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1d9a089e246f2acd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorus97961 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x82fbbe18f8eb36f0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceThorus97961);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x222dae20f194be6a), G1R.FireMagesDead != 0);
                }
                
                return G1R.FireMagesDead != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82fbbe18f8eb36e5), EConversationDebugInfo::Executing);
                // Well, well. 
                Thorus.AI.Say(LocText("TEXT_WIP_ZWKHAXF_20240527_143620_731"));
                DC(int64(0x82fbbe18f8eb36e5), EConversationDebugInfo::Done);
                DB(int64(0x19f1d0df4e41e770), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x19f1d0df4e41e7b7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                DB(int64(0x19f1d0df4e41e7b8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x19f1d0df4e41e77c), EConversationDebugInfo::Executing);
                    // Did my guys deliver the message? 
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184905_2785"));
                    DC(int64(0x19f1d0df4e41e77c), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7d8), EConversationDebugInfo::Executing);
                    
                    // They did. You kicked me out. 
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185040"));
                    DC(int64(0x19f1d0df4e41e7d8), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7d9), EConversationDebugInfo::Executing);
                    
                    // No need to be all sullen. Fact is, Gomez might've well ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185107"));
                    DC(int64(0x19f1d0df4e41e7d9), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7da), EConversationDebugInfo::Executing);
                    // Raven and I are the only reason he settled for ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185210"));
                    DC(int64(0x19f1d0df4e41e7da), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Thorus_101373,
                        UTopic_Thorus_102058,
                        UTopic_Thorus_101393
                    );
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                {
                    DC(int64(0x19f1d0df4e41e7ba), EConversationDebugInfo::Executing);
                    // You've got some nerve showing up here, especially in ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185015_3286"));
                    DC(int64(0x19f1d0df4e41e7ba), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7dc), EConversationDebugInfo::Executing);
                    
                    // Why? Are you going to kill me? 
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185316"));
                    DC(int64(0x19f1d0df4e41e7dc), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7dd), EConversationDebugInfo::Executing);
                    
                    // I won't, and my guys won't either, at least as long as ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185322"));
                    DC(int64(0x19f1d0df4e41e7dd), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7de), EConversationDebugInfo::Executing);
                    // Fact is, Gomez wanted to have you hunted down at first. ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185337"));
                    DC(int64(0x19f1d0df4e41e7de), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Thorus_1013732,
                        UTopic_Thorus_1020582,
                        UTopic_Thorus_1013932
                    );
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x19f1d0df4e41e7c9), EConversationDebugInfo::Executing);
                    // You got some nerve showing up here - especially in that ...
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185018_686"));
                    DC(int64(0x19f1d0df4e41e7c9), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7e0), EConversationDebugInfo::Executing);
                    
                    // I guess we're enemies now?
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185521"));
                    DC(int64(0x19f1d0df4e41e7e0), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e7e1), EConversationDebugInfo::Executing);
                    
                    // If we were, you'd already be dead. 
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185527"));
                    DC(int64(0x19f1d0df4e41e7e1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_97961_exit_1");
                }
                else
                {
                    DC(int64(0x19f1d0df4e41e79e), EConversationDebugInfo::Executing);
                    // You got some nerve showing up here. 
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_184912_3436"));
                    DC(int64(0x19f1d0df4e41e79e), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e835), EConversationDebugInfo::Executing);
                    
                    // Why? Are you going to kill me? 
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190112"));
                    DC(int64(0x19f1d0df4e41e835), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e836), EConversationDebugInfo::Executing);
                    
                    // If that's what I wanted, you'd be long dead. 
                    Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190118"));
                    DC(int64(0x19f1d0df4e41e836), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_97961_exit_2");
                }
            }
        }
        
        
        class UTopic_Thorus_101373 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e7e4);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_185804_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_101373);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e7e5), EConversationDebugInfo::Executing);
                // What do you expect me to say? "Thank you?"
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185804_2386"));
                DC(int64(0x19f1d0df4e41e7e5), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e805), EConversationDebugInfo::Executing);
                
                // I couldn't care less. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185842"));
                DC(int64(0x19f1d0df4e41e805), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_102058 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e84b);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_190141_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_102058);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e84c), EConversationDebugInfo::Executing);
                
                // Go to hell. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190141_3569"));
                DC(int64(0x19f1d0df4e41e84c), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e859), EConversationDebugInfo::Executing);
                
                // Already there. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190204"));
                DC(int64(0x19f1d0df4e41e859), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_101393 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e7e8);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_185804_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_101393);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e7e9), EConversationDebugInfo::Executing);
                
                // You're murderers. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185804_1609"));
                DC(int64(0x19f1d0df4e41e7e9), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e806), EConversationDebugInfo::Executing);
                
                // Tell me something I don't know, freshie. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185900"));
                DC(int64(0x19f1d0df4e41e806), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_1013732 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e7e4);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_185804_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_1013732);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e7e5), EConversationDebugInfo::Executing);
                
                // What do you expect me to say? "Thank you?"
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185804_2386"));
                DC(int64(0x19f1d0df4e41e7e5), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e805), EConversationDebugInfo::Executing);
                
                // I couldn't care less. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185842"));
                DC(int64(0x19f1d0df4e41e805), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_1020582 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e84b);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_190141_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_1020582);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e84c), EConversationDebugInfo::Executing);
                
                // Go to hell. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190141_3569"));
                DC(int64(0x19f1d0df4e41e84c), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e859), EConversationDebugInfo::Executing);
                
                // Already there. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190204"));
                DC(int64(0x19f1d0df4e41e859), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Thorus_1013932 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x19f1d0df4e41e7e8);
            default Caption = LocText("TEXT_WIP_SRQTACJ_20240607_185804_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Thorus_1013932);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e7e9), EConversationDebugInfo::Executing);
                
                // You're murderers. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185804_1609"));
                DC(int64(0x19f1d0df4e41e7e9), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e806), EConversationDebugInfo::Executing);
                
                // Tell me something I don't know, freshie. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185900"));
                DC(int64(0x19f1d0df4e41e806), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorus98585 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x2fab0830121ab293);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceThorus98585);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2fab0830121ab296), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2fab0830121ab288), EConversationDebugInfo::Executing);
                // Hold up. 
                Thorus.AI.Say(LocText("TEXT_WIP_IAKMKKE_20240522_155530_41"));
                DC(int64(0x2fab0830121ab288), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_Thorus);
                DB(int64(0x6894bd3e27721595), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x6894bd3e277215ab), EConversationDebugInfo::Executing);
                    // Where by Beliar have you been? 
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185654_41"));
                    DC(int64(0x6894bd3e277215ab), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215ce), EConversationDebugInfo::Executing);
                    
                    // Here and there. 
                    Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185722"));
                    DC(int64(0x6894bd3e277215ce), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215cf), EConversationDebugInfo::Executing);
                    
                    // Really? Because word on the street is, you've been ...
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185725"));
                    DC(int64(0x6894bd3e277215cf), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d1), EConversationDebugInfo::Executing);
                    
                    // It's for a good cause. 
                    Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185814"));
                    DC(int64(0x6894bd3e277215d1), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d0), EConversationDebugInfo::Executing);
                    
                    // It always is, ain't it? 
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185805"));
                    DC(int64(0x6894bd3e277215d0), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d2), EConversationDebugInfo::Executing);
                    // Look, I don't give a molerat's ass what you do when ...
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185955"));
                    DC(int64(0x6894bd3e277215d2), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d4), EConversationDebugInfo::Executing);
                    // I'd recommend you stay away from the castle right now. 
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190148"));
                    DC(int64(0x6894bd3e277215d4), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6894bd3e277215c1), EConversationDebugInfo::Executing);
                    // Beliar's Balls ... you just show up everywhere, don't ...
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_185706_2083"));
                    DC(int64(0x6894bd3e277215c1), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d5), EConversationDebugInfo::Executing);
                    
                    // I have business in the castle. 
                    Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190225"));
                    DC(int64(0x6894bd3e277215d5), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d6), EConversationDebugInfo::Executing);
                    
                    // At the risk of blowing your mind, I guessed as much. 
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190232"));
                    DC(int64(0x6894bd3e277215d6), EConversationDebugInfo::Done);
                    DC(int64(0x6894bd3e277215d7), EConversationDebugInfo::Executing);
                    // If I were you, I'd postpone it, whatever it is. Now ...
                    Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190304"));
                    DC(int64(0x6894bd3e277215d7), EConversationDebugInfo::Done);
                }
                DC(int64(0x6894bd3e277215e4), EConversationDebugInfo::Executing);
                // Why's that? 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190329"));
                DC(int64(0x6894bd3e277215e4), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277215e5), EConversationDebugInfo::Executing);
                
                // Let's just say, emotions are running high right now. The ...
                Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190329_2238"));
                DC(int64(0x6894bd3e277215e5), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e27721606), EConversationDebugInfo::Executing);
                
                // I'll take the risk. 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190446"));
                DC(int64(0x6894bd3e27721606), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e27721607), EConversationDebugInfo::Executing);
                
                // (sighs) Fine. It'll probably be alright. 
                Thorus.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_190450"));
                DC(int64(0x6894bd3e27721607), EConversationDebugInfo::Done);
                DC(int64(0x1d9a089e246f28fb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1d9a089e246f28fb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorus99670 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x4c07988ffc224bac);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorus97961);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x19f1d0df4e41e86e), EConversationDebugInfo::Executing);
                // Look, if it's any solace, I don't like what happened to ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190231"));
                DC(int64(0x19f1d0df4e41e86e), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e86f), EConversationDebugInfo::Executing);
                // They thought those runes and oaths made them any better ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190302"));
                DC(int64(0x19f1d0df4e41e86f), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e870), EConversationDebugInfo::Executing);
                // You're either tough, savvy, or you make the right ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190324"));
                DC(int64(0x19f1d0df4e41e870), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e871), EConversationDebugInfo::Executing);
                // Corristo and his men didn't get that, and thought their ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190405"));
                DC(int64(0x19f1d0df4e41e871), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e808), EConversationDebugInfo::Executing);
                // It didn't work out. 
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_185939"));
                DC(int64(0x19f1d0df4e41e808), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e872), EConversationDebugInfo::Executing);
                // Now, I suggest you move along. I like you, but if Arto ...
                Thorus.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_190527"));
                DC(int64(0x19f1d0df4e41e872), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_THORUS, Document::UDocumentSegment_Glossary_OC_GRD_THORUS_FireMages);
            }
        }
        
        
        class UChoiceThorusBribeguard : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f4a);
            default Caption = LocText("INFO_THORUS_BRIBEGUARD_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusEntercastle);
            default Rules.HideIfKnows(UChoiceThorusBribeguard);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f4b), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x9fe4174460845f4c), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x6689f91ee0d2fdb), G1R.Thorus_Permission_Exterior == 0);
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                if (G1R.Thorus_Permission_Exterior != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f4d), EConversationDebugInfo::Executing);
                // For enough nuggets, would you let me into the castle?
                Hero.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_15_00"));
                DC(int64(0x9fe4174460845f4d), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f4e), EConversationDebugInfo::Executing);
                
                // What's "enough?"
                Thorus.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_09_01"));
                DC(int64(0x9fe4174460845f4e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f4f), EConversationDebugInfo::Executing);
                
                // You tell me.
                Hero.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_15_02"));
                DC(int64(0x9fe4174460845f4f), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f50), EConversationDebugInfo::Executing);
                
                // Well, it would have to be enough to keep me and my guys ...
                Thorus.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_09_02"));
                DC(int64(0x9fe4174460845f50), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f51), EConversationDebugInfo::Executing);
                
                // Just give me a number.
                Hero.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_15_03"));
                DC(int64(0x9fe4174460845f51), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f52), EConversationDebugInfo::Executing);
                
                // A thousand nuggs.
                Thorus.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_09_03"));
                DC(int64(0x9fe4174460845f52), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f53), EConversationDebugInfo::Executing);
                
                // A thousand?
                Hero.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_15_04"));
                DC(int64(0x9fe4174460845f53), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f54), EConversationDebugInfo::Executing);
                
                // That's what I said. Or you could just join Gomez's ...
                Thorus.AI.Say(LocText("INFO_THORUS_BRIBEGUARD_09_04"));
                DC(int64(0x9fe4174460845f54), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusDiegosentme : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845ef6);
            default Caption = LocText("INFO_THORUS_DIEGOSENTME_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusWorkforgomez);
            default Rules.HideIfKnows(UChoiceThorusDiegosentme);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_DIEGO_JOINOLDCAMP_11_01"), int64(0x9fe4174460845ef6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845ef7), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845ef8), EConversationDebugInfo::Executing);
                
                // Diego said you're the guy to talk to if I want to join ...
                Hero.AI.Say(LocText("INFO_THORUS_DIEGOSENTME_15_00"));
                DC(int64(0x9fe4174460845ef8), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845ef9), EConversationDebugInfo::Executing);
                
                // Did he? Guess he wants me to give you the rundown then.
                Thorus.AI.Say(LocText("INFO_THORUS_DIEGOSENTME_09_01"));
                DC(int64(0x9fe4174460845ef9), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845efa), EConversationDebugInfo::Executing);
                // I'll make it simple: The only one who can take you in as ...
                Thorus.AI.Say(LocText("INFO_THORUS_DIEGOSENTME_09_02"));
                DC(int64(0x9fe4174460845efa), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845efb), EConversationDebugInfo::Executing);
                // And the only way you get to go through this gate and ...
                Thorus.AI.Say(LocText("INFO_THORUS_DIEGOSENTME_09_03"));
                DC(int64(0x9fe4174460845efb), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845efc), EConversationDebugInfo::Executing);
                
                // Then I guess I'll go talk to Diego. 
                Hero.AI.Say(LocText("INFO_THORUS_DIEGOSENTME_15_04"));
                DC(int64(0x9fe4174460845efc), EConversationDebugInfo::Done);
                DC(int64(0xf13dbf3c5ac4b22c), EConversationDebugInfo::Executing);
                
                // Do that. 
                Thorus.AI.Say(LocText("TEXT_WIP_ZDMVSBC_20240918_201423"));
                DC(int64(0xf13dbf3c5ac4b22c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINOC, Document::UDocumentSegment_CH1_JOINOC_VisitDiego);
            }
        }
        
        
        class UChoiceThorusEntercastle : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845eee);
            default Caption = LocText("INFO_ENTERCASTLE_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceThorusEntercastle);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845eef), G1R.Diego_GomezAudience == 0);
                    DB(int64(0x48bed3b8afffbcaa), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (G1R.Diego_GomezAudience != 0)
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845ef0), EConversationDebugInfo::Executing);
                // I'm guessing this area is off limits?
                Hero.AI.Say(LocText("INFO_ENTERCASTLE_15_00"));
                DC(int64(0x9fe4174460845ef0), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845ef1), EConversationDebugInfo::Executing);
                
                // It is. Only Gomez's men are allowed inside the castle. 
                Thorus.AI.Say(LocText("INFO_ENTERCASTLE_09_01"));
                DC(int64(0x9fe4174460845ef1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_THORUS, Document::UDocumentSegment_Glossary_OC_GRD_THORUS_Introduction);
            }
        }
        
        
        class UChoiceThorusExit : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845eec);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845eed), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9fe4174460845eed), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorusGive1000ore : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f55);
            default Caption = LocText("INFO_THORUS_GIVE1000ORE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusBribeguard);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd614ff4fe8304d3a), G1R.Thorus_Permission_Exterior == 0);
                }
                
                return G1R.Thorus_Permission_Exterior == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f56), EConversationDebugInfo::Executing);
                // I have your one thousand nuggets. Now let me in.
                Hero.AI.Say(LocText("INFO_THORUS_GIVE1000ORE_15_00"));
                DC(int64(0x9fe4174460845f56), EConversationDebugInfo::Done);
                DB(int64(0x9fe4174460845f58), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1000, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1000, 0))
                {
                    DC(int64(0x3324a0310d74f78f), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Thorus, UItMi_Orenugget, 1000);
                    DC(int64(0x3324a0310d74f78f), EConversationDebugInfo::Done);
                    DC(int64(0x9fe4174460845f5a), EConversationDebugInfo::Executing);
                    // All right, you can go in. But I'm warning you - one ...
                    Thorus.AI.Say(LocText("INFO_THORUS_GIVE1000ORE_09_01"));
                    DC(int64(0x9fe4174460845f5a), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d74f78c), EConversationDebugInfo::Executing);
                    G1R.Thorus_Permission_Exterior = 1;
                    DC(int64(0x3324a0310d74f78c), EConversationDebugInfo::Done);
                    DC(int64(0x1eef95525eb76c44), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Ch2); }
                    DC(int64(0x1eef95525eb76c44), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_give1000ore_exit_1");
                }
                else
                {
                    DC(int64(0x9fe4174460845f5b), EConversationDebugInfo::Executing);
                    // Don't play with me. You ain't got that much.
                    Thorus.AI.Say(LocText("INFO_THORUS_GIVE1000ORE_09_02"));
                    DC(int64(0x9fe4174460845f5b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_give1000ore_exit_2");
                }
            }
        }
        
        
        class UChoiceThorusKdwsiegel : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f75);
            default Caption = LocText("INFO_THORUS_KDWSIEGEL_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x31e17e614b8c3e22), G1R.Thorus_AmuletShown == 0);
                    DB(int64(0x31e17e614b8c3e23), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Water, 1, 0));
                    DB(int64(0x2fab0830121ab274), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xc12c60aa26238010), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xd84afffd503ad69c), G1R.Thorus_AmuletShown == 0);
                    DB(int64(0xd84afffd503ad6a8), Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_COURIER_11_03")));
                    DB(int64(0x2fab0830121ab275), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0xc12c60aa26238022), G1R.Thorus_Permission_Exterior == 0);
                }
                
                if (G1R.Thorus_AmuletShown == 0 && Hero != nullptr && Hero.HasItem(UItAt_Amulet_Water, 1, 0) && G1R != nullptr && !G1R.HasReachedChapter(4) && G1R.Thorus_Permission_Exterior == 0)
                    return true;
                
                if (G1R.Thorus_AmuletShown == 0 && Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_COURIER_11_03")) && G1R != nullptr && !G1R.HasReachedChapter(4) && G1R.Thorus_Permission_Exterior == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f77), EConversationDebugInfo::Executing);
                // I have an important message from the Water Mages. I need ...
                Hero.AI.Say(LocText("INFO_THORUS_KDWSIEGEL_15_00"));
                DC(int64(0x9fe4174460845f77), EConversationDebugInfo::Done);
                DB(int64(0x9fe4174460845f79), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Water, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Amulet_Water, 1, 0))
                {
                    DC(int64(0x9fe4174460845f7a), EConversationDebugInfo::Executing);
                    // Hmm ... you're wearing their amulet. All right, I'll ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KDWSIEGEL_09_01"));
                    DC(int64(0x9fe4174460845f7a), EConversationDebugInfo::Done);
                    DC(int64(0x9fe4174460845f7b), EConversationDebugInfo::Executing);
                    // Just go on through and don't bother me again. I don't ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KDWSIEGEL_09_02"));
                    DC(int64(0x9fe4174460845f7b), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d74f799), EConversationDebugInfo::Executing);
                    G1R.Thorus_AmuletShown = 1;
                    DC(int64(0x3324a0310d74f799), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d74f79b), EConversationDebugInfo::Executing);
                    G1R.Thorus_Permission_Exterior = 1;
                    DC(int64(0x3324a0310d74f79b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_kdwsiegel_exit_1");
                }
                else
                {
                    DC(int64(0x9fe4174460845f7d), EConversationDebugInfo::Executing);
                    // Sure you are. And you just happened to forget your ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KDWSIEGEL_09_03"));
                    DC(int64(0x9fe4174460845f7d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_kdwsiegel_exit_2");
                }
            }
        }
        
        
        class UChoiceThorusKrautbote : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f6c);
            default Caption = LocText("INFO_THORUS_KRAUTBOTE_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f6d), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning());
                    DB(int64(0x2fab0830121ab273), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && !Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f6e), EConversationDebugInfo::Executing);
                // I have some swampweed for Gomez. It's from Cor Kalom.
                Hero.AI.Say(LocText("INFO_THORUS_KRAUTBOTE_15_00"));
                DC(int64(0x9fe4174460845f6e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f6f), EConversationDebugInfo::Executing);
                
                // Show me.
                Thorus.AI.Say(LocText("INFO_THORUS_KRAUTBOTE_09_01"));
                DC(int64(0x9fe4174460845f6f), EConversationDebugInfo::Done);
                DB(int64(0x9fe4174460845f71), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 30, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 30, 0))
                {
                    DC(int64(0x9fe4174460845f72), EConversationDebugInfo::Executing);
                    // Hmm ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KRAUTBOTE_09_02"));
                    DC(int64(0x9fe4174460845f72), EConversationDebugInfo::Done);
                    DC(int64(0x9fe4174460845f73), EConversationDebugInfo::Executing);
                    // All right, you can pass. Go straight to the ore barons' ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KRAUTBOTE_09_03"));
                    DC(int64(0x9fe4174460845f73), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_KRAUTBOTE, Document::UDocumentSegment_CH2_KRAUTBOTE_Thorus);
                    DC(int64(0x3324a0310d74f7a8), EConversationDebugInfo::Executing);
                    G1R.Thorus_Permission_Interior = 1;
                    DC(int64(0x3324a0310d74f7a8), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d74f7aa), EConversationDebugInfo::Executing);
                    G1R.Thorus_Permission_Exterior = 1;
                    DC(int64(0x3324a0310d74f7aa), EConversationDebugInfo::Done);
                    DC(int64(0x7c7361a318c4028e), EConversationDebugInfo::Executing);
                    G1R.GuardPassageWarning_OC = 0;
                    DC(int64(0x7c7361a318c4028e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_krautbote_exit_1");
                    DC(int64(0xfb64fa1f6f86285), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xfb64fa1f6f86285), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x9fe4174460845f74), EConversationDebugInfo::Executing);
                    // That's way less than what they usually bring. You didn't ...
                    Thorus.AI.Say(LocText("INFO_THORUS_KRAUTBOTE_09_04"));
                    DC(int64(0x9fe4174460845f74), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_thorus_krautbote_exit_2");
                    DC(int64(0xfb64fa1f6f86286), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xfb64fa1f6f86286), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceThorusLetterformages : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f5c);
            default Caption = LocText("TEXT_CHOICE_THORUS_LETTERFORMAGES");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusEntercastle);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x31e17e614b8c3e07), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0xe026176af47bcb78), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xe026176af47bcb7c), G1R.FireMagesDead == 0);
                    DB(int64(0x31e17e614b8c3e07), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0xe026176af47bcb79), G1R.Thorus_Permission_Interior == 0);
                    DB(int64(0xe026176af47bcb8b), G1R.FireMagesDead == 0);
                    DB(int64(0x31e17e614b8c3e07), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                    DB(int64(0xe026176af47bcb7b), G1R.Thorus_Permission_Interior == 0);
                    DB(int64(0xe026176af47bcb9b), G1R.FireMagesDead == 0);
                    DB(int64(0x31e17e614b8c3e08), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                    DB(int64(0xe026176af47bcb7a), G1R.Thorus_Permission_Exterior == 0);
                    DB(int64(0xe026176af47bcb8c), G1R.FireMagesDead == 0);
                }
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0) && G1R.Thorus_Permission_Exterior == 0 && G1R.FireMagesDead == 0)
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0) && G1R.Thorus_Permission_Interior == 0 && G1R.FireMagesDead == 0)
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0) && G1R.Thorus_Permission_Interior == 0 && G1R.FireMagesDead == 0)
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0) && G1R.Thorus_Permission_Exterior == 0 && G1R.FireMagesDead == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f5d), EConversationDebugInfo::Executing);
                // I need to go in there. I have a letter for the highest ...
                Hero.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_15_00"));
                DC(int64(0x9fe4174460845f5d), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f5e), EConversationDebugInfo::Executing);
                
                // And now you expect me to just let you waltz in here and ...
                Thorus.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_09_01"));
                DC(int64(0x9fe4174460845f5e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f5f), EConversationDebugInfo::Executing);
                
                // Yes.
                Hero.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_15_02"));
                DC(int64(0x9fe4174460845f5f), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f60), EConversationDebugInfo::Executing);
                
                // All right. Show me that letter.
                Thorus.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_09_03"));
                DC(int64(0x9fe4174460845f60), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f61), EConversationDebugInfo::Executing);
                
                // Forget it - I'm not that stupid.
                Hero.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_15_04"));
                DC(int64(0x9fe4174460845f61), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f62), EConversationDebugInfo::Executing);
                
                // Good for you.
                Thorus.AI.Say(LocText("INFO_THORUS_LETTERFORMAGES_09_05"));
                DC(int64(0x9fe4174460845f62), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragfailed : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f42);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusMordragkoOffer);
            default Rules.HideIfKnows(UChoiceThorusMordragfailed);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f43), G1R.MordragKO_PlayerChoseThorus != 0);
                    DB(int64(0x9fe4174460845f44), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                    DB(int64(0x2c9c64b8ce3d0cd6), Mordrag != nullptr && !Mordrag.IsEveryoneOfThisKindDead());
                }
                
                if (G1R.MordragKO_PlayerChoseThorus == 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && !Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning())
                    return false;
                
                if (Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f45), EConversationDebugInfo::Executing);
                // You fucking idiot! Didn't I tell you not to mention my ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGFAILED_09_00"));
                DC(int64(0x9fe4174460845f45), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f46), EConversationDebugInfo::Executing);
                // You bloody blew it ... don't even think about trying fix ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGFAILED_09_01"));
                DC(int64(0x9fe4174460845f46), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_Failed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ThorusFailed);
                DC(int64(0x63819e131811202d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO.FailQuest();
                DC(int64(0x63819e131811202d), EConversationDebugInfo::Done);
                DC(int64(0x7a39042251a226f4), EConversationDebugInfo::Executing);
                Thorus.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x7a39042251a226f4), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f49), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9fe4174460845f49), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorusMordragkoAnalyze : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f2e);
            default Caption = LocText("TEXT_CHOICE_THORUS_MORDRAGKO_ANALYZE");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusMordragkoOffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x570acab4847cedbc), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                    DB(int64(0x570acab4847cedcb), G1R.MordragKO_PlayerChoseThorus != 0);
                    DB(int64(0x570acab4847cedcc), Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead());
                    DB(int64(0x9fe4174460845f2f), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning());
                    DB(int64(0x9fe4174460845f30), G1R.MordragKO_PlayerChoseThorus == 0);
                }
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning() && G1R.MordragKO_PlayerChoseThorus != 0 && Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead())
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.IsRunning() && G1R.MordragKO_PlayerChoseThorus == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UChoiceThorusMordragkoAnalyzeBack,
                    UChoiceThorusMordragkoWhere1,
                    UChoiceThorusMordragkoMordragdead,
                    UChoiceThorusMordragkoMordraggone
                );
            }
        }
        
        
        class UChoiceThorusMordragkoAnalyzeBack : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f32);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_ANALYZE_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f33), EConversationDebugInfo::Executing);
                // I'll take care of it.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_ANALYZE_BACK_15_00"));
                DC(int64(0x9fe4174460845f33), EConversationDebugInfo::Done);
                DC(int64(0x373f0a4982b63f36), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x373f0a4982b63f36), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorusMordragkoWhere1 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f34);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_WHERE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("ORG_826_MORDRAG_GREET_11_00"), int64(0x9fe4174460845f34));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f35), EConversationDebugInfo::Executing);
                // Okay. Where do I find this Mordrag?
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_WHERE_15_00"));
                DC(int64(0x9fe4174460845f35), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f36), EConversationDebugInfo::Executing);
                
                // At the south gate, the other side of the castle. He's ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_WHERE_09_01"));
                DC(int64(0x9fe4174460845f36), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f37), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9fe4174460845f37), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragkoMordragdead : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f38);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_MORDRAGDEAD_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb592c2429630b9ec), Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead());
                    DB(int64(0x31e17e614b8c3dde), Mordrag != nullptr && Mordrag.WasDefeatedBy(Hero));
                }
                
                if (Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead())
                    return true;
                
                if (Mordrag != nullptr && Mordrag.WasDefeatedBy(Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f39), EConversationDebugInfo::Executing);
                // Mordrag won't steal from anyone ever again.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MORDRAGDEAD_15_00"));
                DC(int64(0x9fe4174460845f39), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f3a), EConversationDebugInfo::Executing);
                
                // So you actually beat him? Not bad, green blood. Not bad ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MORDRAGDEAD_09_01"));
                DC(int64(0x9fe4174460845f3a), EConversationDebugInfo::Done);
                DC(int64(0xf13dbf3c5ac4b209), EConversationDebugInfo::Executing);
                // I'll remember this. 
                Thorus.AI.Say(LocText("TEXT_WIP_ZDMVSBC_20240918_195832"));
                DC(int64(0xf13dbf3c5ac4b209), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_MordragDead);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ThorusCompleted);
                DC(int64(0x3324a0310d74f7cf), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_MORDRAGKO_KILL);
                DC(int64(0x3324a0310d74f7cf), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318111fff), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_REPORT.SucceedQuest();
                DC(int64(0x63819e1318111fff), EConversationDebugInfo::Done);
                DC(int64(0x5c2c96b7708dbed3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c2c96b7708dbed3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorusMordragkoMordraggone : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f3d);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_MORDRAGGONE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x31e17e614b8c3de6), Mordrag != nullptr && !Mordrag.IsEveryoneOfThisKindDead());
                    DB(int64(0x31e17e614b8c3de7), G1R.MordragKO_StayAtNC != 0);
                }
                
                if (Mordrag != nullptr && Mordrag.IsEveryoneOfThisKindDead())
                    return false;
                
                if (G1R.MordragKO_StayAtNC == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f3e), EConversationDebugInfo::Executing);
                // That guy won't ever show up here again.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MORDRAGGONE_15_00"));
                DC(int64(0x9fe4174460845f3e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f3f), EConversationDebugInfo::Executing);
                
                // Hm. I'd rather you killed him. But fine.
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MORDRAGGONE_09_01"));
                DC(int64(0x9fe4174460845f3f), EConversationDebugInfo::Done);
                DC(int64(0xf13dbf3c5ac4b20a), EConversationDebugInfo::Executing);
                // I'll remember this. 
                Thorus.AI.Say(LocText("TEXT_WIP_ZDMVSBC_20240918_195832"));
                DC(int64(0xf13dbf3c5ac4b20a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_Completed);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_ThorusCompleted);
                DC(int64(0x3324a0310d74f7d8), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_MORDRAGKO_CONVINCE);
                DC(int64(0x3324a0310d74f7d8), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318111fee), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_REPORT.SucceedQuest();
                DC(int64(0x63819e1318111fee), EConversationDebugInfo::Done);
                DC(int64(0x5c2c96b7708dbed4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5c2c96b7708dbed4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceThorusMordragkoOffer : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f0a);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_OFFER_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusTrymeicandoit);
            default Rules.HideIfKnows(UChoiceThorusMordragkoOffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f0b), Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && !Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasBeenStarted());
                    DB(int64(0x1a7e557b8ae583ba), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f0c), EConversationDebugInfo::Executing);
                // I'm ready for that job you mentioned.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_15_00"));
                DC(int64(0x9fe4174460845f0c), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f0d), EConversationDebugInfo::Executing);
                
                // Fine. What I'm about to tell you stays between us - that ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_09_01"));
                DC(int64(0x9fe4174460845f0d), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f0e), EConversationDebugInfo::Executing);
                
                // Clear.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_15_02"));
                DC(int64(0x9fe4174460845f0e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f0f), EConversationDebugInfo::Executing);
                
                // Good. We got trouble with a guy from the New Camp. ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_09_03"));
                DC(int64(0x9fe4174460845f0f), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f10), EConversationDebugInfo::Executing);
                // Now, he ain't the first rice-eater to do that, but that ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_09_04"));
                DC(int64(0x9fe4174460845f10), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f11), EConversationDebugInfo::Executing);
                // We can't let that stand, but Mordrag knows damn well I ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_09_05"));
                DC(int64(0x9fe4174460845f11), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f12), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_15_06"));
                DC(int64(0x9fe4174460845f12), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f13), EConversationDebugInfo::Executing);
                
                // Because the Fire Mages protect him.  
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_09_07"));
                DC(int64(0x9fe4174460845f13), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceThorusMordragkoOfferBack,
                    UChoiceThorusMordragkoKillhim,
                    UChoiceThorusMordragkoWhere,
                    UChoiceThorusMordragkoMagesprotect,
                    UChoiceThorusMordragkoMageproblem
                );
            }
        }
        
        
        class UChoiceThorusMordragkoOfferBack : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f17);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_OFFER_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceThorusMordragkoOfferBack);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f18), EConversationDebugInfo::Executing);
                // I'll take care of it.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_OFFER_BACK_15_00"));
                DC(int64(0x9fe4174460845f18), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MORDRAGKO, Document::UDocumentSegment_CH1_MORDRAGKO_Start);
                DC(int64(0x63819e1318111ab7), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_MORDRAGKO.StartQuest();
                DC(int64(0x63819e1318111ab7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragkoKillhim : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f19);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_KILLHIM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceThorusMordragkoKillhim);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f1a), EConversationDebugInfo::Executing);
                // You want me to kill this guy?
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_KILLHIM_15_00"));
                DC(int64(0x9fe4174460845f1a), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f1b), EConversationDebugInfo::Executing);
                
                // I want you to make sure I don't ever have to see his mug ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_KILLHIM_09_01"));
                DC(int64(0x9fe4174460845f1b), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f1c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9fe4174460845f1c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragkoWhere : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f1d);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_WHERE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceThorusMordragkoWhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f1e), EConversationDebugInfo::Executing);
                // Okay. Where do I find this Mordrag?
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_WHERE_15_00"));
                DC(int64(0x9fe4174460845f1e), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f1f), EConversationDebugInfo::Executing);
                
                // At the south gate, the other side of the castle. He's ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_WHERE_09_01"));
                DC(int64(0x9fe4174460845f1f), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f20), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9fe4174460845f20), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragkoMagesprotect : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f21);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceThorusMordragkoMagesprotect);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f22), EConversationDebugInfo::Executing);
                // Why do the Fire Mages protect this Mordrag?
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_15_00"));
                DC(int64(0x9fe4174460845f22), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f23), EConversationDebugInfo::Executing);
                
                // 'Cause he works as their courier. Our mages are in touch ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_09_01"));
                DC(int64(0x9fe4174460845f23), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f24), EConversationDebugInfo::Executing);
                // If I kick out or kill one of their couriers ... let's ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_09_02"));
                DC(int64(0x9fe4174460845f24), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f25), EConversationDebugInfo::Executing);
                
                // What about me? If I handle Mordrag, what are the mages ...
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_15_03"));
                DC(int64(0x9fe4174460845f25), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f26), EConversationDebugInfo::Executing);
                
                // You're a freshie, so they ain't gonna do shit. I, on the ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGESPROTECT_09_04"));
                DC(int64(0x9fe4174460845f26), EConversationDebugInfo::Done);
                DC(int64(0x3324a0310d74f7f2), EConversationDebugInfo::Executing);
                G1R.Thorus_MordragMageMessenger = 1;
                DC(int64(0x3324a0310d74f7f2), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f28), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9fe4174460845f28), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusMordragkoMageproblem : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f29);
            default Caption = LocText("INFO_THORUS_MORDRAGKO_MAGEPROBLEM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceThorusMordragkoMageproblem);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f2a), EConversationDebugInfo::Executing);
                // Sounds like the MAGES are your real problem.
                Hero.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGEPROBLEM_15_00"));
                DC(int64(0x9fe4174460845f2a), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f2b), EConversationDebugInfo::Executing);
                
                // They are, but one that's hard to solve. Few years ago, a ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGEPROBLEM_09_01"));
                DC(int64(0x9fe4174460845f2b), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f2c), EConversationDebugInfo::Executing);
                // The next morning, they found his body in the outer ring. ...
                Thorus.AI.Say(LocText("INFO_THORUS_MORDRAGKO_MAGEPROBLEM_09_02"));
                DC(int64(0x9fe4174460845f2c), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f2d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9fe4174460845f2d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusPerm2 : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f83);
            default Caption = LocText("INFO_THORUS_PERM2_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceThorusPerm2);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f84), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x9fe4174460845f85), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f86), EConversationDebugInfo::Executing);
                // How's the situation?
                Hero.AI.Say(LocText("INFO_THORUS_PERM2_15_00"));
                DC(int64(0x9fe4174460845f86), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f87), EConversationDebugInfo::Executing);
                
                // In the Camp? Quiet. The guys from the New Camp haven't ...
                Thorus.AI.Say(LocText("INFO_THORUS_PERM2_09_01"));
                DC(int64(0x9fe4174460845f87), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusReadyforgomez : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f63);
            default Caption = LocText("INFO_THORUS_READYFORGOMEZ_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceThorusReadyforgomez);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f64), G1R.Diego_GomezAudience != 0);
                    DB(int64(0x6acc4502733b6761), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (G1R.Diego_GomezAudience == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f65), EConversationDebugInfo::Executing);
                
                // Diego says I'm ready to meet Gomez.
                Hero.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_15_00"));
                DC(int64(0x9fe4174460845f65), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f66), EConversationDebugInfo::Executing);
                
                // And I say that it's still up to me who goes through that ...
                Thorus.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_09_01"));
                DC(int64(0x9fe4174460845f66), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f67), EConversationDebugInfo::Executing);
                
                // And? What's your decision?
                Hero.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_15_02"));
                DC(int64(0x9fe4174460845f67), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f68), EConversationDebugInfo::Executing);
                
                // Hmm ...
                Thorus.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_09_03"));
                DC(int64(0x9fe4174460845f68), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f69), EConversationDebugInfo::Executing);
                // Well, judging by what I've heard, you did a solid job, ...
                Thorus.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_09_04"));
                DC(int64(0x9fe4174460845f69), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f6a), EConversationDebugInfo::Executing);
                // All right, you can go see Gomez. But don't go around ...
                Thorus.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_09_05"));
                DC(int64(0x9fe4174460845f6a), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f6b), EConversationDebugInfo::Executing);
                // You're on your own now, freshie.
                Thorus.AI.Say(LocText("INFO_THORUS_READYFORGOMEZ_09_06"));
                DC(int64(0x9fe4174460845f6b), EConversationDebugInfo::Done);
                DC(int64(0x3324a0310d74f80e), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Interior = 1;
                DC(int64(0x3324a0310d74f80e), EConversationDebugInfo::Done);
                DC(int64(0x3324a0310d74f810), EConversationDebugInfo::Executing);
                G1R.Thorus_Permission_Exterior = 1;
                DC(int64(0x3324a0310d74f810), EConversationDebugInfo::Done);
                DC(int64(0xa0c47c1e219584eb), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.SucceedQuest();
                DC(int64(0xa0c47c1e219584eb), EConversationDebugInfo::Done);
                DC(int64(0x63ca372f5fe908c5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Ch2); }
                DC(int64(0x63ca372f5fe908c5), EConversationDebugInfo::Done);
                DC(int64(0x7c7361a318c402b4), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_OC = 0;
                DC(int64(0x7c7361a318c402b4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusSttgeschafft : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f7e);
            default Caption = LocText("INFO_THORUS_STTGESCHAFFT_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceThorusSttgeschafft);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845f7f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x2fab0830121ab272), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f80), EConversationDebugInfo::Executing);
                // I did it! I'm a Shadow now. 
                Hero.AI.Say(LocText("INFO_THORUS_STTGESCHAFFT_15_00"));
                DC(int64(0x9fe4174460845f80), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f81), EConversationDebugInfo::Executing);
                
                // So I heard. Welcome aboard. 
                Thorus.AI.Say(LocText("INFO_THORUS_STTGESCHAFFT_09_01"));
                DC(int64(0x9fe4174460845f81), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f82), EConversationDebugInfo::Executing);
                // Don't mess this up, will you?
                Thorus.AI.Say(LocText("INFO_THORUS_STTGESCHAFFT_09_02"));
                DC(int64(0x9fe4174460845f82), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusTryme : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845efd);
            default Caption = LocText("INFO_THORUS_TRYME_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusWorkforgomez);
            default Rules.HideIfKnows(UChoiceThorusTryme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a7e557b8ae58371), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845efe), EConversationDebugInfo::Executing);
                
                // How about you test me? See if I got what it takes?
                Hero.AI.Say(LocText("INFO_THORUS_TRYME_15_00"));
                DC(int64(0x9fe4174460845efe), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845eff), EConversationDebugInfo::Executing);
                
                // That ain't how it works. You need someone to vouch for ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYME_09_01"));
                DC(int64(0x9fe4174460845eff), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f00), EConversationDebugInfo::Executing);
                // So, before you get to prove yourself to me, you're first ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYME_09_02"));
                DC(int64(0x9fe4174460845f00), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f01), EConversationDebugInfo::Executing);
                // Because guess who takes the blame if a freshie fucks up? ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYME_09_03"));
                DC(int64(0x9fe4174460845f01), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusTrymeagain : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f02);
            default Caption = LocText("INFO_THORUS_TRYMEAGAIN_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusTryme);
            default Rules.HideIfKnows(UChoiceThorusTrymeagain);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a7e557b8ae58371), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f03), EConversationDebugInfo::Executing);
                
                // All right, but there has to be something I can do for ...
                Hero.AI.Say(LocText("INFO_THORUS_TRYMEAGAIN_15_00"));
                DC(int64(0x9fe4174460845f03), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f04), EConversationDebugInfo::Executing);
                
                // No. The things we warders take care of are way out of ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYMEAGAIN_09_01"));
                DC(int64(0x9fe4174460845f04), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f05), EConversationDebugInfo::Executing);
                // I'll say it again, find someone to vouch for you, and ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYMEAGAIN_09_02"));
                DC(int64(0x9fe4174460845f05), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusTrymeicandoit : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845f06);
            default Caption = LocText("INFO_THORUS_TRYMEICANDOIT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusTrymeagain);
            default Rules.HideIfKnows(UChoiceThorusTrymeicandoit);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a7e557b8ae58371), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845f07), EConversationDebugInfo::Executing);
                
                // Whatever you need done, I can handle it.
                Hero.AI.Say(LocText("INFO_THORUS_TRYMEICANDOIT_15_00"));
                DC(int64(0x9fe4174460845f07), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f08), EConversationDebugInfo::Executing);
                
                // That desperate to fail, huh? Fine. Come to think of it, ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYMEICANDOIT_09_01"));
                DC(int64(0x9fe4174460845f08), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845f09), EConversationDebugInfo::Executing);
                // But I'm warning you - fuck this up, and you're in deep ...
                Thorus.AI.Say(LocText("INFO_THORUS_TRYMEICANDOIT_09_02"));
                DC(int64(0x9fe4174460845f09), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceThorusWorkforgomez : UTopic_Hero__OC_GRD_THORUS_200
        {
            default DebugId = int64(0x9fe4174460845ef2);
            default Caption = LocText("INFO_WORKFORGOMEZ_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceThorusEntercastle);
            default Rules.HideIfKnows(UChoiceThorusWorkforgomez);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_DIEGO_JOINOLDCAMP_11_01"), int64(0x9fe4174460845ef2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9fe4174460845ef3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9fe4174460845ef4), EConversationDebugInfo::Executing);
                
                // I want to work for Gomez.
                Hero.AI.Say(LocText("INFO_WORKFORGOMEZ_15_00"));
                DC(int64(0x9fe4174460845ef4), EConversationDebugInfo::Done);
                DC(int64(0x9fe4174460845ef5), EConversationDebugInfo::Executing);
                
                // That so? And why would Gomez want to work with YOU?
                Thorus.AI.Say(LocText("INFO_WORKFORGOMEZ_09_01"));
                DC(int64(0x9fe4174460845ef5), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */