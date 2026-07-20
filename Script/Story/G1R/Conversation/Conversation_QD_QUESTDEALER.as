#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_QD_QUESTDEALER : UConversationCharacterSettings
        {
            default ForCharacter = n"QD_QUESTDEALER";
        }
        
        
        class UTopic_Hero__QD_QUESTDEALER : UG1RDialogTopic
        {
            default ForCharacter = n"QD_QUESTDEALER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetQuestdealer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceQuestdealer422704 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0a1576);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0a1575), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4c6d948d2d0a1575), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceQuestdealer422724 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0a157b);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_114938");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab366), EConversationDebugInfo::Executing);
                // Choose chapter
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_114938"));
                DC(int64(0x4c6d948d2d0ab366), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Questdealer_633767,
                    UTopic_Questdealer_633787,
                    UTopic_Questdealer_633831,
                    UTopic_Questdealer_633851,
                    UTopic_Questdealer_633871,
                    UTopic_Questdealer_633891
                );
            }
        }
        
        
        class UTopic_Questdealer_633767 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab368);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115006");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3ed), EConversationDebugInfo::Executing);
                // CHAPTER 1
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142311"));
                DC(int64(0x4c6d948d2d0ab3ed), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Questdealer_634721,
                    UTopic_Questdealer_634741,
                    UTopic_Questdealer_634775,
                    UTopic_Questdealer_634889
                );
            }
        }
        
        
        class UTopic_Questdealer_633787 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab36c);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115006_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3fa), EConversationDebugInfo::Executing);
                // CHAPTER 2
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142445"));
                DC(int64(0x4c6d948d2d0ab3fa), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Questdealer_633937,
                    UTopic_Questdealer_633957,
                    UTopic_Questdealer_633997,
                    UTopic_Questdealer_634024,
                    UTopic_Questdealer_634060,
                    UTopic_Questdealer_634090,
                    UTopic_Questdealer_635083
                );
            }
        }
        
        
        class UTopic_Questdealer_633831 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab370);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115036");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Questdealer_634125,
                    UTopic_Questdealer_634145,
                    UTopic_Questdealer_634167,
                    UTopic_Questdealer_634187,
                    UTopic_Questdealer_634285,
                    UTopic_Questdealer_634324,
                    UTopic_Questdealer_635178
                );
            }
        }
        
        
        class UTopic_Questdealer_633851 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab374);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115044");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Questdealer_634372,
                    UTopic_Questdealer_634392,
                    UTopic_Questdealer_634414,
                    UTopic_Questdealer_634434,
                    UTopic_Questdealer_635150
                );
            }
        }
        
        
        class UTopic_Questdealer_633871 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab378);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115045");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Questdealer_634521,
                    UTopic_Questdealer_634541,
                    UTopic_Questdealer_635284
                );
            }
        }
        
        
        class UTopic_Questdealer_633891 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab37c);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115047");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Questdealer_634608,
                    UTopic_Questdealer_634628,
                    UTopic_Questdealer_634688,
                    UTopic_Questdealer_635340
                );
            }
        }
        
        
        class UTopic_Questdealer_634721 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3df);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141333");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3ef), EConversationDebugInfo::Executing);
                // JOINOC
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142348"));
                DC(int64(0x4c6d948d2d0ab3ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634741 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3e3);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141333_1723");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3f1), EConversationDebugInfo::Executing);
                // JOINNC
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142355"));
                DC(int64(0x4c6d948d2d0ab3f1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634775 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3e8);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141417");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3f4), EConversationDebugInfo::Executing);
                // JOINSC
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142406"));
                DC(int64(0x4c6d948d2d0ab3f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634889 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3f5);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_142420_31");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab3f6), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142420_31"));
                DC(int64(0x4c6d948d2d0ab3f6), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab3f8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab3f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_633937 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab381);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115313");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab401), EConversationDebugInfo::Executing);
                // FINDING CAINE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142510"));
                DC(int64(0x4c6d948d2d0ab401), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_633957 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab385);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115313_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab402), EConversationDebugInfo::Executing);
                // FOCUS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142517"));
                DC(int64(0x4c6d948d2d0ab402), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_633997 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab38a);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115343");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab403), EConversationDebugInfo::Executing);
                // ALMANAC
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142521"));
                DC(int64(0x4c6d948d2d0ab403), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634024 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab38e);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115357");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab404), EConversationDebugInfo::Executing);
                // MINECRAWLER NEST
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142532"));
                DC(int64(0x4c6d948d2d0ab404), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634060 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab392);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115439");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab405), EConversationDebugInfo::Executing);
                // INVOCATION
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142545"));
                DC(int64(0x4c6d948d2d0ab405), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634090 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab396);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115454");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab406), EConversationDebugInfo::Executing);
                // ORC GRAVEYARD
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142552"));
                DC(int64(0x4c6d948d2d0ab406), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_635083 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab407);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_142644_3331");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab408), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_142644_3331"));
                DC(int64(0x4c6d948d2d0ab408), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab40a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab40a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634125 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab39b);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115547");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4c5), EConversationDebugInfo::Executing);
                // SPEAK TO SATURAS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144042"));
                DC(int64(0x4c6d948d2d0ab4c5), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_10");
            }
        }
        
        
        class UTopic_Questdealer_634145 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab39f);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115547_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4c6), EConversationDebugInfo::Executing);
                // MEET FRIENDS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144048"));
                DC(int64(0x4c6d948d2d0ab4c6), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_11");
            }
        }
        
        
        class UTopic_Questdealer_634167 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3a4);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115554");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4c7), EConversationDebugInfo::Executing);
                // FIND 4 FOCUS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144054"));
                DC(int64(0x4c6d948d2d0ab4c7), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_12");
            }
        }
        
        
        class UTopic_Questdealer_634187 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3a8);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115557");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4c8), EConversationDebugInfo::Executing);
                // RETURN FOCUS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144059"));
                DC(int64(0x4c6d948d2d0ab4c8), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_13");
            }
        }
        
        
        class UTopic_Questdealer_634285 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3ac);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115711");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4c9), EConversationDebugInfo::Executing);
                // MEET FIRE MAGES
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144105"));
                DC(int64(0x4c6d948d2d0ab4c9), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_14");
            }
        }
        
        
        class UTopic_Questdealer_634324 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3b0);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115745");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4ca), EConversationDebugInfo::Executing);
                // RETURN WITH SATURAS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144125"));
                DC(int64(0x4c6d948d2d0ab4ca), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633831_exit_15");
            }
        }
        
        
        class UTopic_Questdealer_635178 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab421);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_143353_1661");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab422), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_143353_1661"));
                DC(int64(0x4c6d948d2d0ab422), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab424), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab424), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634372 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3b5);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115838");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4cb), EConversationDebugInfo::Executing);
                // MEET XARDAS
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144312"));
                DC(int64(0x4c6d948d2d0ab4cb), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633851_exit_16");
            }
        }
        
        
        class UTopic_Questdealer_634392 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3b9);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115838_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4cc), EConversationDebugInfo::Executing);
                // MEET URSHAK
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144314"));
                DC(int64(0x4c6d948d2d0ab4cc), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633851_exit_17");
            }
        }
        
        
        class UTopic_Questdealer_634414 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3be);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115841");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4cd), EConversationDebugInfo::Executing);
                // FREE MINE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144316"));
                DC(int64(0x4c6d948d2d0ab4cd), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633851_exit_18");
            }
        }
        
        
        class UTopic_Questdealer_634434 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3c2);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_115843");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4ce), EConversationDebugInfo::Executing);
                // GO TO ORC ENCLAVE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144318"));
                DC(int64(0x4c6d948d2d0ab4ce), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633851_exit_19");
            }
        }
        
        
        class UTopic_Questdealer_635150 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab419);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_143305_2650");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab41a), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_143305_2650"));
                DC(int64(0x4c6d948d2d0ab41a), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab41c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab41c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634521 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3c7);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_120023");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4cf), EConversationDebugInfo::Executing);
                // ORC ENCLAVE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144354"));
                DC(int64(0x4c6d948d2d0ab4cf), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633871_exit_20");
            }
        }
        
        
        class UTopic_Questdealer_634541 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3cb);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_120023_1351");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4d0), EConversationDebugInfo::Executing);
                // SLEEPER TEMPLE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144400"));
                DC(int64(0x4c6d948d2d0ab4d0), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633871_exit_21");
            }
        }
        
        
        class UTopic_Questdealer_635284 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab475);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_143441_1289");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab476), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_143441_1289"));
                DC(int64(0x4c6d948d2d0ab476), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab478), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab478), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Questdealer_634608 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3d1);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141239");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4d1), EConversationDebugInfo::Executing);
                // CHARGE URIZIEL
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144407"));
                DC(int64(0x4c6d948d2d0ab4d1), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633891_exit_22");
            }
        }
        
        
        class UTopic_Questdealer_634628 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3d5);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141239_3346");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4d2), EConversationDebugInfo::Executing);
                // RETURN TO SLEEPER TEMPLE
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144411"));
                DC(int64(0x4c6d948d2d0ab4d2), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633891_exit_23");
            }
        }
        
        
        class UTopic_Questdealer_634688 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab3da);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_141306");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4d3), EConversationDebugInfo::Executing);
                // FINAL FIGHT
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_144413"));
                DC(int64(0x4c6d948d2d0ab4d3), EConversationDebugInfo::Done);
                
                Other.Remember(n"choice_Questdealer_633891_exit_24");
            }
        }
        
        
        class UTopic_Questdealer_635340 : UTopic_Hero__QD_QUESTDEALER
        {
            default DebugId = int64(0x4c6d948d2d0ab4b2);
            default Caption = LocText("TEXT_WIP_GCUGZMK_20251030_143606_568");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c6d948d2d0ab4b3), EConversationDebugInfo::Executing);
                // (back)
                Hero.AI.Say(LocText("TEXT_WIP_GCUGZMK_20251030_143606_568"));
                DC(int64(0x4c6d948d2d0ab4b3), EConversationDebugInfo::Done);
                DC(int64(0x4c6d948d2d0ab4b5), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x4c6d948d2d0ab4b5), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */