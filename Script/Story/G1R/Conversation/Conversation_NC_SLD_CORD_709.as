#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_CORD_709 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_CORD_709";
        }
        
        
        class UTopic_Hero__NC_SLD_CORD_709 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_CORD_709";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCord() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSld709CordExit : UTopic_Hero__NC_SLD_CORD_709
        {
            default DebugId = int64(0xe76d0fc02fc9eaef);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe76d0fc02fc9eaf0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe76d0fc02fc9eaf0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld709CordTrain : UTopic_Hero__NC_SLD_CORD_709
        {
            default DebugId = int64(0xe76d0fc02fc9eaf5);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_150806_472");
            default PriorityRank = 1;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld709CordTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2330b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                    DB(int64(0x1a491ba842e9958c), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe76d0fc02fc9eaf7), EConversationDebugInfo::Executing);
                // I want to become a better fighter.
                Hero.AI.Say(LocText("SLD_709_CORD_TRAIN_INFO_15_00"));
                DC(int64(0xe76d0fc02fc9eaf7), EConversationDebugInfo::Done);
                DB(int64(0xe76d0fc02fc9eaf9), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                {
                    DB(int64(0x1dfe82dfe349ab3a), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                    {
                        DC(int64(0xa7deef969d1cb52a), EConversationDebugInfo::Executing);
                        // Good choice. Much of it comes down to posture. Some ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153724"));
                        DC(int64(0xa7deef969d1cb52a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb52b), EConversationDebugInfo::Executing);
                        // For the fight itself, momentum is the key. Don't stop ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153743"));
                        DC(int64(0xa7deef969d1cb52b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb52c), EConversationDebugInfo::Executing);
                        // You can also use your sword to parry. If your opponent ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153746"));
                        DC(int64(0xa7deef969d1cb52c), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb52d), EConversationDebugInfo::Executing);
                        // What else ... uh, right. When you're about to swing, but ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153750"));
                        DC(int64(0xa7deef969d1cb52d), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb52e), EConversationDebugInfo::Executing);
                        // Finally, some blows do more damage than the others. ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153756"));
                        DC(int64(0xa7deef969d1cb52e), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb530), EConversationDebugInfo::Executing);
                        // But the better you get, the more often you'll land them. 
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153817"));
                        DC(int64(0xa7deef969d1cb530), EConversationDebugInfo::Done);
                        DC(int64(0xe76d0fc02fc9eb02), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Trained);
                        DC(int64(0xe76d0fc02fc9eb02), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_709_cord_train_exit_1");
                        DC(int64(0x959938528b9a0e8), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x959938528b9a0e8), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xe76d0fc02fc9eb04), EConversationDebugInfo::Executing);
                        // No nuggets, no lessons. Sorry, friend.
                        Cord.AI.Say(LocText("KDF_402_CORRISTO_HEAVYARMOR_INFO_14_03"));
                        DC(int64(0xe76d0fc02fc9eb04), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_709_cord_train_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb532), EConversationDebugInfo::Executing);
                    // You're still a bit too clumsy for the next steps, ...
                    Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153846"));
                    DC(int64(0xa7deef969d1cb532), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_709_cord_train_exit_3");
                }
            }
        }
        
        
        class UChoiceSld709CordTrainagain : UTopic_Hero__NC_SLD_CORD_709
        {
            default DebugId = int64(0xe76d0fc02fc9eb05);
            default Caption = LocText("TEXT_WIP_YJSDKDL_20241212_150806_2973");
            default PriorityRank = 1;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld709CordTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x454feea8e6c2331b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master));
                    DB(int64(0x118acb5747a17de9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Master))
                    return false;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Melee_OneHanded_Trained))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe76d0fc02fc9eb07), EConversationDebugInfo::Executing);
                // Can you teach me some advanced fighting techniques? 
                Hero.AI.Say(LocText("SLD_709_CORD_TRAINAGAIN_INFO_15_01"));
                DC(int64(0xe76d0fc02fc9eb07), EConversationDebugInfo::Done);
                DB(int64(0xe76d0fc02fc9eb09), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                {
                    DB(int64(0x1dfe82dfe349ab4f), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                    {
                        DC(int64(0xa7deef969d1cb57c), EConversationDebugInfo::Executing);
                        // Hm. Yes, I think you're ready. You already know it's all ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155423"));
                        DC(int64(0xa7deef969d1cb57c), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb57d), EConversationDebugInfo::Executing);
                        // The next step is to create a proper sequence. You need ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155426"));
                        DC(int64(0xa7deef969d1cb57d), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb57e), EConversationDebugInfo::Executing);
                        // It's like a dance, really. Don't let your opponent even ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155434"));
                        DC(int64(0xa7deef969d1cb57e), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb57f), EConversationDebugInfo::Executing);
                        // Attacking like this won't just make it more likely ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155436"));
                        DC(int64(0xa7deef969d1cb57f), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb580), EConversationDebugInfo::Executing);
                        // Let's see, what else ... oh, of course. Ripostes. If you ...
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155439"));
                        DC(int64(0xa7deef969d1cb580), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb581), EConversationDebugInfo::Executing);
                        // Use that opportunity. 
                        Cord.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_155441"));
                        DC(int64(0xa7deef969d1cb581), EConversationDebugInfo::Done);
                        DC(int64(0xe76d0fc02fc9eb02), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Master);
                        DC(int64(0xe76d0fc02fc9eb02), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_709_cord_trainagain_exit_1");
                        DC(int64(0x959938528b9a11a), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x959938528b9a11a), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xe76d0fc02fc9eb11), EConversationDebugInfo::Executing);
                        // No nuggets, no lessons. Sorry, friend.
                        Cord.AI.Say(LocText("KDF_402_CORRISTO_HEAVYARMOR_INFO_14_03"));
                        DC(int64(0xe76d0fc02fc9eb11), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_sld_709_cord_trainagain_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x959938528b9a0fe), EConversationDebugInfo::Executing);
                    // It won't work like that. Get some more experience, then ...
                    Cord.AI.Say(LocText("TEXT_WIP_YJSDKDL_20241212_152601"));
                    DC(int64(0x959938528b9a0fe), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_709_cord_trainagain_exit_3");
                }
            }
        }
        
        
        class UChoiceSld709CordTrainoffer : UTopic_Hero__NC_SLD_CORD_709
        {
            default DebugId = int64(0xe76d0fc02fc9eaf1);
            default Caption = LocText("SLD_709_CORD_TRAINOFFER_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld709CordTrainoffer);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe76d0fc02fc9eaf3), EConversationDebugInfo::Executing);
                // You're pretty good with one-handed weapons, aren't you?
                Hero.AI.Say(LocText("SLD_709_CORD_TRAINOFFER_INFO_15_01"));
                DC(int64(0xe76d0fc02fc9eaf3), EConversationDebugInfo::Done);
                DC(int64(0xe76d0fc02fc9eaf4), EConversationDebugInfo::Executing);
                
                // If that's your way of asking if I can teach you, I can. ...
                Cord.AI.Say(LocText("SLD_709_CORD_TRAINOFFER_INFO_14_02"));
                DC(int64(0xe76d0fc02fc9eaf4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_CORD, Document::UDocumentSegment_Glossary_NC_SLD_CORD_Introduction_Teacher);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */