#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_LEE_700 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_LEE_700";
        }
        
        
        class UTopic_Hero__NC_SLD_LEE_700 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_LEE_700";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLee() const property
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
            
            AGothicCharacterState GetMyxir() const property
            {
                return GetCharacter(n"NC_KDW_MYXIR_601");
            }
            
            AGothicCharacterState GetTorlof() const property
            {
                return GetCharacter(n"NC_SLD_TORLOF_737");
            }
        }
        
        
        class UChoiceLee112218 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd22ba0cdd0f60a88);
            default Caption = LocText("TEXT_WIP_JGNROOD_20241111_143953");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a491ba842e9958c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master));
                    DB(int64(0xd0510c469b93fac1), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0x118acb5747a17b7a), Hero.GetStrengthAttributeBaseValue() < 100);
                    DB(int64(0x118acb5747a17b7a), Hero.GetDexterityAttributeBaseValue() < 100);
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return true;
                
                if (Hero.GetStrengthAttributeBaseValue() < 100)
                    return true;
                
                if (Hero.GetDexterityAttributeBaseValue() < 100)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd22ba0cdd0f60a7e), EConversationDebugInfo::Executing);
                // Can you train me? 
                Hero.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_143953"));
                DC(int64(0xd22ba0cdd0f60a7e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_Teacher);
                DB(int64(0x6c15dce33c63b3ae), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                DB(int64(0x1360a142db120baf), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_DemonSummoner));
                
                if ((Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp)) || (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_DemonSummoner)))
                {
                    DB(int64(0xd22ba0cdd0f60a9b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    {
                        DC(int64(0xd22ba0cdd0f60aad), EConversationDebugInfo::Executing);
                        // I don't train bandits, no. Maybe if you end up in our ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_144641"));
                        DC(int64(0xd22ba0cdd0f60aad), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_lee_112218_exit_1");
                    }
                    else
                    {
                        DC(int64(0xd22ba0cdd0f60ac3), EConversationDebugInfo::Executing);
                        // Now that you're one of us, yes. Lessons on swordplay ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_144733"));
                        DC(int64(0xd22ba0cdd0f60ac3), EConversationDebugInfo::Done);
                        DC(int64(0x2a2b6e49b3261b43), EConversationDebugInfo::Executing);
                        Hero.AI.RememberCurrentStatsForTeachingConversation(Lee);
                        DC(int64(0x2a2b6e49b3261b43), EConversationDebugInfo::Done);
                        Subdialog(
                            UTopic_Lee_112620,
                            UTopic_Lee_122831,
                            UTopic_Lee_112640,
                            UTopic_Lee_122851,
                            UTopic_Lee_112947,
                            UTopic_Lee_112967,
                            UTopic_Lee_123168
                        );
                    }
                }
                else
                {
                    DC(int64(0xd22ba0cdd0f60ab7), EConversationDebugInfo::Executing);
                    // No. I only train New Campers. 
                    Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_144720"));
                    DC(int64(0xd22ba0cdd0f60ab7), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Lee_112620 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd22ba0cdd0f60b13);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_120451_2368");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Lee, 1);
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Done);
                DC(int64(0xa712b680ede39d68), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa712b680ede39d68), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_122831 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xa712b680ede39b76);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_121532");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Strength_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Executing);
                Hero.AI.BuyStrengthAttributePoints(Lee, 5);
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Done);
                DC(int64(0xa712b680ede39dc2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa712b680ede39dc2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_112640 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd22ba0cdd0f60b17);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_120451_579");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_1);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Lee, 1);
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Done);
                DC(int64(0xa712b680ede39d98), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa712b680ede39d98), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_122851 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xa712b680ede39b95);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_121538");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_BuyAttribute_Dexterity_5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Executing);
                Hero.AI.BuyDexterityAttributePoints(Lee, 5);
                DC(int64(0x664aa9ea65f55e7d), EConversationDebugInfo::Done);
                DC(int64(0xa712b680ede39dec), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa712b680ede39dec), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_112947 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd22ba0cdd0f60b4f);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_120451_650");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2330b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained));
                    DB(int64(0xc3316dceccaaedd9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x1a491ba842e9958c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master));
                    DB(int64(0xd0510c469b93fac1), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd22ba0cdd0f60b50), EConversationDebugInfo::Executing);
                // Show me how to fight with two-handers. 
                Hero.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145043_3331"));
                DC(int64(0xd22ba0cdd0f60b50), EConversationDebugInfo::Done);
                DB(int64(0xd22ba0cdd0f60b73), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained))
                {
                    DB(int64(0xa712b680ede39e5f), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    {
                        DC(int64(0xd22ba0cdd0f60b88), EConversationDebugInfo::Executing);
                        // Okay. 
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145118"));
                        DC(int64(0xd22ba0cdd0f60b88), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60bb4), EConversationDebugInfo::Executing);
                        // I probably don't need to tell you this, but two handers ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145224"));
                        DC(int64(0xd22ba0cdd0f60bb4), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60bc9), EConversationDebugInfo::Executing);
                        // Controlling your body is one half of it - controlling ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145232"));
                        DC(int64(0xd22ba0cdd0f60bc9), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60bde), EConversationDebugInfo::Executing);
                        // Once you've gotten the hang of it, you'll be able to ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145238"));
                        DC(int64(0xd22ba0cdd0f60bde), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60bdf), EConversationDebugInfo::Executing);
                        // Also, don't just hack at your opponents like you're ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145239"));
                        DC(int64(0xd22ba0cdd0f60bdf), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60c09), EConversationDebugInfo::Executing);
                        // You can also use your weapon to parry - it ain't no ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145347"));
                        DC(int64(0xd22ba0cdd0f60c09), EConversationDebugInfo::Done);
                        DC(int64(0xd22ba0cdd0f60c33), EConversationDebugInfo::Executing);
                        // Now get out there and practice. It's all about ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145414"));
                        DC(int64(0xd22ba0cdd0f60c33), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39e9a), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_TwoHanded_Trained);
                        DC(int64(0xa712b680ede39e9a), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39e86), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xa712b680ede39e86), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xd22ba0cdd0f60b95), EConversationDebugInfo::Executing);
                        // Like I said, I don't teach for free. Matter of ...
                        Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145149"));
                        DC(int64(0xd22ba0cdd0f60b95), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39e7c), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa712b680ede39e7c), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xd22ba0cdd0f60b7d), EConversationDebugInfo::Executing);
                    // I don't think you're ready for that kind of training ...
                    Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145114"));
                    DC(int64(0xd22ba0cdd0f60b7d), EConversationDebugInfo::Done);
                    DC(int64(0xd22ba0cdd0f60b94), EConversationDebugInfo::Executing);
                    // Go out there and get more experienced - then we'll see. 
                    Lee.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145139"));
                    DC(int64(0xd22ba0cdd0f60b94), EConversationDebugInfo::Done);
                    DC(int64(0xa712b680ede39e54), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xa712b680ede39e54), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Lee_112967 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd22ba0cdd0f60b5c);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_120451_2223");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2331b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master));
                    DB(int64(0xc3316dceccaaedda), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x118acb5747a17de9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_TwoHanded_Trained))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd22ba0cdd0f60b5d), EConversationDebugInfo::Executing);
                // I want to become a master with two-handed weapons. 
                Hero.AI.Say(LocText("TEXT_WIP_JGNROOD_20241111_145045_2650"));
                DC(int64(0xd22ba0cdd0f60b5d), EConversationDebugInfo::Done);
                DB(int64(0xa712b680ede39ebd), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_TwoHanded_Master))
                {
                    DB(int64(0xa712b680ede39edc), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_TwoHanded_Master))
                    {
                        DC(int64(0xa712b680ede39f12), EConversationDebugInfo::Executing);
                        // Fair enough. 
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123712_2386"));
                        DC(int64(0xa712b680ede39f12), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f1c), EConversationDebugInfo::Executing);
                        // You already know about critical hits - those moments ...
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123722"));
                        DC(int64(0xa712b680ede39f1c), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f1d), EConversationDebugInfo::Executing);
                        // Try and be more precise with your attacks. Yes, you know ...
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123730"));
                        DC(int64(0xa712b680ede39f1d), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f1e), EConversationDebugInfo::Executing);
                        // Also, always keep an eye on your enemy's movements. ...
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123737"));
                        DC(int64(0xa712b680ede39f1e), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f1f), EConversationDebugInfo::Executing);
                        // And last but not least: footing. Always keep your boots ...
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123745"));
                        DC(int64(0xa712b680ede39f1f), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f20), EConversationDebugInfo::Executing);
                        // Good luck. You've come a long way. 
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123757"));
                        DC(int64(0xa712b680ede39f20), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39e9a), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_TwoHanded_Master);
                        DC(int64(0xa712b680ede39e9a), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f35), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xa712b680ede39f35), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa712b680ede39efd), EConversationDebugInfo::Executing);
                        // Like I said, I don't teach for free. Matter of ...
                        Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123644_686"));
                        DC(int64(0xa712b680ede39efd), EConversationDebugInfo::Done);
                        DC(int64(0xa712b680ede39f07), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa712b680ede39f07), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xa712b680ede39ee7), EConversationDebugInfo::Executing);
                    // I don't think you're ready for that kind of training ...
                    Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123623_3286"));
                    DC(int64(0xa712b680ede39ee7), EConversationDebugInfo::Done);
                    DC(int64(0xa712b680ede39ef1), EConversationDebugInfo::Executing);
                    // Go out there and get more experienced - then we'll see. 
                    Lee.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_123631"));
                    DC(int64(0xa712b680ede39ef1), EConversationDebugInfo::Done);
                    DC(int64(0xa712b680ede39ef2), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xa712b680ede39ef2), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Lee_123168 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xa712b680ede39ccc);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a2b6e49b3261b5a), EConversationDebugInfo::Executing);
                Hero.AI.ActTeacherReactionLines(Lee);
                DC(int64(0x2a2b6e49b3261b5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee113706 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc99858765b70a543);
            default Caption = LocText("TEXT_WIP_NWCJMDN_20241128_152708");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLee113706);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc894ae7b93277c30), G1R.Lee_SldPossible != 0);
                }
                
                return G1R.Lee_SldPossible != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc99858765b70a552), EConversationDebugInfo::Executing);
                // What do you need me to do?
                Hero.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_152708"));
                DC(int64(0xc99858765b70a552), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a4d4), EConversationDebugInfo::Executing);
                
                // As you already know, we work for the Mages. One of them, ...
                Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_141948"));
                DC(int64(0xc99858765b70a4d4), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a6136a6), EConversationDebugInfo::Executing);
                // He went there to investigate it, but he asked for some ...
                Lee.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_144949"));
                DC(int64(0x33e046463a6136a6), EConversationDebugInfo::Done);
                DC(int64(0xc190f77f097df129), EConversationDebugInfo::Executing);
                
                // Why didn't he wait before leaving?
                Hero.AI.Say(LocText("TEXT_WIP_EIYYDND_20241129_151829"));
                DC(int64(0xc190f77f097df129), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a6e8), EConversationDebugInfo::Executing);
                
                // Because he's a stubborn mule - like the lot of them. But ...
                Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_160340"));
                DC(int64(0xc99858765b70a6e8), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a97), EConversationDebugInfo::Executing);
                // Not to mention that traveling is a whole lot nicer if ...
                Lee.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_222055"));
                DC(int64(0x3673fe4e769e6a97), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a98), EConversationDebugInfo::Executing);
                // Anyway, one of our guys saw him at the beach with the ...
                Lee.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_222235"));
                DC(int64(0x3673fe4e769e6a98), EConversationDebugInfo::Done);
                DC(int64(0x7ef9d7ec44a2bbd), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Torlof))) { Torlof.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Torlof_737_Start); }
                DC(int64(0x7ef9d7ec44a2bbd), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613690), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Myxir))) { Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_Wait); }
                DC(int64(0x33e046463a613690), EConversationDebugInfo::Done);
                DC(int64(0xbf5297e45dc3d10d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Myxir))) { Myxir.TeleportToSpot(n"FP_SW_MYXIR_WAIT"); }
                DC(int64(0xbf5297e45dc3d10d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_113759,
                    UTopic_Lee_118178,
                    UTopic_Lee_114934
                );
            }
        }
        
        
        class UTopic_Lee_113759 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc99858765b70a569);
            default Caption = LocText("TEXT_WIP_NWCJMDN_20241128_153145_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_113759);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc99858765b70a56a), EConversationDebugInfo::Executing);
                // Where is that beach?
                Hero.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153145_2785"));
                DC(int64(0xc99858765b70a56a), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a578), EConversationDebugInfo::Executing);
                
                // Just follow the tributary until it meets the sea. 
                Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153306"));
                DC(int64(0xc99858765b70a578), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a579), EConversationDebugInfo::Executing);
                // You can get to the beach from the right side of the old ...
                Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153427"));
                DC(int64(0xc99858765b70a579), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_Location);
                DC(int64(0xc99858765b70a56c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc99858765b70a56c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_118178 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x33e046463a6137ba);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_170540_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118178);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a6137bb), EConversationDebugInfo::Executing);
                // Do you do everything the mages ask of you? 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_170540_1769"));
                DC(int64(0x33e046463a6137bb), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a6137c7), EConversationDebugInfo::Executing);
                
                // Within reason. Generally speaking, though, yeah.
                Lee.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_170628"));
                DC(int64(0x33e046463a6137c7), EConversationDebugInfo::Done);
                DC(int64(0xdf3de6516cabcd7d), EConversationDebugInfo::Executing);
                // As long as they pay. 
                Lee.AI.Say(LocText("TEXT_WIP_JPMSWZD_20241210_145047"));
                DC(int64(0xdf3de6516cabcd7d), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a6137bd), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x33e046463a6137bd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_114934 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc99858765b70a652);
            default Caption = LocText("TEXT_WIP_NWCJMDN_20241128_155654_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_114934);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc99858765b70a653), EConversationDebugInfo::Executing);
                // All right. I'll handle it.
                Hero.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_155654_2801"));
                DC(int64(0xc99858765b70a653), EConversationDebugInfo::Done);
                DC(int64(0xc190f77f097df140), EConversationDebugInfo::Executing);
                
                // Thanks. Do this well and you'll get your spot.
                Lee.AI.Say(LocText("TEXT_WIP_EIYYDND_20241129_152751"));
                DC(int64(0xc190f77f097df140), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_Start);
                DC(int64(0xc99858765b70a674), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.StartQuest();
                DC(int64(0xc99858765b70a674), EConversationDebugInfo::Done);
                DC(int64(0x6c528962981e99de), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST.StartQuest();
                DC(int64(0x6c528962981e99de), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a664), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc99858765b70a664), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLee114045 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc99858765b70a749);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLee114045);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc99858765b70a729), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning());
                    DB(int64(0x40c65dd13596a727), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && !Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS != nullptr && !Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc99858765b70a57b), EConversationDebugInfo::Executing);
                // Look who it is. 
                Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153505_686"));
                DC(int64(0xc99858765b70a57b), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a57a), EConversationDebugInfo::Executing);
                
                // I helped Myxir find a book. 
                Hero.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153505"));
                DC(int64(0xc99858765b70a57a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_Completed);
                DB(int64(0x1f4a84cc2abb3b5b), G1R.Myxir_Quest_Completed.IsValid() && G1R.Myxir_Quest_Completed.IsAtLeastXMinutesAgo(60));
                
                if (G1R.Myxir_Quest_Completed.IsValid() && G1R.Myxir_Quest_Completed.IsAtLeastXMinutesAgo(60))
                {
                    DC(int64(0x1f4a84cc2abb3b94), EConversationDebugInfo::Executing);
                    // Yeah, so he told me. Though he made it sound like you ...
                    Lee.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171254"));
                    DC(int64(0x1f4a84cc2abb3b94), EConversationDebugInfo::Done);
                }
                DC(int64(0x1f4a84cc2abb3bc5), EConversationDebugInfo::Executing);
                // He's very fond of that book.
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171251"));
                DC(int64(0x1f4a84cc2abb3bc5), EConversationDebugInfo::Done);
                DC(int64(0x1f4a84cc2abb3bc6), EConversationDebugInfo::Executing);
                
                // (amused snort) Well, good work. 
                Lee.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171305"));
                DC(int64(0x1f4a84cc2abb3bc6), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a694), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_REPORT.SucceedQuest();
                DC(int64(0xc99858765b70a694), EConversationDebugInfo::Done);
                DC(int64(0x6c528962981e99e9), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_TEST.SucceedQuest();
                DC(int64(0x6c528962981e99e9), EConversationDebugInfo::Done);
                DC(int64(0xdf3de6516cabcd7e), EConversationDebugInfo::Executing);
                // You've proven your worth to our camp - now and several ...
                Lee.AI.Say(LocText("TEXT_WIP_JPMSWZD_20241210_150147"));
                DC(int64(0xdf3de6516cabcd7e), EConversationDebugInfo::Done);
                DB(int64(0x39f04095ce9b9793), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.HasSucceeded())
                {
                    DC(int64(0xc894ae7b93277c34), EConversationDebugInfo::Executing);
                    // Just one more question. Why? Why did you join us back ...
                    Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_INFO_08_03"));
                    DC(int64(0xc894ae7b93277c34), EConversationDebugInfo::Done);
                    Subdialog(
                        UChoiceSld700LeeBecomesldnowNoother,
                        UChoiceSld700LeeBecomesldnowFreedom,
                        UChoiceSld700LeeBecomesldnowJustbecause
                    );
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Executing);
                    Lee.AddItemToInventory(USld_Armor, 1);
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c1c), EConversationDebugInfo::Executing);
                    Lee.AI.GiveItemTo(Hero, USld_Armor, 1);
                    DC(int64(0x9c096e8facaf9c1c), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c1e), EConversationDebugInfo::Executing);
                    Hero.Inventory.EquipArmorOfClass(USld_Armor);
                    DC(int64(0x9c096e8facaf9c1e), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c20), EConversationDebugInfo::Executing);
                    Hero.SetTrueGuild(UGE_Guild_Human_NewCamp_Mercenary);
                    DC(int64(0x9c096e8facaf9c20), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Executing);
                    Lee.AddItemToInventory(USld_Armor, 1);
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c1c), EConversationDebugInfo::Executing);
                    Lee.AI.GiveItemTo(Hero, USld_Armor, 1);
                    DC(int64(0x9c096e8facaf9c1c), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c1e), EConversationDebugInfo::Executing);
                    Hero.Inventory.EquipArmorOfClass(USld_Armor);
                    DC(int64(0x9c096e8facaf9c1e), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c20), EConversationDebugInfo::Executing);
                    Hero.SetTrueGuild(UGE_Guild_Human_NewCamp_Mercenary);
                    DC(int64(0x9c096e8facaf9c20), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceSld700LeeBecomesldnowNoother : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c36);
            default Caption = LocText("SLD_700_LEE_BECOMESLDNOW_NOOTHER_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c37), EConversationDebugInfo::Executing);
                // The other camps are a bunch of idiots.
                Hero.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_NOOTHER_15_01"));
                DC(int64(0xc894ae7b93277c37), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c38), EConversationDebugInfo::Executing);
                
                // Couldn't have said it any better.
                Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_NOOTHER_08_02"));
                DC(int64(0xc894ae7b93277c38), EConversationDebugInfo::Done);
                DC(int64(0xe0e28b2386f64622), EConversationDebugInfo::Executing);
                // Welcome to the crew, MERCENARY.
                Lee.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_161024"));
                DC(int64(0xe0e28b2386f64622), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld700LeeBecomesldnowFreedom : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c3e);
            default Caption = LocText("SLD_700_LEE_BECOMESLDNOW_FREEDOM_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c3f), EConversationDebugInfo::Executing);
                
                // Because your camp is my best shot at getting out of ...
                Hero.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_FREEDOM_15_01"));
                DC(int64(0xc894ae7b93277c3f), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c40), EConversationDebugInfo::Executing);
                
                // It is indeed. Welcome to the crew, MERCENARY.
                Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_FREEDOM_08_02"));
                DC(int64(0xc894ae7b93277c40), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld700LeeBecomesldnowJustbecause : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c46);
            default Caption = LocText("SLD_700_LEE_BECOMESLDNOW_JUSTBECAUSE_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c47), EConversationDebugInfo::Executing);
                
                // To be honest, it just happened.
                Hero.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_JUSTBECAUSE_15_01"));
                DC(int64(0xc894ae7b93277c47), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c48), EConversationDebugInfo::Executing);
                
                // I see. Well, then. Welcome to the crew, MERCENARY.
                Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLDNOW_JUSTBECAUSE_08_02"));
                DC(int64(0xc894ae7b93277c48), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee115142 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc99858765b70a839);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLee114045);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeBecomesldnowFreedom);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeBecomesldnowJustbecause);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeBecomesldnowNoother);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb7edd93d6a449447), EConversationDebugInfo::Executing);
                
                // Any orders?
                Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_195046"));
                DC(int64(0xb7edd93d6a449447), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449448), EConversationDebugInfo::Executing);
                
                // (laughs) Yeah. Go back to the Water Mages and help ...
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_195046_41"));
                DC(int64(0xb7edd93d6a449448), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449451), EConversationDebugInfo::Executing);
                // It's way past time we get out of here. 
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_195131"));
                DC(int64(0xb7edd93d6a449451), EConversationDebugInfo::Done);
                DB(int64(0xe03daa3efbc91a87), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BANNEDFROMOC, Document::UDocumentSegment_CH4_BANNEDFROMOC_Completed);
                    DC(int64(0xc99858765b70a853), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.SucceedQuest();
                    DC(int64(0xc99858765b70a853), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lee_115142_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_lee_115142_exit_2");
                }
            }
        }
        
        
        class UChoiceLee115602 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc919d7);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_110351");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceLee115602);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe03daa3efbc919da), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                    DB(int64(0xe03daa3efbc91a5f), Lee != nullptr && Lee.IsCloseToWaypoint(n"FP_NC_SMALLTALK_23", 1500.0f));
                    DB(int64(0x86fa46146d71d9e0), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasSucceeded());
                    DB(int64(0xe03daa3efbc91b61), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xe03daa3efbc91b69), Lee != nullptr && Lee.IsCloseToWaypoint(n"FP_NC_SMALLTALK_23", 1500.0f));
                    DB(int64(0x86fa46146d71d9e1), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasSucceeded());
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary) && Lee != nullptr && Lee.IsCloseToWaypoint(n"FP_NC_SMALLTALK_23", 1500.0f) && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasSucceeded())
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Lee != nullptr && Lee.IsCloseToWaypoint(n"FP_NC_SMALLTALK_23", 1500.0f) && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91a9d), EConversationDebugInfo::Executing);
                // Do you have any more work for me? Something unrelated to ...
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_110351"));
                DC(int64(0xe03daa3efbc91a9d), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8754), EConversationDebugInfo::Executing);
                
                // Why? Eager to prove yourself?
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_124854"));
                DC(int64(0xd87530abc9fc8754), EConversationDebugInfo::Done);
                DB(int64(0x129327624d01e5b4), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                {
                    DC(int64(0x129327624d01e598), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.FailQuest();
                    DC(int64(0x129327624d01e598), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Lee_134211,
                    UTopic_Lee_134231
                );
                DC(int64(0xe03daa3efbc919cf), EConversationDebugInfo::Executing);
                // But yeah, there is something I could use a hand with.
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_090116_41"));
                DC(int64(0xe03daa3efbc919cf), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91a9e), EConversationDebugInfo::Executing);
                // A few years back, a bunch of bandits split from Lares's ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_110505"));
                DC(int64(0xe03daa3efbc91a9e), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91a9f), EConversationDebugInfo::Executing);
                // Anyway, they aren't a true "Camp" or anything, so we ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_110550"));
                DC(int64(0xe03daa3efbc91a9f), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91aa3), EConversationDebugInfo::Executing);
                // I'd like to be sure that was a one-time thing.
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_111017"));
                DC(int64(0xe03daa3efbc91aa3), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91aa1), EConversationDebugInfo::Executing);
                
                // You want me to remind them?
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_110928"));
                DC(int64(0xe03daa3efbc91aa1), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91aa2), EConversationDebugInfo::Executing);
                
                // No, that would be too obvious. I want you to gain their ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_110940"));
                DC(int64(0xe03daa3efbc91aa2), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87ea), EConversationDebugInfo::Executing);
                // An intelligence job. Think you can handle that? 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_125829"));
                DC(int64(0xd87530abc9fc87ea), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_116319,
                    UTopic_Lee_116339,
                    UTopic_Lee_136762,
                    UTopic_Lee_116860
                );
            }
        }
        
        
        class UTopic_Lee_134211 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc8774);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_124927_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_134211);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8775), EConversationDebugInfo::Executing);
                // I could use some extra ore. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_124927_41"));
                DC(int64(0xd87530abc9fc8775), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87e6), EConversationDebugInfo::Executing);
                
                // Couldn't we all.
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_125128"));
                DC(int64(0xd87530abc9fc87e6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_134231 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc8778);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_124927_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_134231);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8779), EConversationDebugInfo::Executing);
                
                // No, but a change of scenery would be nice. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_124927_2238"));
                DC(int64(0xd87530abc9fc8779), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87e7), EConversationDebugInfo::Executing);
                // I'm running way too many errands for wise old men in ...
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_125205"));
                DC(int64(0xd87530abc9fc87e7), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87e8), EConversationDebugInfo::Executing);
                
                // Ha. You know what, I can relate to that. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_125240"));
                DC(int64(0xd87530abc9fc87e8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_116319 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91aa5);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_111123_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_116319);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91aa6), EConversationDebugInfo::Executing);
                
                // Where can I find these guys?
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_111123_3286"));
                DC(int64(0xe03daa3efbc91aa6), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91ab4), EConversationDebugInfo::Executing);
                
                // Well, that's the thing, no one really knows. They're up ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_111545"));
                DC(int64(0xe03daa3efbc91ab4), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91ab5), EConversationDebugInfo::Executing);
                // Drax, one of Lares's guys, says they might be in the ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_111648"));
                DC(int64(0xe03daa3efbc91ab5), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91aa8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe03daa3efbc91aa8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_116339 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91aa9);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_111123_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_116339);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91aaa), EConversationDebugInfo::Executing);
                // Anything you could give me to help with that job? 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_111123_2386"));
                DC(int64(0xe03daa3efbc91aaa), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87eb), EConversationDebugInfo::Executing);
                
                // Well, your most important asset are going to be your ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130210"));
                DC(int64(0xd87530abc9fc87eb), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91ab6), EConversationDebugInfo::Executing);
                // As far as potions are concerned, I'm afraid we're ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_112344"));
                DC(int64(0xe03daa3efbc91ab6), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91ab7), EConversationDebugInfo::Executing);
                // You'll just have to buy it from the mages or one of our ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_112740"));
                DC(int64(0xe03daa3efbc91ab7), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91aac), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe03daa3efbc91aac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_136762 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc87ec);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_130254_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_136762);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc87ed), EConversationDebugInfo::Executing);
                // Any idea what went down between them and Lares?
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130254_3436"));
                DC(int64(0xd87530abc9fc87ed), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87f9), EConversationDebugInfo::Executing);
                
                // Far as I know, it came from this guy called Quentin. ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130354"));
                DC(int64(0xd87530abc9fc87f9), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87fa), EConversationDebugInfo::Executing);
                // He hated mages for some reason, so he always started ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130557"));
                DC(int64(0xd87530abc9fc87fa), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87fb), EConversationDebugInfo::Executing);
                // Eventually, he became too much of a liability to keep ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130630"));
                DC(int64(0xd87530abc9fc87fb), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87fd), EConversationDebugInfo::Executing);
                
                // And some guys followed him?
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130743"));
                DC(int64(0xd87530abc9fc87fd), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87fc), EConversationDebugInfo::Executing);
                
                // Exactly.
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130654"));
                DC(int64(0xd87530abc9fc87fc), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87ef), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd87530abc9fc87ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_116860 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91ab8);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_112814_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_116860);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VFCKUON_20241203_111648"), int64(0xe03daa3efbc91ab8));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_ARTOQVD_20241220_130354"), int64(0xe03daa3efbc91ab8));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91ab9), EConversationDebugInfo::Executing);
                // All right. I'll find that camp. 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_112814_3984"));
                DC(int64(0xe03daa3efbc91ab9), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87fe), EConversationDebugInfo::Executing);
                
                // Do that. You'll be well paid. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_130800"));
                DC(int64(0xd87530abc9fc87fe), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_Start);
                DC(int64(0xe03daa3efbc91acb), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.StartQuest();
                DC(int64(0xe03daa3efbc91acb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee117013 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91b73);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_120803");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe03daa3efbc91b76), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91b6a), EConversationDebugInfo::Executing);
                // About the canyon camp ... 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_120803"));
                DC(int64(0xe03daa3efbc91b6a), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91b6b), EConversationDebugInfo::Executing);
                
                // Yes?
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_120803_2801"));
                DC(int64(0xe03daa3efbc91b6b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_117704,
                    UTopic_Lee_118360,
                    UTopic_Lee_117620,
                    UTopic_Lee_118515,
                    UTopic_Lee_118623,
                    UTopic_Lee_118459
                );
            }
        }
        
        
        class UTopic_Lee_117704 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91c7f);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_133137_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_117704);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe03daa3efbc91d0d), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning());
                }
                
                return Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91c80), EConversationDebugInfo::Executing);
                // I found the camp, but I'm still trying to win their ...
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_133137_1340"));
                DC(int64(0xe03daa3efbc91c80), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c8a), EConversationDebugInfo::Executing);
                
                // And you came back just to report that? An interesting ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_133355"));
                DC(int64(0xe03daa3efbc91c8a), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8813), EConversationDebugInfo::Executing);
                // Anyway, keep at it. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_133443"));
                DC(int64(0xd87530abc9fc8813), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8798), EConversationDebugInfo::Executing);
                
                // Just trying to make myself useful. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_124933_1924"));
                DC(int64(0xd87530abc9fc8798), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc87e9), EConversationDebugInfo::Executing);
                
                // You just proved it was a good idea to hire you. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_125454"));
                DC(int64(0xd87530abc9fc87e9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_118360 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91d69);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_135604_1661");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118360);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe03daa3efbc91d76), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded());
                }
                
                return Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91d6a), EConversationDebugInfo::Executing);
                
                // I gained their trust, but I'm still assessing the ...
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_135604_1661"));
                DC(int64(0xe03daa3efbc91d6a), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91d74), EConversationDebugInfo::Executing);
                
                // Well, then keep at it. No need to come back to me for ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_135751"));
                DC(int64(0xe03daa3efbc91d74), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_117620 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91c6c);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_124819_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_117620);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_YRWYRII_20250110_152427"), int64(0xe03daa3efbc91c6c));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91c6d), EConversationDebugInfo::Executing);
                
                // I had a chat with their leader. Quentin.
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124819_731"));
                DC(int64(0xe03daa3efbc91c6d), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c77), EConversationDebugInfo::Executing);
                
                // Now I'm listening. How did that go?
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124835"));
                DC(int64(0xe03daa3efbc91c77), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_118165,
                    UTopic_Lee_118185
                );
            }
        }
        
        
        class UTopic_Lee_118515 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91da7);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_141029_568");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118515);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd577347741a1063a), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_152427")));
                    DB(int64(0x83b76a8690a2dfb), BC_BAN_QUENTIN != nullptr && BC_BAN_QUENTIN.IsEveryoneOfThisKindDead());
                }
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_YRWYRII_20250110_152427")))
                    return true;
                
                if (BC_BAN_QUENTIN != nullptr && BC_BAN_QUENTIN.IsEveryoneOfThisKindDead())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91da8), EConversationDebugInfo::Executing);
                // They're dead now. 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_141029_568"));
                DC(int64(0xe03daa3efbc91da8), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8869), EConversationDebugInfo::Executing);
                
                // ... What?
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124025"));
                DC(int64(0xd87530abc9fc8869), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc886b), EConversationDebugInfo::Executing);
                
                // Things got out of hand. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135211"));
                DC(int64(0xd87530abc9fc886b), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91db2), EConversationDebugInfo::Executing);
                
                // Well. Remind me not to get on your bad side, will you? 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124314"));
                DC(int64(0xe03daa3efbc91db2), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91db3), EConversationDebugInfo::Executing);
                // Anyway, I guess that's one less problem to worry about. 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124344"));
                DC(int64(0xe03daa3efbc91db3), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc886c), EConversationDebugInfo::Executing);
                // Huh...Bloody hell ... You're a real wild card.
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135220"));
                DC(int64(0xd87530abc9fc886c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_CompletedDead);
            }
        }
        
        
        class UTopic_Lee_118623 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91df7);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_144011_2853");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118623);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe03daa3efbc91e03), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasBeenStarted());
                }
                
                return Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91df8), EConversationDebugInfo::Executing);
                // Thorus also asked me to investigate the canyon camp. ...
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_144011_2853"));
                DC(int64(0xe03daa3efbc91df8), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91e0b), EConversationDebugInfo::Executing);
                
                // Did he, now? Well, I can't say I'm surprised. They were ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_144049"));
                DC(int64(0xe03daa3efbc91e0b), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91e0c), EConversationDebugInfo::Executing);
                // Glad you're working for us now. 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_144241"));
                DC(int64(0xe03daa3efbc91e0c), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91dfa), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe03daa3efbc91dfa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_118459 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91d86);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_135906_1289");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91d87), EConversationDebugInfo::Executing);
                // I don't have anything yet. 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_135906_1289"));
                DC(int64(0xe03daa3efbc91d87), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc886e), EConversationDebugInfo::Executing);
                
                // And you came here just to tell me that? All right, I ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135332"));
                DC(int64(0xd87530abc9fc886e), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc886f), EConversationDebugInfo::Executing);
                // Keep at it. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135343"));
                DC(int64(0xd87530abc9fc886f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_118165 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91d18);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_124003_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118165);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91c40), EConversationDebugInfo::Executing);
                
                // They're dead now.
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124003_491"));
                DC(int64(0xe03daa3efbc91c40), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c4e), EConversationDebugInfo::Executing);
                
                // ... What?
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124025"));
                DC(int64(0xe03daa3efbc91c4e), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8814), EConversationDebugInfo::Executing);
                
                // Things got out of hand. Sorry. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_133839"));
                DC(int64(0xd87530abc9fc8814), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c58), EConversationDebugInfo::Executing);
                
                // Well. Remind me not to get on your bad side, will you? 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124314"));
                DC(int64(0xe03daa3efbc91c58), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c59), EConversationDebugInfo::Executing);
                // Anyway, I guess that's one less problem to worry about. 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124344"));
                DC(int64(0xe03daa3efbc91c59), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc886d), EConversationDebugInfo::Executing);
                // Huh...Bloody hell ... You're a real wild card.
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135220"));
                DC(int64(0xd87530abc9fc886d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_CompletedDead);
            }
        }
        
        
        class UTopic_Lee_118185 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91d1c);
            default Caption = LocText("TEXT_WIP_VFCKUON_20241203_124003_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_118185);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe03daa3efbc91c44), EConversationDebugInfo::Executing);
                // He told me a bit about why he fell out with Lares. 
                Hero.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124003_3750"));
                DC(int64(0xe03daa3efbc91c44), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c4f), EConversationDebugInfo::Executing);
                
                // And? Is he gonna stop poaching our guys? 
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_124107"));
                DC(int64(0xe03daa3efbc91c4f), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7e8), EConversationDebugInfo::Executing);
                
                // He says he's not poaching them. But he won't turn them ...
                Hero.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_135945"));
                DC(int64(0x6b50f48009bbe7e8), EConversationDebugInfo::Done);
                DC(int64(0x6b50f48009bbe7e9), EConversationDebugInfo::Executing);
                
                // Hm. I see. 
                Lee.AI.Say(LocText("TEXT_WIP_BSWYRII_20250113_140008"));
                DC(int64(0x6b50f48009bbe7e9), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91d67), EConversationDebugInfo::Executing);
                // Tell me, hand to heart: what's your take on that man? Is ...
                Lee.AI.Say(LocText("TEXT_WIP_VFCKUON_20241203_135234"));
                DC(int64(0xe03daa3efbc91d67), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_139122,
                    UTopic_Lee_139142,
                    UTopic_Lee_139285
                );
            }
        }
        
        
        class UTopic_Lee_139122 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc8821);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_135001_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_139122);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8822), EConversationDebugInfo::Executing);
                // I don't think so. These guys just want to be left alone. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135001_3286"));
                DC(int64(0xd87530abc9fc8822), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8867), EConversationDebugInfo::Executing);
                
                // Don't we all.
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135131"));
                DC(int64(0xd87530abc9fc8867), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8868), EConversationDebugInfo::Executing);
                // All right, I'll give this some thought. Thanks for your ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135142"));
                DC(int64(0xd87530abc9fc8868), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_CompleteNoThreat);
            }
        }
        
        
        class UTopic_Lee_139142 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc8825);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_135001_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_139142);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8826), EConversationDebugInfo::Executing);
                // I don't know. He's hard to read. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135001_2386"));
                DC(int64(0xd87530abc9fc8826), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8865), EConversationDebugInfo::Executing);
                
                // I see. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135111"));
                DC(int64(0xd87530abc9fc8865), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8866), EConversationDebugInfo::Executing);
                // All right, I'll give this some thought. Thanks for your ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135142"));
                DC(int64(0xd87530abc9fc8866), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_CompleteNoThreat);
            }
        }
        
        
        class UTopic_Lee_139285 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xd87530abc9fc8832);
            default Caption = LocText("TEXT_WIP_ARTOQVD_20241220_135027_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_139285);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8833), EConversationDebugInfo::Executing);
                // I don't trust him. 
                Hero.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135027_3984"));
                DC(int64(0xd87530abc9fc8833), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc883f), EConversationDebugInfo::Executing);
                
                // I see. 
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135038"));
                DC(int64(0xd87530abc9fc883f), EConversationDebugInfo::Done);
                DC(int64(0xd87530abc9fc8840), EConversationDebugInfo::Executing);
                // All right, I'll give this some thought. Thanks for your ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_135142"));
                DC(int64(0xd87530abc9fc8840), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_CompletedThreat);
            }
        }
        
        
        class UChoiceLee118575 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe03daa3efbc91dd0);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Lee_118165);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Lee_118515);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Lee_139122);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Lee_139142);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Lee_139285);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd87530abc9fc8816), EConversationDebugInfo::Executing);
                // Here's your pay. I'll let you know if anything else ...
                Lee.AI.Say(LocText("TEXT_WIP_ARTOQVD_20241220_133945"));
                DC(int64(0xd87530abc9fc8816), EConversationDebugInfo::Done);
                DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Executing);
                Lee.AddItemToInventory(UItMi_Orenugget, 100);
                DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c5b), EConversationDebugInfo::Executing);
                Hero.GiveExperience(1000);
                DC(int64(0xe03daa3efbc91c5b), EConversationDebugInfo::Done);
                DC(int64(0xe03daa3efbc91c64), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_REPORT.SucceedQuest();
                DC(int64(0xe03daa3efbc91c64), EConversationDebugInfo::Done);
                DC(int64(0x56529d3224c7331a), EConversationDebugInfo::Executing);
                Lee.AI.GiveItemTo(Hero, UItMi_Orenugget, 100);
                DC(int64(0x56529d3224c7331a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee147673 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x5a3be527244faa93);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLee147673);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2141), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded());
                    DB(int64(0x9720fc4dba61836a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570b7), Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                    DB(int64(0x8840daf1ff7c2140), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning());
                    DB(int64(0x9720fc4dba61836b), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570cc), Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5a3be527244faa89), EConversationDebugInfo::Executing);
                // No time. Talk to Saturas.
                Lee.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_091904_41"));
                DC(int64(0x5a3be527244faa89), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee149223 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x943dbf1f6b4dce9d);
            default Caption = LocText("TEXT_WIP_WNZVQKH_20250202_214905");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeDamnpast);
            default Rules.HideIfKnows(UChoiceLee149223);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x943dbf1f6b4dce92), EConversationDebugInfo::Executing);
                
                // I could use a beer too.
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_214905"));
                DC(int64(0x943dbf1f6b4dce92), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dce93), EConversationDebugInfo::Executing);
                
                // Is that so.
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_214905_41"));
                DC(int64(0x943dbf1f6b4dce93), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dce9f), EConversationDebugInfo::Executing);
                // You're such a strange man, you know that? Just a few ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_214921"));
                DC(int64(0x943dbf1f6b4dce9f), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcea0), EConversationDebugInfo::Executing);
                // Tell me, and don't lie. What are you after? Most guys in ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215008"));
                DC(int64(0x943dbf1f6b4dcea0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_BackStory);
                Subdialog(
                    UTopic_Lee_149865,
                    UTopic_Lee_149885,
                    UTopic_Lee_149907
                );
                DC(int64(0x6c4519adbe1dd4f5), EConversationDebugInfo::Executing);
                // Here. Have one. It's on me.
                Lee.AI.Say(LocText("SLD_700_LEE_DAMNPAST_INFO_08_09"));
                DC(int64(0x6c4519adbe1dd4f5), EConversationDebugInfo::Done);
                DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Executing);
                Lee.AddItemToInventory(UItFo_Potion_Beer, 1);
                DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Done);
                DC(int64(0x6c4519adbe1dd500), EConversationDebugInfo::Executing);
                Lee.AI.GiveItemTo(Hero, UItFo_Potion_Beer, 1);
                DC(int64(0x6c4519adbe1dd500), EConversationDebugInfo::Done);
                DC(int64(0x1fd7cc0387a7bc1c), EConversationDebugInfo::Executing);
                RequestCameraReverseShot();
                DC(int64(0x1fd7cc0387a7bc1c), EConversationDebugInfo::Done);
                DC(int64(0x1fd7cc0387a7bc1e), EConversationDebugInfo::Executing);
                Hero.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                DC(int64(0x1fd7cc0387a7bc1e), EConversationDebugInfo::Done);
                DC(int64(0x1fd7cc0387a7bc20), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItFo_Potion_Beer, 1, 0);
                DC(int64(0x1fd7cc0387a7bc20), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf10), EConversationDebugInfo::Executing);
                // They ever told you why they call me "General" Lee?
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215745"));
                DC(int64(0x943dbf1f6b4dcf10), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf11), EConversationDebugInfo::Executing);
                
                // Because you used to be one.
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215815"));
                DC(int64(0x943dbf1f6b4dcf11), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf12), EConversationDebugInfo::Executing);
                
                // Sounds kind of obvious when you say it like that. 
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215823"));
                DC(int64(0x943dbf1f6b4dcf12), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf13), EConversationDebugInfo::Executing);
                // But yeah, I was. A damn good one at that. Served right ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215839"));
                DC(int64(0x943dbf1f6b4dcf13), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf14), EConversationDebugInfo::Executing);
                // At least that's what I thought. You know, one of my ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215918"));
                DC(int64(0x943dbf1f6b4dcf14), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88afd), EConversationDebugInfo::Executing);
                // Even that the war against the orcs was going VERY badly. 
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_110519"));
                DC(int64(0xab9fc080c4a88afd), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf16), EConversationDebugInfo::Executing);
                
                // And the king didn't like that?
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_220004"));
                DC(int64(0x943dbf1f6b4dcf16), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf17), EConversationDebugInfo::Executing);
                
                // No. I guess he was afraid I'd undercut his authority.
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_220016"));
                DC(int64(0x943dbf1f6b4dcf17), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf18), EConversationDebugInfo::Executing);
                // So he sent me and some of my best men to the front, into ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_220051"));
                DC(int64(0x943dbf1f6b4dcf18), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88afe), EConversationDebugInfo::Executing);
                // Many good soldiers died that day. I made it, but Rhobar ...
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_110708"));
                DC(int64(0xab9fc080c4a88afe), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88b01), EConversationDebugInfo::Executing);
                // He was gonna string me up first, but I guess he figured ...
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_110900"));
                DC(int64(0xab9fc080c4a88b01), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lee_150585,
                    UTopic_Lee_150605,
                    UTopic_Lee_150950
                );
                DC(int64(0xab9fc080c4a88b2a), EConversationDebugInfo::Executing);
                // One day, I'm getting out of here. And I'll make him pay.
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111035"));
                DC(int64(0xab9fc080c4a88b2a), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88b2b), EConversationDebugInfo::Executing);
                // All of them. 
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111045"));
                DC(int64(0xab9fc080c4a88b2b), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf1b), EConversationDebugInfo::Executing);
                // (deep sigh, returns to the present moment) Ah, well. ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_220155"));
                DC(int64(0x943dbf1f6b4dcf1b), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf1c), EConversationDebugInfo::Executing);
                // Stay alive, will you? 
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_220246"));
                DC(int64(0x943dbf1f6b4dcf1c), EConversationDebugInfo::Done);
                DC(int64(0x9c096e8facaf9c56), EConversationDebugInfo::Executing);
                Lee.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Lee_700_Start);
                DC(int64(0x9c096e8facaf9c56), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_149865 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x943dbf1f6b4dcead);
            default Caption = LocText("TEXT_WIP_WNZVQKH_20250202_215403_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_149865);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x943dbf1f6b4dceae), EConversationDebugInfo::Executing);
                // I just wanna get out of here.
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215403_2238"));
                DC(int64(0x943dbf1f6b4dceae), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcecb), EConversationDebugInfo::Executing);
                
                // So you do. But unlike most, you're actually willing to ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215512"));
                DC(int64(0x943dbf1f6b4dcecb), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcecc), EConversationDebugInfo::Executing);
                // I respect that.
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215537"));
                DC(int64(0x943dbf1f6b4dcecc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_149885 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x943dbf1f6b4dceb1);
            default Caption = LocText("TEXT_WIP_WNZVQKH_20250202_215403_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_149885);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x943dbf1f6b4dceb2), EConversationDebugInfo::Executing);
                
                // Honestly, I don't think about it that much. 
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215403_2785"));
                DC(int64(0x943dbf1f6b4dceb2), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcecd), EConversationDebugInfo::Executing);
                
                // (snorts) I had a hunch you'd say that. 
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215550"));
                DC(int64(0x943dbf1f6b4dcecd), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcece), EConversationDebugInfo::Executing);
                // Maybe I should try that from time to time. You know - ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215557"));
                DC(int64(0x943dbf1f6b4dcece), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_149907 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0x943dbf1f6b4dcebe);
            default Caption = LocText("TEXT_WIP_WNZVQKH_20250202_215406_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_149907);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x943dbf1f6b4dcebf), EConversationDebugInfo::Executing);
                
                // Guess I just like the thrill of it. 
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215406_3436"));
                DC(int64(0x943dbf1f6b4dcebf), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dcf05), EConversationDebugInfo::Executing);
                
                // A death chaser, then. Interesting - didn't peg you for ...
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_215652"));
                DC(int64(0x943dbf1f6b4dcf05), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_150585 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xab9fc080c4a88b18);
            default Caption = LocText("TEXT_WIP_XNZVQKH_20250203_111005_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_150585);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab9fc080c4a88b19), EConversationDebugInfo::Executing);
                
                // Sorry to hear that.
                Hero.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111005_41"));
                DC(int64(0xab9fc080c4a88b19), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88b29), EConversationDebugInfo::Executing);
                
                // Don't be.
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111017"));
                DC(int64(0xab9fc080c4a88b29), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_150605 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xab9fc080c4a88b1c);
            default Caption = LocText("TEXT_WIP_XNZVQKH_20250203_111005_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_150605);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab9fc080c4a88b1d), EConversationDebugInfo::Executing);
                
                // Kings hate it when you tell them the truth.
                Hero.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111005_2238"));
                DC(int64(0xab9fc080c4a88b1d), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88b2c), EConversationDebugInfo::Executing);
                
                // They do. And I was a fool to think he was the exception.
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111121"));
                DC(int64(0xab9fc080c4a88b2c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lee_150950 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xab9fc080c4a88b2d);
            default Caption = LocText("TEXT_WIP_XNZVQKH_20250203_111139_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lee_150950);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xab9fc080c4a88b2e), EConversationDebugInfo::Executing);
                
                // Tough luck.
                Hero.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111139_1924"));
                DC(int64(0xab9fc080c4a88b2e), EConversationDebugInfo::Done);
                DC(int64(0xab9fc080c4a88b3a), EConversationDebugInfo::Executing);
                
                // (amused) One way to put it.
                Lee.AI.Say(LocText("TEXT_WIP_XNZVQKH_20250203_111205"));
                DC(int64(0xab9fc080c4a88b3a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLee232017 : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xe8710df756e2e4b6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceLee232017);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_SMALLTALK_23", 1500.0f, int64(0xe8710df756e2e4b6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc894ae7b93277c71), Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning());
                    DB(int64(0x41e5590be84700ab), Lee != nullptr && Lee.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Lee_700_Start));
                }
                
                if (Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC != nullptr && !Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC.IsRunning())
                    return false;
                
                if (Lee != nullptr && !Lee.HasAssignedDailyRoutine(UDailyRoutine_NC_SLD_Lee_700_Start))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_SecondChance);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BANNEDFROMOC, Document::UDocumentSegment_CH4_BANNEDFROMOC_Test);
                DB(int64(0xe8710df756e2e509), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                {
                    DC(int64(0xb7edd93d6a449440), EConversationDebugInfo::Executing);
                    // Look who it is. The prodigal warder. 
                    Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194055"));
                    DC(int64(0xb7edd93d6a449440), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe8710df756e2e435), EConversationDebugInfo::Executing);
                    // Look who it is. 
                    Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_153505_686"));
                    DC(int64(0xe8710df756e2e435), EConversationDebugInfo::Done);
                }
                DC(int64(0xc894ae7b93277c72), EConversationDebugInfo::Executing);
                // I didn't know about the attack.
                Hero.AI.Say(LocText("SLD_700_LEE_CHANGESIDE_INFO_15_01"));
                DC(int64(0xc894ae7b93277c72), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449442), EConversationDebugInfo::Executing);
                
                // I figured. And before you tell me, I know about the Fire ...
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194231"));
                DC(int64(0xb7edd93d6a449442), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449441), EConversationDebugInfo::Executing);
                // I'm surprised Gomez spared you.
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194124"));
                DC(int64(0xb7edd93d6a449441), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449443), EConversationDebugInfo::Executing);
                
                // He wasn't planning to - someone talked him out of it. ...
                Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194709"));
                DC(int64(0xb7edd93d6a449443), EConversationDebugInfo::Done);
                DC(int64(0x75fa2e972a7e5258), EConversationDebugInfo::Executing);
                
                // So I've heard. All right, I'll cut to the chase. You can ...
                Lee.AI.Say(LocText("TEXT_WIP_CPPCYMI_20250123_144550"));
                DC(int64(0x75fa2e972a7e5258), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449444), EConversationDebugInfo::Executing);
                
                // Just like that?
                Hero.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194819"));
                DC(int64(0xb7edd93d6a449444), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c74), EConversationDebugInfo::Executing);
                
                // No, not "just like that." Do you really think we weren't ...
                Lee.AI.Say(LocText("SLD_700_LEE_CHANGESIDE_INFO_08_03"));
                DC(int64(0xc894ae7b93277c74), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449445), EConversationDebugInfo::Executing);
                // You attract trouble, that much I knew ever since your ...
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_194847"));
                DC(int64(0xb7edd93d6a449445), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c75), EConversationDebugInfo::Executing);
                // But still. You helped with the focus stones, Gomez ...
                Lee.AI.Say(LocText("SLD_700_LEE_CHANGESIDE_INFO_08_04"));
                DC(int64(0xc894ae7b93277c75), EConversationDebugInfo::Done);
                DC(int64(0xb7edd93d6a449446), EConversationDebugInfo::Executing);
                // There's one thing I want you to do for me. Do that, and ...
                Lee.AI.Say(LocText("TEXT_WIP_BPBBQAJ_20240613_195028"));
                DC(int64(0xb7edd93d6a449446), EConversationDebugInfo::Done);
                DC(int64(0xc99858765b70a805), EConversationDebugInfo::Executing);
                G1R.Lee_SldPossible = 1;
                DC(int64(0xc99858765b70a805), EConversationDebugInfo::Done);
                DC(int64(0x6c528962981e99cc), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER4_BANNEDFROMOC_BANNEDFROMOC_OBJ_ASKLEE.SucceedQuest();
                DC(int64(0x6c528962981e99cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld700LeeDamnpast : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c4e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSld700LeeDamnpast);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_NC_GUARD_11", 1000.0f, int64(0xc894ae7b93277c4e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc894ae7b93277c4f), G1R.Saturas_BringFoci == 5);
                    DB(int64(0xc894ae7b93277c50), Hero != nullptr && Hero.IsCloseToCharacter(Lee, 1000.0f));
                }
                
                if (G1R.Saturas_BringFoci != 5)
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lee, 1000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c53), EConversationDebugInfo::Executing);
                // Who - oh. Hey.
                Lee.AI.Say(LocText("SLD_700_LEE_DAMNPAST_INFO_08_02"));
                DC(int64(0xc894ae7b93277c53), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dce87), EConversationDebugInfo::Executing);
                
                // What are you doing out here?
                Hero.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_214812"));
                DC(int64(0x943dbf1f6b4dce87), EConversationDebugInfo::Done);
                DC(int64(0x943dbf1f6b4dce88), EConversationDebugInfo::Executing);
                
                // Drinking. And thinking. Bit of both.
                Lee.AI.Say(LocText("TEXT_WIP_WNZVQKH_20250202_214818"));
                DC(int64(0x943dbf1f6b4dce88), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld700LeeDefine : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c12);
            default Caption = LocText("DIA_LEE_DEFINE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeGreet);
            default Rules.HideIfKnows(UChoiceSld700LeeDefine);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c13), EConversationDebugInfo::Executing);
                
                // What do you guys do? What's your "mission?"
                Hero.AI.Say(LocText("DIA_LEE_DEFINE_15_00"));
                DC(int64(0xc894ae7b93277c13), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c14), EConversationDebugInfo::Executing);
                
                // Simple: protect the nuggets, protect the mages.
                Lee.AI.Say(LocText("DIA_LEE_DEFINE_08_01"));
                DC(int64(0xc894ae7b93277c14), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c15), EConversationDebugInfo::Executing);
                // From time to time, they might have a special assignment ...
                Lee.AI.Say(LocText("DIA_LEE_DEFINE_08_02"));
                DC(int64(0xc894ae7b93277c15), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld700LeeExit : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c0d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c0e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc894ae7b93277c0e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld700LeeFmtaken : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c5f);
            default Caption = LocText("DIA_LEE_FMTAKEN_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc894ae7b93277c61), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasSucceeded());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c62), EConversationDebugInfo::Executing);
                // What do you make of the raid?
                Hero.AI.Say(LocText("DIA_LEE_FMTAKEN_15_00"));
                DC(int64(0xc894ae7b93277c62), EConversationDebugInfo::Done);
                DB(int64(0xc894ae7b93277c64), G1R.Lee_freeminereport == 0);
                
                if (G1R.Lee_freeminereport == 0)
                {
                    DC(int64(0xc894ae7b93277c65), EConversationDebugInfo::Executing);
                    // Well, it was bound to happen someday. Now we make sure ...
                    Lee.AI.Say(LocText("DIA_LEE_FMTAKEN_08_01"));
                    DC(int64(0xc894ae7b93277c65), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_700_lee_fmtaken_exit_1");
                }
                else
                {
                    DC(int64(0xe0e28b2386f5e312), EConversationDebugInfo::Executing);
                    // Well, it was bound to happen someday. 
                    Lee.AI.Say(LocText("TEXT_WIP_MGTRMXB_20240926_154613"));
                    DC(int64(0xe0e28b2386f5e312), EConversationDebugInfo::Done);
                    DC(int64(0xc894ae7b93277c67), EConversationDebugInfo::Executing);
                    // And thankfully, you, Gorn, and Cord made sure they paid ...
                    Lee.AI.Say(LocText("SLD_700_LEE_CHANGESIDE_INFO_08_02"));
                    DC(int64(0xc894ae7b93277c67), EConversationDebugInfo::Done);
                    DC(int64(0xc553335a7bc73b49), EConversationDebugInfo::Executing);
                    // Speaking of - here, you have earned this. It'll come in ...
                    Lee.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_101157"));
                    DC(int64(0xc553335a7bc73b49), EConversationDebugInfo::Done);
                    DC(int64(0xc553335a7bc73b53), EConversationDebugInfo::Executing);
                    
                    // Thanks.
                    Hero.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_101307"));
                    DC(int64(0xc553335a7bc73b53), EConversationDebugInfo::Done);
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Executing);
                    Lee.AddItemToInventory(UItMw_2H_Axe_Old_01, 1);
                    DC(int64(0xac5a933a2de4becd), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c74), EConversationDebugInfo::Executing);
                    Lee.AI.GiveItemTo(Hero, UItMw_2H_Axe_Old_01, 1);
                    DC(int64(0x9c096e8facaf9c74), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c76), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(500);
                    DC(int64(0x9c096e8facaf9c76), EConversationDebugInfo::Done);
                    DC(int64(0x9c096e8facaf9c78), EConversationDebugInfo::Executing);
                    G1R.Lee_freeminereport = 0;
                    DC(int64(0x9c096e8facaf9c78), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_700_lee_fmtaken_exit_2");
                }
            }
        }
        
        
        class UChoiceSld700LeeGreet : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c0f);
            default Caption = LocText("DIA_LEE_GREET_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld700LeeGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c10), EConversationDebugInfo::Executing);
                // You're the boss of the mercs, aren't you?
                Hero.AI.Say(LocText("DIA_LEE_GREET_15_00"));
                DC(int64(0xc894ae7b93277c10), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c11), EConversationDebugInfo::Executing);
                
                // That's right. 
                Lee.AI.Say(LocText("DIA_LEE_GREET_08_01"));
                DC(int64(0xc894ae7b93277c11), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_Introduction);
            }
        }
        
        
        class UChoiceSld700LeeMitmachen : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c16);
            default Caption = LocText("DIA_LEE_MITMACHEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeGreet);
            default Rules.HideIfKnows(UChoiceSld700LeeMitmachen);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc894ae7b93277c17), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c19), EConversationDebugInfo::Executing);
                // I want to join you.
                Hero.AI.Say(LocText("DIA_LEE_MITMACHEN_15_00"));
                DC(int64(0xc894ae7b93277c19), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c1a), EConversationDebugInfo::Executing);
                
                // You've got some nerve ... you think I hire every fool ...
                Lee.AI.Say(LocText("DIA_LEE_MITMACHEN_08_01"));
                DC(int64(0xc894ae7b93277c1a), EConversationDebugInfo::Done);
                DC(int64(0xc894ae7b93277c1b), EConversationDebugInfo::Executing);
                // I only want the best of the best. Maybe join Lares' gang ...
                Lee.AI.Say(LocText("DIA_LEE_MITMACHEN_08_02"));
                DC(int64(0xc894ae7b93277c1b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_BecomeMercenary);
            }
        }
        
        
        class UChoiceSld700LeeNowready : UTopic_Hero__NC_SLD_LEE_700
        {
            default DebugId = int64(0xc894ae7b93277c1c);
            default Caption = LocText("DIA_LEE_NOWREADY_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld700LeeGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x230173bf27565644), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0xc99858765b70a3d4), G1R.Lee_SldPossible == 0);
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return false;
                
                if (G1R.Lee_SldPossible != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc894ae7b93277c1e), EConversationDebugInfo::Executing);
                // I want to become a mercenary. Am I ready?
                Hero.AI.Say(LocText("DIA_LEE_NOWREADY_15_00"));
                DC(int64(0xc894ae7b93277c1e), EConversationDebugInfo::Done);
                DB(int64(0xc894ae7b93277c2a), Hero.GetLevelAttribute() < 10);
                
                if (Hero.GetLevelAttribute() < 10)
                {
                    DC(int64(0xc894ae7b93277c2b), EConversationDebugInfo::Executing);
                    // You're still way too green. Get a better grip on the ...
                    Lee.AI.Say(LocText("DIA_LEE_NOWREADY_08_01"));
                    DC(int64(0xc894ae7b93277c2b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_BecomeMercenary);
                    
                    Other.Remember(n"choice_sld_700_lee_nowready_exit_1");
                }
                else
                {
                    DC(int64(0xc99858765b70a2ab), EConversationDebugInfo::Executing);
                    G1R.Lee_HeroProgression = 0;
                    DC(int64(0xc99858765b70a2ab), EConversationDebugInfo::Done);
                    DB(int64(0xc99858765b70a2d2), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    
                    if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    {
                        DC(int64(0xc99858765b70a2da), EConversationDebugInfo::Executing);
                        G1R.Lee_HeroProgression += 1;
                        DC(int64(0xc99858765b70a2da), EConversationDebugInfo::Done);
                    }
                    DB(int64(0x2b23ba49d8edeb2a), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    
                    if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    {
                        DC(int64(0xc99858765b70a32e), EConversationDebugInfo::Executing);
                        G1R.Lee_HeroProgression += 1;
                        DC(int64(0xc99858765b70a32e), EConversationDebugInfo::Done);
                    }
                    DB(int64(0xc99858765b70a337), G1R.Lee_HeroProgression == 1);
                    DB(int64(0xc99858765b70a33d), G1R.Lee_HeroProgression == 2);
                    
                    if (G1R.Lee_HeroProgression == 1)
                    {
                        DC(int64(0xc894ae7b93277c21), EConversationDebugInfo::Executing);
                        // Hmm ... I heard about that stunt you pulled in the Old ...
                        Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLD_INFO_08_01"));
                        DC(int64(0xc894ae7b93277c21), EConversationDebugInfo::Done);
                        DC(int64(0xc894ae7b93277c22), EConversationDebugInfo::Executing);
                        // I'm still not sure why you'd help the Loons, but it does ...
                        Lee.AI.Say(LocText("SLD_700_LEE_BECOMESLD_INFO_08_02"));
                        DC(int64(0xc894ae7b93277c22), EConversationDebugInfo::Done);
                        DC(int64(0xc190f77f097df119), EConversationDebugInfo::Executing);
                        // Still, that ain't enough just yet. Keep at it. 
                        Lee.AI.Say(LocText("TEXT_WIP_EIYYDND_20241129_150705"));
                        DC(int64(0xc190f77f097df119), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_700_lee_nowready_exit_2");
                    }
                    else if (G1R.Lee_HeroProgression == 2)
                    {
                        DC(int64(0xc99858765b70a34c), EConversationDebugInfo::Executing);
                        // Word is, you were behind the schism of the Swamp Camp. ...
                        Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_112951_41"));
                        DC(int64(0xc99858765b70a34c), EConversationDebugInfo::Done);
                        DC(int64(0xc190f77f097df11a), EConversationDebugInfo::Executing);
                        
                        // I guess that's one way to put it.
                        Hero.AI.Say(LocText("TEXT_WIP_EIYYDND_20241129_150849"));
                        DC(int64(0xc190f77f097df11a), EConversationDebugInfo::Done);
                        DC(int64(0xc99858765b70a3b7), EConversationDebugInfo::Executing);
                        
                        // Hmm...well, in that case, I'm willing to give you a ...
                        Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_113746"));
                        DC(int64(0xc99858765b70a3b7), EConversationDebugInfo::Done);
                        DC(int64(0x9c096e8facaf9c96), EConversationDebugInfo::Executing);
                        G1R.Lee_SldPossible = 1;
                        DC(int64(0x9c096e8facaf9c96), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_700_lee_nowready_exit_3");
                    }
                    else
                    {
                        DC(int64(0x2b23ba49d8edeb36), EConversationDebugInfo::Executing);
                        // You're strong enough, but I don't know enough about you ...
                        Lee.AI.Say(LocText("TEXT_WIP_NWCJMDN_20241128_110802"));
                        DC(int64(0x2b23ba49d8edeb36), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_LEE, Document::UDocumentSegment_Glossary_NC_SLD_LEE_BecomeMercenary);
                        DC(int64(0xc99858765b70a366), EConversationDebugInfo::Executing);
                        G1R.Lee_HeroProgression = 0;
                        DC(int64(0xc99858765b70a366), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_700_lee_nowready_exit_4");
                    }
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */