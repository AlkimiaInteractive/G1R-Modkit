#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_BUSTER_833 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_BUSTER_833";
        }
        
        
        class UTopic_Hero__NC_ORG_BUSTER_833 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_BUSTER_833";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBuster() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBuster215041 : UTopic_Hero__NC_ORG_BUSTER_833
        {
            default DebugId = int64(0xe1d0d96edfa301e1);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_183109");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg833Buster);
            default Rules.HideIfKnows(UChoiceBuster215041);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe1d0d96edfa301dc), EConversationDebugInfo::Executing);
                // Can Acrobatics help me move faster?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_183109"));
                DC(int64(0xe1d0d96edfa301dc), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301dd), EConversationDebugInfo::Executing);
                
                // No, that's nonsense. It's mostly about rolling, dodging ...
                Buster.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_183109_41"));
                DC(int64(0xe1d0d96edfa301dd), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301e6), EConversationDebugInfo::Executing);
                // If you want to move faster, you'll need a scavenger.
                Buster.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184029"));
                DC(int64(0xe1d0d96edfa301e6), EConversationDebugInfo::Done);
                DC(int64(0xe1d0d96edfa301e7), EConversationDebugInfo::Executing);
                // There's a guy near the old tower, not far from the camp. ...
                Buster.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_184043"));
                DC(int64(0xe1d0d96edfa301e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBuster78171 : UTopic_Hero__NC_ORG_BUSTER_833
        {
            default DebugId = int64(0xf8e1e94826260b50);
            default Caption = LocText("TEXT_WIP_ZJSDKDL_20241213_085902_1948");
            default PriorityRank = 3;
            
            default PropertyTags.AddTag(GameplayTag::Skill_Acrobatics_Trained);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg833Buster);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc78f7548a08424af), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Acrobatics));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Acrobatics);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf8e1e94826260b4e), EConversationDebugInfo::Executing);
                
                // Teach me acrobatics. 
                Hero.AI.Say(LocText("TEXT_USUARIO_20231129_121254"));
                DC(int64(0xf8e1e94826260b4e), EConversationDebugInfo::Done);
                DB(int64(0xf33d474cfc5429a), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Acrobatics));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Acrobatics))
                {
                    DB(int64(0xf1ffb8d71d2c4ad9), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Acrobatics));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Acrobatics))
                    {
                        DC(int64(0xe5368d3b2344d816), EConversationDebugInfo::Executing);
                        // Okay. The most important technique you've got to learn ...
                        Buster.AI.Say(LocText("DIA_ORG_833_BUSTER3_02_02"));
                        DC(int64(0xe5368d3b2344d816), EConversationDebugInfo::Done);
                        DC(int64(0xe5368d3b2344d817), EConversationDebugInfo::Executing);
                        // It'll also help you jump much farther. But remember, ...
                        Buster.AI.Say(LocText("DIA_ORG_833_BUSTER3_02_03"));
                        DC(int64(0xe5368d3b2344d817), EConversationDebugInfo::Done);
                        DC(int64(0xe5368d3b2344d818), EConversationDebugInfo::Executing);
                        // Oh, and of course this can also come in handy during a ...
                        Buster.AI.Say(LocText("DIA_ORG_833_BUSTER3_02_04"));
                        DC(int64(0xe5368d3b2344d818), EConversationDebugInfo::Done);
                        DC(int64(0xa1fbb8ad329a6e1), EConversationDebugInfo::Executing);
                        // Good luck, man! 
                        Buster.AI.Say(LocText("TEXT_WIP_ZUKFIKD_20241021_161100"));
                        DC(int64(0xa1fbb8ad329a6e1), EConversationDebugInfo::Done);
                        DC(int64(0xf1ffb8d71d2c4ae3), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Acrobatics);
                        DC(int64(0xf1ffb8d71d2c4ae3), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_buster_78171_exit_1");
                        DC(int64(0xf1ffb8d71d2c4ae7), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf1ffb8d71d2c4ae7), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x85cc8718da697825), EConversationDebugInfo::Executing);
                        // I will. For a price ... 
                        Buster.AI.Say(LocText("TEXT_WIP_GGNROOD_20241112_125347"));
                        DC(int64(0x85cc8718da697825), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_buster_78171_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xc78f7548a08424a5), EConversationDebugInfo::Executing);
                    // Good for you - but I can't teach you when you're not ...
                    Buster.AI.Say(LocText("TEXT_USUARIO_20231129_115507_41"));
                    DC(int64(0xc78f7548a08424a5), EConversationDebugInfo::Done);
                    DC(int64(0xa1fbb8ad329a6e2), EConversationDebugInfo::Executing);
                    // Come back later, will you? 
                    Buster.AI.Say(LocText("TEXT_WIP_ZUKFIKD_20241021_161119"));
                    DC(int64(0xa1fbb8ad329a6e2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_buster_78171_exit_3");
                }
            }
        }
        
        
        class UChoiceOrg833Buster : UTopic_Hero__NC_ORG_BUSTER_833
        {
            default DebugId = int64(0x68f606b804a4547c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg833Buster);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x68f606b804a4547d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Acrobatics));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Acrobatics);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68f606b804a4547e), EConversationDebugInfo::Executing);
                // Hey, you there! Yeah, you. You look a bit clumsy, if you ...
                Buster.AI.Say(LocText("DIA_ORG_833_BUSTER_02_01"));
                DC(int64(0x68f606b804a4547e), EConversationDebugInfo::Done);
                DC(int64(0xa1fbb8ad329a6df), EConversationDebugInfo::Executing);
                
                // How?
                Hero.AI.Say(LocText("TEXT_WIP_ZUKFIKD_20241021_160700"));
                DC(int64(0xa1fbb8ad329a6df), EConversationDebugInfo::Done);
                DC(int64(0xf8e1e94826260b53), EConversationDebugInfo::Executing);
                
                // Ever heard of acrobatics? The art of controlling your ...
                Buster.AI.Say(LocText("DIA_ORG_833_BUSTER3_02_01"));
                DC(int64(0xf8e1e94826260b53), EConversationDebugInfo::Done);
                DC(int64(0xa1fbb8ad329a6e0), EConversationDebugInfo::Executing);
                // I could teach you - for some ore, that is. 
                Buster.AI.Say(LocText("TEXT_WIP_ZUKFIKD_20241021_160719"));
                DC(int64(0xa1fbb8ad329a6e0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_BUSTER, Document::UDocumentSegment_Glossary_NC_ORG_BUSTER_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_BUSTER, Document::UDocumentSegment_Glossary_NC_ORG_BUSTER_Teacher);
            }
        }
        
        
        class UChoiceOrg833BusterExit : UTopic_Hero__NC_ORG_BUSTER_833
        {
            default DebugId = int64(0x68f606b804a4547f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x68f606b804a45480), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x68f606b804a45480), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */