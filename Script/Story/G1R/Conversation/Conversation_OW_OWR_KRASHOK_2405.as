#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_KRASHOK_2405 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_KRASHOK_2405";
        }
        
        
        class UTopic_Hero__OW_OWR_KRASHOK_2405 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_KRASHOK_2405";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKrashok() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceKrashok100503 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0xe33cc85f6e6cb2ad);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe33cc85f6e6cb2ac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe33cc85f6e6cb2ac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKrashok100519 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0xe33cc85f6e6cb2b1);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_114740_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKrashok100519);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe33cc85f6e6cb2b5), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe33cc85f6e6cb2af), EConversationDebugInfo::Executing);
                // Who lives in there?
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_114740_41"));
                DC(int64(0xe33cc85f6e6cb2af), EConversationDebugInfo::Done);
                DC(int64(0xa77480f9b999ea7f), EConversationDebugInfo::Executing);
                
                // Ur-Nazkrog, the Highest Shaman. She is the reason we let ...
                Krashok.AI.Say(LocText("TEXT_WIP_BWGQKWK_20240710_151409"));
                DC(int64(0xa77480f9b999ea7f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKrashok100616 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0xb4d4140f93841635);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_120709");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKrashok100616);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d4140f93841638), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d4140f93841633), EConversationDebugInfo::Executing);
                
                // Go... tos?
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_120709"));
                DC(int64(0xb4d4140f93841633), EConversationDebugInfo::Done);
                DC(int64(0xb4d4140f93841634), EConversationDebugInfo::Executing);
                
                // Ur-Nazkrog ... shaman.
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_120709_41"));
                DC(int64(0xb4d4140f93841634), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_KRASHOK, Document::UDocumentSegment_Glossary_OW_OWR_KRASHOK_Access);
            }
        }
        
        
        class UChoiceKrashok100800 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e27357);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_132126");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKrashok100519);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceKrashok100616);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QDZOJWI_20240722_140714"), int64(0x2efd7a5b99e27357));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e27355), EConversationDebugInfo::Executing);
                // Why can't I enter? I have the Ulu-Mulu. 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132126"));
                DC(int64(0x2efd7a5b99e27355), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27356), EConversationDebugInfo::Executing);
                
                // That doesn't mean you can go wherever you please. 
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132126_3286"));
                DC(int64(0x2efd7a5b99e27356), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681796a), EConversationDebugInfo::Executing);
                // I will not have you disturb Ur-Nazkrog's meditation with ...
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140120"));
                DC(int64(0x315a3a90681796a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Krashok_100582,
                    UTopic_Krashok_100602,
                    UTopic_Krashok_100685,
                    UTopic_Krashok_100719,
                    UTopic_Krashok_100758
                );
            }
        }
        
        
        class UTopic_Krashok_100582 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e27339);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_131825_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Krashok_100582);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e2733a), EConversationDebugInfo::Executing);
                // I just want to talk to her. 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_131825_41"));
                DC(int64(0x2efd7a5b99e2733a), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27341), EConversationDebugInfo::Executing);
                
                // I told you - she is busy. 
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_131840"));
                DC(int64(0x2efd7a5b99e27341), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e2733c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2efd7a5b99e2733c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Krashok_100602 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e2733d);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_131825_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Krashok_100602);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e2733e), EConversationDebugInfo::Executing);
                // I could just kill you ...
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_131825_2238"));
                DC(int64(0x2efd7a5b99e2733e), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27344), EConversationDebugInfo::Executing);
                
                // Ahh, so you finally show what you are here for. This was ...
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_131955"));
                DC(int64(0x2efd7a5b99e27344), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681796b), EConversationDebugInfo::Executing);
                // I will see you regret it.
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140347"));
                DC(int64(0x315a3a90681796b), EConversationDebugInfo::Done);
                DC(int64(0xa77480f9b999ea15), EConversationDebugInfo::Executing);
                Krashok.AI.StartAttackingImmediately(Hero);
                DC(int64(0xa77480f9b999ea15), EConversationDebugInfo::Done);
                DC(int64(0xa77480f9b999ea1a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa77480f9b999ea1a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Krashok_100685 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e27345);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_131959_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Krashok_100685);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa77480f9b999ea20), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e27346), EConversationDebugInfo::Executing);
                // I need to speak to Ur-Nazkrog about Krushak. 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_131959_1924"));
                DC(int64(0x2efd7a5b99e27346), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27349), EConversationDebugInfo::Executing);
                
                // Krushak? What do YOU know of Krushak?
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132005"));
                DC(int64(0x2efd7a5b99e27349), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681796c), EConversationDebugInfo::Executing);
                
                // It's important, but only for Ur-Nazkrog's ears. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140432"));
                DC(int64(0x315a3a90681796c), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681796d), EConversationDebugInfo::Executing);
                
                // Hmm ... 
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140506"));
                DC(int64(0x315a3a90681796d), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681796e), EConversationDebugInfo::Executing);
                // No. I don't trust you. Go. 
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140509"));
                DC(int64(0x315a3a90681796e), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27348), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2efd7a5b99e27348), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Krashok_100719 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e2734a);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_132013_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Krashok_100719);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2efd7a5b99e2735e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e2734b), EConversationDebugInfo::Executing);
                // Don't you think Ur-Nazkrog would want to see me? 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132013_2785"));
                DC(int64(0x2efd7a5b99e2734b), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e2734e), EConversationDebugInfo::Executing);
                
                // ... I told you, she is busy. She has no time for ...
                Krashok.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132020"));
                DC(int64(0x2efd7a5b99e2734e), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817970), EConversationDebugInfo::Executing);
                
                // Are you sure about that? 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140622"));
                DC(int64(0x315a3a906817970), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817972), EConversationDebugInfo::Executing);
                // Maybe she has something important to say about Krushak.
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140702"));
                DC(int64(0x315a3a906817972), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817971), EConversationDebugInfo::Executing);
                
                // You-
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140700"));
                DC(int64(0x315a3a906817971), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817973), EConversationDebugInfo::Executing);
                // (sighs) Fine. Go in and talk to her. But trust me, if I ...
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140714"));
                DC(int64(0x315a3a906817973), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817974), EConversationDebugInfo::Executing);
                
                // I get it. Thanks. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140745"));
                DC(int64(0x315a3a906817974), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e2734f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2efd7a5b99e2734f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Krashok_100758 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e27350);
            default Caption = LocText("TEXT_WIP_LYRXZUK_20240705_132049_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2efd7a5b99e27351), EConversationDebugInfo::Executing);
                // I'll leave you be. 
                Hero.AI.Say(LocText("TEXT_WIP_LYRXZUK_20240705_132049_3436"));
                DC(int64(0x2efd7a5b99e27351), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817975), EConversationDebugInfo::Executing);
                
                // (grunts)
                Krashok.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_140759"));
                DC(int64(0x315a3a906817975), EConversationDebugInfo::Done);
                DC(int64(0xa77480f9b999ea0b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa77480f9b999ea0b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKrashok100852 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x2efd7a5b99e27361);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceKrashok100852);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_SHAMAN_CAVE", 200.0f, int64(0x2efd7a5b99e27361));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_QDZOJWI_20240722_140714"), int64(0x2efd7a5b99e27361));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xa77480f9b999e9d5), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0xa77480f9b999e9fa), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0xa77480f9b999e9e7), EConversationDebugInfo::Executing);
                    // Intruder!
                    Krashok.AI.Say(LocText("TEXT_WIP_BWGQKWK_20240710_095707_2083"));
                    DC(int64(0xa77480f9b999e9e7), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa77480f9b999e9df), EConversationDebugInfo::Executing);
                    // Intruder!
                    Krashok.AI.Say(LocText("TEXT_WIP_BWGQKWK_20240710_095707_2083"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xa77480f9b999e9df), EConversationDebugInfo::Done);
                }
                DC(int64(0x2efd7a5b99e27364), EConversationDebugInfo::Executing);
                Krashok.AI.StartAttackingImmediately(Hero);
                DC(int64(0x2efd7a5b99e27364), EConversationDebugInfo::Done);
                DC(int64(0x2efd7a5b99e27365), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2efd7a5b99e27365), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKrashok101798 : UTopic_Hero__OW_OWR_KRASHOK_2405
        {
            default DebugId = int64(0x50c0631945905ce1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceKrashok101798);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_KRASHOK, Document::UDocumentSegment_Glossary_OW_OWR_KRASHOK_Introduction);
                DB(int64(0x5c7e55a5f0b784b3), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0xa77480f9b999e9c7), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0x5c7e55a5f0b784b6), EConversationDebugInfo::Executing);
                    // Stop! This place is not for a morra. Turn around. 
                    Krashok.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_114653_2785"));
                    DC(int64(0x5c7e55a5f0b784b6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_krashok_101798_exit_1");
                }
                else
                {
                    DC(int64(0x5c7e55a5f0b784b8), EConversationDebugInfo::Executing);
                    // Stop! This place is not for a morra. Turn around. 
                    Krashok.AI.Say(LocText("TEXT_WIP_DAYMWIF_20240709_114653_2785"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x5c7e55a5f0b784b8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_krashok_101798_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */