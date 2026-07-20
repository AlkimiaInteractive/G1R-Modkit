#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_BLOODWYN_233 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_BLOODWYN_233";
        }
        
        
        class UTopic_Hero__OCR_GRD_BLOODWYN_233 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_BLOODWYN_233";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBloodwyn() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceBloodwyn106913 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835ad8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBloodwyn106913);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x59bd819cc590e420), G1R.OldCampAccess == 0);
                    DB(int64(0x222dae20f194beea), G1R.FireMagesDead != 0);
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
                DC(int64(0x4f4013217835ad3), EConversationDebugInfo::Executing);
                // Ha. I called it.
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124131_443"));
                DC(int64(0x4f4013217835ad3), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835ae4), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124200"));
                DC(int64(0x4f4013217835ae4), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835ae5), EConversationDebugInfo::Executing);
                
                // Uh, just a wager I had with one of the lads. I told him ...
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124201"));
                DC(int64(0x4f4013217835ae5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_AfterFireMages);
                DB(int64(0x4f4013217835b8f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                {
                    DC(int64(0x4f4013217835b9d), EConversationDebugInfo::Executing);
                    // You here to avenge your brothers?
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124836_1340"));
                    DC(int64(0x4f4013217835b9d), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835bae), EConversationDebugInfo::Executing);
                    
                    // No. Just business.
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124849"));
                    DC(int64(0x4f4013217835bae), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835baf), EConversationDebugInfo::Executing);
                    
                    // Hm. Well then.
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124907"));
                    DC(int64(0x4f4013217835baf), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4f4013217835ba4), EConversationDebugInfo::Executing);
                    
                    // I'm not here because of what you did to the mages. I ...
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124838"));
                    DC(int64(0x4f4013217835ba4), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835ba5), EConversationDebugInfo::Executing);
                    
                    // Don't we all. 
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124838_3719"));
                    DC(int64(0x4f4013217835ba5), EConversationDebugInfo::Done);
                }
                DC(int64(0x4f4013217835af3), EConversationDebugInfo::Executing);
                // Here's how it stands, mate: Gomez wanted you gone, but ...
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124245"));
                DC(int64(0x4f4013217835af3), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835b00), EConversationDebugInfo::Executing);
                // You're free to head in, but the castle's off limits. And ...
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124334"));
                DC(int64(0x4f4013217835b00), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835b01), EConversationDebugInfo::Executing);
                // Oh, and of course there's a fee.
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124419"));
                DC(int64(0x4f4013217835b01), EConversationDebugInfo::Done);
                DB(int64(0x4f4013217835b15), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                {
                    DC(int64(0x4f4013217835b1a), EConversationDebugInfo::Executing);
                    // Are you serious? I'm one of you.
                    Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124455"));
                    DC(int64(0x4f4013217835b1a), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835b1b), EConversationDebugInfo::Executing);
                    
                    // Not anymore, you ain't. Sorry.
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_124455_491"));
                    DC(int64(0x4f4013217835b1b), EConversationDebugInfo::Done);
                    DC(int64(0x4f4013217835bc3), EConversationDebugInfo::Executing);
                    // A hundred nuggs, cold and blue. Take it or leave it.
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125021"));
                    DC(int64(0x4f4013217835bc3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_106913_exit_1");
                }
                else
                {
                    DC(int64(0x4f4013217835b21), EConversationDebugInfo::Executing);
                    // A hundred nuggs, cold and blue. Take it or leave it.
                    Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125021"));
                    DC(int64(0x4f4013217835b21), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_106913_exit_2");
                }
            }
        }
        
        
        class UChoiceBloodwyn107802 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835bcc);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBloodwyn106913);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBloodwyn108210);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Bloodwyn_107863,
                    UTopic_Bloodwyn_107883,
                    UTopic_Bloodwyn_107909
                );
            }
        }
        
        
        class UTopic_Bloodwyn_107863 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835bef);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_125121_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bloodwyn_107863);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4f4013217835c06), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835bf0), EConversationDebugInfo::Executing);
                // Here's you ore.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125121_153"));
                DC(int64(0x4f4013217835bf0), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c27), EConversationDebugInfo::Executing);
                
                // Wonderful. And remember the rules. The castle's-
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125150"));
                DC(int64(0x4f4013217835c27), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c28), EConversationDebugInfo::Executing);
                
                // Off limits. Heard it the first time.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125200"));
                DC(int64(0x4f4013217835c28), EConversationDebugInfo::Done);
                DC(int64(0x59bd819cc590e45e), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Bloodwyn, UItMi_Orenugget, 100);
                DC(int64(0x59bd819cc590e45e), EConversationDebugInfo::Done);
                DC(int64(0x59bd819cc590e46d), EConversationDebugInfo::Executing);
                G1R.OldCampAccess = 1;
                DC(int64(0x59bd819cc590e46d), EConversationDebugInfo::Done);
                DC(int64(0x59bd819cc590e465), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x59bd819cc590e465), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Bloodwyn_107883 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835bf3);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_125121_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bloodwyn_107883);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835bf4), EConversationDebugInfo::Executing);
                // I don't have that much.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125121_94"));
                DC(int64(0x4f4013217835bf4), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c3e), EConversationDebugInfo::Executing);
                
                // What a shame. Then come back when you do.
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125222"));
                DC(int64(0x4f4013217835c3e), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c4c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4f4013217835c4c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Bloodwyn_107909 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835c15);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_125136_1037");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bloodwyn_107909);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835c16), EConversationDebugInfo::Executing);
                // I'm not paying you.
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125136_1037"));
                DC(int64(0x4f4013217835c16), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c3f), EConversationDebugInfo::Executing);
                
                // Then you ain't gettin' it. 
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125238"));
                DC(int64(0x4f4013217835c3f), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c53), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4f4013217835c53), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBloodwyn107820 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835bdc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBloodwyn106913);
            default Rules.HideIfKnows(UChoiceBloodwyn107820);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OC_NorthGate", 300.0f, int64(0x4f4013217835bdc));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x59bd819cc590e435), G1R.OldCampAccess == 0);
                }
                
                return G1R.OldCampAccess == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835bd5), EConversationDebugInfo::Executing);
                // Are you deaf? Pay up or piss off!
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125043_2316"));
                DC(int64(0x4f4013217835bd5), EConversationDebugInfo::Done);
                DC(int64(0x59bd819cc590e437), EConversationDebugInfo::Executing);
                Bloodwyn.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x59bd819cc590e437), EConversationDebugInfo::Done);
                DC(int64(0x59bd819cc590e43e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x59bd819cc590e43e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBloodwyn108210 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x4f4013217835c6a);
            default Caption = LocText("TEXT_WIP_MRZXSLD_20241031_125306");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x59bd819cc590e446), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_112524")));
                    DB(int64(0x59bd819cc590e456), G1R.OldCampAccess == 0);
                    DB(int64(0x59bd819cc590e44e), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_112549")));
                    DB(int64(0x59bd819cc590e455), G1R.OldCampAccess == 0);
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_112524")) && G1R.OldCampAccess == 0)
                    return true;
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZWKHAXF_20240527_112549")) && G1R.OldCampAccess == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f4013217835c62), EConversationDebugInfo::Executing);
                // How much did you want again?
                Hero.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125306"));
                DC(int64(0x4f4013217835c62), EConversationDebugInfo::Done);
                DC(int64(0x4f4013217835c63), EConversationDebugInfo::Executing);
                
                // A hundred nuggets.
                Bloodwyn.AI.Say(LocText("TEXT_WIP_MRZXSLD_20241031_125306_2332"));
                DC(int64(0x4f4013217835c63), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBloodwynDoch : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e85a7);
            default Caption = LocText("INFO_BLOODWYN_DOCH_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa5b93196174e85a8), G1R.Bloodwyn_ProtectionPaid == 0);
                    DB(int64(0x74f9b73e1b670e4f), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (G1R.Bloodwyn_ProtectionPaid != 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e85a9), EConversationDebugInfo::Executing);
                
                // I changed my mind about your offer. I am going to give ...
                Hero.AI.Say(LocText("INFO_BLOODWYN_DOCH_15_00"));
                DC(int64(0xa5b93196174e85a9), EConversationDebugInfo::Done);
                DB(int64(0xa5b93196174e85ab), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xa5b93196174e85ac), EConversationDebugInfo::Executing);
                    // Look at that! You got some brains in you after all.
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_DOCH_08_01"));
                    DC(int64(0xa5b93196174e85ac), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85ad), EConversationDebugInfo::Executing);
                    // From today on, you'll be a good lad and hand over your ...
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_DOCH_08_02"));
                    DC(int64(0xa5b93196174e85ad), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Pay);
                    DC(int64(0x74f9b73e1b66ef81), EConversationDebugInfo::Executing);
                    G1R.Bloodwyn_ProtectionPaid = 1;
                    DC(int64(0x74f9b73e1b66ef81), EConversationDebugInfo::Done);
                    DC(int64(0x74f9b73e1b66ef83), EConversationDebugInfo::Executing);
                    G1R.Herek_ProtectionBully = 0;
                    DC(int64(0x74f9b73e1b66ef83), EConversationDebugInfo::Done);
                    DC(int64(0x74f9b73e1b66ef85), EConversationDebugInfo::Executing);
                    G1R.Grim_ProtectionBully = 0;
                    DC(int64(0x74f9b73e1b66ef85), EConversationDebugInfo::Done);
                    DC(int64(0x74f9b73e1b66ef87), EConversationDebugInfo::Executing);
                    Hero.GivePremiumProtectionByBloodwyn();
                    DC(int64(0x74f9b73e1b66ef87), EConversationDebugInfo::Done);
                    DC(int64(0x97c0403bd629211f), EConversationDebugInfo::Executing);
                    G1R.Bloodwyn_PayDay = FInGameTime::Now();
                    DC(int64(0x97c0403bd629211f), EConversationDebugInfo::Done);
                    DC(int64(0xe8c9f81796adde67), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Bloodwyn, UItMi_Orenugget, 10);
                    DC(int64(0xe8c9f81796adde67), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_doch_exit_1");
                }
                else
                {
                    DC(int64(0xa5b93196174e85b2), EConversationDebugInfo::Executing);
                    // Then come back when you got 'em.
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_DOCH_NOORE_08_00"));
                    DC(int64(0xa5b93196174e85b2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_doch_exit_2");
                    DC(int64(0xa5b93196174e85b3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa5b93196174e85b3), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBloodwynExitSchutzgeld : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e854e);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e854f), EConversationDebugInfo::Executing);
                // See you around.
                Hero.AI.Say(LocText("INFO_BLOODWYN_EXIT_SCHUTZGELD_15_00"));
                DC(int64(0xa5b93196174e854f), EConversationDebugInfo::Done);
                DB(int64(0xa5b93196174e8551), G1R.Bloodwyn_ProtectionPaid == 0);
                
                if (G1R.Bloodwyn_ProtectionPaid == 0)
                {
                    DC(int64(0xa5b93196174e8552), EConversationDebugInfo::Executing);
                    // Watch your back, lad. 
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_EXIT_SCHUTZGELD_08_01"));
                    DC(int64(0xa5b93196174e8552), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa5b93196174e8553), EConversationDebugInfo::Executing);
                    // See you around! And don't worry, we've got your back.
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_EXIT_SCHUTZGELD_08_02"));
                    DC(int64(0xa5b93196174e8553), EConversationDebugInfo::Done);
                }
                DC(int64(0xa5b93196174e8554), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa5b93196174e8554), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBloodwynHello : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e8555);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBloodwynHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa5b93196174e8556), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8557), EConversationDebugInfo::Executing);
                // Oy! You there!
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_00"));
                DC(int64(0xa5b93196174e8557), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8558), EConversationDebugInfo::Executing);
                
                // Who? Me?
                Hero.AI.Say(LocText("INFO_BLOODWYN_HELLO_15_01"));
                DC(int64(0xa5b93196174e8558), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8559), EConversationDebugInfo::Executing);
                
                // Yeah, you. You're new here, ain't you? I want to warn ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_02"));
                DC(int64(0xa5b93196174e8559), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e855a), EConversationDebugInfo::Executing);
                // There's some real bastards in this camp who think they ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_03"));
                DC(int64(0xa5b93196174e855a), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e855b), EConversationDebugInfo::Executing);
                // Lucky for you, there's folks like me.
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_04"));
                DC(int64(0xa5b93196174e855b), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e855c), EConversationDebugInfo::Executing);
                // Gomez wants law and order in his camp, and that's what ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_05"));
                DC(int64(0xa5b93196174e855c), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e855d), EConversationDebugInfo::Executing);
                // Let's call it a ... gentlemen's agreement: you watch our ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_08_06"));
                DC(int64(0xa5b93196174e855d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Introduction);
                DC(int64(0x97c0403bd6292125), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x97c0403bd6292125), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBloodwynHelloHowmuch,
                    UChoiceBloodwynHelloForgetit,
                    UChoiceBloodwynHelloSolldrohungsein
                );
            }
        }
        
        
        class UChoiceBloodwynHelloHowmuch : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be870);
            default Caption = LocText("INFO_BLOODWYN_HELLO_HOWMUCH_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBloodwynHelloHowmuch);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8560), EConversationDebugInfo::Executing);
                // Hmm, why not. How much ore were you thinking?
                Hero.AI.Say(LocText("INFO_BLOODWYN_HELLO_HOWMUCH_15_01"));
                DC(int64(0xa5b93196174e8560), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8561), EConversationDebugInfo::Executing);
                
                // Not much. Ten nuggets should do the trick.
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_HOWMUCH_08_02"));
                DC(int64(0xa5b93196174e8561), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceBloodwynHelloNotnow,
                    UChoiceBloodwynHelloOktakeit
                );
            }
        }
        
        
        class UChoiceBloodwynHelloForgetit : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be899);
            default Caption = LocText("INFO_BLOODWYN_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBloodwynHelloForgetit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8581), EConversationDebugInfo::Executing);
                // Are you asking for protection money? I can take care of ...
                Hero.AI.Say(LocText("INFO_BLOODWYN_FORGETIT_15_00"));
                DC(int64(0xa5b93196174e8581), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8582), EConversationDebugInfo::Executing);
                
                // If you say so, green-blood. Wait and see where that'll ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_FORGETIT_08_01"));
                DC(int64(0xa5b93196174e8582), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Ignore);
                DC(int64(0x74f9b73e1b66efd2), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_ProtectionPaid = 0;
                DC(int64(0x74f9b73e1b66efd2), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efd4), EConversationDebugInfo::Executing);
                G1R.Herek_ProtectionBully = 1;
                DC(int64(0x74f9b73e1b66efd4), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efd6), EConversationDebugInfo::Executing);
                G1R.Grim_ProtectionBully = 1;
                DC(int64(0x74f9b73e1b66efd6), EConversationDebugInfo::Done);
                DC(int64(0x5e925542e2e7cd3), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x5e925542e2e7cd3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBloodwynHelloSolldrohungsein : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be8a0);
            default Caption = LocText("INFO_BLOODWYN_SOLLDROHUNGSEIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceBloodwynHelloSolldrohungsein);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8587), EConversationDebugInfo::Executing);
                // Is that supposed to be a threat?
                Hero.AI.Say(LocText("INFO_BLOODWYN_SOLLDROHUNGSEIN_15_00"));
                DC(int64(0xa5b93196174e8587), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8588), EConversationDebugInfo::Executing);
                
                // Not at all. I told you, it's a gentlemen's agreement.
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_SOLLDROHUNGSEIN_08_01"));
                DC(int64(0xa5b93196174e8588), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8589), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa5b93196174e8589), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBloodwynHelloNotnow : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be872);
            default Caption = LocText("INFO_BLOODWYN_HELLO_NOTNOW_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8564), EConversationDebugInfo::Executing);
                // Eh, I don't have ten nuggets on me.
                Hero.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_15_00"));
                DC(int64(0xa5b93196174e8564), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8565), EConversationDebugInfo::Executing);
                
                // That so? Then I'll just make do with whatever you've got ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_08_01"));
                DC(int64(0xa5b93196174e8565), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efb8), EConversationDebugInfo::Executing);
                Bloodwyn.AI.GotoCharacter(Hero, 200.0f);
                DC(int64(0x74f9b73e1b66efb8), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8567), EConversationDebugInfo::Executing);
                // Lemme see ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_08_02"));
                DC(int64(0xa5b93196174e8567), EConversationDebugInfo::Done);
                DB(int64(0xa5b93196174e8569), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0))
                {
                    DB(int64(0xa5b93196174e856b), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                    {
                        DC(int64(0xa5b93196174e856c), EConversationDebugInfo::Executing);
                        // Well, what have we here? Can't count to ten, can you?
                        Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_TENOREMORE_08_00"));
                        DC(int64(0xa5b93196174e856c), EConversationDebugInfo::Done);
                        DC(int64(0xa5b93196174e856d), EConversationDebugInfo::Executing);
                        // You know what, I'll just take the whole lot. In return, ...
                        Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_TENOREMORE_08_01"));
                        DC(int64(0xa5b93196174e856d), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Pay);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                        Bloodwyn.AddItemToInventory(UItMi_Orenugget, 0);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                        DC(int64(0xe3597da01d663860), EConversationDebugInfo::Executing);
                        Bloodwyn.AI.GiveItemTo(Hero, UItMi_Orenugget, 0);
                        DC(int64(0xe3597da01d663860), EConversationDebugInfo::Done);
                        DC(int64(0xe3597da01d66387a), EConversationDebugInfo::Executing);
                        Hero.RemoveAllItemsFromInventory(UItMi_Orenugget);
                        DC(int64(0xe3597da01d66387a), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa5b93196174e856e), EConversationDebugInfo::Executing);
                        // Ah, well, a small donation will do the trick for today. ...
                        Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_LESSTHANTEN_08_00"));
                        DC(int64(0xa5b93196174e856e), EConversationDebugInfo::Done);
                        DC(int64(0xa5b93196174e856f), EConversationDebugInfo::Executing);
                        // Cheers for the ore, lad. We've got your back.
                        Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_LESSTHANTEN_08_01"));
                        DC(int64(0xa5b93196174e856f), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Pay);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                        Bloodwyn.AddItemToInventory(UItMi_Orenugget, 0);
                        DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                        DC(int64(0x1a5f41d89bd067a8), EConversationDebugInfo::Executing);
                        Bloodwyn.AI.GiveItemTo(Hero, UItMi_Orenugget, 0);
                        DC(int64(0x1a5f41d89bd067a8), EConversationDebugInfo::Done);
                        DC(int64(0x1a5f41d89bd067b8), EConversationDebugInfo::Executing);
                        Hero.RemoveItemFromInventory(UItMi_Orenugget, 10, 0);
                        DC(int64(0x1a5f41d89bd067b8), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xa5b93196174e8570), EConversationDebugInfo::Executing);
                    // Well, I'll be damned. You really ARE skint, ain't you? ...
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_NOTNOW_NOORE_08_00"));
                    DC(int64(0xa5b93196174e8570), EConversationDebugInfo::Done);
                }
                DC(int64(0x74f9b73e1b66efa2), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_ProtectionPaid = 1;
                DC(int64(0x74f9b73e1b66efa2), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efa4), EConversationDebugInfo::Executing);
                G1R.Herek_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66efa4), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efa6), EConversationDebugInfo::Executing);
                G1R.Grim_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66efa6), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efa8), EConversationDebugInfo::Executing);
                Hero.GivePremiumProtectionByBloodwyn();
                DC(int64(0x74f9b73e1b66efa8), EConversationDebugInfo::Done);
                DC(int64(0x5e925542e2e7cd7), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x5e925542e2e7cd7), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b670e4b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x74f9b73e1b670e4b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBloodwynHelloOktakeit : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be88a);
            default Caption = LocText("INFO_BLOODWYN_HELLO_OKTAKEIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xad54905205491a9e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8578), EConversationDebugInfo::Executing);
                // Here. I can use some friends.
                Hero.AI.Say(LocText("INFO_BLOODWYN_HELLO_OKTAKEIT_15_00"));
                DC(int64(0xa5b93196174e8578), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8579), EConversationDebugInfo::Executing);
                
                // Smart lad. We're gonna watch your back from here on out.
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_OKTAKEIT_08_01"));
                DC(int64(0xa5b93196174e8579), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e857a), EConversationDebugInfo::Executing);
                // But don't get any funny ideas, will you? This ain't a ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_HELLO_OKTAKEIT_08_02"));
                DC(int64(0xa5b93196174e857a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Pay);
                DC(int64(0x74f9b73e1b66efbe), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Bloodwyn, UItMi_Orenugget, 10);
                DC(int64(0x74f9b73e1b66efbe), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efc0), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_ProtectionPaid = 1;
                DC(int64(0x74f9b73e1b66efc0), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efc2), EConversationDebugInfo::Executing);
                G1R.Herek_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66efc2), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efc4), EConversationDebugInfo::Executing);
                G1R.Grim_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66efc4), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efc6), EConversationDebugInfo::Executing);
                Hero.GivePremiumProtectionByBloodwyn();
                DC(int64(0x74f9b73e1b66efc6), EConversationDebugInfo::Done);
                DC(int64(0x5e925542e2e7cd5), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x5e925542e2e7cd5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBloodwynPayday : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e858a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_08_01"), int64(0xa5b93196174e858a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa5b93196174e858b), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xa5b93196174e858c), G1R.Bloodwyn_PayDay.IsValid() && G1R.Bloodwyn_PayDay.IsAtLeastXDaysAgo(1));
                    DB(int64(0xa5b93196174e858d), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Bloodwyn_PayDay.IsValid() && !G1R.Bloodwyn_PayDay.IsAtLeastXDaysAgo(1))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 10, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xa5b93196174e858f), G1R.Bloodwyn_ProtectionPaid != 0);
                
                if (G1R.Bloodwyn_ProtectionPaid != 0)
                {
                    DC(int64(0xa5b93196174e8590), EConversationDebugInfo::Executing);
                    // My friend, good to see you!
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_08_00"));
                    DC(int64(0xa5b93196174e8590), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e8591), EConversationDebugInfo::Executing);
                    // Remember our gentlemen's agreement? Your ten nuggets are ...
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_08_01"));
                    DC(int64(0xa5b93196174e8591), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa5b93196174e85a3), EConversationDebugInfo::Executing);
                    // Oy, you there!
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_DEN_08_00"));
                    DC(int64(0xa5b93196174e85a3), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85a4), EConversationDebugInfo::Executing);
                    
                    // What now?
                    Hero.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_DEN_15_01"));
                    DC(int64(0xa5b93196174e85a4), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85a5), EConversationDebugInfo::Executing);
                    
                    // I decided to give you another shot to buy into our ...
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_DEN_08_02"));
                    DC(int64(0xa5b93196174e85a5), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85a6), EConversationDebugInfo::Executing);
                    // Just ten nuggets and you're in. What d'you say?
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_DEN_08_03"));
                    DC(int64(0xa5b93196174e85a6), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UChoiceBloodwynPaydayPayagain,
                    UChoiceBloodwynPaydayPaynomore,
                    UTopic_Bloodwyn_608601
                );
                DC(int64(0x74f9b73e1b66eff9), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_ProtectionPaid = 0;
                DC(int64(0x74f9b73e1b66eff9), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66effb), EConversationDebugInfo::Executing);
                G1R.Herek_ProtectionBully = 1;
                DC(int64(0x74f9b73e1b66effb), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66effd), EConversationDebugInfo::Executing);
                G1R.Grim_ProtectionBully = 1;
                DC(int64(0x74f9b73e1b66effd), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efff), EConversationDebugInfo::Executing);
                Bloodwyn.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x74f9b73e1b66efff), EConversationDebugInfo::Done);
                DC(int64(0x5e925542e2e7cd1), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x5e925542e2e7cd1), EConversationDebugInfo::Done);
                DC(int64(0xab74043d3040461c), EConversationDebugInfo::Executing);
                Hero.RemovePremiumProtectionByBloodwyn();
                DC(int64(0xab74043d3040461c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBloodwynPaydayPayagain : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be8b1);
            default Caption = LocText("INFO_BLOODWYN_PAYDAY_PAYAGAIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74f9b73e1b670e4a), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e8594), EConversationDebugInfo::Executing);
                // Here you go. Always good to have a friend to rely on.
                Hero.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYAGAIN_15_00"));
                DC(int64(0xa5b93196174e8594), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e8595), EConversationDebugInfo::Executing);
                
                // Well said, mate. Well said. 
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYAGAIN_08_01"));
                DC(int64(0xa5b93196174e8595), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efed), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_ProtectionPaid = 1;
                DC(int64(0x74f9b73e1b66efed), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66efef), EConversationDebugInfo::Executing);
                G1R.Herek_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66efef), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66eff1), EConversationDebugInfo::Executing);
                G1R.Grim_ProtectionBully = 0;
                DC(int64(0x74f9b73e1b66eff1), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66eff3), EConversationDebugInfo::Executing);
                Hero.GivePremiumProtectionByBloodwyn();
                DC(int64(0x74f9b73e1b66eff3), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b670e48), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Bloodwyn, UItMi_Orenugget, 10);
                DC(int64(0x74f9b73e1b670e48), EConversationDebugInfo::Done);
                DC(int64(0x97c0403bd629212f), EConversationDebugInfo::Executing);
                G1R.Bloodwyn_PayDay = FInGameTime::Now();
                DC(int64(0x97c0403bd629212f), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b670e4e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x74f9b73e1b670e4e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBloodwynPaydayPaynomore : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xe8603e87342be8b9);
            default Caption = LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5cca5287241c8a9), G1R.Bloodwyn_ProtectionPaid != 0);
                }
                
                return G1R.Bloodwyn_ProtectionPaid != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e859b), EConversationDebugInfo::Executing);
                // I'm done paying. I gave you enough.
                Hero.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_15_00"));
                DC(int64(0xa5b93196174e859b), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e859c), EConversationDebugInfo::Executing);
                
                // Oh, really? Well, that's a shame. Guess that means the ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_08_01"));
                DC(int64(0xa5b93196174e859c), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e859d), EConversationDebugInfo::Executing);
                
                // I can take care of myself.
                Hero.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_15_02"));
                DC(int64(0xa5b93196174e859d), EConversationDebugInfo::Done);
                DC(int64(0xa5b93196174e859e), EConversationDebugInfo::Executing);
                
                // Of course you can. 
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_08_03"));
                DC(int64(0xa5b93196174e859e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Ignore);
            }
        }
        
        
        class UTopic_Bloodwyn_608601 : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0x5cca5287241c890);
            default Caption = LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_15_02");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5cca5287241c891), EConversationDebugInfo::Executing);
                // I can take care of myself.
                Hero.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_15_02"));
                DC(int64(0x5cca5287241c891), EConversationDebugInfo::Done);
                DC(int64(0x5cca5287241c89a), EConversationDebugInfo::Executing);
                
                // Of course you can. 
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYDAY_PAYNOMORE_08_03"));
                DC(int64(0x5cca5287241c89a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_BLOODWYN, Document::UDocumentSegment_Glossary_OCR_GRD_BLOODWYN_Ignore);
            }
        }
        
        
        class UChoiceBloodwynPayforjesse : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e85b4);
            default Caption = LocText("INFO_BLOODWYN_PAYFORJESSE_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa5b93196174e85b5), Quest::JESSE_PAYFORME != nullptr && Quest::JESSE_PAYFORME.IsRunning());
                }
                
                return Quest::JESSE_PAYFORME != nullptr && Quest::JESSE_PAYFORME.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e85b6), EConversationDebugInfo::Executing);
                // Jesse sent me. I want to pay his ten nuggets.
                Hero.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_15_00"));
                DC(int64(0xa5b93196174e85b6), EConversationDebugInfo::Done);
                DB(int64(0xa5b93196174e85b8), G1R.Bloodwyn_ProtectionPaid == 0);
                
                if (G1R.Bloodwyn_ProtectionPaid == 0)
                {
                    DC(int64(0xa5b93196174e85b9), EConversationDebugInfo::Executing);
                    // How about you settle YOUR dues first, mate?
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_08_01"));
                    DC(int64(0xa5b93196174e85b9), EConversationDebugInfo::Done);
                }
                DC(int64(0xa5b93196174e85ba), EConversationDebugInfo::Executing);
                // Nevermind Jesse. He's a weakling and he won't last much ...
                Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_08_02"));
                DC(int64(0xa5b93196174e85ba), EConversationDebugInfo::Done);
                DB(int64(0xa5b93196174e85bc), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xa5b93196174e85bd), EConversationDebugInfo::Executing);
                    // No, I will pay for him. Take the nuggets and leave him ...
                    Hero.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_15_03"));
                    DC(int64(0xa5b93196174e85bd), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85be), EConversationDebugInfo::Executing);
                    
                    // Suit yourself, mate. Suit yourself.
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_08_04"));
                    DC(int64(0xa5b93196174e85be), EConversationDebugInfo::Done);
                    DC(int64(0x74f9b73e1b66f012), EConversationDebugInfo::Executing);
                    Quest::JESSE_PAYFORME.SucceedQuest();
                    DC(int64(0x74f9b73e1b66f012), EConversationDebugInfo::Done);
                    DC(int64(0x74f9b73e1b66f014), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Bloodwyn, UItMi_Orenugget, 10);
                    DC(int64(0x74f9b73e1b66f014), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_payforjesse_exit_1");
                }
                else
                {
                    DC(int64(0xa5b93196174e85c0), EConversationDebugInfo::Executing);
                    // Now that you say it, I don't even have that much ore ...
                    Hero.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_15_05"));
                    DC(int64(0xa5b93196174e85c0), EConversationDebugInfo::Done);
                    DC(int64(0xa5b93196174e85c1), EConversationDebugInfo::Executing);
                    
                    // Well that's gotta be a sign. Think about it - that fool ...
                    Bloodwyn.AI.Say(LocText("INFO_BLOODWYN_PAYFORJESSE_08_06"));
                    DC(int64(0xa5b93196174e85c1), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bloodwyn_payforjesse_exit_2");
                    DC(int64(0x6da0b63c604a6f6d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6da0b63c604a6f6d), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGrd233BloodwynWelcome : UTopic_Hero__OCR_GRD_BLOODWYN_233
        {
            default DebugId = int64(0xa5b93196174e85c2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGrd233BloodwynWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa5b93196174e85c3), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa5b93196174e85c4), EConversationDebugInfo::Executing);
                // So, you're one of us now! Good job - the guard needs ...
                Bloodwyn.AI.Say(LocText("GRD_233_BLOODWYN_WELCOME_INFO_08_01"));
                DC(int64(0xa5b93196174e85c4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */