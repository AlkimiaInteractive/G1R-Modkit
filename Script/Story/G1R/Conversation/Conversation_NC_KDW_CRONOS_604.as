#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_CRONOS_604 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_CRONOS_604";
        }
        
        
        class UTopic_Hero__NC_KDW_CRONOS_604 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_CRONOS_604";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCronos() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY06_708() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY06_708");
            }
        }
        
        
        class UTopic_NC_SLD_MERCENARY06_708__NC_KDW_CRONOS_604 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_CRONOS_604";
            default WithCharacter = n"NC_SLD_MERCENARY06_708";
            
            AGothicCharacterState GetCronos() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY06_708() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY06_708");
            }
        }
        
        
        class UChoiceCronos114973 : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x14197298145f72af);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCronos114973);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Cronos, 500.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Cronos, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f72ae), EConversationDebugInfo::Executing);
                // You're wearing the robes now - does that mean you passed ...
                Cronos.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_111437_1769"));
                DC(int64(0x14197298145f72ae), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCronos144504_0 : UTopic_NC_SLD_MERCENARY06_708__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0xcf6cde32246c7df8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCronos144504);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xcf6cde32246c7df8));
            default Rules.HideIfKnows(UChoiceCronos144504_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Cronos != nullptr && Cronos.HasAssignedDailyRoutine(UDailyRoutine_NC_KDW_Cronos_604_FMOre));
                    DB(int64(0xf9317a6ed9c2db2f), Hero != nullptr && Hero.IsCloseToCharacter(Cronos, 700.0f));
                }
                
                if (Cronos != nullptr && !Cronos.HasAssignedDailyRoutine(UDailyRoutine_NC_KDW_Cronos_604_FMOre))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Cronos, 700.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7df7), EConversationDebugInfo::Executing);
                // You truly think they would try to come for the pile? 
                Cronos.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_135505_3331"));
                DC(int64(0xcf6cde32246c7df7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCronos144504_1 : UTopic_NC_SLD_MERCENARY06_708__NC_KDW_CRONOS_604
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCronos144504_0);
            default Rules.HideIfKnows(UChoiceCronos144504_1);
            default DebugId = int64(0xcf6cde32246c7df8);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf9317a6ed9c2db24), EConversationDebugInfo::Executing);
                
                // I don't know. But Lee thinks it's better to be safe.
                NC_SLD_MERCENARY06_708.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_124921"));
                DC(int64(0xf9317a6ed9c2db24), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCronos144504 : UTopic_NC_SLD_MERCENARY06_708__NC_KDW_CRONOS_604
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCronos144504_1);
            default Rules.HideIfKnows(UChoiceCronos144504);
            default DebugId = int64(0xcf6cde32246c7df8);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7dfb), EConversationDebugInfo::Executing);
                
                // Ah he's probably right. Well, then. We will be on our ...
                Cronos.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_135709"));
                DC(int64(0xcf6cde32246c7dfb), EConversationDebugInfo::Done);
                DC(int64(0xf9317a6ed9c2db31), EConversationDebugInfo::Executing);
                Cronos.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Cronos_604_Start);
                DC(int64(0xf9317a6ed9c2db31), EConversationDebugInfo::Done);
                DC(int64(0xf9317a6ed9c2db33), EConversationDebugInfo::Executing);
                NC_SLD_MERCENARY06_708.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Mercenary06_708_Start);
                DC(int64(0xf9317a6ed9c2db33), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCronos93857 : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0xffe334defa1e88a9);
            default Caption = LocText("DIA_CRONOS_BANDIT_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceCronos93857);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_AGXCIAC_20240904_191104"), int64(0xffe334defa1e88a9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c5fe40dd954273f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x1c5fe40dd9542740), Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER != nullptr && !Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER.HasBeenStarted());
                    DB(int64(0x7a2e0e99b0d30e60), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER != nullptr && Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER.HasBeenStarted())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542743), EConversationDebugInfo::Executing);
                // I work for Lares now. 
                Hero.AI.Say(LocText("DIA_CRONOS_BANDIT_15_00"));
                DC(int64(0x1c5fe40dd9542743), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_CRONOS_MESSENGER, Document::UDocumentSegment_CH2_CRONOS_MESSENGER_Start);
                DB(int64(0xffe334defa1e88a8), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_AGXCIAC_20240904_191104")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_AGXCIAC_20240904_191104")))
                {
                    DC(int64(0xffe334defa1e88af), EConversationDebugInfo::Executing);
                    // He said you could help me get into the Old Camp castle? 
                    Hero.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_125834_2238"));
                    DC(int64(0xffe334defa1e88af), EConversationDebugInfo::Done);
                    DC(int64(0xffe334defa1e88b8), EConversationDebugInfo::Executing);
                    
                    // Did he, now. Well, yes, we do send messengers to the ...
                    Cronos.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_130740"));
                    DC(int64(0xffe334defa1e88b8), EConversationDebugInfo::Done);
                    DC(int64(0xffe334defa1e88b9), EConversationDebugInfo::Executing);
                    // And as chance would have it, there IS in fact a letter ...
                    Cronos.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_130814"));
                    DC(int64(0xffe334defa1e88b9), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xffe334defa1e88ad), EConversationDebugInfo::Executing);
                    
                    // You said you send messengers to the Fire Mages from time ...
                    Hero.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_125828_2083"));
                    DC(int64(0xffe334defa1e88ad), EConversationDebugInfo::Done);
                    DC(int64(0xe525574b1fff1799), EConversationDebugInfo::Executing);
                    // Any letters that need delivering?
                    Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_135139"));
                    DC(int64(0xe525574b1fff1799), EConversationDebugInfo::Done);
                    DC(int64(0xffe334defa1e88b7), EConversationDebugInfo::Executing);
                    
                    // Hmm ... there's one indeed. And if Lares accepted you ...
                    Cronos.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_130715"));
                    DC(int64(0xffe334defa1e88b7), EConversationDebugInfo::Done);
                }
                DC(int64(0x1c5fe40dd9542744), EConversationDebugInfo::Executing);
                // Here, take this amulet - it'll identify you as one of ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BANDIT_08_01"));
                DC(int64(0x1c5fe40dd9542744), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542745), EConversationDebugInfo::Executing);
                // And this is the letter. It's for Corristo, the Highest ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BANDIT_08_02"));
                DC(int64(0x1c5fe40dd9542745), EConversationDebugInfo::Done);
                DC(int64(0xffe334defa1e88ba), EConversationDebugInfo::Executing);
                // Adanos bless you. 
                Cronos.AI.Say(LocText("TEXT_WIP_RVXAWSC_20240419_131037"));
                DC(int64(0xffe334defa1e88ba), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de9169e), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAt_Amulet_Water, 1);
                DC(int64(0x1a494c3f7de9169e), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de916a0), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItWr_Scroll_Cronos, 1);
                DC(int64(0x1a494c3f7de916a0), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de916a2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER.StartQuest();
                DC(int64(0x1a494c3f7de916a2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCronosReward : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542774);
            default Caption = LocText("INFO_CRONOS_REWARD_15_01");
            default PriorityRank = 4;
            
            default Rules.HideIfKnows(UChoiceCronosReward);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c5fe40dd9542775), G1R.Saturas_BringFoci == 5);
                    DB(int64(0x1c5fe40dd9542776), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (G1R.Saturas_BringFoci != 5)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542777), EConversationDebugInfo::Executing);
                // Saturas said to see you about a reward. 
                Hero.AI.Say(LocText("INFO_CRONOS_REWARD_15_01"));
                DC(int64(0x1c5fe40dd9542777), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542778), EConversationDebugInfo::Executing);
                
                // Then you found the focus stones. Well done. Here - these ...
                Cronos.AI.Say(LocText("INFO_CRONOS_REWARD_08_02"));
                DC(int64(0x1c5fe40dd9542778), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542779), EConversationDebugInfo::Executing);
                // May they serve you well. 
                Cronos.AI.Say(LocText("INFO_CRONOS_REWARD_08_03"));
                DC(int64(0x1c5fe40dd9542779), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BRINGFOCI, Document::UDocumentSegment_CH3_BRINGFOCI_CronosReward);
                DB(int64(0x1c5fe40dd954277b), Hero != nullptr && Hero.HasListenedTo(LocText("INFO_RIORDIAN_REWARD_14_04")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("INFO_RIORDIAN_REWARD_14_04")))
                {
                    DC(int64(0x1a494c3f7de9167d), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_BRINGFOCI.SucceedQuest();
                    DC(int64(0x1a494c3f7de9167d), EConversationDebugInfo::Done);
                    DC(int64(0x7858bf075764a0eb), EConversationDebugInfo::Executing);
                    Cronos.RemoveImmortality();
                    DC(int64(0x7858bf075764a0eb), EConversationDebugInfo::Done);
                }
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Cronos.AddItemToInventory(UItMi_Orenugget, 300);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de91679), EConversationDebugInfo::Executing);
                Cronos.AI.GiveItemTo(Hero, UItMi_Orenugget, 300);
                DC(int64(0x1a494c3f7de91679), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosBarrier : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542731);
            default Caption = LocText("DIA_CRONOS_BARRIER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosGreet);
            default Rules.HideIfKnows(UChoiceKdw604CronosBarrier);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542732), EConversationDebugInfo::Executing);
                // I heard you want to destroy the barrier - how exactly ...
                Hero.AI.Say(LocText("DIA_CRONOS_BARRIER_15_00"));
                DC(int64(0x1c5fe40dd9542732), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542733), EConversationDebugInfo::Executing);
                
                // Through that which is the reason we ended up here to ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BARRIER_08_01"));
                DC(int64(0x1c5fe40dd9542733), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542734), EConversationDebugInfo::Executing);
                // In layman's terms, we plan to channel the ore's magical ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BARRIER_08_02"));
                DC(int64(0x1c5fe40dd9542734), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff1794), EConversationDebugInfo::Executing);
                
                // And that'll work?
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_132309"));
                DC(int64(0xe525574b1fff1794), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542735), EConversationDebugInfo::Executing);
                
                // We hope so. Anyway, you can imagine that amassing such a ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BARRIER_08_03"));
                DC(int64(0x1c5fe40dd9542735), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542736), EConversationDebugInfo::Executing);
                // That is why we work with the mercenaries who keep things ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BARRIER_08_04"));
                DC(int64(0x1c5fe40dd9542736), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosBrief : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542728);
            default Caption = LocText("DIA_CRONOS_BRIEF_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosGreet);
            default Rules.HideIfKnows(UChoiceKdw604CronosBrief);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c5fe40dd9542729), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x1c5fe40dd954272a), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x87ea2f9c1a943f1d), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0x7a2e0e99b0d30e90), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x1c5fe40dd9542729), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x1c5fe40dd954272a), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x87ea2f9c1a943f1d), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                    DB(int64(0x7a2e0e99b0d30e91), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0) && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd954272c), EConversationDebugInfo::Executing);
                
                // I have a letter for the highest Fire Mage. Any idea how ...
                Hero.AI.Say(LocText("DIA_CRONOS_BRIEF_15_00"));
                DC(int64(0x1c5fe40dd954272c), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954272d), EConversationDebugInfo::Executing);
                
                // A letter? From whom?
                Cronos.AI.Say(LocText("DIA_CRONOS_BRIEF_08_01"));
                DC(int64(0x1c5fe40dd954272d), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954272e), EConversationDebugInfo::Executing);
                
                // Outside. 
                Hero.AI.Say(LocText("DIA_CRONOS_BRIEF_15_02"));
                DC(int64(0x1c5fe40dd954272e), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954272f), EConversationDebugInfo::Executing);
                
                // Hmm ... well, we do sometimes send messengers to our ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BRIEF_08_03"));
                DC(int64(0x1c5fe40dd954272f), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542730), EConversationDebugInfo::Executing);
                // That said, we can't just give this responsibility to ...
                Cronos.AI.Say(LocText("DIA_CRONOS_BRIEF_08_04"));
                DC(int64(0x1c5fe40dd9542730), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_CRONOS, Document::UDocumentSegment_Glossary_NC_KDW_CRONOS_WaterMessenger);
            }
        }
        
        
        class UChoiceKdw604CronosBriefback : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542749);
            default Caption = LocText("DIA_CRONOS_BRIEFBACK_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceKdw604CronosBriefback);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c5fe40dd954274a), Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD != nullptr && Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD != nullptr && Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd954274b), EConversationDebugInfo::Executing);
                // I delivered that letter.
                Hero.AI.Say(LocText("DIA_CRONOS_BRIEFBACK_15_00"));
                DC(int64(0x1c5fe40dd954274b), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954274c), EConversationDebugInfo::Executing);
                
                // As I knew you would. Here, for your efforts. 
                Cronos.AI.Say(LocText("DIA_CRONOS_BRIEFBACK_08_01"));
                DC(int64(0x1c5fe40dd954274c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_CRONOS_MESSENGER, Document::UDocumentSegment_CH2_CRONOS_MESSENGER_Reward);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Cronos.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x1a494c3f7de916b9), EConversationDebugInfo::Executing);
                Cronos.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x1a494c3f7de916b9), EConversationDebugInfo::Done);
                DC(int64(0x647eaafbd8b43c28), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD.SucceedQuest();
                DC(int64(0x647eaafbd8b43c28), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosExit : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542720);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x1c5fe40dd9542722), Cronos != nullptr && !Cronos.HasItem(UItAr_Rune_IceBlock, 1, 0));
                
                if (Cronos != nullptr && !Cronos.HasItem(UItAr_Rune_IceBlock, 1, 0))
                {
                    DC(int64(0x1a494c3f7de916ca), EConversationDebugInfo::Executing);
                    Cronos.AddItemToInventory(UItAr_Rune_IceBlock, 1);
                    DC(int64(0x1a494c3f7de916ca), EConversationDebugInfo::Done);
                }
                DB(int64(0x1c5fe40dd9542725), Cronos != nullptr && !Cronos.HasItem(UItAr_Rune_IceBolt, 1, 0));
                
                if (Cronos != nullptr && !Cronos.HasItem(UItAr_Rune_IceBolt, 1, 0))
                {
                    DC(int64(0x1a494c3f7de916c4), EConversationDebugInfo::Executing);
                    Cronos.AddItemToInventory(UItAr_Rune_IceBolt, 1);
                    DC(int64(0x1a494c3f7de916c4), EConversationDebugInfo::Done);
                }
                DC(int64(0x1c5fe40dd9542727), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1c5fe40dd9542727), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdw604CronosGreet : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542789);
            default Caption = LocText("KDW_604_CRONOS_GREET_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKdw604CronosGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd954278b), EConversationDebugInfo::Executing);
                // You're one of the Water Mages, aren't you? What do you ...
                Hero.AI.Say(LocText("KDW_604_CRONOS_GREET_INFO_15_01"));
                DC(int64(0x1c5fe40dd954278b), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954278c), EConversationDebugInfo::Executing);
                
                // Adanos' Blessings, child. And yes, I am a Water Mage. My ...
                Cronos.AI.Say(LocText("KDW_604_CRONOS_GREET_INFO_08_02"));
                DC(int64(0x1c5fe40dd954278c), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954278d), EConversationDebugInfo::Executing);
                // I also help others steel their minds, and trade with ...
                Cronos.AI.Say(LocText("KDW_604_CRONOS_GREET_INFO_08_03"));
                DC(int64(0x1c5fe40dd954278d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_CRONOS, Document::UDocumentSegment_Glossary_NC_KDW_CRONOS_Introduction);
            }
        }
        
        
        class UChoiceKdw604CronosMana : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542783);
            default Caption = LocText("KDW_604_CRONOS_MANA_INFO_15_01");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542784), EConversationDebugInfo::Executing);
                // I want to strengthen my mind. 
                Hero.AI.Say(LocText("KDW_604_CRONOS_MANA_INFO_15_01"));
                DC(int64(0x1c5fe40dd9542784), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542785), EConversationDebugInfo::Executing);
                
                // A laudable endeavor. Let me see what I can do. 
                Cronos.AI.Say(LocText("KDW_604_CRONOS_MANA_INFO_08_02"));
                DC(int64(0x1c5fe40dd9542785), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_CRONOS, Document::UDocumentSegment_Glossary_NC_KDW_CRONOS_Teacher);
                DC(int64(0x57fe20256d0af2c5), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Cronos);
                DC(int64(0x57fe20256d0af2c5), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKdw604CronosManaMan11,
                    UChoiceKdw604CronosManaMan1,
                    UTopic_Cronos_210491
                );
            }
        }
        
        
        class UChoiceKdw604CronosManaMan11 : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0xef32a46aff27bcd2);
            default Caption = LocText("TEXT_CHOICE_KDW_604_CRONOS_MANA_MAN_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1a494c3f7de916dd), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Cronos, 1);
                DC(int64(0x1a494c3f7de916dd), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e9967b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e9967b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosManaMan1 : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0xef32a46aff27bcd0);
            default Caption = LocText("TEXT_CHOICE_KDW_604_CRONOS_MANA_MAN_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1a494c3f7de916d9), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Cronos, 5);
                DC(int64(0x1a494c3f7de916d9), EConversationDebugInfo::Done);
                DC(int64(0x1a491ba842e9967c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1a491ba842e9967c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cronos_210491 : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x6c1e299bd1a51421);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57fe20256d0af2cb), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Cronos);
                DC(int64(0x57fe20256d0af2cb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosSellstuff : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542786);
            default Caption = LocText("KDW_604_CRONOS_SELLSTUFF_INFO_15_01");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542787), EConversationDebugInfo::Executing);
                // What do you have in stock?
                Hero.AI.Say(LocText("KDW_604_CRONOS_SELLSTUFF_INFO_15_01"));
                DC(int64(0x1c5fe40dd9542787), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_CRONOS, Document::UDocumentSegment_Glossary_NC_KDW_CRONOS_Dealer);
                DB(int64(0x7ec56dc721168a64), Cronos != nullptr && Cronos.IsAngryTowards(Hero));
                
                if (Cronos != nullptr && Cronos.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168a65), EConversationDebugInfo::Executing);
                    // Right now? Nothing. You caused too much trouble.
                    Cronos.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_105921"));
                    DC(int64(0x7ec56dc721168a65), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231629511), EConversationDebugInfo::Executing);
                    // You can come back when you've learned how to behave.
                    Cronos.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_142213"));
                    DC(int64(0x81b634f231629511), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_604_cronos_sellstuff_exit_1");
                    DC(int64(0x7ec56dc721168a67), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168a67), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x1a494c3f7de916e8), EConversationDebugInfo::Executing);
                    Cronos.AI.StartTradingWith(Hero);
                    DC(int64(0x1a494c3f7de916e8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdw_604_cronos_sellstuff_exit_2");
                }
            }
        }
        
        
        class UChoiceKdw604CronosWannajoin : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd9542737);
            default Caption = LocText("DIA_CRONOS_WANNAJOIN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosGreet);
            default Rules.HideIfKnows(UChoiceKdw604CronosWannajoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x868d389bf57c8835), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542738), EConversationDebugInfo::Executing);
                // I want to join your camp.
                Hero.AI.Say(LocText("DIA_CRONOS_WANNAJOIN_15_00"));
                DC(int64(0x1c5fe40dd9542738), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542739), EConversationDebugInfo::Executing);
                
                // Then talk to Lares or Lee. 
                Cronos.AI.Say(LocText("DIA_CRONOS_WANNAJOIN_08_01"));
                DC(int64(0x1c5fe40dd9542739), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosWannamage : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd954273a);
            default Caption = LocText("DIA_CRONOS_WANNAMAGE_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosBarrier);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdw604CronosWannajoin);
            default Rules.HideIfKnows(UChoiceKdw604CronosWannamage);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xce11cc9452ea4bbd), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd954273b), EConversationDebugInfo::Executing);
                
                // I want to become a mage.
                Hero.AI.Say(LocText("DIA_CRONOS_WANNAMAGE_15_00"));
                DC(int64(0x1c5fe40dd954273b), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954273c), EConversationDebugInfo::Executing);
                
                // Many do. But surely you understand that we don't share ...
                Cronos.AI.Say(LocText("DIA_CRONOS_WANNAMAGE_08_01"));
                DC(int64(0x1c5fe40dd954273c), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd954273d), EConversationDebugInfo::Executing);
                // Prove your loyalty to our camp - then, and only then, we ...
                Cronos.AI.Say(LocText("DIA_CRONOS_WANNAMAGE_08_02"));
                DC(int64(0x1c5fe40dd954273d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdw604CronosWelcome : UTopic_Hero__NC_KDW_CRONOS_604
        {
            default DebugId = int64(0x1c5fe40dd954277f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdw604CronosWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1c5fe40dd9542780), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1c5fe40dd9542781), EConversationDebugInfo::Executing);
                // So, you are one of us at last ... you made the right ...
                Cronos.AI.Say(LocText("KDW_604_CRONOS_WELCOME_INFO_08_01"));
                DC(int64(0x1c5fe40dd9542781), EConversationDebugInfo::Done);
                DC(int64(0x1c5fe40dd9542782), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1c5fe40dd9542782), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */