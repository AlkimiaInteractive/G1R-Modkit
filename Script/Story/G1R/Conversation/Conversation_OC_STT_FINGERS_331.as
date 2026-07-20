#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_STT_FINGERS_331 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_STT_FINGERS_331";
        }
        
        
        class UTopic_Hero__OC_STT_FINGERS_331 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_STT_FINGERS_331";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetFingers() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceFingersBecomeshadow : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x79d9e41ef4df246e);
            default Caption = LocText("DIA_FINGERS_BECOMESHADOW_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x79d9e41ef4df246f), G1R.Fingers_CanTeach == 0);
                    DB(int64(0x79d9e41ef4df2470), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (G1R.Fingers_CanTeach != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df2471), EConversationDebugInfo::Executing);
                // I want to become a Shadow.
                Hero.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_15_00"));
                DC(int64(0x79d9e41ef4df2471), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2472), EConversationDebugInfo::Executing);
                
                // Then you should find yourself a nice spot of sunlight.
                Fingers.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_05_01"));
                DC(int64(0x79d9e41ef4df2472), EConversationDebugInfo::Done);
                DC(int64(0x2c6ecb01f6f76fc4), EConversationDebugInfo::Executing);
                
                // You know what I mean. 
                Hero.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_140944"));
                DC(int64(0x2c6ecb01f6f76fc4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FINGERS, Document::UDocumentSegment_Glossary_OC_STT_FINGERS_Introduction);
                Subdialog(
                    UChoiceFingersBecomeshadowTeachme,
                    UChoiceFingersBecomeshadowAnytips,
                    UChoiceFingersBecomeshadowBack
                );
            }
        }
        
        
        class UChoiceFingersBecomeshadowTeachme : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x79d9e41ef4df2474);
            default Caption = LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7869238cb2b2f5c1), Hero != nullptr && Hero.HasKnowledgeOf(UChoiceDiegoTeachers::StaticClass()));
                }
                
                return Hero != nullptr && Hero.HasKnowledgeOf(UChoiceDiegoTeachers::StaticClass());
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df2475), EConversationDebugInfo::Executing);
                // I'm looking for folks to put in a good word for me. 
                Hero.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_15_00"));
                DC(int64(0x79d9e41ef4df2475), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2476), EConversationDebugInfo::Executing);
                
                // Now, why would I do that?
                Fingers.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_05_01"));
                DC(int64(0x79d9e41ef4df2476), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2477), EConversationDebugInfo::Executing);
                
                // Because Diego says you're one of the key players. 
                Hero.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_15_02"));
                DC(int64(0x79d9e41ef4df2477), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2478), EConversationDebugInfo::Executing);
                
                // Ah, why didn't you lead with that. Yeah, I guess I could ...
                Fingers.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_05_03"));
                DC(int64(0x79d9e41ef4df2478), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2479), EConversationDebugInfo::Executing);
                // Thing is, I have to be sure you're good for something. ...
                Fingers.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_05_04"));
                DC(int64(0x79d9e41ef4df2479), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_FINGERS, Document::UDocumentSegment_Glossary_OC_STT_FINGERS_Teacher);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_FingersStart);
                DB(int64(0x9f2d4d59b9c8d7c1), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                {
                    DC(int64(0x6529242ba425e4b2), EConversationDebugInfo::Executing);
                    // Yes.
                    Hero.AI.Say(LocText("TEXT_NISEA_20240109_183844"));
                    DC(int64(0x6529242ba425e4b2), EConversationDebugInfo::Done);
                    DC(int64(0x6529242ba425e4b3), EConversationDebugInfo::Executing);
                    
                    // Then we're off to a good start.
                    Fingers.AI.Say(LocText("TEXT_NISEA_20240109_183844_41"));
                    DC(int64(0x6529242ba425e4b3), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6529242ba425e4b5), EConversationDebugInfo::Executing);
                    
                    // No. 
                    Hero.AI.Say(LocText("TEXT_NISEA_20240109_183852"));
                    DC(int64(0x6529242ba425e4b5), EConversationDebugInfo::Done);
                    DC(int64(0x6529242ba425e4b6), EConversationDebugInfo::Executing);
                    
                    // Pity ... 
                    Fingers.AI.Say(LocText("TEXT_NISEA_20240109_183852_2083"));
                    DC(int64(0x6529242ba425e4b6), EConversationDebugInfo::Done);
                }
                DC(int64(0x6529242ba425e4b8), EConversationDebugInfo::Executing);
                // You know Scatty, the guy with the punchable face who ...
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_183937_2238"));
                DC(int64(0x6529242ba425e4b8), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4b9), EConversationDebugInfo::Executing);
                // He has a big chest in his hut, and in that chest is a ...
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184020"));
                DC(int64(0x6529242ba425e4b9), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425bd4d), EConversationDebugInfo::Executing);
                G1R.Fingers_CanTeach = 1;
                DC(int64(0x6529242ba425bd4d), EConversationDebugInfo::Done);
                DC(int64(0x5655d6b2dc6e9093), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FINGERS.StartQuest();
                DC(int64(0x5655d6b2dc6e9093), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Fingers_80192,
                    UTopic_Fingers_80212,
                    UTopic_Fingers_80613
                );
            }
        }
        
        
        class UChoiceFingersBecomeshadowAnytips : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x79d9e41ef4df247e);
            default Caption = LocText("DIA_FINGERS_BECOMESHADOW_ANYTIPS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df247f), EConversationDebugInfo::Executing);
                // Can you help me with that?
                Hero.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_ANYTIPS_15_00"));
                DC(int64(0x79d9e41ef4df247f), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2480), EConversationDebugInfo::Executing);
                
                // I wouldn't know how. 
                Fingers.AI.Say(LocText("DIA_FINGERS_BECOMESHADOW_ANYTIPS_05_01"));
                DC(int64(0x79d9e41ef4df2480), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2481), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x79d9e41ef4df2481), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFingersBecomeshadowBack : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xb8d5d0d8e7d55bf9);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UTopic_Fingers_80192 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x6529242ba425e4cb);
            default Caption = LocText("TEXT_NISEA_20240109_184336_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fingers_80192);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6529242ba425e4cc), EConversationDebugInfo::Executing);
                // Can you teach me the skills to do that? 
                Hero.AI.Say(LocText("TEXT_NISEA_20240109_184336_686"));
                DC(int64(0x6529242ba425e4cc), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4d3), EConversationDebugInfo::Executing);
                
                // Why not. What do you want to know?
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184410"));
                DC(int64(0x6529242ba425e4d3), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Fingers_207354,
                    UTopic_Fingers_207374,
                    UTopic_Fingers_207408
                );
            }
        }
        
        
        class UTopic_Fingers_80212 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x6529242ba425e4cf);
            default Caption = LocText("TEXT_NISEA_20240109_184336_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fingers_80212);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6529242ba425e4d0), EConversationDebugInfo::Executing);
                // Wait. You're stealing from your own guys?
                Hero.AI.Say(LocText("TEXT_NISEA_20240109_184336_3984"));
                DC(int64(0x6529242ba425e4d0), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4d4), EConversationDebugInfo::Executing);
                
                // Me? No. You are. 
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184514"));
                DC(int64(0x6529242ba425e4d4), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4d2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6529242ba425e4d2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Fingers_80613 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x6529242ba425e4d5);
            default Caption = LocText("TEXT_NISEA_20240109_184527_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Fingers_80613);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6529242ba425e4d6), EConversationDebugInfo::Executing);
                // I'll take care of it.
                Hero.AI.Say(LocText("TEXT_NISEA_20240109_184527_1609"));
                DC(int64(0x6529242ba425e4d6), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4d9), EConversationDebugInfo::Executing);
                
                // I'll be waiting. 
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184532"));
                DC(int64(0x6529242ba425e4d9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FINGERS_RING, Document::UDocumentSegment_CH1_FINGERS_RING_Start);
                DC(int64(0xd237ceecf7ac7287), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FINGERS_RING.StartQuest();
                DC(int64(0xd237ceecf7ac7287), EConversationDebugInfo::Done);
                DC(int64(0x491634af7603ac91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x491634af7603ac91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Fingers_207354 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xefcd36dc9119373b);
            default Caption = LocText("TEXT_WIP_UUGTOIC_20250821_115649");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
            
            default Rules.HideIfKnows(UTopic_Fingers_207354);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a55347b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x5e925542e2e7cd8), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefcd36dc91193752), EConversationDebugInfo::Executing);
                // How do I get better at lockpicking? 
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_15_00"));
                DC(int64(0xefcd36dc91193752), EConversationDebugInfo::Done);
                DB(int64(0xefcd36dc91193756), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled))
                {
                    DB(int64(0xefcd36dc91193760), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled))
                    {
                        DC(int64(0xefcd36dc91193766), EConversationDebugInfo::Executing);
                        // Ahh ... the mother of skullduggery. 
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_01"));
                        DC(int64(0xefcd36dc91193766), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193767), EConversationDebugInfo::Executing);
                        // Frankly, the biggest rookie mistake is when people use ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_02"));
                        DC(int64(0xefcd36dc91193767), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193769), EConversationDebugInfo::Executing);
                        // What I'm saying is, be careful with your lockpicks, and ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_03"));
                        DC(int64(0xefcd36dc91193769), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc9119376a), EConversationDebugInfo::Executing);
                        // Oh, and this should go without saying, but the louder ...
                        Fingers.AI.Say(LocText("TEXT_WIP_CVYUJYK_20241107_141249"));
                        DC(int64(0xefcd36dc9119376a), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bd84), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Skilled);
                        DC(int64(0x6529242ba425bd84), EConversationDebugInfo::Done);
                        DC(int64(0x8debfcfc6a5d6c3f), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(2);
                        DC(int64(0x8debfcfc6a5d6c3f), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xefcd36dc91193764), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_160043_686"));
                        DC(int64(0xefcd36dc91193764), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193782), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xefcd36dc91193782), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xefcd36dc91193761), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xefcd36dc91193761), EConversationDebugInfo::Done);
                    DC(int64(0xefcd36dc91193783), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xefcd36dc91193783), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_207374 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xefcd36dc9119373f);
            default Caption = LocText("TEXT_WIP_UUGTOIC_20250821_115651");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
            
            default Rules.HideIfKnows(UTopic_Fingers_207374);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a553474), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x43b55d6bf2ccb0e0), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefcd36dc9119374f), EConversationDebugInfo::Executing);
                // How do I become a master at lockpicking? 
                Hero.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_15_00"));
                DC(int64(0xefcd36dc9119374f), EConversationDebugInfo::Done);
                DB(int64(0xefcd36dc9119376f), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master))
                {
                    DB(int64(0xefcd36dc91193771), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master))
                    {
                        DC(int64(0xefcd36dc91193777), EConversationDebugInfo::Executing);
                        // Right. So, remember what I told you about being gentle ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_01"));
                        DC(int64(0xefcd36dc91193777), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193778), EConversationDebugInfo::Executing);
                        // Learn to attune your ear to it, and you'll never waste ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_02"));
                        DC(int64(0xefcd36dc91193778), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193779), EConversationDebugInfo::Executing);
                        // Good luck!
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_03"));
                        DC(int64(0xefcd36dc91193779), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bdbd), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Master);
                        DC(int64(0x6529242ba425bdbd), EConversationDebugInfo::Done);
                        DC(int64(0x8debfcfc6a5d6c40), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(2);
                        DC(int64(0x8debfcfc6a5d6c40), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xefcd36dc91193775), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_160043_686"));
                        DC(int64(0xefcd36dc91193775), EConversationDebugInfo::Done);
                        DC(int64(0xefcd36dc91193784), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xefcd36dc91193784), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xefcd36dc91193772), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xefcd36dc91193772), EConversationDebugInfo::Done);
                    DC(int64(0xefcd36dc91193781), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xefcd36dc91193781), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_207408 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xefcd36dc91193749);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefcd36dc9119377f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0xefcd36dc9119377f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFingersLearnt : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x79d9e41ef4df2492);
            default Caption = LocText("DIA_FINGERS_LEARNT_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x79d9e41ef4df2493), Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning());
                    DB(int64(0x79d9e41ef4df2494), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x65e34064ab97992e), Hero != nullptr && Hero.HasItem(UItAt_Ring_Scatty, 1, 0));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_FINGERS_RING != nullptr && !Quest::OldCamp_OCCHAPTER1_FINGERS_RING.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Ring_Scatty, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df2495), EConversationDebugInfo::Executing);
                //  I have the ring.
                Hero.AI.Say(LocText("DIA_FINGERS_LEARNT_15_00"));
                DC(int64(0x79d9e41ef4df2495), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BROWNIEPOINTS, Document::UDocumentSegment_CH1_BROWNIEPOINTS_FingersCompleted);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FINGERS_RING, Document::UDocumentSegment_CH1_FINGERS_RING_Completed);
                DC(int64(0x9f2d4d59b9c8d7d1), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Fingers, UItAt_Ring_Scatty, 1);
                DC(int64(0x9f2d4d59b9c8d7d1), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4da), EConversationDebugInfo::Executing);
                // Let me see ... I'll be damned, the man's got skills.
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184731"));
                DC(int64(0x6529242ba425e4da), EConversationDebugInfo::Done);
                DC(int64(0x6529242ba425e4db), EConversationDebugInfo::Executing);
                // Yeah, we could use a guy like you. If Diego asks me, ...
                Fingers.AI.Say(LocText("TEXT_NISEA_20240109_184742"));
                DC(int64(0x6529242ba425e4db), EConversationDebugInfo::Done);
                DC(int64(0x65e34064ab9798f1), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FINGERS_RING_FINGERS_RING_OBJ_RETURNRING.SucceedQuest();
                DC(int64(0x65e34064ab9798f1), EConversationDebugInfo::Done);
                DC(int64(0x5655d6b2dc6e9233), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FINGERS.SucceedQuest();
                DC(int64(0x5655d6b2dc6e9233), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFingersLehrer : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xefcd36dc9119372f);
            default Caption = LocText("DIA_FINGERS_LEHRER_15_00");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x79d9e41ef4df2483), G1R.Fingers_CanTeach != 0);
                    DB(int64(0x4807faddc90d4319), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x2ed1fb35b8392dd), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x79d9e41ef4df2483), G1R.Fingers_CanTeach != 0);
                    DB(int64(0x4807faddc90d4319), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x2ed1fb35b8392de), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                }
                
                if (G1R.Fingers_CanTeach != 0 && G1R != nullptr && !G1R.HasReachedChapter(4) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return true;
                
                if (G1R.Fingers_CanTeach != 0 && G1R != nullptr && !G1R.HasReachedChapter(4) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df2484), EConversationDebugInfo::Executing);
                // What can you teach me?
                Hero.AI.Say(LocText("DIA_FINGERS_LEHRER_15_00"));
                DC(int64(0x79d9e41ef4df2484), EConversationDebugInfo::Done);
                DC(int64(0x79d9e41ef4df2485), EConversationDebugInfo::Executing);
                
                // Depends. What do you wanna know?
                Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_05_02"));
                DC(int64(0x79d9e41ef4df2485), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Fingers_77553,
                    UTopic_Fingers_77573,
                    UTopic_Fingers_77642,
                    UTopic_Fingers_77666,
                    UTopic_Fingers_77757
                );
            }
        }
        
        
        class UTopic_Fingers_77553 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xbca9e5babdeb59cc);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_1487");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Pickpocketing_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a55347b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                    DB(int64(0x5e925542e2e7cd8), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbca9e5babdeb59d7), EConversationDebugInfo::Executing);
                // Teach me how to pick pockets. 
                Hero.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET_15_00"));
                DC(int64(0xbca9e5babdeb59d7), EConversationDebugInfo::Done);
                DB(int64(0xc49446c1951afbc6), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Skilled))
                {
                    DB(int64(0xcb6efa8d2649429), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Skilled))
                    {
                        DC(int64(0xdf5903f52ef239a), EConversationDebugInfo::Executing);
                        // What a noble wish. Very well. 
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET_05_01"));
                        DC(int64(0xdf5903f52ef239a), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef239b), EConversationDebugInfo::Executing);
                        // Pickpocketing is all about distraction. Just bump into ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET_05_02"));
                        DC(int64(0xdf5903f52ef239b), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef239c), EConversationDebugInfo::Executing);
                        // Of course, you've got to make sure there are no ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET_05_03"));
                        DC(int64(0xdf5903f52ef239c), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef239d), EConversationDebugInfo::Executing);
                        // Just give it a try. There's no better teacher than field ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET_05_04"));
                        DC(int64(0xdf5903f52ef239d), EConversationDebugInfo::Done);
                        DC(int64(0xf91e85d79ee5d38b), EConversationDebugInfo::Executing);
                        // Oh, and this should go without saying, but the louder ...
                        Fingers.AI.Say(LocText("TEXT_WIP_CVYUJYK_20241107_141249"));
                        DC(int64(0xf91e85d79ee5d38b), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bd84), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Pickpocket_Skilled);
                        DC(int64(0x6529242ba425bd84), EConversationDebugInfo::Done);
                        DC(int64(0x22a699964d8c9ce), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x22a699964d8c9ce), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d264942b), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_160043_686"));
                        DC(int64(0xcb6efa8d264942b), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d264942c), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d264942c), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xbf3c8670f1dd88c3), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xbf3c8670f1dd88c3), EConversationDebugInfo::Done);
                    DC(int64(0x2c6ecb01f6f76fc5), EConversationDebugInfo::Executing);
                    // Come back another time.
                    Fingers.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_142358"));
                    DC(int64(0x2c6ecb01f6f76fc5), EConversationDebugInfo::Done);
                    DC(int64(0xbf3c8670f1dd88c4), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xbf3c8670f1dd88c4), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_77573 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xbca9e5babdeb59d0);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_3894");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Pickpocketing_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a553474), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master));
                    DB(int64(0x43b55d6bf2ccb0e0), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Pickpocket_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbca9e5babdeb59da), EConversationDebugInfo::Executing);
                // I want to be an even better pickpocket. 
                Hero.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET2_15_00"));
                DC(int64(0xbca9e5babdeb59da), EConversationDebugInfo::Done);
                DB(int64(0xca915fba22af69b4), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Pickpocket_Master))
                {
                    DB(int64(0xcb6efa8d264942f), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Pickpocket_Master))
                    {
                        DC(int64(0xdf5903f52ef2391), EConversationDebugInfo::Executing);
                        // Hmm. All right then, I guess you're ready. 
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET2_05_01"));
                        DC(int64(0xdf5903f52ef2391), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef2392), EConversationDebugInfo::Executing);
                        // You probably already figured out that there's easy ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET2_05_02"));
                        DC(int64(0xdf5903f52ef2392), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef2393), EConversationDebugInfo::Executing);
                        // Always make sure you're mark is isolated. Fewer ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_PICKPOCKET2_05_03"));
                        DC(int64(0xdf5903f52ef2393), EConversationDebugInfo::Done);
                        DC(int64(0x2c6ecb01f6f76fc6), EConversationDebugInfo::Executing);
                        // If you get caught and the guy is weaker than you, ...
                        Fingers.AI.Say(LocText("TEXT_WIP_WCCKZPD_20241101_142945"));
                        DC(int64(0x2c6ecb01f6f76fc6), EConversationDebugInfo::Done);
                        DC(int64(0xf91e85d79ee5d38c), EConversationDebugInfo::Executing);
                        // But pickpocketing a Fire Mage? Bad idea ... 
                        Fingers.AI.Say(LocText("TEXT_WIP_CVYUJYK_20241107_142232"));
                        DC(int64(0xf91e85d79ee5d38c), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bd9a), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Pickpocket_Master);
                        DC(int64(0x6529242ba425bd9a), EConversationDebugInfo::Done);
                        DC(int64(0x22a699964d8c9cc), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x22a699964d8c9cc), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d2649431), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_161306_2386"));
                        DC(int64(0xcb6efa8d2649431), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d2649432), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d2649432), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xb1625821df272bc8), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xb1625821df272bc8), EConversationDebugInfo::Done);
                    DC(int64(0xb1625821df272bcb), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb1625821df272bcb), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_77642 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xbca9e5babdeb59dd);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_3051");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a55348d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x5e925542e2e7cd9), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbca9e5babdeb59de), EConversationDebugInfo::Executing);
                // How do I get better at lockpicking? 
                Hero.AI.Say(LocText("DIA_WEDGE_LEHRER_LOCKPICK_15_00"));
                DC(int64(0xbca9e5babdeb59de), EConversationDebugInfo::Done);
                DB(int64(0xca915fba22af69b6), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Skilled))
                {
                    DB(int64(0xcb6efa8d2649435), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Skilled))
                    {
                        DC(int64(0xdf5903f52ef23aa), EConversationDebugInfo::Executing);
                        // Ahh ... the mother of skullduggery. 
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_01"));
                        DC(int64(0xdf5903f52ef23aa), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef23ab), EConversationDebugInfo::Executing);
                        // Frankly, the biggest rookie mistake is when people use ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_02"));
                        DC(int64(0xdf5903f52ef23ab), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef23ac), EConversationDebugInfo::Executing);
                        // What I'm saying is, be careful with your lockpicks, and ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK_05_03"));
                        DC(int64(0xdf5903f52ef23ac), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bdac), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Skilled);
                        DC(int64(0x6529242ba425bdac), EConversationDebugInfo::Done);
                        DC(int64(0x22a699964d8c9ca), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x22a699964d8c9ca), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d2649438), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_161635_3984"));
                        DC(int64(0xcb6efa8d2649438), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d2649439), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d2649439), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xb1625821df272be0), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xb1625821df272be0), EConversationDebugInfo::Done);
                    DC(int64(0xb1625821df272be3), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb1625821df272be3), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_77666 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xbca9e5babdeb59e1);
            default Caption = LocText("TEXT_WIP_LILDIL_20241213_134400_2269");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Lockpicking_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ac2b1925a553486), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Master));
                    DB(int64(0x43b55d6bf2ccb0df), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Picklock_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Picklock_Skilled))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbca9e5babdeb59e2), EConversationDebugInfo::Executing);
                // How do I become a master at lockpicking? 
                Hero.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_15_00"));
                DC(int64(0xbca9e5babdeb59e2), EConversationDebugInfo::Done);
                DB(int64(0xca915fba22af69b8), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Picklock_Master))
                {
                    DB(int64(0xcb6efa8d264943c), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Picklock_Master))
                    {
                        DC(int64(0xdf5903f52ef23a3), EConversationDebugInfo::Executing);
                        // Right. So, remember what I told you about being gentle ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_01"));
                        DC(int64(0xdf5903f52ef23a3), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef23a4), EConversationDebugInfo::Executing);
                        // Learn to attune your ear to it, and you'll never waste ...
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_02"));
                        DC(int64(0xdf5903f52ef23a4), EConversationDebugInfo::Done);
                        DC(int64(0xdf5903f52ef23a5), EConversationDebugInfo::Executing);
                        // Good luck!
                        Fingers.AI.Say(LocText("DIA_FINGERS_LEHRER_LOCKPICK2_05_03"));
                        DC(int64(0xdf5903f52ef23a5), EConversationDebugInfo::Done);
                        DC(int64(0x6529242ba425bdbd), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Picklock_Master);
                        DC(int64(0x6529242ba425bdbd), EConversationDebugInfo::Done);
                        DC(int64(0x22a699964d8c9c8), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x22a699964d8c9c8), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xcb6efa8d264943e), EConversationDebugInfo::Executing);
                        // Bring the nuggets, then we'll talk. 
                        Fingers.AI.Say(LocText("TEXT_WIP_LILDIL_20241213_161729_1609"));
                        DC(int64(0xcb6efa8d264943e), EConversationDebugInfo::Done);
                        DC(int64(0xcb6efa8d264943f), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xcb6efa8d264943f), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xb1625821df272bec), EConversationDebugInfo::Executing);
                    // Huh...Glad you're so eager to learn, but you've got to ...
                    Fingers.AI.Say(LocText("TEXT_DAVID_20231006_130347_2083"));
                    DC(int64(0xb1625821df272bec), EConversationDebugInfo::Done);
                    DC(int64(0xb1625821df272bef), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xb1625821df272bef), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Fingers_77757 : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0xbca9e5babdeb59ec);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceStt331FingersExit : UTopic_Hero__OC_STT_FINGERS_331
        {
            default DebugId = int64(0x79d9e41ef4df246c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x79d9e41ef4df246d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x79d9e41ef4df246d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */