#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_UMOSH_2406 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_UMOSH_2406";
        }
        
        
        class UTopic_Hero__OW_OWR_UMOSH_2406 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_UMOSH_2406";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUmosh() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
        }
        
        
        class UChoiceUmosh101727 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0x55528d307b6f66c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x55528d307b6f66b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x55528d307b6f66b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmosh101743 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0x55528d307b6f670);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUmosh101743);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_EYMFHKF_20240711_163105"), int64(0x55528d307b6f670));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x118ac50a41c1e5b3), Umosh != nullptr && !Umosh.IsRefusingToTalkWith(Hero));
                    DB(int64(0x4aaff086bb0cfd18), Umosh != nullptr && Umosh.HasAssignedDailyRoutine(UDailyRoutine_OW_OWR_Umosh_2406_Burial));
                }
                
                if (Umosh != nullptr && Umosh.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Umosh != nullptr && !Umosh.HasAssignedDailyRoutine(UDailyRoutine_OW_OWR_Umosh_2406_Burial))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_UMOSH, Document::UDocumentSegment_Glossary_OW_OWR_UMOSH_Introduction);
                DC(int64(0x9afb83adba270541), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS.StartQuest();
                DC(int64(0x9afb83adba270541), EConversationDebugInfo::Done);
                DB(int64(0x118ac50a41c1e5cb), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x55528d307b6f67c), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0x55528d307b6f67e), EConversationDebugInfo::Executing);
                    // Turn around, morra. This place is forbidden - especially ...
                    Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_135802_1924"));
                    DC(int64(0x55528d307b6f67e), EConversationDebugInfo::Done);
                    DC(int64(0x118ac50a41c1e5cc), EConversationDebugInfo::Executing);
                    
                    // Why "especially for me?"
                    Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_164441"));
                    DC(int64(0x118ac50a41c1e5cc), EConversationDebugInfo::Done);
                    DC(int64(0x118ac50a41c1e5cd), EConversationDebugInfo::Executing);
                    
                    // Because it is where Warrior Grazrak waits for his last ...
                    Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_164441_491"));
                    DC(int64(0x118ac50a41c1e5cd), EConversationDebugInfo::Done);
                    DC(int64(0x315a3a906817976), EConversationDebugInfo::Executing);
                    // The one you killed proving you were worthy of the ...
                    Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143611"));
                    DC(int64(0x315a3a906817976), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_UMOSH, Document::UDocumentSegment_Glossary_OW_OWR_UMOSH_AccessDenied);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_AccessDenied);
                    
                    Other.Remember(n"choice_umosh_101743_exit_1");
                }
                else
                {
                    DC(int64(0x55528d307b6f682), EConversationDebugInfo::Executing);
                    // Turn around, morra. This place is forbidden - especially ...
                    Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_135802_1924"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x55528d307b6f682), EConversationDebugInfo::Done);
                    DC(int64(0x8eb2c55de5547e26), EConversationDebugInfo::Executing);
                    Umosh.RefuseToTalk(10);
                    DC(int64(0x8eb2c55de5547e26), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_umosh_101743_exit_2");
                    DC(int64(0x8eb2c55de5547e27), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x8eb2c55de5547e27), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceUmosh103091 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0x118ac50a41c1e5b9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUmosh103091);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8eb2c55de5547e23), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OTOWN_BURIAL", 200.0f));
                    DB(int64(0x8eb2c55de5547e24), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_EYMFHKF_20240711_163105")));
                    DB(int64(0xf9c3048b07bb3846), Grazkrak != nullptr && !Grazkrak.IsEveryoneOfThisKindDead());
                    DB(int64(0x99367be0ddad50d0), Umosh != nullptr && Umosh.HasAssignedDailyRoutine(UDailyRoutine_OW_OWR_Umosh_2406_Burial));
                }
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OTOWN_BURIAL", 200.0f) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_EYMFHKF_20240711_163105")))
                    return true;
                
                if (Grazkrak != nullptr && !Grazkrak.IsEveryoneOfThisKindDead() && Umosh != nullptr && Umosh.HasAssignedDailyRoutine(UDailyRoutine_OW_OWR_Umosh_2406_Burial))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x118ac50a41c1e5d3), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x118ac50a41c1e5bc), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x118ac50a41c1e5be), EConversationDebugInfo::Executing);
                    // You asked for it, morra. Die!
                    Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_164332_443"));
                    DC(int64(0x118ac50a41c1e5be), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x118ac50a41c1e5c0), EConversationDebugInfo::Executing);
                    // You asked for it, morra. Die!
                    Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_164332_443"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x118ac50a41c1e5c0), EConversationDebugInfo::Done);
                }
                DC(int64(0x118ac50a41c1e5c4), EConversationDebugInfo::Executing);
                Umosh.AI.StartAttackingImmediately(Hero);
                DC(int64(0x118ac50a41c1e5c4), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5c7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x118ac50a41c1e5c7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmosh111400 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0x315a3a906817980);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceUmosh111400);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x48495da8d676298e), G1R.UrNazkrog_Spores != 0);
                    DB(int64(0x4fa0d34025f8f8bf), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (G1R.UrNazkrog_Spores == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x315a3a90681797f), EConversationDebugInfo::Executing);
                // So you did it. I must say, I did not see this coming. ...
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143905_443"));
                DC(int64(0x315a3a90681797f), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817989), EConversationDebugInfo::Executing);
                // Grazkrak was a great warrior. Now go - do not keep ...
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144352"));
                DC(int64(0x315a3a906817989), EConversationDebugInfo::Done);
                DC(int64(0x48495da8d676298f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x48495da8d676298f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmosh189634 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0xd1f3e866dd874f0a);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_161427_3286");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_umosh_101743_exit_1");
            default Rules.HideIfKnows(UChoiceUmosh189634);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7a4b0b7937cd6f8f), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning());
                }
                
                return Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e596), EConversationDebugInfo::Executing);
                // I'm here to "shape life from death."
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_161427_3286"));
                DC(int64(0x118ac50a41c1e596), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5a4), EConversationDebugInfo::Executing);
                
                // ... What do you mean by that? 
                Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_162914"));
                DC(int64(0x118ac50a41c1e5a4), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817979), EConversationDebugInfo::Executing);
                
                // Um ... I'm not sure. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143710"));
                DC(int64(0x315a3a906817979), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681797a), EConversationDebugInfo::Executing);
                
                // (scoffs) It is all fun and mockery to you, isn't it? 
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143717"));
                DC(int64(0x315a3a90681797a), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681797b), EConversationDebugInfo::Executing);
                // Go away. Leave Grazkrak to his final rest. 
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143740"));
                DC(int64(0x315a3a90681797b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUmosh189637 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0xd1f3e866dd874f0c);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_162600_3984");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_umosh_101743_exit_1");
            default Rules.HideIfKnows(UChoiceUmosh189637);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x118ac50a41c1e5a2), Hero != nullptr && Hero.HasItem(UItFo_Plants_OrcSpore, 1, 0));
                    DB(int64(0xc413ac721f088bd8), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItFo_Plants_OrcSpore, 1, 0))
                    return false;
                
                if (Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && !Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e59e), EConversationDebugInfo::Executing);
                
                // I'm here to turn Grazkrak's dead flesh into new life, as ...
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_162600_3984"));
                DC(int64(0x118ac50a41c1e59e), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817982), EConversationDebugInfo::Executing);
                
                // ... Go on. 
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143948"));
                DC(int64(0x315a3a906817982), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5a3), EConversationDebugInfo::Executing);
                
                // When one warrior crushes another in an honorable duel, ...
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_162729"));
                DC(int64(0x118ac50a41c1e5a3), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817983), EConversationDebugInfo::Executing);
                // This brings the Tsar, the power of life, back into the ...
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144047"));
                DC(int64(0x315a3a906817983), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5ac), EConversationDebugInfo::Executing);
                
                // Hm. And you have the seeds? 
                Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_163105"));
                DC(int64(0x118ac50a41c1e5ac), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817984), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144203"));
                DC(int64(0x315a3a906817984), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817985), EConversationDebugInfo::Executing);
                
                // Interesting. I never thought I would see a morra honor ...
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144205"));
                DC(int64(0x315a3a906817985), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817986), EConversationDebugInfo::Executing);
                
                // More or less. She saw me do it in a vision. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144234"));
                DC(int64(0x315a3a906817986), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817987), EConversationDebugInfo::Executing);
                
                // ... Huh. Well, then, I have no right to deny Grazkrak ...
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144245"));
                DC(int64(0x315a3a906817987), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817988), EConversationDebugInfo::Executing);
                
                // I will. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_144323"));
                DC(int64(0x315a3a906817988), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_THECHAMPIONBURIAL, Document::UDocumentSegment_CH5_THECHAMPIONBURIAL_AccessGranted);
                DC(int64(0x9afb83adba27054e), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS.SucceedQuest();
                DC(int64(0x9afb83adba27054e), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5ad), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x118ac50a41c1e5ad), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmosh189640 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0xd1f3e866dd874f0e);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_161427_2386");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_umosh_101743_exit_1");
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QDZOJWI_20240722_144245"), int64(0xd1f3e866dd874f0e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc413ac721f088bd9), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning());
                }
                
                return Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e59a), EConversationDebugInfo::Executing);
                // I want to pay my respects to Warrior Grazkrak.
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_161427_2386"));
                DC(int64(0x118ac50a41c1e59a), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5ae), EConversationDebugInfo::Executing);
                
                // Even if you were, this is no reason to disturb his final ...
                Umosh.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_163405"));
                DC(int64(0x118ac50a41c1e5ae), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681797c), EConversationDebugInfo::Executing);
                // I will say it again: leave. 
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143827"));
                DC(int64(0x315a3a90681797c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_UMOSH, Document::UDocumentSegment_Glossary_OW_OWR_UMOSH_AccessDenied);
                DC(int64(0x118ac50a41c1e5b5), EConversationDebugInfo::Executing);
                Umosh.RefuseToTalk(10);
                DC(int64(0x118ac50a41c1e5b5), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5b6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x118ac50a41c1e5b6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmosh189643 : UTopic_Hero__OW_OWR_UMOSH_2406
        {
            default DebugId = int64(0xd1f3e866dd874f10);
            default Caption = LocText("TEXT_WIP_EYMFHKF_20240711_162924_1609");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_umosh_101743_exit_1");
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QDZOJWI_20240722_144245"), int64(0xd1f3e866dd874f10));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x118ac50a41c1e5a6), EConversationDebugInfo::Executing);
                // All right. I'm going. 
                Hero.AI.Say(LocText("TEXT_WIP_EYMFHKF_20240711_162924_1609"));
                DC(int64(0x118ac50a41c1e5a6), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681797d), EConversationDebugInfo::Executing);
                
                // Good. 
                Umosh.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_143847"));
                DC(int64(0x315a3a90681797d), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5b5), EConversationDebugInfo::Executing);
                Umosh.RefuseToTalk(10);
                DC(int64(0x118ac50a41c1e5b5), EConversationDebugInfo::Done);
                DC(int64(0x118ac50a41c1e5b6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x118ac50a41c1e5b6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */