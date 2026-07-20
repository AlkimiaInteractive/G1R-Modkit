#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_FLETCHER_255 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_FLETCHER_255";
        }
        
        
        class UTopic_Hero__OC_GRD_FLETCHER_255 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_FLETCHER_255";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetFletcher() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceFletcher106038 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f4013217835981);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceFletcher106038);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4f40132178359be), G1R.OldCampAccess == 0);
                    DB(int64(0x222dae20f194bee3), G1R.FireMagesDead != 0);
                }
                
                if (G1R.OldCampAccess != 0)
                    return false;
                
                if (G1R.FireMagesDead == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f401321783597e), EConversationDebugInfo::Executing);
                // Aw, come on. You've gotta be jokin'.
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_122854_41"));
                DC(int64(0x4f401321783597e), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835992), EConversationDebugInfo::Executing);
                
                // What are you talking about?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123004"));
                DC(int64(0x4f4013217835992), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835997), EConversationDebugInfo::Executing);
                
                // Though, I had this bet with a mate o' mine. I told him, ...
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123018"));
                DC(int64(0x4f4013217835997), EConversationDebugInfo::Done);
                DC(int64(0x4f40132178359a2), EConversationDebugInfo::Executing);
                // Seems I was wrong. 
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123137"));
                DC(int64(0x4f40132178359a2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_FLETCHER, Document::UDocumentSegment_Glossary_OC_GRD_FLETCHER_AfterFireMages);
                DB(int64(0x4f4013217835b4d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                {
                    DC(int64(0x4f4013217835b57), EConversationDebugInfo::Executing);
                    // You here to avenge your brothers?
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124638_3750"));
                    DC(int64(0x4f4013217835b57), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835b80), EConversationDebugInfo::Executing);
                    
                    // I'm just here to do business.
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124741"));
                    DC(int64(0x4f4013217835b80), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835b81), EConversationDebugInfo::Executing);
                    
                    // Of course you are.
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124804"));
                    DC(int64(0x4f4013217835b81), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4f40132178359a3), EConversationDebugInfo::Executing);
                    
                    // I'm just here to do business.
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123138"));
                    DC(int64(0x4f40132178359a3), EConversationDebugInfo::Done);
                    DC(int64(0x4f40132178359a8), EConversationDebugInfo::Executing);
                    
                    // Course you are.
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123151"));
                    DC(int64(0x4f40132178359a8), EConversationDebugInfo::Done);
                }
                DC(int64(0x4f4013217835b68), EConversationDebugInfo::Executing);
                // Here's the deal: Gomez wanted you six feet under, but ...
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124659"));
                DC(int64(0x4f4013217835b68), EConversationDebugInfo::Done);
                DC(int64(0x4f40132178359ad), EConversationDebugInfo::Executing);
                // Anyway, we ain't gonna kill you, but the castle and the ...
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123204"));
                DC(int64(0x4f40132178359ad), EConversationDebugInfo::Done);
                DC(int64(0x4f40132178359b2), EConversationDebugInfo::Executing);
                // Also, forget about protection - you piss someone off, ...
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123210"));
                DC(int64(0x4f40132178359b2), EConversationDebugInfo::Done);
                DC(int64(0x4f40132178359b7), EConversationDebugInfo::Executing);
                
                // So I can go in?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123216"));
                DC(int64(0x4f40132178359b7), EConversationDebugInfo::Done);
                DC(int64(0x4f40132178359b8), EConversationDebugInfo::Executing);
                
                // You can. AFTER you pay the fee. 
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123218"));
                DC(int64(0x4f40132178359b8), EConversationDebugInfo::Done);
                DB(int64(0x4f40132178359c2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x4f40132178359d5), EConversationDebugInfo::Executing);
                    // But I'm one of you.
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123328"));
                    DC(int64(0x4f40132178359d5), EConversationDebugInfo::Done);
                    DC(int64(0x4f40132178359c6), EConversationDebugInfo::Executing);
                    
                    // Oof. Not anymore, you ain't.
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123314_2238"));
                    DC(int64(0x4f40132178359c6), EConversationDebugInfo::Done);
                    DC(int64(0x4f40132178359dc), EConversationDebugInfo::Executing);
                    // A hundred nuggs, cold and blue. Take it or leave it.
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123419"));
                    DC(int64(0x4f40132178359dc), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fletcher_106038_exit_1");
                }
                else
                {
                    DC(int64(0x4f40132178359c9), EConversationDebugInfo::Executing);
                    // How much?
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123316"));
                    DC(int64(0x4f40132178359c9), EConversationDebugInfo::Done);
                    DC(int64(0x4f40132178359ca), EConversationDebugInfo::Executing);
                    
                    // A hundred nuggs, cold and blue. Take it or leave it.
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123419"));
                    DC(int64(0x4f40132178359ca), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fletcher_106038_exit_2");
                }
            }
        }
        
        
        class UChoiceFletcher106346 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f40132178359e3);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFletcher106038);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFletcher106813);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Fletcher_106419,
                    UTopic_Fletcher_106439,
                    UTopic_Fletcher_106715
                );
            }
        }
        
        
        class UTopic_Fletcher_106419 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f4013217835a0a);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_123517_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fletcher_106419);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4f4013217835a1d), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835a0b), EConversationDebugInfo::Executing);
                // Here's your ore.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123517_3286"));
                DC(int64(0x4f4013217835a0b), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a2e), EConversationDebugInfo::Executing);
                
                // Good. I'll let the others know you paid up - good luck ...
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123545"));
                DC(int64(0x4f4013217835a2e), EConversationDebugInfo::Done);
                DB(int64(0x4f4013217835a34), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x4f4013217835a48), EConversationDebugInfo::Executing);
                    // For what it's worth, I think you were an all right ...
                    Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123620_3984"));
                    DC(int64(0x4f4013217835a48), EConversationDebugInfo::Done);
                }
                DC(int64(0x80fdc4ad8325ac80), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Fletcher, UItMi_Orenugget, 100);
                DC(int64(0x80fdc4ad8325ac80), EConversationDebugInfo::Done);
                DC(int64(0x80fdc4ad8325ac8a), EConversationDebugInfo::Executing);
                G1R.OldCampAccess = 1;
                DC(int64(0x80fdc4ad8325ac8a), EConversationDebugInfo::Done);
                DC(int64(0x80fdc4ad8325ac8b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x80fdc4ad8325ac8b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Fletcher_106439 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f4013217835a0e);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_123517_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fletcher_106439);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835a0f), EConversationDebugInfo::Executing);
                // I don't have that much on me. 
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123517_2386"));
                DC(int64(0x4f4013217835a0f), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a63), EConversationDebugInfo::Executing);
                
                // Sad. Then come back when you do.
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123744"));
                DC(int64(0x4f4013217835a63), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a7d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4f4013217835a7d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Fletcher_106715 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f4013217835a64);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_123751_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fletcher_106715);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835a65), EConversationDebugInfo::Executing);
                // I'm not paying that.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123751_1609"));
                DC(int64(0x4f4013217835a65), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a72), EConversationDebugInfo::Executing);
                
                // Then you ain't gettin' in. 
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123759"));
                DC(int64(0x4f4013217835a72), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a86), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4f4013217835a86), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFletcher106364 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f40132178359f5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFletcher106038);
            default Rules.HideIfKnows(UChoiceFletcher106364);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_MainGate", 300.0f, int64(0x4f40132178359f5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x59bd819cc590e476), G1R.OldCampAccess == 0);
                }
                
                return G1R.OldCampAccess == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f40132178359f0), EConversationDebugInfo::Executing);
                // You deaf or what? Pay or sod off!
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123444_2785"));
                DC(int64(0x4f40132178359f0), EConversationDebugInfo::Done);
                DC(int64(0x80fdc4ad8325ac5d), EConversationDebugInfo::Executing);
                Fletcher.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x80fdc4ad8325ac5d), EConversationDebugInfo::Done);
                DC(int64(0x80fdc4ad8325ac62), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x80fdc4ad8325ac62), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFletcher106813 : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x4f4013217835a97);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_123837");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4f4013217835aa5), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_140538")));
                    DB(int64(0x80fdc4ad8325ac52), G1R.OldCampAccess == 0);
                    DB(int64(0x4f4013217835aab), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_140540")));
                    DB(int64(0x80fdc4ad8325ac53), G1R.OldCampAccess == 0);
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_140538")) && G1R.OldCampAccess == 0)
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_140540")) && G1R.OldCampAccess == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835a91), EConversationDebugInfo::Executing);
                // How much did you want again?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123837"));
                DC(int64(0x4f4013217835a91), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835a92), EConversationDebugInfo::Executing);
                
                // A hundred nuggets.
                Fletcher.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_123837_3569"));
                DC(int64(0x4f4013217835a92), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFletcherExit : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d2996);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d2997), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1dd4e95630d2997), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFletcherFirst : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d2998);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceFletcherFirst);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_NRZXSLD_20241030_124655"), int64(0x1dd4e95630d2998));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1dd4e95630d2999), GameTime.CurrentClockTime.IsBetween(FClockTime(0, 0), FClockTime(6, 0)));
                    DB(int64(0x87a0f8dfdee9d0f5), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x87a0f8dfdee9d0f6), G1R.Fletcher_Timer_Night.IsValid() && G1R.Fletcher_Timer_Night.IsMoreThanXMinutesAgo(120));
                    DB(int64(0xb945a8937a2f7e76), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(0, 0), FClockTime(6, 0)))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (G1R.Fletcher_Timer_Night.IsValid() && !G1R.Fletcher_Timer_Night.IsMoreThanXMinutesAgo(120))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d299a), EConversationDebugInfo::Executing);
                // Hey, you!
                Fletcher.AI.Say(LocText("DIA_FLETCHER_FIRST_06_00"));
                DC(int64(0x1dd4e95630d299a), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d299b), EConversationDebugInfo::Executing);
                
                // Who? Me?
                Hero.AI.Say(LocText("DIA_FLETCHER_FIRST_15_01"));
                DC(int64(0x1dd4e95630d299b), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d299c), EConversationDebugInfo::Executing);
                
                // You know damn well who I'm talking to.
                Fletcher.AI.Say(LocText("DIA_FLETCHER_FIRST_06_02"));
                DC(int64(0x1dd4e95630d299c), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d299d), EConversationDebugInfo::Executing);
                // Listen up: this bit of the camp is my patch. That means ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_FIRST_06_03"));
                DC(int64(0x1dd4e95630d299d), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d299e), EConversationDebugInfo::Executing);
                // Thing is, freshies like you just LOVE to make trouble ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_FIRST_06_04"));
                DC(int64(0x1dd4e95630d299e), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29a0), EConversationDebugInfo::Executing);
                // And I swear, if I catch you in one of the digger's huts ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_FIRST_06_06"));
                DC(int64(0x1dd4e95630d29a0), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a17224), EConversationDebugInfo::Executing);
                
                // All right, all right ... 
                Hero.AI.Say(LocText("TEXT_NISEA_20231218_150110"));
                DC(int64(0xea4b1a4f94a17224), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_FLETCHER, Document::UDocumentSegment_Glossary_OC_GRD_FLETCHER_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_FLETCHER, Document::UDocumentSegment_Glossary_OC_GRD_FLETCHER_NightPatrol);
                DC(int64(0x1dd4e95630d29a1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1dd4e95630d29a1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFletcherHello : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d29a2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceFletcherHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7452d775975be07), Fletcher != nullptr && Fletcher.IsInConversation());
                    DB(int64(0x3a09a40528d11918), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Fletcher != nullptr && !Fletcher.IsInConversation())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda646550), EConversationDebugInfo::Executing);
                // Ain't seen your mug before ... 
                Fletcher.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_124655"));
                DC(int64(0x468f6c0cda646550), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29a5), EConversationDebugInfo::Executing);
                // You're here to pay your protection money? If so, save ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_HELLO_06_01"));
                DC(int64(0x1dd4e95630d29a5), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29a6), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("DIA_FLETCHER_HELLO_15_02"));
                DC(int64(0x1dd4e95630d29a6), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29a7), EConversationDebugInfo::Executing);
                
                // 'Cause I'm not really here. 
                Fletcher.AI.Say(LocText("DIA_FLETCHER_HELLO_06_03"));
                DC(int64(0x1dd4e95630d29a7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_FLETCHER, Document::UDocumentSegment_Glossary_OC_GRD_FLETCHER_Introduction);
                DC(int64(0x87a0f8dfdee9d0e7), EConversationDebugInfo::Executing);
                G1R.Fletcher_Timer_Night = FInGameTime::Now();
                DC(int64(0x87a0f8dfdee9d0e7), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceFletcherHelloWhytalk,
                    UChoiceFletcherHelloWhereelse
                );
            }
        }
        
        
        class UChoiceFletcherHelloWhytalk : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0xe8603e87342bd4e3);
            default Caption = LocText("DIA_FLETCHER_HELLO_WHYTALK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceFletcherHelloWhytalk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29ac), EConversationDebugInfo::Executing);
                // Then who am I talking to?
                Hero.AI.Say(LocText("DIA_FLETCHER_HELLO_WHYTALK_15_00"));
                DC(int64(0x1dd4e95630d29ac), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda646551), EConversationDebugInfo::Executing);
                
                // The poor warder who had to step in for his mate, Nek, ...
                Fletcher.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_124835"));
                DC(int64(0x468f6c0cda646551), EConversationDebugInfo::Done);
                DB(int64(0x68b45c0693f6995b), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded())
                {
                    DC(int64(0x468f6c0cda646552), EConversationDebugInfo::Executing);
                    // Where is Nek?
                    Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_125453"));
                    DC(int64(0x468f6c0cda646552), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29ad), EConversationDebugInfo::Executing);
                    
                    // Missin'. 
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_HELLO_WHYTALK_06_01"));
                    DC(int64(0x1dd4e95630d29ad), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29ae), EConversationDebugInfo::Executing);
                    // Thorus has me coverin' for him 'til he's back. 
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_HELLO_WHYTALK_06_02"));
                    DC(int64(0x1dd4e95630d29ae), EConversationDebugInfo::Done);
                    DC(int64(0x66a8afbd7d5ab3c8), EConversationDebugInfo::Executing);
                    G1R.Fletcher_whytalk = 1;
                    DC(int64(0x66a8afbd7d5ab3c8), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29bd), EConversationDebugInfo::Executing);
                    // What's keeping you from collecting his levies?
                    Hero.AI.Say(LocText("DIA_FLETCHER_TROSCHU_15_00"));
                    DC(int64(0x1dd4e95630d29bd), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29be), EConversationDebugInfo::Executing);
                    
                    // 'Cause he did a big round just before he disappeared. ...
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_TROSCHU_06_01"));
                    DC(int64(0x1dd4e95630d29be), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceFletcherHelloWhereelse : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0xe8603e87342bd4e9);
            default Caption = LocText("DIA_FLETCHER_HELLO_WHEREELSE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceFletcherHelloWhereelse);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29b1), EConversationDebugInfo::Executing);
                // Where are you?
                Hero.AI.Say(LocText("DIA_FLETCHER_HELLO_WHEREELSE_15_00"));
                DC(int64(0x1dd4e95630d29b1), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29b2), EConversationDebugInfo::Executing);
                
                // Huh... In the castle, at the hearth, drinkin' beer with ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_HELLO_WHEREELSE_06_01"));
                DC(int64(0x1dd4e95630d29b2), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29b3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1dd4e95630d29b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFletcherProblem : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d29cd);
            default Caption = LocText("DIA_FLETCHER_PROBLEM_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceFletcherProblem);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1dd4e95630d29ce), G1R.Fletcher_foundNek != 0);
                }
                
                return G1R.Fletcher_foundNek != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29cf), EConversationDebugInfo::Executing);
                // Did you know Nek well?
                Hero.AI.Say(LocText("DIA_FLETCHER_PROBLEM_15_00"));
                DC(int64(0x1dd4e95630d29cf), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29d0), EConversationDebugInfo::Executing);
                
                // Uh, more or less. They tossed us in together, but he's ...
                Fletcher.AI.Say(LocText("DIA_FLETCHER_PROBLEM_06_01"));
                DC(int64(0x1dd4e95630d29d0), EConversationDebugInfo::Done);
                DC(int64(0xea4b1a4f94a1722b), EConversationDebugInfo::Executing);
                // Don't ask me why ... 
                Fletcher.AI.Say(LocText("TEXT_NISEA_20231218_152749"));
                DC(int64(0xea4b1a4f94a1722b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFletcherWegennek : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d29bf);
            default Caption = LocText("DIA_FLETCHER_WEGENNEK_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFletcherWonek);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1dd4e95630d29c0), G1R.Fletcher_foundNek == 0);
                }
                
                return G1R.Fletcher_foundNek == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29c1), EConversationDebugInfo::Executing);
                
                // About Nek ...
                Hero.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_15_00"));
                DC(int64(0x1dd4e95630d29c1), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29c2), EConversationDebugInfo::Executing);
                
                // Huh?
                Fletcher.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_06_01"));
                DC(int64(0x1dd4e95630d29c2), EConversationDebugInfo::Done);
                DB(int64(0x97c0403bd6292113), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Neks, 1, 0));
                DB(int64(0x444e0fb1efe4712f), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded());
                
                if ((Hero != nullptr && Hero.HasItem(UItAt_Amulet_Neks, 1, 0)) || (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.HasSucceeded()))
                {
                    DC(int64(0x1dd4e95630d29c5), EConversationDebugInfo::Executing);
                    // I think I found him.
                    Hero.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_15_02"));
                    DC(int64(0x1dd4e95630d29c5), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29c6), EConversationDebugInfo::Executing);
                    
                    // Did you now? Did he really turn coat?
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_06_03"));
                    DC(int64(0x1dd4e95630d29c6), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29c7), EConversationDebugInfo::Executing);
                    
                    // No, he's dead. The molerats got him.
                    Hero.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_15_04"));
                    DC(int64(0x1dd4e95630d29c7), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29c8), EConversationDebugInfo::Executing);
                    
                    // Really? Shit. He was a good man. 
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_06_05"));
                    DC(int64(0x1dd4e95630d29c8), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29c9), EConversationDebugInfo::Executing);
                    // Guess I'm gonna have to take over this patch for good ...
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_06_06"));
                    DC(int64(0x1dd4e95630d29c9), EConversationDebugInfo::Done);
                    DC(int64(0x66a8afbd7d5ab3e0), EConversationDebugInfo::Executing);
                    G1R.Fletcher_foundNek = 1;
                    DC(int64(0x66a8afbd7d5ab3e0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fletcher_wegennek_exit_1");
                }
                else
                {
                    DC(int64(0x1dd4e95630d29cb), EConversationDebugInfo::Executing);
                    // I'm still looking.
                    Hero.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_15_07"));
                    DC(int64(0x1dd4e95630d29cb), EConversationDebugInfo::Done);
                    DC(int64(0x1dd4e95630d29cc), EConversationDebugInfo::Executing);
                    
                    // Keep me in the loop. 
                    Fletcher.AI.Say(LocText("DIA_FLETCHER_WEGENNEK_06_08"));
                    DC(int64(0x1dd4e95630d29cc), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fletcher_wegennek_exit_2");
                }
            }
        }
        
        
        class UChoiceFletcherWonek : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d29b4);
            default Caption = LocText("DIA_FLETCHER_WONEK_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceFletcherWonek);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1dd4e95630d29b5), G1R.Fletcher_whytalk != 0);
                    DB(int64(0x83eb32359b3ae4e1), Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning());
                    DB(int64(0x45b6742bd0341816), Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK.HasSucceeded());
                }
                
                if (G1R.Fletcher_whytalk == 0)
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK != nullptr && !Quest::OldCamp_OCCHAPTER1_LOSTNEK.IsRunning())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK != nullptr && Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FINDNEK.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29b7), EConversationDebugInfo::Executing);
                // When was the last time you saw Nek?
                Hero.AI.Say(LocText("DIA_FLETCHER_WONEK_15_00"));
                DC(int64(0x1dd4e95630d29b7), EConversationDebugInfo::Done);
                DC(int64(0x1dd4e95630d29b8), EConversationDebugInfo::Executing);
                
                // What's it to you?
                Fletcher.AI.Say(LocText("DIA_FLETCHER_WONEK_06_01"));
                DC(int64(0x1dd4e95630d29b8), EConversationDebugInfo::Done);
                DC(int64(0x8f7fa217a9ebffd1), EConversationDebugInfo::Executing);
                
                // Sly wants me to find him.
                Hero.AI.Say(LocText("TEXT_NISEA_20231218_144019"));
                DC(int64(0x8f7fa217a9ebffd1), EConversationDebugInfo::Done);
                DC(int64(0x8f7fa217a9ebffd2), EConversationDebugInfo::Executing);
                
                // Ah ... tryin' to make a good impression, are we? I ain't ...
                Fletcher.AI.Say(LocText("TEXT_NISEA_20231218_144025"));
                DC(int64(0x8f7fa217a9ebffd2), EConversationDebugInfo::Done);
                DC(int64(0x8f7fa217a9ebffd3), EConversationDebugInfo::Executing);
                // Try and ask Guy, the digger. He knows everyone.
                Fletcher.AI.Say(LocText("TEXT_NISEA_20231218_144146"));
                DC(int64(0x8f7fa217a9ebffd3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_LOSTNEK, Document::UDocumentSegment_CH1_LOSTNEK_Guy);
                DC(int64(0x63819e1318108443), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_FLETCHER.SucceedQuest();
                DC(int64(0x63819e1318108443), EConversationDebugInfo::Done);
                DC(int64(0x63819e1318108457), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY.StartQuest();
                DC(int64(0x63819e1318108457), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd255FletcherWelcome : UTopic_Hero__OC_GRD_FLETCHER_255
        {
            default DebugId = int64(0x1dd4e95630d29d1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd255FletcherWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1dd4e95630d29d2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1dd4e95630d29d3), EConversationDebugInfo::Executing);
                // So, you're one of us now, eh? Good job, that was a fast ...
                Fletcher.AI.Say(LocText("GRD_255_FLETCHER_WELCOME_INFO_06_01"));
                DC(int64(0x1dd4e95630d29d3), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */