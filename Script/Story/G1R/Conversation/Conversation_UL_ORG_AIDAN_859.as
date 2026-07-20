#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_AIDAN_859 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_AIDAN_859";
        }
        
        
        class UTopic_Hero__UL_ORG_AIDAN_859 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_AIDAN_859";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetAidan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceAidanExit : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f0042d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b51c76e79f0042e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6b51c76e79f0042e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceAidanHello : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f0042f);
            default Caption = LocText("TEXT_WIP_CDCKZPD_20241107_123820");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceAidanHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb3c6), EConversationDebugInfo::Executing);
                // What are you doing out here?
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_123820"));
                DC(int64(0xa7deef969d1cb3c6), EConversationDebugInfo::Done);
                DC(int64(0x6b51c76e79f00431), EConversationDebugInfo::Executing);
                
                // Take a guess. 
                Aidan.AI.Say(LocText("DIA_AIDAN_HELLO_13_01"));
                DC(int64(0x6b51c76e79f00431), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_AIDAN, Document::UDocumentSegment_Glossary_UL_ORG_AIDAN_Introduction);
                Subdialog(
                    UTopic_Aidan_106908,
                    UTopic_Aidan_106928,
                    UTopic_Aidan_106950
                );
                DC(int64(0xa7deef969d1cb3c8), EConversationDebugInfo::Executing);
                // I hunt animals and sell their meat, skins, and teeth. 
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_123931"));
                DC(int64(0xa7deef969d1cb3c8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Aidan_106908 : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0xa7deef969d1cb3cc);
            default Caption = LocText("TEXT_WIP_CDCKZPD_20241107_124203_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Aidan_106908);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb3cd), EConversationDebugInfo::Executing);
                
                // You hunt.
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124203_41"));
                DC(int64(0xa7deef969d1cb3cd), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3d8), EConversationDebugInfo::Executing);
                
                // You win the prize. 
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124338"));
                DC(int64(0xa7deef969d1cb3d8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Aidan_106928 : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0xa7deef969d1cb3d0);
            default Caption = LocText("TEXT_WIP_CDCKZPD_20241107_124203_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Aidan_106928);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb3d1), EConversationDebugInfo::Executing);
                
                // You're a highwayman. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124203_2238"));
                DC(int64(0xa7deef969d1cb3d1), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3d9), EConversationDebugInfo::Executing);
                
                // There isn't much opportunity for highwaymanning around ...
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124347"));
                DC(int64(0xa7deef969d1cb3d9), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3da), EConversationDebugInfo::Executing);
                // And I don't like what Lares is doing lately, robbing all ...
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124521"));
                DC(int64(0xa7deef969d1cb3da), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3db), EConversationDebugInfo::Executing);
                // This place is pisshole enough as it is. The last thing ...
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124609"));
                DC(int64(0xa7deef969d1cb3db), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3dd), EConversationDebugInfo::Executing);
                // Anyway, to answer your question, I'm a hunter. 
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124658"));
                DC(int64(0xa7deef969d1cb3dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Aidan_106950 : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0xa7deef969d1cb3d4);
            default Caption = LocText("TEXT_WIP_CDCKZPD_20241107_124220_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Aidan_106950);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb3d5), EConversationDebugInfo::Executing);
                
                // You wanted to get away from all this shit. 
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124220_1924"));
                DC(int64(0xa7deef969d1cb3d5), EConversationDebugInfo::Done);
                DC(int64(0xa7deef969d1cb3dc), EConversationDebugInfo::Executing);
                
                // Ha. Yes, I suppose that's part of it. But mostly, I ...
                Aidan.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_124639"));
                DC(int64(0xa7deef969d1cb3dc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg859AidanCreatures : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f00434);
            default Caption = LocText("ORG_859_AIDAN_CREATURES_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceAidanHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained));
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained));
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained))
                    return true;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained))
                    return true;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained))
                    return true;
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b51c76e79f00435), EConversationDebugInfo::Executing);
                
                // I want to learn how to harvest animals properly. 
                Hero.AI.Say(LocText("ORG_859_AIDAN_CREATURES_15_00"));
                DC(int64(0x6b51c76e79f00435), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_AIDAN, Document::UDocumentSegment_Glossary_UL_ORG_AIDAN_Teacher);
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained));
                DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                
                if ((Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained)) || (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained)))
                {
                    DC(int64(0x6b51c76e79f00437), EConversationDebugInfo::Executing);
                    // Well, if you got the ore, I suppose I can teach you. 
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_13_01"));
                    DC(int64(0x6b51c76e79f00437), EConversationDebugInfo::Done);
                    Subdialog(
                        UChoiceOrg859AidanCreaturesZahn,
                        UChoiceOrg859AidanCreaturesFell,
                        UChoiceOrg859AidanCreaturesKralle,
                        UChoiceOrg859AidanCreaturesHaut,
                        UChoiceOrg859AidanCreaturesBack
                    );
                }
                else
                {
                    DC(int64(0x6b51c76e79f0046d), EConversationDebugInfo::Executing);
                    // You already do - there's nothing else I can teach you. 
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_TAUGHTALL_13_00"));
                    DC(int64(0x6b51c76e79f0046d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg859AidanCreaturesZahn : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f00439);
            default Caption = LocText("TEXT_CHOICE_ORG_859_AIDAN_CREATURES_ZAHN");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Teeth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Teeth_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b51c76e79f0043a), EConversationDebugInfo::Executing);
                // How do I get to the teeth?
                Hero.AI.Say(LocText("ORG_859_AIDAN_CREATURES_ZAHN_15_00"));
                DC(int64(0x6b51c76e79f0043a), EConversationDebugInfo::Done);
                DB(int64(0x6b51c76e79f0043c), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Teeth_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Teeth_Trained))
                {
                    DB(int64(0x6b51c76e79f0043e), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Teeth_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Teeth_Trained))
                    {
                        DC(int64(0x6b51c76e79f00441), EConversationDebugInfo::Executing);
                        // See, the biggest rookie mistake's using too much force ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_ZAHN_13_01"));
                        DC(int64(0x6b51c76e79f00441), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f00442), EConversationDebugInfo::Executing);
                        // Wolves, shadowstalkers, and snappers fetch the best ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_ZAHN_13_02"));
                        DC(int64(0x6b51c76e79f00442), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9e6), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Teeth_Trained);
                        DC(int64(0xd7a5751a2e65e9e6), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9fb), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd7a5751a2e65e9fb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x6b51c76e79f00444), EConversationDebugInfo::Executing);
                        // Get some more notches on your belt, then we'll talk. 
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEINE_LP_13_00"));
                        DC(int64(0x6b51c76e79f00444), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x6b51c76e79f00445), EConversationDebugInfo::Executing);
                    // Like I said, my lessons come for a price. Bring me some ...
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEIN_ERZ_13_00"));
                    DC(int64(0x6b51c76e79f00445), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg859AidanCreaturesFell : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f00446);
            default Caption = LocText("TEXT_CHOICE_ORG_859_AIDAN_CREATURES_FELL");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Fur);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b51c76e79f00447), EConversationDebugInfo::Executing);
                // How do I get the fur?
                Hero.AI.Say(LocText("ORG_859_AIDAN_CREATURES_FELL_15_00"));
                DC(int64(0x6b51c76e79f00447), EConversationDebugInfo::Done);
                DB(int64(0x6b51c76e79f00449), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Fur_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Fur_Trained))
                {
                    DB(int64(0x6b51c76e79f0044b), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Fur_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Fur_Trained))
                    {
                        DC(int64(0x6b51c76e79f0044e), EConversationDebugInfo::Executing);
                        // The main thing is, start at the front and work your way ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_FELL_13_01"));
                        DC(int64(0x6b51c76e79f0044e), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f0044f), EConversationDebugInfo::Executing);
                        // Shadowbeasts and wolves give you the best hides - ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_FELL_13_02"));
                        DC(int64(0x6b51c76e79f0044f), EConversationDebugInfo::Done);
                        DC(int64(0xded6891a3d391886), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Fur_Trained);
                        DC(int64(0xded6891a3d391886), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9fa), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd7a5751a2e65e9fa), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x6b51c76e79f00452), EConversationDebugInfo::Executing);
                        // Like I said, my lessons come for a price. Bring me some ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEIN_ERZ_13_00"));
                        DC(int64(0x6b51c76e79f00452), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x6b51c76e79f00451), EConversationDebugInfo::Executing);
                    // Get some more notches on your belt, then we'll talk. 
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEINE_LP_13_00"));
                    DC(int64(0x6b51c76e79f00451), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg859AidanCreaturesKralle : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f00453);
            default Caption = LocText("TEXT_CHOICE_ORG_859_AIDAN_CREATURES_KRALLE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Claw);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x6b51c76e79f00455), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Claw_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Claw_Trained))
                {
                    DB(int64(0x6b51c76e79f00457), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Claw_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Claw_Trained))
                    {
                        DC(int64(0x6b51c76e79f0045a), EConversationDebugInfo::Executing);
                        // Teach me how to pull claws.
                        Hero.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KRALLE_15_00"));
                        DC(int64(0x6b51c76e79f0045a), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f0045b), EConversationDebugInfo::Executing);
                        
                        // Ah, that's a piece of cake: just grab a pincer, grip the ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KRALLE_13_01"));
                        DC(int64(0x6b51c76e79f0045b), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f0045c), EConversationDebugInfo::Executing);
                        // Lizards, like lurkers, give the best claws. When you ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KRALLE_13_02"));
                        DC(int64(0x6b51c76e79f0045c), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9e8), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Claw_Trained);
                        DC(int64(0xd7a5751a2e65e9e8), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9f9), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd7a5751a2e65e9f9), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x6b51c76e79f0045f), EConversationDebugInfo::Executing);
                        // Like I said, my lessons come for a price. Bring me some ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEIN_ERZ_13_00"));
                        DC(int64(0x6b51c76e79f0045f), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x6b51c76e79f0045e), EConversationDebugInfo::Executing);
                    // Get some more notches on your belt, then we'll talk. 
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEINE_LP_13_00"));
                    DC(int64(0x6b51c76e79f0045e), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg859AidanCreaturesHaut : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0x6b51c76e79f00460);
            default Caption = LocText("TEXT_CHOICE_ORG_859_AIDAN_CREATURES_HAUT");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Hunting_Skin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd4e50e1a3a89a383), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x6b51c76e79f00462), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Skin_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Hunting_Skin_Trained))
                {
                    DB(int64(0x6b51c76e79f00464), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Skin_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Hunting_Skin_Trained))
                    {
                        DC(int64(0x6b51c76e79f00467), EConversationDebugInfo::Executing);
                        // How about skinning reptiles? 
                        Hero.AI.Say(LocText("ORG_859_AIDAN_CREATURES_HAUT_15_00"));
                        DC(int64(0x6b51c76e79f00467), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f00468), EConversationDebugInfo::Executing);
                        
                        // Well, for starters, there aren't that many worth ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_HAUT_13_01"));
                        DC(int64(0x6b51c76e79f00468), EConversationDebugInfo::Done);
                        DC(int64(0x6b51c76e79f00469), EConversationDebugInfo::Executing);
                        // Start with a cut on both sides, then it'll peel off ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_HAUT_13_02"));
                        DC(int64(0x6b51c76e79f00469), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9ea), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Hunting_Skin_Trained);
                        DC(int64(0xd7a5751a2e65e9ea), EConversationDebugInfo::Done);
                        DC(int64(0xd7a5751a2e65e9f8), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xd7a5751a2e65e9f8), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x6b51c76e79f0046c), EConversationDebugInfo::Executing);
                        // Like I said, my lessons come for a price. Bring me some ...
                        Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEIN_ERZ_13_00"));
                        DC(int64(0x6b51c76e79f0046c), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x6b51c76e79f0046b), EConversationDebugInfo::Executing);
                    // Get some more notches on your belt, then we'll talk. 
                    Aidan.AI.Say(LocText("ORG_859_AIDAN_CREATURES_KEINE_LP_13_00"));
                    DC(int64(0x6b51c76e79f0046b), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceOrg859AidanCreaturesBack : UTopic_Hero__UL_ORG_AIDAN_859
        {
            default DebugId = int64(0xdbbcff6fd747cb99);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */