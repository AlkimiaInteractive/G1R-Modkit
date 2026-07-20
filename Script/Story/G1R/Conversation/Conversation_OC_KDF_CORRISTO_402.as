#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_CORRISTO_402 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_CORRISTO_402";
        }
        
        
        class UTopic_Hero__OC_KDF_CORRISTO_402 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_CORRISTO_402";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCorristo() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD07_222() const property
            {
                return GetCharacter(n"OC_GRD_GUARD07_222");
            }
            
            AGothicCharacterState GetDamarok() const property
            {
                return GetCharacter(n"OC_KDF_DAMAROK_401");
            }
            
            AGothicCharacterState GetDrago() const property
            {
                return GetCharacter(n"OC_KDF_DRAGO_403");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetTorrez() const property
            {
                return GetCharacter(n"OC_KDF_TORREZ_405");
            }
        }
        
        
        class UChoiceCorristo114818 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x14197298145f7220);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceCorristo114818);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Corristo, 500.0f));
                    DB(int64(0xce11cc9452ea4c0d), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Corristo, 500.0f))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f7214), EConversationDebugInfo::Executing);
                // Brother. What can I do for you?
                Corristo.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_105402_2238"));
                DC(int64(0x14197298145f7214), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorristo123064 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xb410429b6e2f9fda);
            default Caption = LocText("TEXT_WIP_VLCTYHF_20241212_164633");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ULCTYHF_20241213_125856"), int64(0xb410429b6e2f9fda));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1ae26e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xac9484e2003d96b2), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x425e95e2cf9e7aa9), G1R.FireMagesPermission != 0);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (G1R.FireMagesPermission == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xba8e121cbc7ab5dc), EConversationDebugInfo::Executing);
                
                // I want to become a Fire Mage. 
                Hero.AI.Say(LocText("TEXT_WIP_VLCTYHF_20241212_164633"));
                DC(int64(0xba8e121cbc7ab5dc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_DenyAccess);
                DB(int64(0xbd6ba6acd676340), G1R.Corristo_FirsTalk != 0);
                
                if (G1R.Corristo_FirsTalk != 0)
                {
                    DB(int64(0xbd6ba6acd67636c), Hero != nullptr && Hero.HasItem(UItWr_Book_FireMages, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItWr_Book_FireMages, 1, 0))
                    {
                        DC(int64(0xbd6ba6acd6763f7), EConversationDebugInfo::Executing);
                        // I demand the Trial of Fire. 
                        Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125124_2238"));
                        DC(int64(0xbd6ba6acd6763f7), EConversationDebugInfo::Done);
                        DC(int64(0xbd6ba6acd6763f8), EConversationDebugInfo::Executing);
                        
                        // ... What was that?
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153449"));
                        DC(int64(0xbd6ba6acd6763f8), EConversationDebugInfo::Done);
                        DC(int64(0xbd6ba6acd676409), EConversationDebugInfo::Executing);
                        
                        // I read the texts. It's my gods-given right to demand the ...
                        Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153453"));
                        DC(int64(0xbd6ba6acd676409), EConversationDebugInfo::Done);
                        DC(int64(0xbd6ba6acd67640a), EConversationDebugInfo::Executing);
                        // I'm doing just that.
                        Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153524"));
                        DC(int64(0xbd6ba6acd67640a), EConversationDebugInfo::Done);
                        DC(int64(0xbd6ba6acd67640b), EConversationDebugInfo::Executing);
                        
                        // (deep sigh) Do I even want to know how you got your ...
                        Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125856"));
                        DC(int64(0xbd6ba6acd67640b), EConversationDebugInfo::Done);
                        DC(int64(0xbd6ba6acd67640c), EConversationDebugInfo::Executing);
                        // But fine. If you read it, surely you have already ...
                        Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125948"));
                        DC(int64(0xbd6ba6acd67640c), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_corristo_123064_exit_1");
                    }
                    else
                    {
                        DC(int64(0xbd6ba6acd6763ca), EConversationDebugInfo::Executing);
                        // So you've said before. The answer remains no. 
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_154037_2083"));
                        DC(int64(0xbd6ba6acd6763ca), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_corristo_123064_exit_2");
                        DC(int64(0xbd6ba6acd6763d9), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xbd6ba6acd6763d9), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0xbd6ba6acd676398), EConversationDebugInfo::Executing);
                    // No. 
                    Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152241"));
                    DC(int64(0xbd6ba6acd676398), EConversationDebugInfo::Done);
                    DC(int64(0xbd6ba6acd6763a8), EConversationDebugInfo::Executing);
                    
                    // Why not?
                    Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152254"));
                    DC(int64(0xbd6ba6acd6763a8), EConversationDebugInfo::Done);
                    DC(int64(0xbd6ba6acd6763a9), EConversationDebugInfo::Executing);
                    
                    // Because this Circle has no need for new additions. 
                    Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152259"));
                    DC(int64(0xbd6ba6acd6763a9), EConversationDebugInfo::Done);
                    DC(int64(0xbd6ba6acd6763aa), EConversationDebugInfo::Executing);
                    // I'm sorry. 
                    Corristo.AI.Say(LocText("TEXT_WIP_ZLCTYHF_20241216_162348"));
                    DC(int64(0xbd6ba6acd6763aa), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Corristo_129559,
                        UTopic_Corristo_145585,
                        UTopic_Corristo_129579,
                        UTopic_Corristo_129800
                    );
                }
            }
        }
        
        
        class UTopic_Corristo_129559 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b57ac);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_125124_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_129559);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b57ad), EConversationDebugInfo::Executing);
                // Is there any way I can convince you?
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125124_41"));
                DC(int64(0xa821604d731b57ad), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b57e7), EConversationDebugInfo::Executing);
                
                // No. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125442"));
                DC(int64(0xa821604d731b57e7), EConversationDebugInfo::Done);
                DC(int64(0x8dd9f10e3568d3b6), EConversationDebugInfo::Executing);
                // I'm set on this. Even if you had the talent, we are not ...
                Corristo.AI.Say(LocText("TEXT_WIP_UKCQMAI_20250112_210957"));
                DC(int64(0x8dd9f10e3568d3b6), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c31), EConversationDebugInfo::Executing);
                // Milten was an exception, and he'll remain the only one. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152417"));
                DC(int64(0xf4d1c69f6fb33c31), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b57af), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa821604d731b57af), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_145585 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xf4d1c69f6fb33c32);
            default Caption = LocText("TEXT_WIP_BPPCYMI_20250120_152437_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_145585);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_OOQECXC_20240425_181651"), int64(0xf4d1c69f6fb33c32));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4d1c69f6fb33c33), EConversationDebugInfo::Executing);
                // I've killed the minecrawler queen. Isn't that enough? 
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152437_41"));
                DC(int64(0xf4d1c69f6fb33c33), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c44), EConversationDebugInfo::Executing);
                
                // (sighs) It's not about accomplishments, lad. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153121"));
                DC(int64(0xf4d1c69f6fb33c44), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c45), EConversationDebugInfo::Executing);
                // If combat prowess was all it took to become a mage of ...
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153156"));
                DC(int64(0xf4d1c69f6fb33c45), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c46), EConversationDebugInfo::Executing);
                // The answer is and stays no. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153230"));
                DC(int64(0xf4d1c69f6fb33c46), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c35), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xf4d1c69f6fb33c35), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_129579 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b57b0);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_125124_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_129579);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1ae249), G1R.FireMagesBook == 1);
                }
                
                return G1R.FireMagesBook == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b57b1), EConversationDebugInfo::Executing);
                // I demand the Trial of Fire. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125124_2238"));
                DC(int64(0xa821604d731b57b1), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c48), EConversationDebugInfo::Executing);
                
                // ... What was that?
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153449"));
                DC(int64(0xf4d1c69f6fb33c48), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c49), EConversationDebugInfo::Executing);
                
                // I read the texts. It's my gods-given right to demand the ...
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153453"));
                DC(int64(0xf4d1c69f6fb33c49), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c4a), EConversationDebugInfo::Executing);
                // I'm doing just that.
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153524"));
                DC(int64(0xf4d1c69f6fb33c4a), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5832), EConversationDebugInfo::Executing);
                
                // (deep sigh) Do I even want to know how you got your ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125856"));
                DC(int64(0xa821604d731b5832), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5833), EConversationDebugInfo::Executing);
                // But fine. If you read it, surely you have already ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125948"));
                DC(int64(0xa821604d731b5833), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_129800 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b580b);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_125711_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b580c), EConversationDebugInfo::Executing);
                
                // I'll find a way. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125711_2785"));
                DC(int64(0xa821604d731b580c), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b581a), EConversationDebugInfo::Executing);
                
                // Innos bless your tenacity. Now go. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_125722"));
                DC(int64(0xa821604d731b581a), EConversationDebugInfo::Done);
                DC(int64(0xbd6ba6acd676314), EConversationDebugInfo::Executing);
                G1R.Corristo_FirsTalk = 1;
                DC(int64(0xbd6ba6acd676314), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5826), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5826), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorristo129943 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc689a6);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorristo123064);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Corristo_129579);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCorristo130125);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4d1c69f6fb33c83), EConversationDebugInfo::Executing);
                // What do you know about alchemy?
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_153733"));
                DC(int64(0xf4d1c69f6fb33c83), EConversationDebugInfo::Done);
                DB(int64(0xd511bf2d13f0465a), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Alchemy))
                {
                    DC(int64(0xf4d1c69f6fb33cb4), EConversationDebugInfo::Executing);
                    // I know my way around potions and herbs.
                    Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_154230"));
                    DC(int64(0xf4d1c69f6fb33cb4), EConversationDebugInfo::Done);
                    DC(int64(0xba8e121cbc7ab687), EConversationDebugInfo::Executing);
                    
                    // Hm. I must say, I'm surprised. Very well. 
                    Corristo.AI.Say(LocText("TEXT_WIP_VLCTYHF_20241212_165304_2785"));
                    DC(int64(0xba8e121cbc7ab687), EConversationDebugInfo::Done);
                    DB(int64(0xba8e121cbc7ab6b2), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription));
                    
                    if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Inscription))
                    {
                        DC(int64(0xf4d1c69f6fb33cb7), EConversationDebugInfo::Executing);
                        // What about runecraft? Scribing? 
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_155017"));
                        DC(int64(0xf4d1c69f6fb33cb7), EConversationDebugInfo::Done);
                        DC(int64(0xf4d1c69f6fb33cb8), EConversationDebugInfo::Executing);
                        
                        // No problem. I've written scrolls. 
                        Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_155102"));
                        DC(int64(0xf4d1c69f6fb33cb8), EConversationDebugInfo::Done);
                        DC(int64(0xf4d1c69f6fb33cb9), EConversationDebugInfo::Executing);
                        
                        // You say that as if it were an easy feat. But I can feel ...
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_155126"));
                        DC(int64(0xf4d1c69f6fb33cb9), EConversationDebugInfo::Done);
                        DC(int64(0xba8e121cbc7ab6fe), EConversationDebugInfo::Executing);
                        // Very well. It seems I was too quick to dismiss you. But ...
                        Corristo.AI.Say(LocText("TEXT_WIP_VLCTYHF_20241212_170319"));
                        DC(int64(0xba8e121cbc7ab6fe), EConversationDebugInfo::Done);
                        DC(int64(0xd131ddde9cc68b16), EConversationDebugInfo::Executing);
                        G1R.Corristo_FireMagesTest = 1;
                        DC(int64(0xd131ddde9cc68b16), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_corristo_129943_exit_1");
                    }
                    else
                    {
                        DC(int64(0xf4d1c69f6fb33cba), EConversationDebugInfo::Executing);
                        // What about runecraft? Scribing? 
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_155017"));
                        DC(int64(0xf4d1c69f6fb33cba), EConversationDebugInfo::Done);
                        DC(int64(0xf4d1c69f6fb33cbb), EConversationDebugInfo::Executing);
                        
                        // Um ... 
                        Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_160520"));
                        DC(int64(0xf4d1c69f6fb33cbb), EConversationDebugInfo::Done);
                        DC(int64(0xf4d1c69f6fb33cbc), EConversationDebugInfo::Executing);
                        
                        // "Um," indeed. Someone unversed in the art of ...
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_160523"));
                        DC(int64(0xf4d1c69f6fb33cbc), EConversationDebugInfo::Done);
                        DC(int64(0xf4d1c69f6fb33cbd), EConversationDebugInfo::Executing);
                        // If you are serious about this, then you know what to do.
                        Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_160559"));
                        DC(int64(0xf4d1c69f6fb33cbd), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_ImpressInscription);
                        
                        Other.Remember(n"choice_corristo_129943_exit_2");
                        DC(int64(0xba8e121cbc7ab6df), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xba8e121cbc7ab6df), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0xf4d1c69f6fb33cb5), EConversationDebugInfo::Executing);
                    // I cook a good stew, if that's what you mean.
                    Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_154827"));
                    DC(int64(0xf4d1c69f6fb33cb5), EConversationDebugInfo::Done);
                    DC(int64(0xba8e121cbc7ab694), EConversationDebugInfo::Executing);
                    
                    // It most decidedly is NOT.
                    Corristo.AI.Say(LocText("TEXT_WIP_VLCTYHF_20241212_165331_3436"));
                    DC(int64(0xba8e121cbc7ab694), EConversationDebugInfo::Done);
                    DC(int64(0xba8e121cbc7ab6a2), EConversationDebugInfo::Executing);
                    // You're not ready yet. Far from it. Educate yourself, and ...
                    Corristo.AI.Say(LocText("TEXT_WIP_VLCTYHF_20241212_165352"));
                    DC(int64(0xba8e121cbc7ab6a2), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_ImpressAlchemy);
                    
                    Other.Remember(n"choice_corristo_129943_exit_3");
                    DC(int64(0xba8e121cbc7ab6a3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xba8e121cbc7ab6a3), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceCorristo129969 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc689fd);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_154343");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1adeea), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning());
                    DB(int64(0xb410429b6e2fa1b8), Corristo != nullptr && !Corristo.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Corristo_402_Kdfritual));
                    DB(int64(0xd5c761130200c1c7), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded());
                    DB(int64(0xce11cc9452ea4c11), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning())
                    return false;
                
                if (Corristo != nullptr && Corristo.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Corristo_402_Kdfritual))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.HasSucceeded())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd131ddde9cc689ed), EConversationDebugInfo::Executing);
                // Regarding the Trial of Fire ... 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154343"));
                DC(int64(0xd131ddde9cc689ed), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc689ee), EConversationDebugInfo::Executing);
                
                // Yes?
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154343_41"));
                DC(int64(0xd131ddde9cc689ee), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Corristo_130042,
                    UTopic_Corristo_130062,
                    UTopic_Corristo_130101,
                    UTopic_Corristo_130127,
                    UTopic_Corristo_200685
                );
            }
        }
        
        
        class UTopic_Corristo_130042 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc68a0e);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_154454_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x58f395bf0c1adf09), Hero != nullptr && !Hero.HasItem(UItAr_Scroll_InnosPray, 1, 0));
                    DB(int64(0xfd7140af8de37ca0), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasBeenStarted());
                }
                
                if (Hero != nullptr && Hero.HasItem(UItAr_Scroll_InnosPray, 1, 0))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd131ddde9cc68a0f), EConversationDebugInfo::Executing);
                //  I've run out of scrolls. Could I get some more?
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154454_2238"));
                DC(int64(0xd131ddde9cc68a0f), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a24), EConversationDebugInfo::Executing);
                
                // (sighs) You were told not to waste them. But fine - ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154516"));
                DC(int64(0xd131ddde9cc68a24), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Corristo.AddItemToInventory(UItAr_Scroll_InnosPray, 2);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68ad7), EConversationDebugInfo::Executing);
                Corristo.AI.GiveItemTo(Hero, UItAr_Scroll_InnosPray, 2);
                DC(int64(0xd131ddde9cc68ad7), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a11), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd131ddde9cc68a11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_130062 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc68a12);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_154454_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd131ddde9cc68a13), EConversationDebugInfo::Executing);
                // Where did you say the altars were?
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154454_2785"));
                DC(int64(0xd131ddde9cc68a13), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a25), EConversationDebugInfo::Executing);
                
                // I told you all I will. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154535"));
                DC(int64(0xd131ddde9cc68a25), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a26), EConversationDebugInfo::Executing);
                // One overlooks the sea. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154545"));
                DC(int64(0xd131ddde9cc68a26), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a27), EConversationDebugInfo::Executing);
                // The other lies sheltered behind a wall of Adanos. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154552"));
                DC(int64(0xd131ddde9cc68a27), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a15), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd131ddde9cc68a15), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_130101 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc68a28);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_154601_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130101);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfd7140af8de37c7f), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd131ddde9cc68a29), EConversationDebugInfo::Executing);
                // I've completed the Trial.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154601_3436"));
                DC(int64(0xd131ddde9cc68a29), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a3a), EConversationDebugInfo::Executing);
                
                // No. You have not. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154610"));
                DC(int64(0xd131ddde9cc68a3a), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257b88), EConversationDebugInfo::Executing);
                
                // I have. 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_145803"));
                DC(int64(0x4aade750f7257b88), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257b89), EConversationDebugInfo::Executing);
                
                // If that were true, I would feel Innos' blessing upon ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_145812"));
                DC(int64(0x4aade750f7257b89), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257b8a), EConversationDebugInfo::Executing);
                // You should be glad I am in a forgiving mood today. Do ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_145823"));
                DC(int64(0x4aade750f7257b8a), EConversationDebugInfo::Done);
                DC(int64(0xd131ddde9cc68a2b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd131ddde9cc68a2b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_130127 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xd131ddde9cc68a3b);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_154625_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130127);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfd7140af8de37c8f), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.HasSucceeded());
                    DB(int64(0xf8115b72c2e3465f), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.HasSucceeded());
                    DB(int64(0xf8115b72c2e34660), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasSucceeded());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd131ddde9cc68a3c), EConversationDebugInfo::Executing);
                // I've rekindled the altars. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154625_3286"));
                DC(int64(0xd131ddde9cc68a3c), EConversationDebugInfo::Done);
                DB(int64(0xac9484e2003d964d), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                {
                    DC(int64(0xd131ddde9cc68a6b), EConversationDebugInfo::Executing);
                    // ... You have indeed. I can feel His blessing upon you. 
                    Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154645"));
                    DC(int64(0xd131ddde9cc68a6b), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b8b), EConversationDebugInfo::Executing);
                    // I must say, I'm impressed. I didn't think you had the ...
                    Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154728"));
                    DC(int64(0x4aade750f7257b8b), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b8c), EConversationDebugInfo::Executing);
                    
                    // I'm full of surprises. Does that mean I passed? 
                    Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150140"));
                    DC(int64(0x4aade750f7257b8c), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b92), EConversationDebugInfo::Executing);
                    
                    // It does indeed. You have proven yourself worthy, and ...
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150219"));
                    DC(int64(0x4aade750f7257b92), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b93), EConversationDebugInfo::Executing);
                    // We can perform the ritual right away. Follow me. 
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150336"));
                    DC(int64(0x4aade750f7257b93), EConversationDebugInfo::Done);
                    DC(int64(0x58f395bf0c1ae27e), EConversationDebugInfo::Executing);
                    G1R.Corristo_FireMagesTest = 4;
                    DC(int64(0x58f395bf0c1ae27e), EConversationDebugInfo::Done);
                    DC(int64(0xdec3772243bfb397), EConversationDebugInfo::Executing);
                    Corristo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Corristo_402_Kdfritual);
                    DC(int64(0xdec3772243bfb397), EConversationDebugInfo::Done);
                    DC(int64(0xdec3772243bfb399), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Damarok))) { Damarok.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Damarok_401_Kdfritual); }
                    DC(int64(0xdec3772243bfb399), EConversationDebugInfo::Done);
                    DC(int64(0xdec3772243bfb39b), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Kdfritual); }
                    DC(int64(0xdec3772243bfb39b), EConversationDebugInfo::Done);
                    DC(int64(0xdec3772243bfb39d), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Drago))) { Drago.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Drago_403_Kdfritual); }
                    DC(int64(0xdec3772243bfb39d), EConversationDebugInfo::Done);
                    DC(int64(0xdec3772243bfb39f), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Kdfritual); }
                    DC(int64(0xdec3772243bfb39f), EConversationDebugInfo::Done);
                    DC(int64(0xd131ddde9cc68a9b), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd131ddde9cc68a9b), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xd131ddde9cc68a7b), EConversationDebugInfo::Executing);
                    // ... You have indeed. I can feel His blessing upon you. 
                    Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154645"));
                    DC(int64(0xd131ddde9cc68a7b), EConversationDebugInfo::Done);
                    DC(int64(0xd131ddde9cc68a8b), EConversationDebugInfo::Executing);
                    // I must say, I'm impressed. I didn't think you had the ...
                    Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_154728"));
                    DC(int64(0xd131ddde9cc68a8b), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b8d), EConversationDebugInfo::Executing);
                    
                    // I'm full of surprises. Does that mean I passed? 
                    Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150140"));
                    DC(int64(0x4aade750f7257b8d), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b8e), EConversationDebugInfo::Executing);
                    
                    // It does indeed. You have proven yourself worthy, and ...
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150219"));
                    DC(int64(0x4aade750f7257b8e), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b8f), EConversationDebugInfo::Executing);
                    // That said, there have been some recent developments that ...
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150245"));
                    DC(int64(0x4aade750f7257b8f), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b90), EConversationDebugInfo::Executing);
                    // Come back a bit later when things have calmed down a ...
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150259"));
                    DC(int64(0x4aade750f7257b90), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f7257b91), EConversationDebugInfo::Executing);
                    // Innos bless you. You've done well. 
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150316"));
                    DC(int64(0x4aade750f7257b91), EConversationDebugInfo::Done);
                    DC(int64(0xd131ddde9cc68a8c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd131ddde9cc68a8c), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Corristo_200685 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xea78d151bfcd68d7);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceCorristo130125 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5865);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_130048");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ULCTYHF_20241213_125856"), int64(0xa821604d731b5865));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x96197ba47f205123), G1R.Corristo_FireMagesTest < 1);
                    DB(int64(0xac9484e2003d96b3), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0xce11cc9452ea4c0f), Corristo != nullptr && !Corristo.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Corristo_402_WaitYard));
                }
                
                if (G1R.Corristo_FireMagesTest >= 1)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (Corristo != nullptr && Corristo.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Corristo_402_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5834), EConversationDebugInfo::Executing);
                // I am ready for the Trial of Fire.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_130048"));
                DC(int64(0xa821604d731b5834), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5835), EConversationDebugInfo::Executing);
                
                // Hmmm...We'll see about that.
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_130048_3436"));
                DC(int64(0xa821604d731b5835), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorristo130447 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5935);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_133223");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ULCTYHF_20241213_133822"), int64(0xa821604d731b5935));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd131ddde9cc68b35), G1R.Corristo_FireMagesTest == 1);
                    DB(int64(0xce11cc9452ea4c10), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (G1R.Corristo_FireMagesTest != 1)
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5928), EConversationDebugInfo::Executing);
                
                // You said there's more before I can start the Trial. What ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133223"));
                DC(int64(0xa821604d731b5928), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5929), EConversationDebugInfo::Executing);
                
                // You will answer my questions. Are you ready?
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133223_3984"));
                DC(int64(0xa821604d731b5929), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_RankUpFireMages);
                Subdialog(
                    UTopic_Corristo_130724,
                    UTopic_Corristo_130744
                );
            }
        }
        
        
        class UTopic_Corristo_130724 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5946);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_133528_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130724);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5947), EConversationDebugInfo::Executing);
                // I'm ready, Master. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133528_3569"));
                DC(int64(0xa821604d731b5947), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5971), EConversationDebugInfo::Executing);
                
                // Why do you wish to be a mage of Innos?
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133822"));
                DC(int64(0xa821604d731b5971), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Corristo_130897,
                    UTopic_Corristo_130917,
                    UTopic_Corristo_131332
                );
            }
        }
        
        
        class UTopic_Corristo_130744 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b594a);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_133528_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130744);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b594b), EConversationDebugInfo::Executing);
                // Give me a bit. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133528_443"));
                DC(int64(0xa821604d731b594b), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cbe), EConversationDebugInfo::Executing);
                
                // Be swift. I don't have all day. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_160849"));
                DC(int64(0xf4d1c69f6fb33cbe), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5965), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5965), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_130897 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b597e);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_133905_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130897);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b597f), EConversationDebugInfo::Executing);
                // To destroy my enemies with His fire and light.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133905_1769"));
                DC(int64(0xa821604d731b597f), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5991), EConversationDebugInfo::Executing);
                
                // So it's about power. How original.
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133913"));
                DC(int64(0xa821604d731b5991), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5992), EConversationDebugInfo::Executing);
                // Innos' fire burns strong indeed, but lust for ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133926"));
                DC(int64(0xa821604d731b5992), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59aa), EConversationDebugInfo::Executing);
                // You're not worthy of the Trial. Go join up with Gomez's ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133958"));
                DC(int64(0xa821604d731b59aa), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cbf), EConversationDebugInfo::Executing);
                // We are done here. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_161042"));
                DC(int64(0xf4d1c69f6fb33cbf), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b599e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b599e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_130917 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5982);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_133905_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_130917);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5983), EConversationDebugInfo::Executing);
                // I want to learn about magic.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_133905_2995"));
                DC(int64(0xa821604d731b5983), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59ab), EConversationDebugInfo::Executing);
                
                // You do? Why, that would have never occured to me. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_134028"));
                DC(int64(0xa821604d731b59ab), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59ad), EConversationDebugInfo::Executing);
                // Thirst for knowledge is a virtue among all mages, but in ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_134139"));
                DC(int64(0xa821604d731b59ad), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59ac), EConversationDebugInfo::Executing);
                // You're unfit for the trial. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_134040"));
                DC(int64(0xa821604d731b59ac), EConversationDebugInfo::Done);
                DC(int64(0x97c013b354135a8c), EConversationDebugInfo::Executing);
                // We are done here. 
                Corristo.AI.Say(LocText("TEXT_WIP_UKCQMAI_20250112_181007"));
                DC(int64(0x97c013b354135a8c), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59b9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b59b9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_131332 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b59c5);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_142955_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131332);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b59c6), EConversationDebugInfo::Executing);
                // I want to bring about justice and help people.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_142955_3750"));
                DC(int64(0xa821604d731b59c6), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59d4), EConversationDebugInfo::Executing);
                
                // Do you, truly?
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143019"));
                DC(int64(0xa821604d731b59d4), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cc0), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_161357"));
                DC(int64(0xf4d1c69f6fb33cc0), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59d5), EConversationDebugInfo::Executing);
                
                // Hm. Innos blind me, but I believe you. You're a ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143041"));
                DC(int64(0xa821604d731b59d5), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cc1), EConversationDebugInfo::Executing);
                // Very well. Here's my next question.
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_161438"));
                DC(int64(0xf4d1c69f6fb33cc1), EConversationDebugInfo::Done);
                DC(int64(0x97c013b354135a8d), EConversationDebugInfo::Executing);
                // There is a flame that burns and radiates warmth and ...
                Corristo.AI.Say(LocText("TEXT_WIP_UKCQMAI_20250112_181648"));
                DC(int64(0x97c013b354135a8d), EConversationDebugInfo::Done);
                DC(int64(0x97c013b354135a8e), EConversationDebugInfo::Executing);
                // What is the meaning of the second flame?
                Corristo.AI.Say(LocText("TEXT_WIP_UKCQMAI_20250112_181807"));
                DC(int64(0x97c013b354135a8e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Corristo_131403,
                    UTopic_Corristo_131423,
                    UTopic_Corristo_131679,
                    UTopic_Corristo_131735,
                    UTopic_Corristo_131783,
                    UTopic_Corristo_131815
                );
                DC(int64(0xa821604d731b5ade), EConversationDebugInfo::Executing);
                // Now, the true Trial can start.
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_144245_94"));
                DC(int64(0xa821604d731b5ade), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5b0e), EConversationDebugInfo::Executing);
                // As the barrier somewhat "restricts" our movement, it ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_144351"));
                DC(int64(0xa821604d731b5b0e), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f774), EConversationDebugInfo::Executing);
                // But it'll be the same trial Brother Milten took. A ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_143718"));
                DC(int64(0x4aade750f724f774), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f775), EConversationDebugInfo::Executing);
                
                // Where to?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_143736"));
                DC(int64(0x4aade750f724f775), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f776), EConversationDebugInfo::Executing);
                
                // Two holy sites of Innos: one gazes out over the sea, and ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_143741"));
                DC(int64(0x4aade750f724f776), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5b10), EConversationDebugInfo::Executing);
                // Find them and use these scrolls to rekindle their ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_144459"));
                DC(int64(0xa821604d731b5b10), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f777), EConversationDebugInfo::Executing);
                // Then, and only then, I shall consider your Trial passed.
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_143946"));
                DC(int64(0x4aade750f724f777), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Corristo.AddItemToInventory(UItAr_Scroll_InnosPray, 2);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5b20), EConversationDebugInfo::Executing);
                Corristo.AI.GiveItemTo(Hero, UItAr_Scroll_InnosPray, 2);
                DC(int64(0xa821604d731b5b20), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Corristo_144750,
                    UTopic_Corristo_145232,
                    UTopic_Corristo_145633,
                    UTopic_Corristo_144770
                );
            }
        }
        
        
        class UTopic_Corristo_131403 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b59e2);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143217_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131403);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b59e3), EConversationDebugInfo::Executing);
                // Could you repeat that?
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143217_731"));
                DC(int64(0xa821604d731b59e3), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b59f5), EConversationDebugInfo::Executing);
                
                // No. I have no patience for a man who doesn't listen. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143235"));
                DC(int64(0xa821604d731b59f5), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cc2), EConversationDebugInfo::Executing);
                // You failed. We are done here. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_161724"));
                DC(int64(0xf4d1c69f6fb33cc2), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a02), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5a02), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_131423 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b59e6);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143217_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131423);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b59e7), EConversationDebugInfo::Executing);
                // It's our faith in Innos.  
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143217_3719"));
                DC(int64(0xa821604d731b59e7), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a19), EConversationDebugInfo::Executing);
                
                // Well said.
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143629"));
                DC(int64(0xa821604d731b5a19), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a1a), EConversationDebugInfo::Executing);
                // Color me surprised. You've passed my test. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143631"));
                DC(int64(0xa821604d731b5a1a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_131679 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5a1b);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143708_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131679);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5a1c), EConversationDebugInfo::Executing);
                
                // It's willpower.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143708_2316"));
                DC(int64(0xa821604d731b5a1c), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a2a), EConversationDebugInfo::Executing);
                
                // Hmmm ... interesting. Not what I had in mind, but true ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143812"));
                DC(int64(0xa821604d731b5a2a), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a2b), EConversationDebugInfo::Executing);
                // Very well. You've passed my test. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143814"));
                DC(int64(0xa821604d731b5a2b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_131735 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5a2c);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143802_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131735);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5a2d), EConversationDebugInfo::Executing);
                
                // It's our awe before the gods. 
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143802_3902"));
                DC(int64(0xa821604d731b5a2d), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a3b), EConversationDebugInfo::Executing);
                
                // Hmmm ... interesting. Not what I had in mind, but true ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143812"));
                DC(int64(0xa821604d731b5a3b), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a3c), EConversationDebugInfo::Executing);
                // Very well. You've passed my test. 
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143814"));
                DC(int64(0xa821604d731b5a3c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_131783 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5a3d);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143844_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131783);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5a3e), EConversationDebugInfo::Executing);
                
                // It's the light of the stars. It burns without ever ...
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143844_153"));
                DC(int64(0xa821604d731b5a3e), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a4c), EConversationDebugInfo::Executing);
                
                // Where did you get that from - the gurus? "Light of the ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143858"));
                DC(int64(0xa821604d731b5a4c), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a4d), EConversationDebugInfo::Executing);
                // You failed. Go join Gomez's bloodhounds. You are unfit ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143905"));
                DC(int64(0xa821604d731b5a4d), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a68), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5a68), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_131815 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xa821604d731b5a4e);
            default Caption = LocText("TEXT_WIP_ULCTYHF_20241213_143926_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_131815);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa821604d731b5a4f), EConversationDebugInfo::Executing);
                // I don't have time for this nonsense.
                Hero.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_143926_292"));
                DC(int64(0xa821604d731b5a4f), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a74), EConversationDebugInfo::Executing);
                
                // In that case, we are done here.
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_144007"));
                DC(int64(0xa821604d731b5a74), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a75), EConversationDebugInfo::Executing);
                // Go talk to Thorus and become another one of Gomez's ...
                Corristo.AI.Say(LocText("TEXT_WIP_ULCTYHF_20241213_144014"));
                DC(int64(0xa821604d731b5a75), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33cc3), EConversationDebugInfo::Executing);
                // You are unworthy of this Trial. 
                Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_161941"));
                DC(int64(0xf4d1c69f6fb33cc3), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5a82), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5a82), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_144750 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x4aade750f724f787);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_144018_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_144750);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4aade750f724f788), EConversationDebugInfo::Executing);
                // "Sheltered behind a wall of Adanos."
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144018_41"));
                DC(int64(0x4aade750f724f788), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7b9), EConversationDebugInfo::Executing);
                
                // It's called a metaphor. 
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144050"));
                DC(int64(0x4aade750f724f7b9), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7ba), EConversationDebugInfo::Executing);
                
                // What does it mean? 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144055"));
                DC(int64(0x4aade750f724f7ba), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7bb), EConversationDebugInfo::Executing);
                
                // (sighs) Do I really have to spell it out for you?
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144105"));
                DC(int64(0x4aade750f724f7bb), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7bc), EConversationDebugInfo::Executing);
                // It's a riddle. Finding out where the altars are is part ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144128"));
                DC(int64(0x4aade750f724f7bc), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7bd), EConversationDebugInfo::Executing);
                
                // Right. 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144213"));
                DC(int64(0x4aade750f724f7bd), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f78a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4aade750f724f78a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_145232 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x4aade750f724f7be);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_144217_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_145232);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4aade750f724f7bf), EConversationDebugInfo::Executing);
                // And that's all?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144217_1924"));
                DC(int64(0x4aade750f724f7bf), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7d2), EConversationDebugInfo::Executing);
                
                // Oh, believe me, there will be peril along the way.
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144251"));
                DC(int64(0x4aade750f724f7d2), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7d0), EConversationDebugInfo::Executing);
                // But like I said, it's the best we can offer given the ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144237"));
                DC(int64(0x4aade750f724f7d0), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7d1), EConversationDebugInfo::Executing);
                // I'm truly sorry we can't better sate your zest for ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144248"));
                DC(int64(0x4aade750f724f7d1), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7c1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4aade750f724f7c1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_145633 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x4aade750f724f7d3);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_144427_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_145633);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4aade750f724f7d4), EConversationDebugInfo::Executing);
                // So Milten did the same thing? 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144427_2785"));
                DC(int64(0x4aade750f724f7d4), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7e5), EConversationDebugInfo::Executing);
                
                // That is correct. He is bolder than he looks. 
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144452"));
                DC(int64(0x4aade750f724f7e5), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7d6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4aade750f724f7d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_144770 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x4aade750f724f78b);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_144018_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_144770);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4aade750f724f78c), EConversationDebugInfo::Executing);
                // All right. I'll be back. 
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144018_2238"));
                DC(int64(0x4aade750f724f78c), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f724f7e6), EConversationDebugInfo::Executing);
                
                // Hmmm...Something tells me you will.
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144531"));
                DC(int64(0x4aade750f724f7e6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TRIALOFFIRE, Document::UDocumentSegment_CH3_TRIALOFFIRE_Start);
                DC(int64(0xa821604d731b5b55), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.StartQuest();
                DC(int64(0xa821604d731b5b55), EConversationDebugInfo::Done);
                DC(int64(0x4c8ae56e77519bae), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_PreRitual); }
                DC(int64(0x4c8ae56e77519bae), EConversationDebugInfo::Done);
                DC(int64(0x4c8ae56e77519bb0), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Damarok))) { Damarok.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Damarok_401_PreRitual); }
                DC(int64(0x4c8ae56e77519bb0), EConversationDebugInfo::Done);
                DC(int64(0x4c8ae56e77519bb2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Drago))) { Drago.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Drago_403_PreRitual); }
                DC(int64(0x4c8ae56e77519bb2), EConversationDebugInfo::Done);
                DC(int64(0x4c8ae56e77519bb4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_PreRitual); }
                DC(int64(0x4c8ae56e77519bb4), EConversationDebugInfo::Done);
                DC(int64(0xa821604d731b5b61), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa821604d731b5b61), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorristo133007 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x38e3477028edf8c1);
            default Caption = LocText("TEXT_WIP_VDGJUJG_20250318_103252_820");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCorristo133007);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x38e3477028edf8f8), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x38e3477028edf994), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                    DB(int64(0x38e3477028edf996), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x38e3477028edf9a5), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                    return true;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3) && Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_02, 1, 0))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf4d1c69f6fb33c1b), EConversationDebugInfo::Executing);
                // I have a letter for you.
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_151729"));
                DC(int64(0xf4d1c69f6fb33c1b), EConversationDebugInfo::Done);
                DC(int64(0x38e3477028edf8b2), EConversationDebugInfo::Executing);
                
                // Truly? Let me see. 
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_113440_41"));
                DC(int64(0x38e3477028edf8b2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_Introduction);
                DB(int64(0x38e3477028edf916), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_Letter_01, 1, 0))
                {
                    DC(int64(0x38e3477028edfa95), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Corristo, UItWr_Scroll_Letter_01, 1);
                    DC(int64(0x38e3477028edfa95), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x38e3477028edfab8), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Corristo, UItWr_Scroll_Letter_02, 1);
                    DC(int64(0x38e3477028edfab8), EConversationDebugInfo::Done);
                    DC(int64(0x38e3477028edf961), EConversationDebugInfo::Executing);
                    // ... The seal's been broken.
                    Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_121957_2785"));
                    DC(int64(0x38e3477028edf961), EConversationDebugInfo::Done);
                    DC(int64(0xf4d1c69f6fb33c1c), EConversationDebugInfo::Executing);
                    
                    // I have no idea how that happened ...
                    Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_151753"));
                    DC(int64(0xf4d1c69f6fb33c1c), EConversationDebugInfo::Done);
                    DC(int64(0x38e3477028edf9dc), EConversationDebugInfo::Executing);
                    
                    // Hmmm...Of course you don't.
                    Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_124339"));
                    DC(int64(0x38e3477028edf9dc), EConversationDebugInfo::Done);
                    DC(int64(0x38e3477028edf9dd), EConversationDebugInfo::Executing);
                    // Be more careful next time, will you?
                    Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_124429"));
                    DC(int64(0x38e3477028edf9dd), EConversationDebugInfo::Done);
                }
                DB(int64(0x123f53d08c63cf10), Corristo != nullptr && Corristo.IsSitting());
                
                if (Corristo != nullptr && Corristo.IsSitting())
                {
                    DC(int64(0xbcdb23aeac0b8d6b), EConversationDebugInfo::Executing);
                    Corristo.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScrollSeated);
                    DC(int64(0xbcdb23aeac0b8d6b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xbcdb23aeac0b8d6b), EConversationDebugInfo::Executing);
                    Corristo.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll);
                    DC(int64(0xbcdb23aeac0b8d6b), EConversationDebugInfo::Done);
                }
                DC(int64(0x38e3477028edf8c4), EConversationDebugInfo::Executing);
                // Ahhh... Interesting.
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_113511_2238"));
                DC(int64(0x38e3477028edf8c4), EConversationDebugInfo::Done);
                DC(int64(0xf4d1c69f6fb33c1d), EConversationDebugInfo::Executing);
                
                // What does it say?
                Hero.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152006"));
                DC(int64(0xf4d1c69f6fb33c1d), EConversationDebugInfo::Done);
                DC(int64(0x38e3477028edf9de), EConversationDebugInfo::Executing);
                
                // It's a warning against the nature of the Brotherhood. ...
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_124603"));
                DC(int64(0x38e3477028edf9de), EConversationDebugInfo::Done);
                DC(int64(0x814e98028469b31c), EConversationDebugInfo::Executing);
                Corristo.AI.EndAnyOngoingInteraction();
                DC(int64(0x814e98028469b31c), EConversationDebugInfo::Done);
                DB(int64(0x38e3477028edf9e2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                {
                    DC(int64(0x38e3477028edf9f1), EConversationDebugInfo::Executing);
                    // I'm sorry, master. I forgot about it. 
                    Hero.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_124705"));
                    DC(int64(0x38e3477028edf9f1), EConversationDebugInfo::Done);
                    DC(int64(0xf4d1c69f6fb33c1f), EConversationDebugInfo::Executing);
                    
                    // It's fine. 
                    Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152142"));
                    DC(int64(0xf4d1c69f6fb33c1f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x38e3477028edfa13), EConversationDebugInfo::Executing);
                    
                    // Things got in the way. 
                    Hero.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_124734"));
                    DC(int64(0x38e3477028edfa13), EConversationDebugInfo::Done);
                    DC(int64(0xf4d1c69f6fb33c1e), EConversationDebugInfo::Executing);
                    
                    // Ha... They always do.
                    Corristo.AI.Say(LocText("TEXT_WIP_BPPCYMI_20250120_152138"));
                    DC(int64(0xf4d1c69f6fb33c1e), EConversationDebugInfo::Done);
                }
                DC(int64(0x38e3477028edfb38), EConversationDebugInfo::Executing);
                // Go see Torrez about your reward.
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_130500"));
                DC(int64(0x38e3477028edfb38), EConversationDebugInfo::Done);
                DC(int64(0x38e3477028edfb39), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x38e3477028edfb39), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorristo134808 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xc5b31ec19f754ec7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceCorristo134808);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5b31ec19f754eca), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xc5b31ec19f754ecb), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x9c0cc70a4b38046e), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xce11cc9452ea4c0c), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0x425e95e2cf9e7a42), G1R.FireMagesPermission != 0);
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (G1R.FireMagesPermission == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x149f4f43870c3873), EConversationDebugInfo::Executing);
                // Who ... 
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160212"));
                DC(int64(0x149f4f43870c3873), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3874), EConversationDebugInfo::Executing);
                // Hm. The ponytail. You're the newcomer, aren't you? The ...
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160358"));
                DC(int64(0x149f4f43870c3874), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3875), EConversationDebugInfo::Executing);
                
                // I guess so. 
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160412"));
                DC(int64(0x149f4f43870c3875), EConversationDebugInfo::Done);
                DC(int64(0xc5b31ec19f754ec6), EConversationDebugInfo::Executing);
                
                // Interesting. Not what I expected to be honest. You look ...
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142243_1702"));
                DC(int64(0xc5b31ec19f754ec6), EConversationDebugInfo::Done);
                DC(int64(0xc5b31ec19f754ecc), EConversationDebugInfo::Executing);
                // Ohhh...No offense, of course.
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142535"));
                DC(int64(0xc5b31ec19f754ecc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_Introduction);
                Subdialog(
                    UTopic_Corristo_135034,
                    UTopic_Corristo_135054
                );
            }
        }
        
        
        class UTopic_Corristo_135034 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xc5b31ec19f754ed0);
            default Caption = LocText("TEXT_WIP_YLCTYHF_20241217_142800_3331");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_135034);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b31ec19f754ed1), EConversationDebugInfo::Executing);
                // "Plain?"
                Hero.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142800_3331"));
                DC(int64(0xc5b31ec19f754ed1), EConversationDebugInfo::Done);
                DC(int64(0xc5b31ec19f754ed8), EConversationDebugInfo::Executing);
                
                // Yes, though that might not even be the best word. I ...
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142817"));
                DC(int64(0xc5b31ec19f754ed8), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3876), EConversationDebugInfo::Executing);
                // Like a man who'd open a door with a headbut, I suppose. 
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_160535"));
                DC(int64(0x149f4f43870c3876), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3885), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x149f4f43870c3885), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_135054 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0xc5b31ec19f754ed4);
            default Caption = LocText("TEXT_WIP_YLCTYHF_20241217_142800_1661");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_135054);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b31ec19f754ed5), EConversationDebugInfo::Executing);
                // So, what's this about? 
                Hero.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142800_1661"));
                DC(int64(0xc5b31ec19f754ed5), EConversationDebugInfo::Done);
                DC(int64(0xc5b31ec19f754ed9), EConversationDebugInfo::Executing);
                
                // Well, first and foremost, I wanted to get an impression ...
                Corristo.AI.Say(LocText("TEXT_WIP_YLCTYHF_20241217_142904"));
                DC(int64(0xc5b31ec19f754ed9), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3894), EConversationDebugInfo::Executing);
                // Second, I want to ask you something about what happened ...
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_161206"));
                DC(int64(0x149f4f43870c3894), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3895), EConversationDebugInfo::Executing);
                // My sources tell me Y'Berion died believing the Sleeper ...
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_161230"));
                DC(int64(0x149f4f43870c3895), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870c3896), EConversationDebugInfo::Executing);
                // Is that true? Or are those sources ... confabulating?
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_161303"));
                DC(int64(0x149f4f43870c3896), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870cc144), EConversationDebugInfo::Executing);
                
                // No. There were murals in the orc graveyard, too. It's ...
                Hero.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_162020"));
                DC(int64(0x149f4f43870cc144), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870cc154), EConversationDebugInfo::Executing);
                
                // Huh. That's ... alarming. 
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_162104"));
                DC(int64(0x149f4f43870cc154), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870cc155), EConversationDebugInfo::Executing);
                // Very well. I wanted to hear it from your mouth. Thank ...
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_162111"));
                DC(int64(0x149f4f43870cc155), EConversationDebugInfo::Done);
                DC(int64(0x149f4f43870cc156), EConversationDebugInfo::Executing);
                // And here - take this. May Innos protect you in what's to ...
                Corristo.AI.Say(LocText("TEXT_WIP_AOZVQKH_20250206_162124"));
                DC(int64(0x149f4f43870cc156), EConversationDebugInfo::Done);
                DC(int64(0x425e95e2cf9e7a70), EConversationDebugInfo::Executing);
                Corristo.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0x425e95e2cf9e7a70), EConversationDebugInfo::Done);
                DC(int64(0x425e95e2cf9e7a82), EConversationDebugInfo::Executing);
                Corristo.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x425e95e2cf9e7a82), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorristo291469 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x4aade750f7257ba4);
            default Caption = LocText("TEXT_WIP_APPCYMI_20250121_150532");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceCorristo291469);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4aade750f7257ba7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xceac13d50428823a), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4aade750f7257b94), EConversationDebugInfo::Executing);
                // What are my responsibilities now? As a Fire Mage?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150532"));
                DC(int64(0x4aade750f7257b94), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257b95), EConversationDebugInfo::Executing);
                
                // That is a good question. 
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_150532_3286"));
                DC(int64(0x4aade750f7257b95), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc4), EConversationDebugInfo::Executing);
                // As you surely know by now, every brother of our small ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151141"));
                DC(int64(0x4aade750f7257bc4), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc6), EConversationDebugInfo::Executing);
                
                // What's mine?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151256"));
                DC(int64(0x4aade750f7257bc6), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc5), EConversationDebugInfo::Executing);
                
                // I'm still figuring that out. For now, take some days or ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151206"));
                DC(int64(0x4aade750f7257bc5), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc7), EConversationDebugInfo::Executing);
                // This is a life-changing step, even if it doesn't feel ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151328"));
                DC(int64(0x4aade750f7257bc7), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc8), EConversationDebugInfo::Executing);
                // I heard you are working for the Water Mages at this ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151350"));
                DC(int64(0x4aade750f7257bc8), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bc9), EConversationDebugInfo::Executing);
                
                // Is that a problem?
                Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151427"));
                DC(int64(0x4aade750f7257bc9), EConversationDebugInfo::Done);
                DC(int64(0x4aade750f7257bca), EConversationDebugInfo::Executing);
                
                // No. Keep doing it for the time being. Your calling will ...
                Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_151432"));
                DC(int64(0x4aade750f7257bca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorristo78292 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x3bdcc9b1d0fe9c2a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceCorristo78292);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_OC_STAIRCASE_TOP_CHAPEL", 200.0f, int64(0x3bdcc9b1d0fe9c2a));
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OC_STAIRCASE_TOP_CHAPEL", 100.0f, int64(0x3bdcc9b1d0fe9c2a));
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_DRAGO_403", n"FP_OC_STAIRCASE_TOP_CHAPEL_DRAGO", 100.0f, int64(0x3bdcc9b1d0fe9c2a));
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_TORREZ_405", n"FP_OC_STAIRCASE_TOP_CHAPEL_TORREZ", 100.0f, int64(0x3bdcc9b1d0fe9c2a));
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_DAMAROK_401", n"FP_OC_STAIRCASE_TOP_CHAPEL_DAMAROK", 100.0f, int64(0x3bdcc9b1d0fe9c2a));
            default Rules.RequireCharacterCloseToWaypoint(n"OC_KDF_RODRIGUEZ_400", n"FP_OC_STAIRCASE_TOP_CHAPEL_RODRIGUEZ", 100.0f, int64(0x3bdcc9b1d0fe9c2a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef734c9), G1R.Corristo_FireMagesTest == 4);
                    DB(int64(0x192d18d4e64b111b), Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning());
                }
                
                if (G1R.Corristo_FireMagesTest != 4)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE != nullptr && !Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef734e7), EConversationDebugInfo::Executing);
                // Brothers of Innos. We are gathered here today to allow a ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_01"));
                DC(int64(0x921a6156ef734e7), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734e8), EConversationDebugInfo::Executing);
                // Seeker. Repeat after me the Oath of Fire.
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_02"));
                DC(int64(0x921a6156ef734e8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_RanUpFireMagesCompleted);
                DC(int64(0x191e63576510f66e), EConversationDebugInfo::Executing);
                G1R.Corristo_FireMagesTest = 5;
                DC(int64(0x191e63576510f66e), EConversationDebugInfo::Done);
                Print("Skipped sound.PlaySound()");
                DC(int64(0x921a6156ef734ea), EConversationDebugInfo::Executing);
                // Oh, Lord Innos, I swear by thy power ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_03"));
                DC(int64(0x921a6156ef734ea), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734eb), EConversationDebugInfo::Executing);
                
                // Oh, Lord Innos, I swear by thy power ...
                Hero.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_15_04"));
                DC(int64(0x921a6156ef734eb), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734ec), EConversationDebugInfo::Executing);
                
                // By thee, oh Cleansing Flame, oh Bringer of Light, oh ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_05"));
                DC(int64(0x921a6156ef734ec), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734ed), EConversationDebugInfo::Executing);
                
                // By thee, oh Cleansing Flame, oh Bringer of Light, oh ...
                Hero.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_15_06"));
                DC(int64(0x921a6156ef734ed), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734ee), EConversationDebugInfo::Executing);
                
                // That, from this day on, my soul and my deeds shall ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_07"));
                DC(int64(0x921a6156ef734ee), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734ef), EConversationDebugInfo::Executing);
                
                // That, from this day on, my soul and my deeds shall ...
                Hero.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_15_08"));
                DC(int64(0x921a6156ef734ef), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734f0), EConversationDebugInfo::Executing);
                
                // Until my flame doth perish, and my life departs this ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_14_09"));
                DC(int64(0x921a6156ef734f0), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef734f1), EConversationDebugInfo::Executing);
                
                // Until my flame doth perish, and my life departs this ...
                Hero.AI.Say(LocText("KDF_402_CORRISTO_AUFNAHME_INFO_15_10"));
                DC(int64(0x921a6156ef734f1), EConversationDebugInfo::Done);
                DC(int64(0xb7d0dc2c6e096238), EConversationDebugInfo::Executing);
                
                // It is done. By uttering this sacred oath, you have ...
                Corristo.AI.Say(LocText("TEXT_GROMEU_20240125_160715"));
                DC(int64(0xb7d0dc2c6e096238), EConversationDebugInfo::Done);
                DC(int64(0xb7d0dc2c6e096239), EConversationDebugInfo::Executing);
                // Wear these robes as a sign of your bond. 
                Corristo.AI.Say(LocText("TEXT_GROMEU_20240125_160716"));
                DC(int64(0xb7d0dc2c6e096239), EConversationDebugInfo::Done);
                DC(int64(0x191e63576510f65a), EConversationDebugInfo::Executing);
                Corristo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Corristo_402_Start);
                DC(int64(0x191e63576510f65a), EConversationDebugInfo::Done);
                DC(int64(0x191e63576510f65c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Start); }
                DC(int64(0x191e63576510f65c), EConversationDebugInfo::Done);
                Print("Skipped Rodriguez.AI.ContinueDailyRoutine()");
                DC(int64(0x191e63576510f660), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Damarok))) { Damarok.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Damarok_401_Start); }
                DC(int64(0x191e63576510f660), EConversationDebugInfo::Done);
                DC(int64(0x191e63576510f662), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Drago))) { Drago.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Drago_403_Start); }
                DC(int64(0x191e63576510f662), EConversationDebugInfo::Done);
                Print("Skipped Drago.AI.ContinueDailyRoutine()");
                DC(int64(0x191e63576510f666), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torrez))) { Torrez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Torrez_405_Start); }
                DC(int64(0x191e63576510f666), EConversationDebugInfo::Done);
                Print("Skipped Torrez.AI.ContinueDailyRoutine()");
                Print("Skipped sound.PlaySound()");
                DC(int64(0x3bdcc9b1d0fe9c2e), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UKdf_Armor_L, 1);
                DC(int64(0x3bdcc9b1d0fe9c2e), EConversationDebugInfo::Done);
                DC(int64(0x3bdcc9b1d0fe9c32), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipArmorOfClass(UKdf_Armor_L);
                DC(int64(0x3bdcc9b1d0fe9c32), EConversationDebugInfo::Done);
                DC(int64(0x3bdcc9b1d0fe9c34), EConversationDebugInfo::Executing);
                Hero.SetTrueGuild(UGE_Guild_Human_OldCamp_FireMage);
                DC(int64(0x3bdcc9b1d0fe9c34), EConversationDebugInfo::Done);
                DC(int64(0x3bdcc9b1d0fe9c36), EConversationDebugInfo::Executing);
                Hero.Character.Heal();
                DC(int64(0x3bdcc9b1d0fe9c36), EConversationDebugInfo::Done);
                DC(int64(0xfd7140af8de37c11), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE.SucceedQuest();
                DC(int64(0xfd7140af8de37c11), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847b24bf), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT.SucceedQuest();
                DC(int64(0x570acab4847b24bf), EConversationDebugInfo::Done);
                DC(int64(0x4a73a68f5291d472), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItKe_FireMagesRoom, 1);
                DC(int64(0x4a73a68f5291d472), EConversationDebugInfo::Done);
                DB(int64(0x192d18d4e64b112d), Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.IsRunning())
                {
                    DC(int64(0x192d18d4e64b113f), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.FailQuest();
                    DC(int64(0x192d18d4e64b113f), EConversationDebugInfo::Done);
                }
                DC(int64(0x921a6156ef73500), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x921a6156ef73500), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCorristo97581 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x1d9a089e246f29d4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceCorristo97581);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1d9a089e246f29e4), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning());
                    DB(int64(0x1d9a089e246f2b25), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1d9a089e246f29c5), EConversationDebugInfo::Executing);
                // Master Corristo? 
                Hero.AI.Say(LocText("TEXT_WIP_DXKHAXF_20240523_111129"));
                DC(int64(0x1d9a089e246f29c5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_FIREMAGES, Document::UDocumentSegment_CH4_FIREMAGES_Corristo);
                
                if (true)
                {
                    DC(int64(0x4aade750f724f822), EConversationDebugInfo::Executing);
                    // Oh, it's you. What is it?
                    Corristo.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144851"));
                    DC(int64(0x4aade750f724f822), EConversationDebugInfo::Done);
                    DC(int64(0x4aade750f724f823), EConversationDebugInfo::Executing);
                    
                    // Saturas sent me. 
                    Hero.AI.Say(LocText("TEXT_WIP_APPCYMI_20250121_144851_3436"));
                    DC(int64(0x4aade750f724f823), EConversationDebugInfo::Done);
                }
                else
                {
                    DB(int64(0x6894bd3e2772162b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x6894bd3e27721648), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x6894bd3e277216e5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xbac32087b2626fee), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    {
                        DC(int64(0x6894bd3e2772163a), EConversationDebugInfo::Executing);
                        // The answer is "no." 
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191229_1924"));
                        DC(int64(0x6894bd3e2772163a), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e2772167c), EConversationDebugInfo::Executing);
                        
                        // What? 
                        Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191408"));
                        DC(int64(0x6894bd3e2772167c), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e2772167d), EConversationDebugInfo::Executing);
                        
                        // We won't use our magic to help Gomez with whatever he's ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191411"));
                        DC(int64(0x6894bd3e2772167d), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e2772167e), EConversationDebugInfo::Executing);
                        // That has been our answer before, and it's our answer ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191432"));
                        DC(int64(0x6894bd3e2772167e), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e2772167f), EConversationDebugInfo::Executing);
                        // Go back to Raven, Bartholo, or whoever sent you and tell ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191446"));
                        DC(int64(0x6894bd3e2772167f), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e27721680), EConversationDebugInfo::Executing);
                        
                        // I don't know what you're talking about. I'm here on ...
                        Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191458"));
                        DC(int64(0x6894bd3e27721680), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e277216b2), EConversationDebugInfo::Executing);
                        
                        // Oh. Forgive me, I was ... nevermind. What is this about? 
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191745"));
                        DC(int64(0x6894bd3e277216b2), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0x6894bd3e2772164a), EConversationDebugInfo::Executing);
                        // ... A man of the Brotherhood. I presume there's a good ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191243_2785"));
                        DC(int64(0x6894bd3e2772164a), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e27721682), EConversationDebugInfo::Executing);
                        
                        // Yes. I'm here on behalf of the Water Mages. 
                        Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191549"));
                        DC(int64(0x6894bd3e27721682), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    {
                        DC(int64(0x6894bd3e277216e6), EConversationDebugInfo::Executing);
                        
                        // Brother. I heard about your recent ... expeditions. ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192800"));
                        DC(int64(0x6894bd3e277216e6), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e277216e7), EConversationDebugInfo::Executing);
                        
                        // That's why I'm here. The Water Mages need our help. 
                        Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192800_2801"));
                        DC(int64(0x6894bd3e277216e7), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    {
                        DC(int64(0x6894bd3e2772165b), EConversationDebugInfo::Executing);
                        
                        // A New Camper - I'm surprised they let you in. I suppose ...
                        Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191247_3436"));
                        DC(int64(0x6894bd3e2772165b), EConversationDebugInfo::Done);
                        DC(int64(0x6894bd3e27721683), EConversationDebugInfo::Executing);
                        
                        // In a way, yes. 
                        Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191652"));
                        DC(int64(0x6894bd3e27721683), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xbac32087b2627005), EConversationDebugInfo::Executing);
                        
                        // Hmm ... I know you. Or rather, I have heard about you - ...
                        Corristo.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_174245"));
                        DC(int64(0xbac32087b2627005), EConversationDebugInfo::Done);
                        DC(int64(0xbac32087b262701d), EConversationDebugInfo::Executing);
                        // How did you get in here? 
                        Corristo.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_174454"));
                        DC(int64(0xbac32087b262701d), EConversationDebugInfo::Done);
                        DC(int64(0xbac32087b262701e), EConversationDebugInfo::Executing);
                        
                        // I'm here on Saturas' behalf. 
                        Hero.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_174524"));
                        DC(int64(0xbac32087b262701e), EConversationDebugInfo::Done);
                    }
                }
                DC(int64(0x6894bd3e27721685), EConversationDebugInfo::Executing);
                // The Water Mages are ready to cast their spell on the ore ...
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191735_3286"));
                DC(int64(0x6894bd3e27721685), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b3), EConversationDebugInfo::Executing);
                
                // They ... but ... how? They'd need-
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191851"));
                DC(int64(0x6894bd3e277216b3), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b4), EConversationDebugInfo::Executing);
                
                // The focus stones, yes. They got them - all they need now ...
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191905"));
                DC(int64(0x6894bd3e277216b4), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b5), EConversationDebugInfo::Executing);
                
                // I ... I must say, this is unexpected. 
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_191915"));
                DC(int64(0x6894bd3e277216b5), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b6), EConversationDebugInfo::Executing);
                
                // What's your answer? 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192033"));
                DC(int64(0x6894bd3e277216b6), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b7), EConversationDebugInfo::Executing);
                
                // (sighs) Time is of the essence, isn't it? Frankly, this ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192041"));
                DC(int64(0x6894bd3e277216b7), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b8), EConversationDebugInfo::Executing);
                // He wants us to help his lackeys with our magic to, as he ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192133"));
                DC(int64(0x6894bd3e277216b8), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216b9), EConversationDebugInfo::Executing);
                // If he was to see us cooperate with the water mages in a ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192332"));
                DC(int64(0x6894bd3e277216b9), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Corristo_103156,
                    UTopic_Corristo_103176,
                    UTopic_Corristo_103355
                );
                DC(int64(0x6894bd3e27721745), EConversationDebugInfo::Executing);
                // But be that as it may - if what you say is true, we ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192950_443"));
                DC(int64(0x6894bd3e27721745), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e2772177a), EConversationDebugInfo::Executing);
                // Fine - we will head to the New Camp and help our ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_193011"));
                DC(int64(0x6894bd3e2772177a), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e2772177c), EConversationDebugInfo::Executing);
                // Still: given your involvement with the Water Mages, it ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_193125"));
                DC(int64(0x6894bd3e2772177c), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e2772178a), EConversationDebugInfo::Executing);
                
                // Do you want me to jump down the battlements? 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_193202"));
                DC(int64(0x6894bd3e2772178a), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e2772178b), EConversationDebugInfo::Executing);
                
                // Nothing as drastic. Go talk to Milten - he'll show you. 
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_193211"));
                DC(int64(0x6894bd3e2772178b), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e2772178c), EConversationDebugInfo::Executing);
                // And ... thanks. I must admit, I never believed in ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_193223"));
                DC(int64(0x6894bd3e2772178c), EConversationDebugInfo::Done);
                DC(int64(0x1d9a089e246f2b2a), EConversationDebugInfo::Executing);
                Corristo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Corristo_402_LastChance);
                DC(int64(0x1d9a089e246f2b2a), EConversationDebugInfo::Done);
                DC(int64(0x54f8b21324f85c46), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OC_GRD_GUARD07_222))) { OC_GRD_GUARD07_222.ExchangeDailyRoutineToClass(UDailyRoutine_OC_GRD_Guard07_222_FMTaken); }
                DC(int64(0x54f8b21324f85c46), EConversationDebugInfo::Done);
                DC(int64(0x1a789642623074ec), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_CORRISTO.SucceedQuest();
                DC(int64(0x1a789642623074ec), EConversationDebugInfo::Done);
                DC(int64(0x1d9a089e246f2b38), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1d9a089e246f2b38), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Corristo_103156 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x6894bd3e277216bb);
            default Caption = LocText("TEXT_WIP_WRQTACJ_20240603_192415_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_103156);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6894bd3e277216bc), EConversationDebugInfo::Executing);
                // Don't you want to get out of this Colony? 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192415_686"));
                DC(int64(0x6894bd3e277216bc), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216e3), EConversationDebugInfo::Executing);
                
                // Of course we do. But that doesn't mean we can act ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192622"));
                DC(int64(0x6894bd3e277216e3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_103176 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x6894bd3e277216bf);
            default Caption = LocText("TEXT_WIP_WRQTACJ_20240603_192415_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_103176);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6894bd3e277216c0), EConversationDebugInfo::Executing);
                
                // So you answer to Gomez now? 
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192415_3984"));
                DC(int64(0x6894bd3e277216c0), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216e2), EConversationDebugInfo::Executing);
                
                // No need to appeal to my pride. No, we don't. But that ...
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192532"));
                DC(int64(0x6894bd3e277216e2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Corristo_103355 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x6894bd3e277216d0);
            default Caption = LocText("TEXT_WIP_WRQTACJ_20240603_192458_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Corristo_103355);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6894bd3e277216d1), EConversationDebugInfo::Executing);
                
                // Is this a "no?"
                Hero.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192458_1609"));
                DC(int64(0x6894bd3e277216d1), EConversationDebugInfo::Done);
                DC(int64(0x6894bd3e277216e1), EConversationDebugInfo::Executing);
                
                // This is me telling you that we cannot act rashly. 
                Corristo.AI.Say(LocText("TEXT_WIP_WRQTACJ_20240603_192458_3569"));
                DC(int64(0x6894bd3e277216e1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCorristoIntruder : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73421);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73422), Corristo != nullptr && Corristo.IsInConversation());
                    DB(int64(0x921a6156ef73423), G1R.CorKalom_BringMCQBalls != 0);
                }
                
                if (Corristo != nullptr && !Corristo.IsInConversation())
                    return false;
                
                if (G1R.CorKalom_BringMCQBalls == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73424), EConversationDebugInfo::Executing);
                // What are you doing here? Get out!
                Corristo.AI.Say(LocText("INFO_SATURAS_INTRUDER_14_00"));
                DC(int64(0x921a6156ef73424), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_Introduction);
                DC(int64(0x921a6156ef73425), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x921a6156ef73425), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf402CorristoExit : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef7341f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73420), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x921a6156ef73420), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf402CorristoExplaincircles : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73505);
            default Caption = LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKdf402CorristoExplaincircles);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73506), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xceac13d50428823b), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73507), EConversationDebugInfo::Executing);
                // Tell me about the nature of magic Circles.
                Hero.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_15_01"));
                DC(int64(0x921a6156ef73507), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef73508), EConversationDebugInfo::Executing);
                
                // Of course. The Circles represent your share of the ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_02"));
                DC(int64(0x921a6156ef73508), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef73509), EConversationDebugInfo::Executing);
                // They stand for knowledge, aptitude, and the mastering of ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_03"));
                DC(int64(0x921a6156ef73509), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7350a), EConversationDebugInfo::Executing);
                // The spells are embedded in the runes. They are ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_04"));
                DC(int64(0x921a6156ef7350a), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7350b), EConversationDebugInfo::Executing);
                // And this synergy will wake a hunger for pure magical ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_05"));
                DC(int64(0x921a6156ef7350b), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7350c), EConversationDebugInfo::Executing);
                // It demands many hours of studying and requires much ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_06"));
                DC(int64(0x921a6156ef7350c), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7350e), EConversationDebugInfo::Executing);
                // But your efforts would be rewarded with much more ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINCIRCLES_INFO_14_08"));
                DC(int64(0x921a6156ef7350e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf402CorristoExplainmage : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73426);
            default Caption = LocText("KDF_402_CORRISTO_EXPLAINMAGE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceKdf402CorristoExplainmage);
            default Rules.HideIfKnowsId(n"choice_kdf_402_corristo_wannbekdf");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73427), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xceac13d50428823c), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73428), EConversationDebugInfo::Executing);
                
                // What does it mean to be a mage?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINMAGE_INFO_15_01"));
                DC(int64(0x921a6156ef73428), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef73429), EConversationDebugInfo::Executing);
                
                // It's a great honor, and a great responsibility. Many see ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINMAGE_INFO_14_02"));
                DC(int64(0x921a6156ef73429), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7342a), EConversationDebugInfo::Executing);
                // Magic and politics are inevitable components of being a ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINMAGE_INFO_14_03"));
                DC(int64(0x921a6156ef7342a), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef7342b), EConversationDebugInfo::Executing);
                // At least that's how it used to be in the outside world. ...
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_EXPLAINMAGE_INFO_14_04"));
                DC(int64(0x921a6156ef7342b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf402CorristoHeavyarmor : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73546);
            default Caption = LocText("KDF_402_CORRISTO_HEAVYARMOR_INFO_15_01");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Conversation_BuyItem_Kdf_Armor_H);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MGTRMXB_20240926_162139"), int64(0x921a6156ef73546));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73547), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73548), EConversationDebugInfo::Executing);
                
                // Where can I get a robe like the one you're wearing?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_HEAVYARMOR_INFO_15_01"));
                DC(int64(0x921a6156ef73548), EConversationDebugInfo::Done);
                DC(int64(0xe0e28b2386f64657), EConversationDebugInfo::Executing);
                
                // That isn't just any robe. It's the robe of a High Mage. 
                Corristo.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_161847"));
                DC(int64(0xe0e28b2386f64657), EConversationDebugInfo::Done);
                DB(int64(0x3100064b10913bf5), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                DB(int64(0x921a6156ef7354c), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDF_ARMOR_H, 0));
                DB(int64(0x3100064b10913c0a), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                {
                    DC(int64(0x921a6156ef7354b), EConversationDebugInfo::Executing);
                    // You're not ready yet. Perhaps one day. 
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_WANNBEKDF_INFO_14_04"));
                    DC(int64(0x921a6156ef7354b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_heavyarmor_exit_1");
                }
                else if (Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, G1R.VALUE_KDF_ARMOR_H, 0) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                {
                    DC(int64(0xe0e28b2386f64658), EConversationDebugInfo::Executing);
                    // You have earned it, yet you will have to pay the price ...
                    Corristo.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_162013"));
                    DC(int64(0xe0e28b2386f64658), EConversationDebugInfo::Done);
                    DC(int64(0xe0e28b2386f6465a), EConversationDebugInfo::Executing);
                    // Return once you have the ore. 
                    Corristo.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_162115"));
                    DC(int64(0xe0e28b2386f6465a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_heavyarmor_exit_2");
                }
                else
                {
                    DC(int64(0xe0e28b2386f6465b), EConversationDebugInfo::Executing);
                    // Wearing it is a great honor - but you have earned it. ...
                    Corristo.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_162139"));
                    DC(int64(0xe0e28b2386f6465b), EConversationDebugInfo::Done);
                    DC(int64(0xe0e28b2386f6465c), EConversationDebugInfo::Executing);
                    // May it serve you well. 
                    Corristo.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_162158"));
                    DC(int64(0xe0e28b2386f6465c), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f68a), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UKdf_Armor_H, 1);
                    DC(int64(0x191e63576510f68a), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f692), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Corristo, UItMi_Orenugget, G1R.VALUE_KDF_ARMOR_H);
                    DC(int64(0x191e63576510f692), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f694), EConversationDebugInfo::Executing);
                    Hero.Inventory.EquipArmorOfClass(UKdf_Armor_H);
                    DC(int64(0x191e63576510f694), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_heavyarmor_exit_3");
                }
            }
        }
        
        
        class UChoiceKdf402CorristoKreis1 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef7350f);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_475");
            default PriorityRank = 1;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_First);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKdf402CorristoExplaincircles);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73511), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x473a2207e0e629a2), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x31cfd98d4dbffddb), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x18a68a090803931f), G1R.Magician_Level < 1);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (G1R.Magician_Level >= 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73512), EConversationDebugInfo::Executing);
                // Am I ready to enter the First Circle?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_15_01"));
                DC(int64(0x921a6156ef73512), EConversationDebugInfo::Done);
                DB(int64(0x921a6156ef73514), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_1))
                {
                    DC(int64(0x921a6156ef73516), EConversationDebugInfo::Executing);
                    // Ready yourself, open your mind. Listen and understand:
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_14_03"));
                    DC(int64(0x921a6156ef73516), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73517), EConversationDebugInfo::Executing);
                    // Innos chose the human and gifted him light.
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_14_04"));
                    DC(int64(0x921a6156ef73517), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73518), EConversationDebugInfo::Executing);
                    // Just like it illuminated Beliar's abominable night for ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_14_05"));
                    DC(int64(0x921a6156ef73518), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73519), EConversationDebugInfo::Executing);
                    // As a chosen of Innos, I may bestow upon you a share of ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_14_06"));
                    DC(int64(0x921a6156ef73519), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef7351a), EConversationDebugInfo::Executing);
                    // Innos' blessings upon your mind, the vessel for his ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS1_INFO_14_07"));
                    DC(int64(0x921a6156ef7351a), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f78e), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_1);
                    DC(int64(0x191e63576510f78e), EConversationDebugInfo::Done);
                    DC(int64(0x18a68a090803931e), EConversationDebugInfo::Executing);
                    G1R.Magician_Level = 1;
                    DC(int64(0x18a68a090803931e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis1_exit_1");
                    DC(int64(0xf5dce9fbc1528521), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf5dce9fbc1528521), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x473a2207e0e629a3), EConversationDebugInfo::Executing);
                    // You're not quite there yet. I suggest you return another ...
                    Corristo.AI.Say(LocText("TEXT_GROMEU_20240116_121639"));
                    DC(int64(0x473a2207e0e629a3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis1_exit_2");
                    DC(int64(0x473a2207e0e629a5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x473a2207e0e629a5), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKdf402CorristoKreis2 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef7351e);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_946");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Second);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef7351f), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x921a6156ef73520), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x473a2207e0e629a6), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffdeb), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x75b6e6a66e155f54), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0x75b6e6a66e155f55), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73521), EConversationDebugInfo::Executing);
                // Am I ready to enter the Second Circle?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_KREIS2_INFO_15_01"));
                DC(int64(0x921a6156ef73521), EConversationDebugInfo::Done);
                DB(int64(0x921a6156ef73523), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2))
                {
                    DC(int64(0x921a6156ef73525), EConversationDebugInfo::Executing);
                    // Innos' fire may only burn its brightest where the ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS2_INFO_14_03"));
                    DC(int64(0x921a6156ef73525), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73527), EConversationDebugInfo::Executing);
                    // Only if you allow your mind to accept the nature of all ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS2_INFO_14_05"));
                    DC(int64(0x921a6156ef73527), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73528), EConversationDebugInfo::Executing);
                    // Innos' powers are at your disposal. Now go and make use ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS2_INFO_14_06"));
                    DC(int64(0x921a6156ef73528), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_2);
                    DC(int64(0x191e63576510f79f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis2_exit_1");
                    DC(int64(0xf5dce9fbc1528520), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf5dce9fbc1528520), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x473a2207e0e629a7), EConversationDebugInfo::Executing);
                    // You're not quite there yet. I suggest you return another ...
                    Corristo.AI.Say(LocText("TEXT_GROMEU_20240116_121639"));
                    DC(int64(0x473a2207e0e629a7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis2_exit_2");
                    DC(int64(0x473a2207e0e629a9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x473a2207e0e629a9), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKdf402CorristoKreis3 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef7352c);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_282");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Third);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef7351f), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x921a6156ef73520), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x473a2207e0e629a6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffdeb), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x75b6e6a66e155f54), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0x75b6e6a66e155f55), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef7352f), EConversationDebugInfo::Executing);
                // Can you teach me the Third Circle?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_15_01"));
                DC(int64(0x921a6156ef7352f), EConversationDebugInfo::Done);
                DB(int64(0x921a6156ef73531), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_2))
                {
                    DC(int64(0x921a6156ef73532), EConversationDebugInfo::Executing);
                    // You no longer seek knowledge, now. You have knowledge. 
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_02"));
                    DC(int64(0x921a6156ef73532), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73533), EConversationDebugInfo::Executing);
                    // But remember that you will learn the most valuable ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_03"));
                    DC(int64(0x921a6156ef73533), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73534), EConversationDebugInfo::Executing);
                    // And the human slayed the beast and it entered the realm ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_04"));
                    DC(int64(0x921a6156ef73534), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73535), EConversationDebugInfo::Executing);
                    // You know how to use the flames of Innos to bring ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_05"));
                    DC(int64(0x921a6156ef73535), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73536), EConversationDebugInfo::Executing);
                    // But you will have to reshape them to make order prevail ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_06"));
                    DC(int64(0x921a6156ef73536), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73537), EConversationDebugInfo::Executing);
                    // Ignite and burn them. Go and act in the name of Innos.
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS3_INFO_14_07"));
                    DC(int64(0x921a6156ef73537), EConversationDebugInfo::Done);
                    DC(int64(0x17e680219579a8fa), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_3);
                    DC(int64(0x17e680219579a8fa), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis3_exit_1");
                    DC(int64(0xf5dce9fbc1528522), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf5dce9fbc1528522), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x17e680219579a8f5), EConversationDebugInfo::Executing);
                    // You don't seem to be ready yet. But you will be soon, ...
                    Corristo.AI.Say(LocText("TEXT_GROMEU_20240116_115723"));
                    DC(int64(0x17e680219579a8f5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis3_exit_2");
                    DC(int64(0x2fda54ff9694c06f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2fda54ff9694c06f), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKdf402CorristoKreis4 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73539);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_1272");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Mage_Circle_Fourth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef7351f), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1));
                    DB(int64(0x921a6156ef73520), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x473a2207e0e629a6), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2));
                    DB(int64(0x31cfd98d4dbffdeb), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x75b6e6a66e155f54), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_3));
                    DB(int64(0x75b6e6a66e155f55), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_4));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Mage_Circle_2))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
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
                DC(int64(0x921a6156ef7353c), EConversationDebugInfo::Executing);
                // Master Corristo, I am ready for the Fourth Circle.
                Hero.AI.Say(LocText("KDF_402_CORRISTO_KREIS4_INFO_15_01"));
                DC(int64(0x921a6156ef7353c), EConversationDebugInfo::Done);
                DB(int64(0x921a6156ef7353e), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_4));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Mage_Circle_4))
                {
                    DC(int64(0x921a6156ef7353f), EConversationDebugInfo::Executing);
                    // Only those will master the Circles who understand that ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS4_INFO_14_02"));
                    DC(int64(0x921a6156ef7353f), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73540), EConversationDebugInfo::Executing);
                    // Imbue the storm of Adanos with the fire of Innos. Raise ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS4_INFO_14_03"));
                    DC(int64(0x921a6156ef73540), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73541), EConversationDebugInfo::Executing);
                    // If you ever have, do no longer hesitate to use your ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS4_INFO_14_04"));
                    DC(int64(0x921a6156ef73541), EConversationDebugInfo::Done);
                    DC(int64(0x921a6156ef73542), EConversationDebugInfo::Executing);
                    // But remember that you are first and foremost a servant ...
                    Corristo.AI.Say(LocText("KDF_402_CORRISTO_KREIS4_INFO_14_05"));
                    DC(int64(0x921a6156ef73542), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f7be), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Mage_Circle_4);
                    DC(int64(0x191e63576510f7be), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis4_exit_1");
                    DC(int64(0xf5dce9fbc152851f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf5dce9fbc152851f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf5dce9fbc152851c), EConversationDebugInfo::Executing);
                    // Not quite yet, no. But keep on gathering knowledge and ...
                    Corristo.AI.Say(LocText("TEXT_GROMEU_20240116_122533"));
                    DC(int64(0xf5dce9fbc152851c), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_kdf_402_corristo_kreis4_exit_2");
                    DC(int64(0xf5dce9fbc152851e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf5dce9fbc152851e), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceKdf402CorristoMana : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x921a6156ef73501);
            default Caption = LocText("KDF_402_CORRISTO_MANA_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x921a6156ef73502), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xceac13d50428823d), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x921a6156ef73503), EConversationDebugInfo::Executing);
                // I want to train my mana. Can you help me?
                Hero.AI.Say(LocText("KDF_402_CORRISTO_MANA_INFO_15_01"));
                DC(int64(0x921a6156ef73503), EConversationDebugInfo::Done);
                DC(int64(0x921a6156ef73504), EConversationDebugInfo::Executing);
                
                // I can. 
                Corristo.AI.Say(LocText("KDF_402_CORRISTO_MANA_INFO_14_02"));
                DC(int64(0x921a6156ef73504), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_CORRISTO, Document::UDocumentSegment_Glossary_OC_KDF_CORRISTO_Teacher);
                DC(int64(0xa1acfa3a2faf9031), EConversationDebugInfo::Executing);
                Hero.AI.RememberCurrentStatsForTeachingConversation(Corristo);
                DC(int64(0xa1acfa3a2faf9031), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceKdf402CorristoManaMan1,
                    UChoiceKdf402CorristoManaMan5,
                    UChoiceKdf402CorristoManaBack
                );
            }
        }
        
        
        class UChoiceKdf402CorristoManaMan1 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x1293fb0c30e90eca);
            default Caption = LocText("TEXT_CHOICE_KDW_604_CRONOS_MANA_MAN_1_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x191e63576510f7ce), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Corristo, 1);
                DC(int64(0x191e63576510f7ce), EConversationDebugInfo::Done);
                DC(int64(0xfee3c136d5a267d6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfee3c136d5a267d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf402CorristoManaMan5 : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x1293fb0c30e90ecc);
            default Caption = LocText("TEXT_CHOICE_KDW_604_CRONOS_MANA_MAN_1");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_MaxMana_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x191e63576510f7d2), EConversationDebugInfo::Executing);
                Hero.AI.BuyMaxManaAttributePoints(Corristo, 5);
                DC(int64(0x191e63576510f7d2), EConversationDebugInfo::Done);
                DC(int64(0xfee3c136d5a267e5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xfee3c136d5a267e5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf402CorristoManaBack : UTopic_Hero__OC_KDF_CORRISTO_402
        {
            default DebugId = int64(0x1293fb0c30e90ec6);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa1acfa3a2faf9053), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Corristo);
                DC(int64(0xa1acfa3a2faf9053), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */