#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_SCORPIO_205 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_SCORPIO_205";
        }
        
        
        class UTopic_Hero__OC_GRD_SCORPIO_205 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_SCORPIO_205";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetScorpio() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd205ScorpioBanished : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae95);
            default Caption = LocText("TEXT_WIP_NRZXSLD_20241030_145206");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd205ScorpioHeypc);
            default Rules.HideIfKnows(UChoiceGrd205ScorpioBanished);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda6465b0), EConversationDebugInfo::Executing);
                // What do you want?
                Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145206"));
                DC(int64(0x468f6c0cda6465b0), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465b1), EConversationDebugInfo::Executing);
                
                // How are things at the New Camp? Did they ... well. Did ...
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145216"));
                DC(int64(0x468f6c0cda6465b1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Scorpio_226837,
                    UTopic_Scorpio_226857,
                    UTopic_Scorpio_227399,
                    UTopic_Scorpio_227429
                );
                DC(int64(0x73ddac48ae3dae97), EConversationDebugInfo::Executing);
                // Anyway. I'm done with Gomez, Raven, and the whole ...
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_BANISHED_INFO_13_02"));
                DC(int64(0x73ddac48ae3dae97), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae98), EConversationDebugInfo::Executing);
                // Lucky for you, I snatched some good steel from the ...
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_BANISHED_INFO_13_03"));
                DC(int64(0x73ddac48ae3dae98), EConversationDebugInfo::Done);
                DB(int64(0x73ddac48ae3dae9a), G1R.Scorpio_Exile == 0);
                
                if (G1R.Scorpio_Exile == 0)
                {
                    DC(int64(0xba8e3044abddb730), EConversationDebugInfo::Executing);
                    G1R.Scorpio_Exile = 1;
                    DC(int64(0xba8e3044abddb730), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Scorpio_226837 : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x468f6c0cda6465b7);
            default Caption = LocText("TEXT_WIP_NRZXSLD_20241030_145321_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Scorpio_226837);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda6465b8), EConversationDebugInfo::Executing);
                // What's it to you? You're with Gomez. 
                Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145321_41"));
                DC(int64(0x468f6c0cda6465b8), EConversationDebugInfo::Done);
                DB(int64(0x468f6c0cda6465c6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x468f6c0cda6465cb), EConversationDebugInfo::Executing);
                    // After what happened, I'm as much with him as you are. 
                    Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145429"));
                    DC(int64(0x468f6c0cda6465cb), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x468f6c0cda6465cf), EConversationDebugInfo::Executing);
                    // Not anymore, I'm not. 
                    Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145433"));
                    DC(int64(0x468f6c0cda6465cf), EConversationDebugInfo::Done);
                }
                DC(int64(0x468f6c0cda6465d3), EConversationDebugInfo::Executing);
                // I was a warder, but I won't stand for that shit. Gomez ...
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145441"));
                DC(int64(0x468f6c0cda6465d3), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465db), EConversationDebugInfo::Executing);
                // That's why I left. Now say, what happened to the Free ...
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145539"));
                DC(int64(0x468f6c0cda6465db), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465ba), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x468f6c0cda6465ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Scorpio_226857 : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x468f6c0cda6465bb);
            default Caption = LocText("TEXT_WIP_NRZXSLD_20241030_145321_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Scorpio_226857);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x468f6c0cda6465bb));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda6465bc), EConversationDebugInfo::Executing);
                // The warders took it, but the mercs got it back.
                Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145321_2238"));
                DC(int64(0x468f6c0cda6465bc), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465f4), EConversationDebugInfo::Executing);
                
                // Ah, thank Innos.
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145714"));
                DC(int64(0x468f6c0cda6465f4), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465f6), EConversationDebugInfo::Executing);
                //  What a steaming pile of shit, that whole business. 
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145809"));
                DC(int64(0x468f6c0cda6465f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Scorpio_227399 : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x468f6c0cda6465dc);
            default Caption = LocText("TEXT_WIP_NRZXSLD_20241030_145618_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Scorpio_227399);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x468f6c0cda6465dc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda6465dd), EConversationDebugInfo::Executing);
                
                // The warders took it. 
                Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145618_3286"));
                DC(int64(0x468f6c0cda6465dd), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465f5), EConversationDebugInfo::Executing);
                
                // Ah, shit. Well, here's hoping the mercs get it back.
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145755"));
                DC(int64(0x468f6c0cda6465f5), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465f7), EConversationDebugInfo::Executing);
                //  What a steaming pile of shit, that whole business. 
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145809"));
                DC(int64(0x468f6c0cda6465f7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Scorpio_227429 : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x468f6c0cda6465ee);
            default Caption = LocText("TEXT_WIP_NRZXSLD_20241030_145700_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Scorpio_227429);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x468f6c0cda6465ef), EConversationDebugInfo::Executing);
                
                // None of your business. 
                Hero.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145700_686"));
                DC(int64(0x468f6c0cda6465ef), EConversationDebugInfo::Done);
                DC(int64(0x468f6c0cda6465ff), EConversationDebugInfo::Executing);
                
                // Hm. Don't trust me, do you? I guess I can't blame you. ...
                Scorpio.AI.Say(LocText("TEXT_WIP_NRZXSLD_20241030_145830"));
                DC(int64(0x468f6c0cda6465ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd205ScorpioCrossbow : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae81);
            default Caption = LocText("GRD_205_SCORPIO_CROSSBOW_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73ddac48ae3dae82), G1R.FireMagesDead != 0);
                    DB(int64(0x31cfd98d4dc07b97), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained));
                    DB(int64(0x90e446b1e0c70b5d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master));
                    DB(int64(0x73ddac48ae3dae83), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x31cfd98d4dc07b93), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0x31cfd98d4dc07b94), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x31cfd98d4dc07b98), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained));
                    DB(int64(0x90e446b1e0c70b6d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master));
                }
                
                if (G1R.FireMagesDead != 0 && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && G1R != nullptr && G1R.HasReachedChapter(2) && G1R != nullptr && !G1R.HasReachedChapter(4) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae84), EConversationDebugInfo::Executing);
                
                // Can you teach me something?
                Hero.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_INFO_15_01"));
                DC(int64(0x73ddac48ae3dae84), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae85), EConversationDebugInfo::Executing);
                
                // I could. I'm the best damn crossbowman in the Colony. ...
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_INFO_13_02"));
                DC(int64(0x73ddac48ae3dae85), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_SCORPIO, Document::UDocumentSegment_Glossary_OC_GRD_SCORPIO_Teacher);
                DB(int64(0xf3590eddfb1a9652), G1R != nullptr && !G1R.HasReachedChapter(5));
                DB(int64(0xf3590eddfb1a9653), G1R.LogScorpiocrossbow == 0);
                DB(int64(0xf3590eddfb1a9655), G1R != nullptr && G1R.HasReachedChapter(5));
                DB(int64(0xf3590eddfb1a9656), G1R.LogScorpiocrossbow == 0);
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5) && G1R.LogScorpiocrossbow == 0)
                {
                    DC(int64(0xba8e3044abddb75b), EConversationDebugInfo::Executing);
                    G1R.LogScorpiocrossbow = 1;
                    DC(int64(0xba8e3044abddb75b), EConversationDebugInfo::Done);
                }
                else if (G1R != nullptr && G1R.HasReachedChapter(5) && G1R.LogScorpiocrossbow == 0)
                {
                    DC(int64(0xba8e3044abddb75f), EConversationDebugInfo::Executing);
                    G1R.LogScorpiocrossbow = 1;
                    DC(int64(0xba8e3044abddb75f), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UChoiceGrd205ScorpioCrossbowOk,
                    UChoiceGrd205ScorpioCrossbowBack
                );
            }
        }
        
        
        class UChoiceGrd205ScorpioCrossbowOk : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x1e6e990b5733c3dd);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_1925");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc085e705c515cb18), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e6e990b5733c3de), EConversationDebugInfo::Executing);
                // Deal. Teach me how to handle a crossbow. 
                Hero.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_15_01"));
                DC(int64(0x1e6e990b5733c3de), EConversationDebugInfo::Done);
                DB(int64(0x1e6e990b5733c3e0), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Crossbow_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Crossbow_Trained))
                {
                    DB(int64(0xc085e705c515cb11), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Crossbow_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Crossbow_Trained))
                    {
                        DC(int64(0x1e6e990b5733c3e2), EConversationDebugInfo::Executing);
                        // Okay, let's get right into it.
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_02"));
                        DC(int64(0x1e6e990b5733c3e2), EConversationDebugInfo::Done);
                        DC(int64(0x1e6e990b5733c3e3), EConversationDebugInfo::Executing);
                        // Hold the lady steady by the front and press the stock ...
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_03"));
                        DC(int64(0x1e6e990b5733c3e3), EConversationDebugInfo::Done);
                        DC(int64(0x1e6e990b5733c3e4), EConversationDebugInfo::Executing);
                        // The first couple of days, you'll feel like your shoulder ...
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_04"));
                        DC(int64(0x1e6e990b5733c3e4), EConversationDebugInfo::Done);
                        DC(int64(0x1e6e990b5733c3e5), EConversationDebugInfo::Executing);
                        // But after a week or so, it'll be hard as a rock. 
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_05"));
                        DC(int64(0x1e6e990b5733c3e5), EConversationDebugInfo::Done);
                        DC(int64(0x1e6e990b5733c3e6), EConversationDebugInfo::Executing);
                        // Also, breathe. It's everything. Calm, and deep exhales ...
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_06"));
                        DC(int64(0x1e6e990b5733c3e6), EConversationDebugInfo::Done);
                        DC(int64(0x93da39ba6ec8d3d1), EConversationDebugInfo::Executing);
                        // Once you've let a bolt fly, don't dawdle - get right to ...
                        Scorpio.AI.Say(LocText("TEXT_WIP_AVYUJYK_20241105_201011"));
                        DC(int64(0x93da39ba6ec8d3d1), EConversationDebugInfo::Done);
                        DC(int64(0xba8e3044abddb746), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Crossbow_Trained);
                        DC(int64(0xba8e3044abddb746), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb4c), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xc085e705c515cb4c), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x1e6e990b5733c3e9), EConversationDebugInfo::Executing);
                        // Two hundred nuggets, my friend. This ain't a charity. 
                        Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW_OK_13_07"));
                        DC(int64(0x1e6e990b5733c3e9), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb0d), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xc085e705c515cb0d), EConversationDebugInfo::Done);
                        return;
                    }
                }
                else
                {
                    DC(int64(0xc085e705c515cb15), EConversationDebugInfo::Executing);
                    // Look, we both know you're not good enough yet. Get ...
                    Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_121004_41"));
                    DC(int64(0xc085e705c515cb15), EConversationDebugInfo::Done);
                    DC(int64(0xc085e705c515cb16), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xc085e705c515cb16), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceGrd205ScorpioCrossbowBack : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x1e6e990b5733c3eb);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceGrd205ScorpioCrossbow2 : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae8d);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090825_1201");
            default PriorityRank = 1;
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73ddac48ae3dae8e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained));
                    DB(int64(0xc085e705c515cb1b), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master));
                    DB(int64(0x31cfd98d4dc07b96), G1R.FireMagesDead != 0);
                    DB(int64(0x73ddac48ae3dae83), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x31cfd98d4dc07b93), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0x31cfd98d4dc07b94), G1R != nullptr && !G1R.HasReachedChapter(4));
                    DB(int64(0x31cfd98d4dc07b98), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained));
                    DB(int64(0x31cfd98d4dc07b9a), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master) && G1R.FireMagesDead != 0)
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && G1R != nullptr && G1R.HasReachedChapter(2) && G1R != nullptr && !G1R.HasReachedChapter(4) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Trained) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Crossbow_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae8f), EConversationDebugInfo::Executing);
                // I want to be even better with crossbows. 
                Hero.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW2_INFO_15_01"));
                DC(int64(0x73ddac48ae3dae8f), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae90), EConversationDebugInfo::Executing);
                
                // And I'd love to help you get there. For three hundred ...
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_CROSSBOW2_INFO_13_02"));
                DC(int64(0x73ddac48ae3dae90), EConversationDebugInfo::Done);
                DB(int64(0x31cfd98d4dc07ba0), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Crossbow_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Crossbow_Master))
                {
                    DB(int64(0x31cfd98d4dc07ba3), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Crossbow_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Crossbow_Master))
                    {
                        DC(int64(0xc085e705c515cb3f), EConversationDebugInfo::Executing);
                        // All right. I already taught you the basics: breathe, ...
                        Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_123856"));
                        DC(int64(0xc085e705c515cb3f), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb41), EConversationDebugInfo::Executing);
                        // What I haven't taught you about is wind. Always factor ...
                        Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_123906"));
                        DC(int64(0xc085e705c515cb41), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb42), EConversationDebugInfo::Executing);
                        // Sounds impossible at first, but a true master can use ...
                        Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_123914"));
                        DC(int64(0xc085e705c515cb42), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb44), EConversationDebugInfo::Executing);
                        // Last but not least, take care of your bolts. Some guys ...
                        Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_123924"));
                        DC(int64(0xc085e705c515cb44), EConversationDebugInfo::Done);
                        DC(int64(0xc085e705c515cb45), EConversationDebugInfo::Executing);
                        // A bolt that's cracked or too stiff from the cold can ...
                        Scorpio.AI.Say(LocText("TEXT_GROMEU_20231221_123929"));
                        DC(int64(0xc085e705c515cb45), EConversationDebugInfo::Done);
                        DC(int64(0xba8e3044abddb76b), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Crossbow_Master);
                        DC(int64(0xba8e3044abddb76b), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_grd_205_scorpio_crossbow2_exit_1");
                        DC(int64(0x696dcdd0ff93797c), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x696dcdd0ff93797c), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x31cfd98d4dc07ba7), EConversationDebugInfo::Executing);
                        // Three hundred nuggets, my friend. This ain't a charity. 
                        Scorpio.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_111020_2386"));
                        DC(int64(0x31cfd98d4dc07ba7), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_grd_205_scorpio_crossbow2_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x31cfd98d4dc07ba5), EConversationDebugInfo::Executing);
                    // Look, we both know you're not good enough yet. Get ...
                    Scorpio.AI.Say(LocText("TEXT_WIP_GILDIL_20241216_111007_686"));
                    DC(int64(0x31cfd98d4dc07ba5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_205_scorpio_crossbow2_exit_3");
                }
            }
        }
        
        
        class UChoiceGrd205ScorpioHeypc : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae91);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd205ScorpioHeypc);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73ddac48ae3dae92), G1R != nullptr && G1R.HasReachedChapter(4));
                    DB(int64(0x73ddac48ae3dae93), Hero != nullptr && Hero.IsCloseToCharacter(Scorpio, 1000.0f));
                }
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Scorpio, 1000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae94), EConversationDebugInfo::Executing);
                // Ey! Come over here for a second, will you? Don't worry, ...
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_HEYPC_INFO_13_01"));
                DC(int64(0x73ddac48ae3dae94), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_SCORPIO, Document::UDocumentSegment_Glossary_OC_GRD_SCORPIO_Escape);
            }
        }
        
        
        class UChoiceGrd205ScorpioTrade : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae9c);
            default Caption = LocText("GRD_205_SCORPIO_TRADE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_NRZXSLD_20241030_145216"), int64(0x73ddac48ae3dae9c));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae9d), EConversationDebugInfo::Executing);
                // Show me what you got.
                Hero.AI.Say(LocText("GRD_205_SCORPIO_TRADE_INFO_15_01"));
                DC(int64(0x73ddac48ae3dae9d), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168c6e), Scorpio != nullptr && Scorpio.IsAngryTowards(Hero));
                
                if (Scorpio != nullptr && Scorpio.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168c72), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Scorpio.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_114346"));
                    DC(int64(0x7ec56dc721168c72), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_205_scorpio_trade_exit_1");
                    DC(int64(0x7ec56dc721168c7d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168c7d), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xba8e3044abddb782), EConversationDebugInfo::Executing);
                    Scorpio.AI.StartTradingWith(Hero);
                    DC(int64(0xba8e3044abddb782), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_205_scorpio_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceGrd205ScorpioWelcome : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae7d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd205ScorpioWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73ddac48ae3dae7e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae7f), EConversationDebugInfo::Executing);
                // So you're one of us now, eh? Good choice!
                Scorpio.AI.Say(LocText("GRD_205_SCORPIO_WELCOME_INFO_13_01"));
                DC(int64(0x73ddac48ae3dae7f), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae80), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x73ddac48ae3dae80), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceScorpioExit : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae63);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae64), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x73ddac48ae3dae64), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceScorpioHello : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae65);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceScorpioHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9617740bb23ff96), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded());
                    DB(int64(0x73ddac48ae3dae66), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae67), EConversationDebugInfo::Executing);
                // Who by Beliar let YOU in here? 
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_13_00"));
                DC(int64(0x73ddac48ae3dae67), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae68), EConversationDebugInfo::Executing);
                
                // Thorus.
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_15_01"));
                DC(int64(0x73ddac48ae3dae68), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae69), EConversationDebugInfo::Executing);
                
                // And what do you want? 
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_13_02"));
                DC(int64(0x73ddac48ae3dae69), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_SCORPIO, Document::UDocumentSegment_Glossary_OC_GRD_SCORPIO_Introduction);
                Subdialog(
                    UChoiceScorpioHelloJustlooking,
                    UChoiceScorpioHelloMages,
                    UChoiceScorpioHelloKraut,
                    UChoiceScorpioHelloJoin
                );
            }
        }
        
        
        class UChoiceScorpioHelloJustlooking : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae6b);
            default Caption = LocText("DIA_SCORPIO_HELLO_JUSTLOOKING_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae6c), EConversationDebugInfo::Executing);
                // Just wanted to take a peek inside. 
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_JUSTLOOKING_15_00"));
                DC(int64(0x73ddac48ae3dae6c), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae6d), EConversationDebugInfo::Executing);
                
                // Ahh, very funny.
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_JUSTLOOKING_13_01"));
                DC(int64(0x73ddac48ae3dae6d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScorpioHelloMages : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae6e);
            default Caption = LocText("DIA_SCORPIO_HELLO_MAGES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae6f), EConversationDebugInfo::Executing);
                
                // I have a message for the mages.
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_MAGES_15_00"));
                DC(int64(0x73ddac48ae3dae6f), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae70), EConversationDebugInfo::Executing);
                
                // ... You're one of your messengers, then? In that case, ...
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_MAGES_13_01"));
                DC(int64(0x73ddac48ae3dae70), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScorpioHelloKraut : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae71);
            default Caption = LocText("DIA_SCORPIO_HELLO_KRAUT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf3590eddfb1a963b), Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE != nullptr && Quest::SwampCamp_SCCHAPTER2_KRAUTBOTE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae72), EConversationDebugInfo::Executing);
                
                // I have a delivery of swampweed for Gomez.
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_KRAUT_15_00"));
                DC(int64(0x73ddac48ae3dae72), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae73), EConversationDebugInfo::Executing);
                
                // Ah, makes sense. Best bring it straight to Bartholo - ...
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_KRAUT_13_01"));
                DC(int64(0x73ddac48ae3dae73), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScorpioHelloJoin : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae74);
            default Caption = LocText("DIA_SCORPIO_HELLO_JOIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf3590eddfb1a963f), Hero != nullptr && Hero.HasKnowledgeOf(UChoiceThorusReadyforgomez::StaticClass()));
                    DB(int64(0x6689f91ee0d2ffe), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                }
                
                if (Hero != nullptr && !Hero.HasKnowledgeOf(UChoiceThorusReadyforgomez::StaticClass()))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae75), EConversationDebugInfo::Executing);
                
                // I'm on my way to see Gomez. I want to join you.
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_JOIN_15_00"));
                DC(int64(0x73ddac48ae3dae75), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae76), EConversationDebugInfo::Executing);
                
                // That so? And why would Gomez be interested in someone ...
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_JOIN_13_01"));
                DC(int64(0x73ddac48ae3dae76), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae77), EConversationDebugInfo::Executing);
                
                // The Shadows were happy with my work.
                Hero.AI.Say(LocText("DIA_SCORPIO_HELLO_JOIN_15_02"));
                DC(int64(0x73ddac48ae3dae77), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae78), EConversationDebugInfo::Executing);
                
                // Huh, Shadows here, Shadows there ... we're callin' the ...
                Scorpio.AI.Say(LocText("DIA_SCORPIO_HELLO_JOIN_13_03"));
                DC(int64(0x73ddac48ae3dae78), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceScorpioRefusetrain : UTopic_Hero__OC_GRD_SCORPIO_205
        {
            default DebugId = int64(0x73ddac48ae3dae79);
            default Caption = LocText("DIA_SCORPIO_REFUSETRAIN_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceScorpioHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x73ddac48ae3dae7a), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73ddac48ae3dae7b), EConversationDebugInfo::Executing);
                
                // Can you teach me how to fight?
                Hero.AI.Say(LocText("DIA_SCORPIO_REFUSETRAIN_15_00"));
                DC(int64(0x73ddac48ae3dae7b), EConversationDebugInfo::Done);
                DC(int64(0x73ddac48ae3dae7c), EConversationDebugInfo::Executing);
                
                // I only train warders ... until you're one of us, find ...
                Scorpio.AI.Say(LocText("DIA_SCORPIO_REFUSETRAIN_13_01"));
                DC(int64(0x73ddac48ae3dae7c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_SCORPIO, Document::UDocumentSegment_Glossary_OC_GRD_SCORPIO_Teacher);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */