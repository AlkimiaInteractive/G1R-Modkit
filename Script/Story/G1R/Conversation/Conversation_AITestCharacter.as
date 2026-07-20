#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_AITESTCHARACTER : UConversationCharacterSettings
        {
            default ForCharacter = n"AITESTCHARACTER";
        }
        
        
        class UTopic_Hero__AITESTCHARACTER : UG1RDialogTopic
        {
            default ForCharacter = n"AITESTCHARACTER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTestCharacter() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UTest_Learn_1h_Master : UTopic_Hero__AITESTCHARACTER
        {
            default DebugId = int64(0x32da0e597d585e55);
            default Caption = LocText("TEXT_ANDRETAULIEN_20231005_115800_2826");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x32da0e597d59a934), EConversationDebugInfo::Executing);
                // Learn Melee 1H Master
                Hero.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115818"));
                DC(int64(0x32da0e597d59a934), EConversationDebugInfo::Done);
                DB(int64(0x32da0e597d5966f0), Hero != nullptr && !Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                DB(int64(0x32da0e597d5966f3), Hero != nullptr && !Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master));
                
                if (Hero != nullptr && !Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                {
                    DC(int64(0x32da0e597d5966f2), EConversationDebugInfo::Executing);
                    // Not enough ore!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115518_1924"));
                    DC(int64(0x32da0e597d5966f2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Master_exit_1");
                }
                else if (Hero != nullptr && !Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Master))
                {
                    DC(int64(0x32da0e597d5966f5), EConversationDebugInfo::Executing);
                    // Not enough Skillpoints!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115555_2785"));
                    DC(int64(0x32da0e597d5966f5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Master_exit_2");
                }
                else
                {
                    DC(int64(0x32da0e597d5966f6), EConversationDebugInfo::Executing);
                    // Ok!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115613"));
                    DC(int64(0x32da0e597d5966f6), EConversationDebugInfo::Done);
                    DC(int64(0x32da0e597d5966f8), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Master);
                    DC(int64(0x32da0e597d5966f8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Master_exit_3");
                }
            }
        }
        
        
        class UTest_Learn_1h_Trained : UTopic_Hero__AITESTCHARACTER
        {
            default DebugId = int64(0x32da0e597d585e55);
            default Caption = LocText("TEXT_ANDRETAULIEN_20231005_115121_41");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x32da0e597d585e53), EConversationDebugInfo::Executing);
                // Learn Melee 1H Trained
                Hero.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115121_41"));
                DC(int64(0x32da0e597d585e53), EConversationDebugInfo::Done);
                DB(int64(0x32da0e597d5966f0), Hero != nullptr && !Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                DB(int64(0x32da0e597d5966f3), Hero != nullptr && !Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained));
                
                if (Hero != nullptr && !Hero.HasEnoughOreToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                {
                    DC(int64(0x32da0e597d5966f2), EConversationDebugInfo::Executing);
                    // Not enough ore!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115518_1924"));
                    DC(int64(0x32da0e597d5966f2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Trained_exit_1");
                }
                else if (Hero != nullptr && !Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Melee_OneHanded_Trained))
                {
                    DC(int64(0x32da0e597d5966f5), EConversationDebugInfo::Executing);
                    // Not enough Skillpoints!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115555_2785"));
                    DC(int64(0x32da0e597d5966f5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Trained_exit_2");
                }
                else
                {
                    DC(int64(0x32da0e597d5966f6), EConversationDebugInfo::Executing);
                    // Ok!
                    TestCharacter.AI.Say(LocText("TEXT_ANDRETAULIEN_20231005_115613"));
                    DC(int64(0x32da0e597d5966f6), EConversationDebugInfo::Done);
                    DC(int64(0x32da0e597d5966f8), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Melee_OneHanded_Trained);
                    DC(int64(0x32da0e597d5966f8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_Test_Learn_1h_Trained_exit_3");
                }
            }
        }
        
        
        class UChoiceTestcharacter77167 : UTopic_Hero__AITESTCHARACTER
        {
            default DebugId = int64(0x32da0e597d585e51);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x32da0e597d585e50), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x32da0e597d585e50), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */