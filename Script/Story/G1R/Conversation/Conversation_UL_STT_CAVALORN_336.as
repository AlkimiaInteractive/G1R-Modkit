#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_STT_CAVALORN_336 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_STT_CAVALORN_336";
        }
        
        
        class UTopic_Hero__UL_STT_CAVALORN_336 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_STT_CAVALORN_336";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCavalorn() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceCavalorn134683 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xc5fc492f37f52b02);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105420");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn134683);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4513bda582bdae85), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning());
                    DB(int64(0xc5fc492f37f5c35a), G1R.Cavalorn_BestiaryDiscovered == 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdae6c), EConversationDebugInfo::Executing);
                // I found this book about beasts.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420"));
                DC(int64(0x4513bda582bdae6c), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae6d), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0x4513bda582bdae6d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_CAVALORN, Document::UDocumentSegment_Glossary_UL_STT_CAVALORN_Bestiary);
                DC(int64(0xeec39d0ff5f1c9f1), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_FIND.SucceedQuest();
                DC(int64(0xeec39d0ff5f1c9f1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_135157 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf4c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn135761);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbd3eb84d878c98bc), G1R.Cavalorn_BestiaryQuestion == 0);
                    DB(int64(0xbd3eb84d878c98c6), G1R.Cavalorn_BestiaryQuestionRunning != 0);
                }
                
                if (G1R.Cavalorn_BestiaryQuestion != 0)
                    return false;
                
                if (G1R.Cavalorn_BestiaryQuestionRunning == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaef3), EConversationDebugInfo::Executing);
                // Scavengers have protective plates - but where exactly do ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111147"));
                DC(int64(0x4513bda582bdaef3), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_135215,
                    UTopic_Cavalorn_135235,
                    UTopic_Cavalorn_135257
                );
            }
        }
        
        
        class UTopic_Cavalorn_135215 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaef5);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111233_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaef6), EConversationDebugInfo::Executing);
                // On their head.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111233_3569"));
                DC(int64(0x4513bda582bdaef6), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf03), EConversationDebugInfo::Executing);
                
                // Wrong. The head plate is more of a tool, not armor. 
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111516"));
                DC(int64(0x4513bda582bdaf03), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf04), EConversationDebugInfo::Executing);
                // Learn about the differences, then you can come back.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111523"));
                DC(int64(0x4513bda582bdaf04), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf07), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf07), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_135235 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaef9);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111233_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaefa), EConversationDebugInfo::Executing);
                // Along the upper part of the spine.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111233_443"));
                DC(int64(0x4513bda582bdaefa), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf01), EConversationDebugInfo::Executing);
                
                // Good. Most hunters don't pay enough attention to that.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111311"));
                DC(int64(0x4513bda582bdaf01), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf02), EConversationDebugInfo::Executing);
                // The plates act as a shield, so you should always aim for ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111440"));
                DC(int64(0x4513bda582bdaf02), EConversationDebugInfo::Done);
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestion = 1;
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_135257 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaefd);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111236_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaefe), EConversationDebugInfo::Executing);
                // Around their beak.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111236_1769"));
                DC(int64(0x4513bda582bdaefe), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf06), EConversationDebugInfo::Executing);
                
                // And that's why so many end up as fodder. Did you really ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114126"));
                DC(int64(0x4513bda582bdaf06), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf08), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf08), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn135456 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x11fa68633049378f);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_135674);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x11fa686330493789), EConversationDebugInfo::Executing);
                // Well done.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_150443_2238"));
                DC(int64(0x11fa686330493789), EConversationDebugInfo::Done);
                DC(int64(0x11fa686330493791), EConversationDebugInfo::Executing);
                // Now, let me show you how to remove those skull plates. ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_150547"));
                DC(int64(0x11fa686330493791), EConversationDebugInfo::Done);
                DC(int64(0x11fa686330493792), EConversationDebugInfo::Executing);
                // If you found the reinforced ridge at the back of the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_150607"));
                DC(int64(0x11fa686330493792), EConversationDebugInfo::Done);
                DC(int64(0x11fa686330493793), EConversationDebugInfo::Executing);
                // Once loose, carefully work your knife underneath the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_150627"));
                DC(int64(0x11fa686330493793), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BESTIARY_1, Document::UDocumentSegment_CH1_BESTIARY_1_Completed);
                DC(int64(0x11fa686330493795), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_SkullArmor_Trained);
                DC(int64(0x11fa686330493795), EConversationDebugInfo::Done);
                DB(int64(0xeec39d0ff5f1c86b), G1R.Cavalorn_BestiaryDiscovered == 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                {
                    DC(int64(0x11fa68633049379b), EConversationDebugInfo::Executing);
                    // That seems straightforward enough
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310"));
                    DC(int64(0x11fa68633049379b), EConversationDebugInfo::Done);
                    DC(int64(0x11fa68633049379c), EConversationDebugInfo::Executing);
                    
                    // You know ... I thought I'd seen one of these before. If ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310_2785"));
                    DC(int64(0x11fa68633049379c), EConversationDebugInfo::Done);
                    DC(int64(0x11fa6863304937a2), EConversationDebugInfo::Executing);
                    // And each volume covers a different kind of animal.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151437"));
                    DC(int64(0x11fa6863304937a2), EConversationDebugInfo::Done);
                    DC(int64(0x11fa6863304937a3), EConversationDebugInfo::Executing);
                    
                    // There's more?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151443"));
                    DC(int64(0x11fa6863304937a3), EConversationDebugInfo::Done);
                    DC(int64(0x11fa6863304937a4), EConversationDebugInfo::Executing);
                    
                    // Five, I think. Let me know if you find any of the others ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151444"));
                    DC(int64(0x11fa6863304937a4), EConversationDebugInfo::Done);
                    DC(int64(0x11fa6863304937a6), EConversationDebugInfo::Executing);
                    
                    // I'll keep an eye out.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151458"));
                    DC(int64(0x11fa6863304937a6), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c881), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryDiscovered = 1;
                    DC(int64(0xeec39d0ff5f1c881), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xeec39d0ff5f1c87a), EConversationDebugInfo::Executing);
                    // Seems straightforward enough.
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095938"));
                    DC(int64(0xeec39d0ff5f1c87a), EConversationDebugInfo::Done);
                }
                DC(int64(0x11fa6863304937a8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.SucceedQuest();
                DC(int64(0x11fa6863304937a8), EConversationDebugInfo::Done);
                DC(int64(0x11fa6863304937ae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x11fa6863304937ae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn135481 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf09);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_135235);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbd3eb84d878c98bc), G1R.Cavalorn_BestiaryQuestion == 1);
                    DB(int64(0x31a0e6acb31a0018), G1R.Cavalorn_BestiaryQuestionRunning != 0);
                }
                
                if (G1R.Cavalorn_BestiaryQuestion != 1)
                    return false;
                
                if (G1R.Cavalorn_BestiaryQuestionRunning == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf0b), EConversationDebugInfo::Executing);
                // The hollow chambers in their skull - what makes them ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114647"));
                DC(int64(0x4513bda582bdaf0b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_135494,
                    UTopic_Cavalorn_135514,
                    UTopic_Cavalorn_135536
                );
            }
        }
        
        
        class UTopic_Cavalorn_135494 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf0d);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_114741_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf0e), EConversationDebugInfo::Executing);
                // They amplify their calls.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114741_491"));
                DC(int64(0x4513bda582bdaf0e), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf19), EConversationDebugInfo::Executing);
                
                // Correct. And that's how they get you - right when you ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114850"));
                DC(int64(0x4513bda582bdaf19), EConversationDebugInfo::Done);
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestion = 2;
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_135514 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf11);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_114741_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf12), EConversationDebugInfo::Executing);
                // They make the skull lighter.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114741_3750"));
                DC(int64(0x4513bda582bdaf12), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf1a), EConversationDebugInfo::Executing);
                
                // Wrong. If you try hunting one, you'll learn quick enough ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114903"));
                DC(int64(0x4513bda582bdaf1a), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf1c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf1c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_135536 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf15);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_114744_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf16), EConversationDebugInfo::Executing);
                // They breathe through them?
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_114744_731"));
                DC(int64(0x4513bda582bdaf16), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf1b), EConversationDebugInfo::Executing);
                
                // You really have no idea, do you?
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115245"));
                DC(int64(0x4513bda582bdaf1b), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf1d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf1d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn135624 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf22);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_135494);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbd3eb84d878c98bc), G1R.Cavalorn_BestiaryQuestion == 2);
                    DB(int64(0x31a0e6acb31a0019), G1R.Cavalorn_BestiaryQuestionRunning != 0);
                }
                
                if (G1R.Cavalorn_BestiaryQuestion != 2)
                    return false;
                
                if (G1R.Cavalorn_BestiaryQuestionRunning == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf24), EConversationDebugInfo::Executing);
                // And lastly - why do they flock together? Think ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115352"));
                DC(int64(0x4513bda582bdaf24), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_135632,
                    UTopic_Cavalorn_135652,
                    UTopic_Cavalorn_135674
                );
            }
        }
        
        
        class UTopic_Cavalorn_135632 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf26);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_115412_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf27), EConversationDebugInfo::Executing);
                // So they can hunt better.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115412_2316"));
                DC(int64(0x4513bda582bdaf27), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf32), EConversationDebugInfo::Executing);
                
                // Not really. It's in the name: they're scavengers, not ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115505"));
                DC(int64(0x4513bda582bdaf32), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf35), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf35), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_135652 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf2a);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_115412_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf2b), EConversationDebugInfo::Executing);
                // To stay warm.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115412_153"));
                DC(int64(0x4513bda582bdaf2b), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf33), EConversationDebugInfo::Executing);
                
                // Now you're just guessing, aren't you?
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115552"));
                DC(int64(0x4513bda582bdaf33), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf36), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaf36), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_135674 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf2e);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_115415_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf2f), EConversationDebugInfo::Executing);
                // To defend their feeding grounds.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115415_292"));
                DC(int64(0x4513bda582bdaf2f), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf34), EConversationDebugInfo::Executing);
                
                // Right. It does seem like you studied the book properly.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115624"));
                DC(int64(0x4513bda582bdaf34), EConversationDebugInfo::Done);
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestion = 3;
                DC(int64(0x8c13532d65cce15b), EConversationDebugInfo::Done);
                DC(int64(0x11fa686330493752), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.SucceedQuest();
                DC(int64(0x11fa686330493752), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb31a0016), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 0;
                DC(int64(0x31a0e6acb31a0016), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn135761 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaf39);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_115931");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn203019);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe07bf4a1a792f879), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaf37), EConversationDebugInfo::Executing);
                // About that bestiary ...
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_115931"));
                DC(int64(0x4513bda582bdaf37), EConversationDebugInfo::Done);
                DB(int64(0x4513bda582bdaf49), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.IsRunning());
                DB(int64(0x691ef330623ca050), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZRHZVIF_20250109_111024")));
                
                if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.IsRunning())
                {
                    DC(int64(0x11fa68633049375a), EConversationDebugInfo::Executing);
                    // Ask me your questions.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_144359_41"));
                    DC(int64(0x11fa68633049375a), EConversationDebugInfo::Done);
                    DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryQuestionRunning = 1;
                    DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_cavalorn_135761_exit_1");
                }
                else if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_ZRHZVIF_20250109_111024")))
                {
                    DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Executing);
                    // What do you mean?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110923"));
                    DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Done);
                    DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Executing);
                    
                    // I'll ask you some questions, all right? And if you get ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110930"));
                    DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Cavalorn_13515722,
                        UTopic_Cavalorn_1351772
                    );
                }
                else
                {
                    DC(int64(0x691ef330623ca064), EConversationDebugInfo::Executing);
                    // Have you read it?
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_142412_1924"));
                    DC(int64(0x691ef330623ca064), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Cavalorn_1347562,
                        UTopic_Cavalorn_1347762
                    );
                }
            }
        }
        
        
        class UTopic_Cavalorn_13515722 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaee9);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_13515722);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Executing);
                // Fire away.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386"));
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.StartQuest();
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 1;
                DC(int64(0x31a0e6acb319ffe0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_1351772 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaeed);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Executing);
                // Not interested.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609"));
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Executing);
                
                // Your choice.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111024"));
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_1347562 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdae77);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105731_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_1347562);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdae78), EConversationDebugInfo::Executing);
                // Yes, I thought it could help me survive.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105731_1924"));
                DC(int64(0x4513bda582bdae78), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae7f), EConversationDebugInfo::Executing);
                
                // Smart of you. A lot of people get killed by beasts just ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105740"));
                DC(int64(0x4513bda582bdae7f), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae80), EConversationDebugInfo::Executing);
                // So I hope you took something away from it, too.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105759"));
                DC(int64(0x4513bda582bdae80), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Executing);
                
                // What do you mean?
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110923"));
                DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Executing);
                
                // I'll ask you some questions, all right? And if you get ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110930"));
                DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_135157222,
                    UTopic_Cavalorn_13517722
                );
            }
        }
        
        
        class UTopic_Cavalorn_1347762 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdae7b);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105731_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdae7c), EConversationDebugInfo::Executing);
                // Not yet.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105731_3436"));
                DC(int64(0x4513bda582bdae7c), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae81), EConversationDebugInfo::Executing);
                
                // Knowledge is probably your best weapon.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105822"));
                DC(int64(0x4513bda582bdae81), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae82), EConversationDebugInfo::Executing);
                // Read it. Understand it. And then we'll talk.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105831"));
                DC(int64(0x4513bda582bdae82), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae83), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdae83), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_135157222 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaee9);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_135157222);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Executing);
                // Fire away.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386"));
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.StartQuest();
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Done);
                DC(int64(0xe07bf4a1a792f84b), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 1;
                DC(int64(0xe07bf4a1a792f84b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_13517722 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaeed);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Executing);
                // Not interested.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609"));
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Executing);
                
                // Your choice.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111024"));
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn136944 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c8b4);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_105248");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn136944);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4513bda582bdae85), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.IsRunning());
                    DB(int64(0xeec39d0ff5f1c8a0), G1R.Cavalorn_BestiaryDiscovered != 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c892d), EConversationDebugInfo::Executing);
                // I found another volume of that bestiary.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105248"));
                DC(int64(0xac71e07b3d8c892d), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c892e), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xac71e07b3d8c892e), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1cd12), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_CAVALORN.SucceedQuest();
                DC(int64(0xeec39d0ff5f1cd12), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn137183 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c8991);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_110141");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202444);
            default Rules.HideIfKnows(UChoiceCavalorn137183);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xac71e07b3d8c8995), Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Minecrawlerqueen_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c898e), EConversationDebugInfo::Executing);
                // I found something that might interest you.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110141"));
                DC(int64(0xac71e07b3d8c898e), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Cavalorn, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Done);
                DC(int64(0xe8d3f454ed08615a), EConversationDebugInfo::Executing);
                Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowGland);
                DC(int64(0xe8d3f454ed08615a), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c899a), EConversationDebugInfo::Executing);
                // By the gods! I've seen a lot of things, but this? It's ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110415"));
                DC(int64(0xac71e07b3d8c899a), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c899b), EConversationDebugInfo::Executing);
                
                // From some secluded part of the Old Mine. But it wasn't a ...
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110415_443"));
                DC(int64(0xac71e07b3d8c899b), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c899d), EConversationDebugInfo::Executing);
                // It was a queen. Big crawler, big glands.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110440"));
                DC(int64(0xac71e07b3d8c899d), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c899e), EConversationDebugInfo::Executing);
                
                // Shit, I don't know whether I should be jealous or ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110504"));
                DC(int64(0xac71e07b3d8c899e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_137223,
                    UTopic_Cavalorn_137243,
                    UTopic_Cavalorn_137273
                );
            }
        }
        
        
        class UTopic_Cavalorn_137223 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89a0);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_110514_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137223);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89a1), EConversationDebugInfo::Executing);
                // It looks kind of special.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110514_1769"));
                DC(int64(0xac71e07b3d8c89a1), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89a9), EConversationDebugInfo::Executing);
                
                // The size of it alone. Any alchemist will empty their ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110525"));
                DC(int64(0xac71e07b3d8c89a9), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89a3), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xac71e07b3d8c89a3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137243 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89a4);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_110514_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137243);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89a5), EConversationDebugInfo::Executing);
                // Can you teach me how to utilize the glands?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110514_2995"));
                DC(int64(0xac71e07b3d8c89a5), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89aa), EConversationDebugInfo::Executing);
                
                // Absolutely.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110556"));
                DC(int64(0xac71e07b3d8c89aa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_Completed);
                DC(int64(0x8921c2ef028151c6), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE.SucceedQuest();
                DC(int64(0x8921c2ef028151c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137273 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89ab);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_110614_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137273);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89ac), EConversationDebugInfo::Executing);
                // I think I'll keep it for myself.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110614_3750"));
                DC(int64(0xac71e07b3d8c89ac), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89b0), EConversationDebugInfo::Executing);
                
                // Are you sure? And do you even know how to preserve it? ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_110616"));
                DC(int64(0xac71e07b3d8c89b0), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89b1), EConversationDebugInfo::Executing);
                // I'm just saying: if you let me have it I'll show you how ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111655"));
                DC(int64(0xac71e07b3d8c89b1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_137322,
                    UTopic_Cavalorn_137302
                );
            }
        }
        
        
        class UTopic_Cavalorn_137322 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89b8);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_111701_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137322);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89b9), EConversationDebugInfo::Executing);
                // Fine, you can keep it.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111701_3719"));
                DC(int64(0xac71e07b3d8c89b9), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89ce), EConversationDebugInfo::Executing);
                
                // Good choice - and thank you!
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111923"));
                DC(int64(0xac71e07b3d8c89ce), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_Completed);
                DC(int64(0x8921c2ef028151c3), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE.SucceedQuest();
                DC(int64(0x8921c2ef028151c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137302 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89b4);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_111701_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137302);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89b5), EConversationDebugInfo::Executing);
                // I'll keep it for now.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111701_731"));
                DC(int64(0xac71e07b3d8c89b5), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89c1), EConversationDebugInfo::Executing);
                
                // Godsdammit ... But fine, it's your choice.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111714"));
                DC(int64(0xac71e07b3d8c89c1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_FindBuyer);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Cavalorn.AddItemToInventory(UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Executing);
                Cavalorn.AI.GiveItemTo(Hero, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89c8), EConversationDebugInfo::Executing);
                // At least I got to see it.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111756_2316"));
                DC(int64(0xac71e07b3d8c89c8), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89cb), EConversationDebugInfo::Executing);
                // Come back if you change your mind, all right?
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111832"));
                DC(int64(0xac71e07b3d8c89cb), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89ca), EConversationDebugInfo::Executing);
                // And if you find more books, I'll gladly take them.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111807"));
                DC(int64(0xac71e07b3d8c89ca), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef02815166), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_BRINGSAMPLE.SucceedQuest();
                DC(int64(0x8921c2ef02815166), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef0281518b), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.StartQuest();
                DC(int64(0x8921c2ef0281518b), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89cc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xac71e07b3d8c89cc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn137456 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c89d4);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_137243);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_137322);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_137477);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c89d2), EConversationDebugInfo::Executing);
                // All right.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_111944_3902"));
                DC(int64(0xac71e07b3d8c89d2), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89d7), EConversationDebugInfo::Executing);
                // A bloodlfy's poison sac is right beneath its thorax. ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112032"));
                DC(int64(0xac71e07b3d8c89d7), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89d8), EConversationDebugInfo::Executing);
                // Otherwise, you'll spray yourself with the poison AND the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112047"));
                DC(int64(0xac71e07b3d8c89d8), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89d9), EConversationDebugInfo::Executing);
                // Now, lurker gills - they're like wet parchment. If you ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112049"));
                DC(int64(0xac71e07b3d8c89d9), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89da), EConversationDebugInfo::Executing);
                // You need to trace the edge of the gill plate first, then ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112050"));
                DC(int64(0xac71e07b3d8c89da), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89db), EConversationDebugInfo::Executing);
                // And the venom glands of fire lizards, they sit right ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112050_292"));
                DC(int64(0xac71e07b3d8c89db), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89dc), EConversationDebugInfo::Executing);
                // But you don't want to puncture those either. Trust me, I ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112051"));
                DC(int64(0xac71e07b3d8c89dc), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89de), EConversationDebugInfo::Executing);
                
                // Seems like each creature needs a specific technique.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112129"));
                DC(int64(0xac71e07b3d8c89de), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89dd), EConversationDebugInfo::Executing);
                
                // Exactly. But all it takes is practice.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112052"));
                DC(int64(0xac71e07b3d8c89dd), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89e4), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.SucceedQuest();
                DC(int64(0xac71e07b3d8c89e4), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c89e6), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_Organ_Trained);
                DC(int64(0xac71e07b3d8c89e6), EConversationDebugInfo::Done);
                DB(int64(0xeec39d0ff5f1c8bc), G1R.Cavalorn_BestiaryDiscovered != 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                {
                    DB(int64(0x4cf259bf04e01460), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146e), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146f), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded());
                    DB(int64(0x4cf259bf04e01470), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded());
                    DB(int64(0x4cf259bf04e01471), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded());
                    
                    if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded())
                    {
                        
                    }
                    else
                    {
                        DC(int64(0xeec39d0ff5f1c8dc), EConversationDebugInfo::Executing);
                        // And if you find more books ... I'll take them off your ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112141"));
                        DC(int64(0xeec39d0ff5f1c8dc), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xeec39d0ff5f1c8e0), EConversationDebugInfo::Executing);
                    // You know ... I thought I'd seen one of these before. If ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310_2785"));
                    DC(int64(0xeec39d0ff5f1c8e0), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8e1), EConversationDebugInfo::Executing);
                    // And each volume covers a different kind of animal.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151437"));
                    DC(int64(0xeec39d0ff5f1c8e1), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8e2), EConversationDebugInfo::Executing);
                    
                    // There's more?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151443"));
                    DC(int64(0xeec39d0ff5f1c8e2), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8e4), EConversationDebugInfo::Executing);
                    
                    // Five, I think. Let me know if you find any of the others ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151444"));
                    DC(int64(0xeec39d0ff5f1c8e4), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8e5), EConversationDebugInfo::Executing);
                    
                    // I'll keep an eye out.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151458"));
                    DC(int64(0xeec39d0ff5f1c8e5), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8ec), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryDiscovered = 1;
                    DC(int64(0xeec39d0ff5f1c8ec), EConversationDebugInfo::Done);
                }
                DC(int64(0x8921c2ef02815162), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8921c2ef02815162), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn137464 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x8921c2ef028151a7);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_112732");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Cavalorn_137302);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8921c2ef028151ab), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8921c2ef028151a4), EConversationDebugInfo::Executing);
                // Do you still want that gland?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112732"));
                DC(int64(0x8921c2ef028151a4), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef028151a5), EConversationDebugInfo::Executing);
                
                // What, did you change your mind? I'll take it, gladly.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_112732_2083"));
                DC(int64(0x8921c2ef028151a5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_137477,
                    UTopic_Cavalorn_137497
                );
            }
        }
        
        
        class UTopic_Cavalorn_137477 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x8921c2ef028151ae);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_113154_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137477);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8921c2ef028151af), EConversationDebugInfo::Executing);
                // If you show me how to harvest the glands.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_113154_1924"));
                DC(int64(0x8921c2ef028151af), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef028151b7), EConversationDebugInfo::Executing);
                
                // Of course.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_113205"));
                DC(int64(0x8921c2ef028151b7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_Completed);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Cavalorn, UItAt_Minecrawlerqueen_01, 1);
                DC(int64(0xac71e07b3d8c8998), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef028151cd), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDBUYER.SucceedQuest();
                DC(int64(0x8921c2ef028151cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137497 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x8921c2ef028151b2);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_113154_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137497);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8921c2ef028151b3), EConversationDebugInfo::Executing);
                // Let me think about it.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_113154_3436"));
                DC(int64(0x8921c2ef028151b3), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef028151be), EConversationDebugInfo::Executing);
                
                // Of course ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_113308"));
                DC(int64(0x8921c2ef028151be), EConversationDebugInfo::Done);
                DC(int64(0x8921c2ef028151c0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8921c2ef028151c0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn138834 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c907);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_095643");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn138834);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4513bda582bdae85), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.IsRunning());
                    DB(int64(0xeec39d0ff5f1c910), G1R.Cavalorn_BestiaryDiscovered != 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ec925980050268), EConversationDebugInfo::Executing);
                // I found another bestiary volume.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095643"));
                DC(int64(0x5ec925980050268), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd227), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd227), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn139129 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x9d07abff0c2499c7);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_173153");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202562);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d07abff0c2499dc), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd6ff919b75219cc), EConversationDebugInfo::Executing);
                // I got something for you.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173153"));
                DC(int64(0xdd6ff919b75219cc), EConversationDebugInfo::Done);
                DB(int64(0x9d07abff0c2499ca), Hero != nullptr && Hero.HasItem(UItAt_Lizard_03, 3, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Lizard_03, 3, 0))
                {
                    DC(int64(0x9d07abff0c2499e5), EConversationDebugInfo::Executing);
                    // Let's see ... 
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101216"));
                    DC(int64(0x9d07abff0c2499e5), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BESTIARY_3, Document::UDocumentSegment_CH3_BESTIARY_3_Completed);
                    DC(int64(0x9d07abff0c2499cd), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItAt_Lizard_03, 3);
                    DC(int64(0x9d07abff0c2499cd), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499d0), EConversationDebugInfo::Executing);
                    // Mmmm... Clean work. Almost as if I'd taught you.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101029_2238"));
                    DC(int64(0x9d07abff0c2499d0), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f0), EConversationDebugInfo::Executing);
                    // You'd be skilled enough for the next lesson.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101232"));
                    DC(int64(0x9d07abff0c2499f0), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f1), EConversationDebugInfo::Executing);
                    
                    // Sure.
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101233"));
                    DC(int64(0x9d07abff0c2499f1), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f2), EConversationDebugInfo::Executing);
                    
                    // All right, then. A razor's topmost plates - those that ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101233_3436"));
                    DC(int64(0x9d07abff0c2499f2), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f4), EConversationDebugInfo::Executing);
                    // You should look for a sort of a "natural seam" at the ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101234_3286"));
                    DC(int64(0x9d07abff0c2499f4), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f5), EConversationDebugInfo::Executing);
                    
                    // And then?
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101327"));
                    DC(int64(0x9d07abff0c2499f5), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f6), EConversationDebugInfo::Executing);
                    
                    // Hmm... You cut along the seam, bit by bit - and then the ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101331"));
                    DC(int64(0x9d07abff0c2499f6), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f7), EConversationDebugInfo::Executing);
                    // And try not to cut yourself. They're called razors for a ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101411"));
                    DC(int64(0x9d07abff0c2499f7), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f8), EConversationDebugInfo::Executing);
                    
                    // I'll manage.
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101418"));
                    DC(int64(0x9d07abff0c2499f8), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499f9), EConversationDebugInfo::Executing);
                    
                    // I'm sure you will. If you do this well, you'll find it ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101426"));
                    DC(int64(0x9d07abff0c2499f9), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c249a0d), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Hunting_Scutes_Master);
                    DC(int64(0x9d07abff0c249a0d), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c249a23), EConversationDebugInfo::Executing);
                    Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES.SucceedQuest();
                    DC(int64(0x9d07abff0c249a23), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c249a25), EConversationDebugInfo::Executing);
                    Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.SucceedQuest();
                    DC(int64(0x9d07abff0c249a25), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Cavalorn_139281,
                        UTopic_Cavalorn_139301
                    );
                }
                else
                {
                    DC(int64(0x9d07abff0c2499d2), EConversationDebugInfo::Executing);
                    // I said three scutes - and I'm sure you can count to ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101042"));
                    DC(int64(0x9d07abff0c2499d2), EConversationDebugInfo::Done);
                    DC(int64(0x9d07abff0c2499e0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9d07abff0c2499e0), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Cavalorn_139281 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x9d07abff0c2499fb);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_101548_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139281);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d07abff0c2499fc), EConversationDebugInfo::Executing);
                // I'll put it to good use.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101548_686"));
                DC(int64(0x9d07abff0c2499fc), EConversationDebugInfo::Done);
                DC(int64(0x9d07abff0c249a04), EConversationDebugInfo::Executing);
                
                // Well, just remember: patience is key.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101558"));
                DC(int64(0x9d07abff0c249a04), EConversationDebugInfo::Done);
                DC(int64(0x9d07abff0c2499fe), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9d07abff0c2499fe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139301 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x9d07abff0c2499ff);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_101548_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139301);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d07abff0c249a00), EConversationDebugInfo::Executing);
                // Thanks for the lesson.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101548_3984"));
                DC(int64(0x9d07abff0c249a00), EConversationDebugInfo::Done);
                DB(int64(0xeec39d0ff5f1c916), G1R.Cavalorn_BestiaryDiscovered == 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                {
                    DC(int64(0xeec39d0ff5f1c92c), EConversationDebugInfo::Executing);
                    // You know ... I thought I'd seen one of these before. If ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310_2785"));
                    DC(int64(0xeec39d0ff5f1c92c), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c92d), EConversationDebugInfo::Executing);
                    // And each volume covers a different kind of animal.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151437"));
                    DC(int64(0xeec39d0ff5f1c92d), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c92e), EConversationDebugInfo::Executing);
                    
                    // There's more?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151443"));
                    DC(int64(0xeec39d0ff5f1c92e), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c92f), EConversationDebugInfo::Executing);
                    
                    // Five, I think. Let me know if you find any of the others ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151444"));
                    DC(int64(0xeec39d0ff5f1c92f), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c931), EConversationDebugInfo::Executing);
                    
                    // I'll keep an eye out.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151458"));
                    DC(int64(0xeec39d0ff5f1c931), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c8ec), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryDiscovered = 1;
                    DC(int64(0xeec39d0ff5f1c8ec), EConversationDebugInfo::Done);
                }
                else
                {
                    DB(int64(0x4cf259bf04e01460), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146e), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146f), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded());
                    DB(int64(0x4cf259bf04e01470), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded());
                    DB(int64(0x4cf259bf04e01471), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded());
                    
                    if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded())
                    {
                        
                    }
                    else
                    {
                        DC(int64(0xeec39d0ff5f1c92b), EConversationDebugInfo::Executing);
                        // If you find another volume, I'm sure there's more to ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101606"));
                        DC(int64(0xeec39d0ff5f1c92b), EConversationDebugInfo::Done);
                    }
                }
                DC(int64(0x9d07abff0c249a07), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9d07abff0c249a07), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn139249 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c944);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120246");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn139249);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4513bda582bdae85), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.IsRunning());
                    DB(int64(0xeec39d0ff5f1c948), G1R.Cavalorn_BestiaryDiscovered != 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a51066a), EConversationDebugInfo::Executing);
                // I found another one of those books.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120246"));
                DC(int64(0x1480f9cc2a51066a), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd247), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_CAVALORN.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd247), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn139616 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a51070f);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_121359");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202652);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1480f9cc2a510715), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a51070c), EConversationDebugInfo::Executing);
                // I have the swampshark parts.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_121359"));
                DC(int64(0x1480f9cc2a51070c), EConversationDebugInfo::Done);
                DB(int64(0x1480f9cc2a510718), Hero != nullptr && Hero.HasItem(UItAt_Swampshark_01, 1, 0));
                DB(int64(0x1480f9cc2a51071c), Hero != nullptr && Hero.HasItem(UItAt_Swampshark_03, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Swampshark_01, 1, 0) && Hero != nullptr && Hero.HasItem(UItAt_Swampshark_03, 1, 0))
                {
                    DC(int64(0x1480f9cc2a51071e), EConversationDebugInfo::Executing);
                    // Let's see ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122126_2995"));
                    DC(int64(0x1480f9cc2a51071e), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BESTIARY_4, Document::UDocumentSegment_CH4_BESTIARY_4_Completed);
                    DC(int64(0x9d07abff0c2499cd), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItAt_Swampshark_01, 1);
                    DC(int64(0x9d07abff0c2499cd), EConversationDebugInfo::Done);
                    DC(int64(0x1b4488402170660c), EConversationDebugInfo::Executing);
                    Cavalorn.AddItemToInventory(UItAt_Swampshark_03, 1);
                    DC(int64(0x1b4488402170660c), EConversationDebugInfo::Done);
                    DC(int64(0x1b4488402170660e), EConversationDebugInfo::Executing);
                    Hero.RemoveItemFromInventory(UItAt_Swampshark_03, 1, 0);
                    DC(int64(0x1b4488402170660e), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a510730), EConversationDebugInfo::Executing);
                    // By the gods, that seems to have worked out well for you. ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122318_731"));
                    DC(int64(0x1480f9cc2a510730), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a510734), EConversationDebugInfo::Executing);
                    
                    // About the payment ...
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122327"));
                    DC(int64(0x1480f9cc2a510734), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a510735), EConversationDebugInfo::Executing);
                    
                    // Of course - here's your ore.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122338"));
                    DC(int64(0x1480f9cc2a510735), EConversationDebugInfo::Done);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                    Cavalorn.AddItemToInventory(UItMi_Orenugget, 250);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a51073f), EConversationDebugInfo::Executing);
                    Cavalorn.AI.GiveItemTo(Hero, UItMi_Orenugget, 250);
                    DC(int64(0x1480f9cc2a51073f), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a510751), EConversationDebugInfo::Executing);
                    // But the real reward is that you and I are now the only ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122916_153"));
                    DC(int64(0x1480f9cc2a510751), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a51076b), EConversationDebugInfo::Executing);
                    // Use that advantage - in case you want to go after a ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_123411"));
                    DC(int64(0x1480f9cc2a51076b), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a510770), EConversationDebugInfo::Executing);
                    Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK.SucceedQuest();
                    DC(int64(0x1480f9cc2a510770), EConversationDebugInfo::Done);
                    DC(int64(0x1480f9cc2a51077a), EConversationDebugInfo::Executing);
                    Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.SucceedQuest();
                    DC(int64(0x1480f9cc2a51077a), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Cavalorn_139757,
                        UTopic_Cavalorn_139777
                    );
                }
                else
                {
                    DC(int64(0x1480f9cc2a510721), EConversationDebugInfo::Executing);
                    // Hmmph.. Seems like you don't.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122139_3750"));
                    DC(int64(0x1480f9cc2a510721), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Cavalorn_139757 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510744);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_122857_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139757);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510745), EConversationDebugInfo::Executing);
                // Who's going to buy these?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122857_3719"));
                DC(int64(0x1480f9cc2a510745), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510762), EConversationDebugInfo::Executing);
                
                // The mages, of course. Don't ask me why, but they have a ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122932"));
                DC(int64(0x1480f9cc2a510762), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510763), EConversationDebugInfo::Executing);
                // And if the mages want something, the other traders want ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122936"));
                DC(int64(0x1480f9cc2a510763), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510768), EConversationDebugInfo::Executing);
                // In any case, I don't think you'll be having difficulties ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_123200"));
                DC(int64(0x1480f9cc2a510768), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510747), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1480f9cc2a510747), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139777 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510748);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_122857_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139777);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510749), EConversationDebugInfo::Executing);
                // Thanks for the lesson.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_122857_3902"));
                DC(int64(0x1480f9cc2a510749), EConversationDebugInfo::Done);
                DB(int64(0xeec39d0ff5f1c953), G1R.Cavalorn_BestiaryDiscovered != 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                {
                    DB(int64(0x4cf259bf04e01460), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146e), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146f), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded());
                    DB(int64(0x4cf259bf04e01470), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded());
                    DB(int64(0x4cf259bf04e01471), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded());
                    
                    if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded())
                    {
                        
                    }
                    else
                    {
                        DC(int64(0xeec39d0ff5f1c968), EConversationDebugInfo::Executing);
                        // Keep an eye out for more of these books.
                        Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_123115"));
                        DC(int64(0xeec39d0ff5f1c968), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xeec39d0ff5f1c969), EConversationDebugInfo::Executing);
                    // You know ... I thought I'd seen one of these before. If ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310_2785"));
                    DC(int64(0xeec39d0ff5f1c969), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c96a), EConversationDebugInfo::Executing);
                    // And each volume covers a different kind of animal.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151437"));
                    DC(int64(0xeec39d0ff5f1c96a), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c96b), EConversationDebugInfo::Executing);
                    
                    // There's more?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151443"));
                    DC(int64(0xeec39d0ff5f1c96b), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c96c), EConversationDebugInfo::Executing);
                    
                    // Five, I think. Let me know if you find any of the others ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151444"));
                    DC(int64(0xeec39d0ff5f1c96c), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c96d), EConversationDebugInfo::Executing);
                    
                    // I'll keep an eye out.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151458"));
                    DC(int64(0xeec39d0ff5f1c96d), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c95e), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryDiscovered = 1;
                    DC(int64(0xeec39d0ff5f1c95e), EConversationDebugInfo::Done);
                }
                DC(int64(0x1480f9cc2a510766), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1480f9cc2a510766), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn140079 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c980);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_163418");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn140079);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4513bda582bdae85), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.IsRunning());
                    DB(int64(0xeec39d0ff5f1c989), G1R.Cavalorn_BestiaryDiscovered != 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a51077b), EConversationDebugInfo::Executing);
                // I found another book.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_163418"));
                DC(int64(0x1480f9cc2a51077b), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd3d4), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_CAVALORN.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd3d4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn141324 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f698);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_173153");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202740);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdd3d96bada88f6cd), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST.IsRunning());
                }
                
                return Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f695), EConversationDebugInfo::Executing);
                // I got something for you.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173153"));
                DC(int64(0xdd3d96bada88f695), EConversationDebugInfo::Done);
                DB(int64(0xdd3d96bada88f69f), Hero != nullptr && Hero.HasItem(UItAt_Shadow_06, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Shadow_06, 1, 0))
                {
                    DC(int64(0xdd3d96bada88f69b), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItAt_Shadow_06, 1);
                    DC(int64(0xdd3d96bada88f69b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_BESTIARY_5, Document::UDocumentSegment_CH5_BESTIARY_5_Completed);
                    DC(int64(0xdd3d96bada88f6ac), EConversationDebugInfo::Executing);
                    // By Innos ... The silver fur. You - you madman, you ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173438_1340"));
                    DC(int64(0xdd3d96bada88f6ac), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f6b1), EConversationDebugInfo::Executing);
                    
                    // It wasn't easy.
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173455"));
                    DC(int64(0xdd3d96bada88f6b1), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f6b0), EConversationDebugInfo::Executing);
                    
                    // No worthwhile hunt ever is. And this ... if there was ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173450"));
                    DC(int64(0xdd3d96bada88f6b0), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f6b2), EConversationDebugInfo::Executing);
                    // You can be truly proud of the fact that there's no ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173459"));
                    DC(int64(0xdd3d96bada88f6b2), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Cavalorn_141442,
                        UTopic_Cavalorn_141462
                    );
                }
                else
                {
                    DC(int64(0xdd3d96bada88f6a2), EConversationDebugInfo::Executing);
                    // And what is it? Empty pockets?
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173402"));
                    DC(int64(0xdd3d96bada88f6a2), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f6a7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdd3d96bada88f6a7), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Cavalorn_141442 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f6b4);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_173509_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141442);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f6b5), EConversationDebugInfo::Executing);
                // What will you do with the pelt?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173509_3719"));
                DC(int64(0xdd3d96bada88f6b5), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6bd), EConversationDebugInfo::Executing);
                
                // This? It'll serve as a trophy. A reminder that I helped ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173517"));
                DC(int64(0xdd3d96bada88f6bd), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6be), EConversationDebugInfo::Executing);
                // Everyone who sees it will be in awe - and know that ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173519"));
                DC(int64(0xdd3d96bada88f6be), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6b7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdd3d96bada88f6b7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_141462 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f6b8);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_173509_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141462);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f6b9), EConversationDebugInfo::Executing);
                // What about my reward?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173509_3902"));
                DC(int64(0xdd3d96bada88f6b9), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6bf), EConversationDebugInfo::Executing);
                
                // Yes, the shadowbeasts.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173536"));
                DC(int64(0xdd3d96bada88f6bf), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c0), EConversationDebugInfo::Executing);
                // As you can guess, their spines are anchored deep within ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173539"));
                DC(int64(0xdd3d96bada88f6c0), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c1), EConversationDebugInfo::Executing);
                
                // Like the lizard plates?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173540"));
                DC(int64(0xdd3d96bada88f6c1), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c2), EConversationDebugInfo::Executing);
                
                // It's the same principle, but much harder. One imprecise ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173542"));
                DC(int64(0xdd3d96bada88f6c2), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c3), EConversationDebugInfo::Executing);
                // Instead, you just work around the quills, then find the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173544"));
                DC(int64(0xdd3d96bada88f6c3), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c4), EConversationDebugInfo::Executing);
                // If you do it like this, you can extract the whole spine.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173545"));
                DC(int64(0xdd3d96bada88f6c4), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c6), EConversationDebugInfo::Executing);
                
                // Got it.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173550"));
                DC(int64(0xdd3d96bada88f6c6), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6c7), EConversationDebugInfo::Executing);
                
                // You've earned it. More than that, even. Everyone who ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_173551"));
                DC(int64(0xdd3d96bada88f6c7), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6d8), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST.SucceedQuest();
                DC(int64(0xdd3d96bada88f6d8), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f6dc), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.SucceedQuest();
                DC(int64(0xdd3d96bada88f6dc), EConversationDebugInfo::Done);
                DC(int64(0xfc3fdb73763bfa9d), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_Spines_Trained);
                DC(int64(0xfc3fdb73763bfa9d), EConversationDebugInfo::Done);
                DB(int64(0xeec39d0ff5f1c98f), G1R.Cavalorn_BestiaryDiscovered == 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                {
                    DC(int64(0xeec39d0ff5f1c9ab), EConversationDebugInfo::Executing);
                    // You know ... I thought I'd seen one of these before. If ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151310_2785"));
                    DC(int64(0xeec39d0ff5f1c9ab), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c9ac), EConversationDebugInfo::Executing);
                    // And each volume covers a different kind of animal.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151437"));
                    DC(int64(0xeec39d0ff5f1c9ac), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c9ad), EConversationDebugInfo::Executing);
                    
                    // There's more?
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151443"));
                    DC(int64(0xeec39d0ff5f1c9ad), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c9ae), EConversationDebugInfo::Executing);
                    
                    // Five, I think. Let me know if you find any of the others ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151444"));
                    DC(int64(0xeec39d0ff5f1c9ae), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c9af), EConversationDebugInfo::Executing);
                    
                    // I'll keep an eye out.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_151458"));
                    DC(int64(0xeec39d0ff5f1c9af), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c9a0), EConversationDebugInfo::Executing);
                    G1R.Cavalorn_BestiaryDiscovered = 1;
                    DC(int64(0xeec39d0ff5f1c9a0), EConversationDebugInfo::Done);
                }
                else
                {
                    DB(int64(0x4cf259bf04e01460), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146e), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded());
                    DB(int64(0x4cf259bf04e0146f), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded());
                    DB(int64(0x4cf259bf04e01470), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded());
                    DB(int64(0x4cf259bf04e01471), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded());
                    
                    if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.HasSucceeded() && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.HasSucceeded())
                    {
                        
                    }
                    else
                    {
                        DC(int64(0xeec39d0ff5f1c9aa), EConversationDebugInfo::Executing);
                        // If you find another volume, I'm sure there's more to ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_101606"));
                        DC(int64(0xeec39d0ff5f1c9aa), EConversationDebugInfo::Done);
                    }
                }
                DC(int64(0xdd3d96bada88f6c9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdd3d96bada88f6c9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn202426 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c899);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105420");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn202426);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeec39d0ff5f1c89c), Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.IsRunning());
                    DB(int64(0xeec39d0ff5f1c8a1), G1R.Cavalorn_BestiaryDiscovered == 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeec39d0ff5f1c894), EConversationDebugInfo::Executing);
                // I found this book about beasts.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420"));
                DC(int64(0xeec39d0ff5f1c894), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1c895), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xeec39d0ff5f1c895), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1cd17), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND.SucceedQuest();
                DC(int64(0xeec39d0ff5f1cd17), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202444 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c8a9);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn136944);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202426);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x123f53d08c63ce60), Cavalorn != nullptr && Cavalorn.IsSitting());
                
                if (Cavalorn != nullptr && Cavalorn.IsSitting())
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_02, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab04), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                    DC(int64(0x28bbc9fc9a61ab04), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_02, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab04), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                    DC(int64(0x28bbc9fc9a61ab04), EConversationDebugInfo::Done);
                }
                DC(int64(0xac71e07b3d8c894d), EConversationDebugInfo::Executing);
                // Ah, internal organs. Basic knowledge for every hunter.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105527_1924"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0xac71e07b3d8c894d), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c894f), EConversationDebugInfo::Executing);
                // There's quite a bit about minecrawlers, too. Now ... ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105541"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0xac71e07b3d8c894f), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8951), EConversationDebugInfo::Executing);
                
                // What?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105609"));
                DC(int64(0xac71e07b3d8c8951), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f642), EConversationDebugInfo::Executing);
                
                // Something about their glands ... Hm ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171638"));
                DC(int64(0xdd3d96bada88f642), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f643), EConversationDebugInfo::Executing);
                // Makes me wonder just how big these beasts can get. And ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171639"));
                DC(int64(0xdd3d96bada88f643), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f644), EConversationDebugInfo::Executing);
                // If one such gland ever comes into your possession, I'll ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171639_2238"));
                DC(int64(0xdd3d96bada88f644), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_137031,
                    UTopic_Cavalorn_137051,
                    UTopic_Cavalorn_137090,
                    UTopic_Cavalorn_137114
                );
            }
        }
        
        
        class UTopic_Cavalorn_137031 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c895c);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_105759_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137031);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c895d), EConversationDebugInfo::Executing);
                // What would you pay?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105759_3436"));
                DC(int64(0xac71e07b3d8c895d), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8965), EConversationDebugInfo::Executing);
                
                // Look, hunting isn't only about killing - it's about ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105808"));
                DC(int64(0xac71e07b3d8c8965), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8966), EConversationDebugInfo::Executing);
                // I could show you which organs fetch the best price - and ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105818"));
                DC(int64(0xac71e07b3d8c8966), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c895f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xac71e07b3d8c895f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137051 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c8960);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_105759_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137051);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c8961), EConversationDebugInfo::Executing);
                // Where would I find these creatures?
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105759_686"));
                DC(int64(0xac71e07b3d8c8961), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8967), EConversationDebugInfo::Executing);
                
                // In deep caverns. Like the mines, for example.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105845"));
                DC(int64(0xac71e07b3d8c8967), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8968), EConversationDebugInfo::Executing);
                // And they prefer to lurk in dark shadows.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105855"));
                DC(int64(0xac71e07b3d8c8968), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8963), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xac71e07b3d8c8963), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137090 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c8969);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_105916_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137090);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c896a), EConversationDebugInfo::Executing);
                // Sounds dangerous.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105916_2386"));
                DC(int64(0xac71e07b3d8c896a), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c896e), EConversationDebugInfo::Executing);
                
                // What in here isn't?
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105919"));
                DC(int64(0xac71e07b3d8c896e), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c896c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xac71e07b3d8c896c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_137114 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xac71e07b3d8c896f);
            default Caption = LocText("TEXT_WIP_YPWRGKF_20250113_105929_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_137114);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xac71e07b3d8c8970), EConversationDebugInfo::Executing);
                // I'll think about it.
                Hero.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105929_3984"));
                DC(int64(0xac71e07b3d8c8970), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8974), EConversationDebugInfo::Executing);
                
                // If you find something, you know where to find me.
                Cavalorn.AI.Say(LocText("TEXT_WIP_YPWRGKF_20250113_105935"));
                DC(int64(0xac71e07b3d8c8974), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_Collect);
                DC(int64(0xac71e07b3d8c897b), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FINDSAMPLE.StartQuest();
                DC(int64(0xac71e07b3d8c897b), EConversationDebugInfo::Done);
                DC(int64(0xac71e07b3d8c8977), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xac71e07b3d8c8977), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn202552 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c8fa);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105420");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn202552);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeec39d0ff5f1c90c), Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.IsRunning());
                    DB(int64(0xeec39d0ff5f1c911), G1R.Cavalorn_BestiaryDiscovered == 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeec39d0ff5f1c8f5), EConversationDebugInfo::Executing);
                // I found this book about beasts.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420"));
                DC(int64(0xeec39d0ff5f1c8f5), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1c8f6), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xeec39d0ff5f1c8f6), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd232), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_FIND.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd232), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202562 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c8fc);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn138834);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202552);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BESTIARY_3, Document::UDocumentSegment_CH3_BESTIARY_3_Collect);
                DB(int64(0x123f53d08c63ce86), Cavalorn != nullptr && Cavalorn.IsSitting());
                
                if (Cavalorn != nullptr && Cavalorn.IsSitting())
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_03, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab06), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                    DC(int64(0x28bbc9fc9a61ab06), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_03, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab06), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                    DC(int64(0x28bbc9fc9a61ab06), EConversationDebugInfo::Done);
                }
                DC(int64(0xdd3d96bada88f638), EConversationDebugInfo::Executing);
                // Hmm ... natural armor. This brings back memories.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171551"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0xdd3d96bada88f638), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f639), EConversationDebugInfo::Executing);
                // I broke a good blade once, when I tried skinning a ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171552"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0xdd3d96bada88f639), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005027a), EConversationDebugInfo::Executing);
                // But the good thing about that is, you won't have to ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095754_1924"));
                DC(int64(0x5ec92598005027a), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005027c), EConversationDebugInfo::Executing);
                // First, you cut around the hard parts, but with as little ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095934"));
                DC(int64(0x5ec92598005027c), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005027d), EConversationDebugInfo::Executing);
                // Once the plate is loose, you still have to mind the spot ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095935"));
                DC(int64(0x5ec92598005027d), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005027e), EConversationDebugInfo::Executing);
                
                // Seems straightforward enough.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095938"));
                DC(int64(0x5ec92598005027e), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005027f), EConversationDebugInfo::Executing);
                
                // In theory, yes. But ther's always a chance for random ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095939"));
                DC(int64(0x5ec92598005027f), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050280), EConversationDebugInfo::Executing);
                // If you manage to get the scutes from three lizards, I'll ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095939_2785"));
                DC(int64(0x5ec925980050280), EConversationDebugInfo::Done);
                DC(int64(0x5ec9259800502e7), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_Scutes_Trained);
                DC(int64(0x5ec9259800502e7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_138896,
                    UTopic_Cavalorn_138916,
                    UTopic_Cavalorn_138938,
                    UTopic_Cavalorn_138958
                );
                DC(int64(0x9d07abff0c2499c3), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_HARVESTSCUTES.StartQuest();
                DC(int64(0x9d07abff0c2499c3), EConversationDebugInfo::Done);
                DC(int64(0x5ec92598005029d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5ec92598005029d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_138896 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x5ec925980050282);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_100014_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_138896);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ec925980050283), EConversationDebugInfo::Executing);
                // What about razor plates?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100014_3436"));
                DC(int64(0x5ec925980050283), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050295), EConversationDebugInfo::Executing);
                
                // Cursed by Beliar himself, those. What I'm saying is: ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100030"));
                DC(int64(0x5ec925980050295), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050285), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5ec925980050285), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_138916 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x5ec925980050286);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_100014_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_138916);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ec925980050287), EConversationDebugInfo::Executing);
                // Where will I find lizards?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100014_686"));
                DC(int64(0x5ec925980050287), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050296), EConversationDebugInfo::Executing);
                
                // Near bodies of water. Rivers, lakes - and they often ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100130"));
                DC(int64(0x5ec925980050296), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050289), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5ec925980050289), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_138938 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x5ec92598005028b);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120447_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_138938);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd6ff919b75219c4), EConversationDebugInfo::Executing);
                // I'll do it.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120447_3984"));
                DC(int64(0xdd6ff919b75219c4), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050297), EConversationDebugInfo::Executing);
                
                // Good hunting. And remember - I want you to get the large ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100131"));
                DC(int64(0x5ec925980050297), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_138958 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x5ec925980050290);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_100022_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_138958);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ec925980050291), EConversationDebugInfo::Executing);
                
                // Seems like too much trouble.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100022_3984"));
                DC(int64(0x5ec925980050291), EConversationDebugInfo::Done);
                DC(int64(0x5ec925980050298), EConversationDebugInfo::Executing);
                
                // I understand that - there's plenty of broken blades out ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_100138"));
                DC(int64(0x5ec925980050298), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202642 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c937);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105420");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn202642);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeec39d0ff5f1c94a), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.IsRunning());
                    DB(int64(0xeec39d0ff5f1c94e), G1R.Cavalorn_BestiaryDiscovered == 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeec39d0ff5f1c932), EConversationDebugInfo::Executing);
                
                // I found this book about beasts.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420"));
                DC(int64(0xeec39d0ff5f1c932), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1c933), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xeec39d0ff5f1c933), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd252), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_FIND.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd252), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202652 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c939);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn139249);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202642);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_BESTIARY_4, Document::UDocumentSegment_CH4_BESTIARY_4_Collect);
                DB(int64(0x123f53d08c63ce9e), Cavalorn != nullptr && Cavalorn.IsSitting());
                
                if (Cavalorn != nullptr && Cavalorn.IsSitting())
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_04, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab08), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                    DC(int64(0x28bbc9fc9a61ab08), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_04, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab08), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                    DC(int64(0x28bbc9fc9a61ab08), EConversationDebugInfo::Done);
                }
                DC(int64(0x1480f9cc2a510673), EConversationDebugInfo::Executing);
                // Hmmm...Swampsharks ... nasty beasts. I lost two ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120340"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0x1480f9cc2a510673), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510676), EConversationDebugInfo::Executing);
                // I never learned how to skin them ... Interesting.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120343"));
                DC(int64(0x1480f9cc2a510676), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510677), EConversationDebugInfo::Executing);
                // All this time we had no idea how to do it properly - and ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120344"));
                DC(int64(0x1480f9cc2a510677), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f637), EConversationDebugInfo::Executing);
                // Look, if you bring me a swampshark hide - and the plates ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171530"));
                DC(int64(0xdd3d96bada88f637), EConversationDebugInfo::Done);
                DC(int64(0x5ec9259800502e7), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Hunting_SkinSwampshark_Trained);
                DC(int64(0x5ec9259800502e7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_139305,
                    UTopic_Cavalorn_139325,
                    UTopic_Cavalorn_139347,
                    UTopic_Cavalorn_139367,
                    UTopic_Cavalorn_139387,
                    UTopic_Cavalorn_139407
                );
                DC(int64(0x1480f9cc2a510709), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_4_BESTIARY_4_OBJ_HUNTSWAMPSHARK.StartQuest();
                DC(int64(0x1480f9cc2a510709), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139305 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510684);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120436_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139305);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510685), EConversationDebugInfo::Executing);
                // Make it worth my while how?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120436_2785"));
                DC(int64(0x1480f9cc2a510685), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a1), EConversationDebugInfo::Executing);
                
                // I'd give you two-hundred and fifty ore for both hide and ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120510"));
                DC(int64(0x1480f9cc2a5106a1), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a2), EConversationDebugInfo::Executing);
                // Trust me, that knowledge is worth more than a few ore ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120524"));
                DC(int64(0x1480f9cc2a5106a2), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510687), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1480f9cc2a510687), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139325 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510688);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120436_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139325);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510689), EConversationDebugInfo::Executing);
                // Why not do it yourself?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120436_3286"));
                DC(int64(0x1480f9cc2a510689), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a3), EConversationDebugInfo::Executing);
                
                // ... Messing with a swampshark? Ouff... I'll pass. ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120726"));
                DC(int64(0x1480f9cc2a5106a3), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a5), EConversationDebugInfo::Executing);
                // Er yeah I know my limits. Besides ... you're younger and ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120732"));
                DC(int64(0x1480f9cc2a5106a5), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a6), EConversationDebugInfo::Executing);
                
                // Spake the wise old hunter.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120733"));
                DC(int64(0x1480f9cc2a5106a6), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a7), EConversationDebugInfo::Executing);
                
                // Pfft - I'm not THAT old, all right? But what's more ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120733_3569"));
                DC(int64(0x1480f9cc2a5106a7), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a51068b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1480f9cc2a51068b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139347 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a51068d);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120443_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139347);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a51068e), EConversationDebugInfo::Executing);
                // Where can I find those beasts?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120443_686"));
                DC(int64(0x1480f9cc2a51068e), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a8), EConversationDebugInfo::Executing);
                
                // Uh, in the swamp, obviously. They're usually by the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120756"));
                DC(int64(0x1480f9cc2a5106a8), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510690), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1480f9cc2a510690), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139367 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510692);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120444_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139367);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510693), EConversationDebugInfo::Executing);
                // Any other advice?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120444_2386"));
                DC(int64(0x1480f9cc2a510693), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106a9), EConversationDebugInfo::Executing);
                
                // Yeah - don't die. They're sharks - they strike fast, ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120807"));
                DC(int64(0x1480f9cc2a5106a9), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a510695), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1480f9cc2a510695), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139387 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a510697);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120447_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139387);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XPWRGKF_20250114_120733_3569"), int64(0x1480f9cc2a510697));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a510698), EConversationDebugInfo::Executing);
                // I'll do it.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120447_3984"));
                DC(int64(0x1480f9cc2a510698), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106aa), EConversationDebugInfo::Executing);
                
                // Good. According to the book, you have to start at the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120837"));
                DC(int64(0x1480f9cc2a5106aa), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106ab), EConversationDebugInfo::Executing);
                // But you shouldn't just make a straight cut - go for the ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120839"));
                DC(int64(0x1480f9cc2a5106ab), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106ac), EConversationDebugInfo::Executing);
                // Good hunting.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120841"));
                DC(int64(0x1480f9cc2a5106ac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_139407 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x1480f9cc2a51069c);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_120450_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_139407);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XPWRGKF_20250114_120733_3569"), int64(0x1480f9cc2a51069c));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1480f9cc2a51069d), EConversationDebugInfo::Executing);
                
                // Too risky for my taste.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120450_1609"));
                DC(int64(0x1480f9cc2a51069d), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106ad), EConversationDebugInfo::Executing);
                
                // Smart of you. Swampsharks have killed more hunters than ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120901"));
                DC(int64(0x1480f9cc2a5106ad), EConversationDebugInfo::Done);
                DC(int64(0x1480f9cc2a5106ae), EConversationDebugInfo::Executing);
                // But if you ever do take one down: you start at the jaw, ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_120902"));
                DC(int64(0x1480f9cc2a5106ae), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202730 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c973);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105420");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn202730);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeec39d0ff5f1c985), Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.IsRunning());
                    DB(int64(0xeec39d0ff5f1c98a), G1R.Cavalorn_BestiaryDiscovered == 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeec39d0ff5f1c96e), EConversationDebugInfo::Executing);
                
                // I found this book about beasts.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420"));
                DC(int64(0xeec39d0ff5f1c96e), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1c96f), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xeec39d0ff5f1c96f), EConversationDebugInfo::Done);
                DC(int64(0x6a8eba3a58dfd3df), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_FIND.SucceedQuest();
                DC(int64(0x6a8eba3a58dfd3df), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn202740 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xeec39d0ff5f1c975);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn140079);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn202730);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x123f53d08c63ceb7), Cavalorn != nullptr && Cavalorn.IsSitting());
                
                if (Cavalorn != nullptr && Cavalorn.IsSitting())
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_05, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab0a), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                    DC(int64(0x28bbc9fc9a61ab0a), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_05, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0x28bbc9fc9a61ab0a), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                    DC(int64(0x28bbc9fc9a61ab0a), EConversationDebugInfo::Done);
                }
                DC(int64(0xdd3d96bada88f62e), EConversationDebugInfo::Executing);
                // Well, shit ... I thought that was just an old myth. A ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171431"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0xdd3d96bada88f62e), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f631), EConversationDebugInfo::Executing);
                // I've tracked some shadowbeasts in my time, but this ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171435"));
                DC(int64(0xdd3d96bada88f631), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_141044,
                    UTopic_Cavalorn_141064
                );
            }
        }
        
        
        class UTopic_Cavalorn_141044 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f648);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_171834_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141044);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f649), EConversationDebugInfo::Executing);
                // You didn't know they were real?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171834_1924"));
                DC(int64(0xdd3d96bada88f649), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f651), EConversationDebugInfo::Executing);
                
                // I've heard tales. I mean, look at the size ... A regular ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171950"));
                DC(int64(0xdd3d96bada88f651), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f652), EConversationDebugInfo::Executing);
                // And I bet IF someone really did find one, they ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171957"));
                DC(int64(0xdd3d96bada88f652), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f64b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdd3d96bada88f64b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_141064 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f64c);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_171834_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141064);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f64d), EConversationDebugInfo::Executing);
                // Where do you reckon it's hiding?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_171834_3436"));
                DC(int64(0xdd3d96bada88f64d), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f653), EConversationDebugInfo::Executing);
                
                // You really have a death wish, don't you?
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172004"));
                DC(int64(0xdd3d96bada88f653), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f659), EConversationDebugInfo::Executing);
                // Well, you've proven yourself a capable hunter.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172040"));
                DC(int64(0xdd3d96bada88f659), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f65a), EConversationDebugInfo::Executing);
                // Maybe you could really take on one of them - without ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172041"));
                DC(int64(0xdd3d96bada88f65a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_141117,
                    UTopic_Cavalorn_141137,
                    UTopic_Cavalorn_141185,
                    UTopic_Cavalorn_141212
                );
            }
        }
        
        
        class UTopic_Cavalorn_141117 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f65c);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_172054_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141117);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f65d), EConversationDebugInfo::Executing);
                // You think it's too dangerous?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172054_3286"));
                DC(int64(0xdd3d96bada88f65d), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f665), EConversationDebugInfo::Executing);
                
                // Much more than you know. You've made it out alive so ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172110"));
                DC(int64(0xdd3d96bada88f665), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f666), EConversationDebugInfo::Executing);
                // It would definitely be a memorable hunt.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172110_3984"));
                DC(int64(0xdd3d96bada88f666), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f667), EConversationDebugInfo::Executing);
                // And maybe you're just the right kind of crazy for this.
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172111"));
                DC(int64(0xdd3d96bada88f667), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f65f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdd3d96bada88f65f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_141137 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f660);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_172054_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141137);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f661), EConversationDebugInfo::Executing);
                // You want me to go for it?
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172054_2386"));
                DC(int64(0xdd3d96bada88f661), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f668), EConversationDebugInfo::Executing);
                
                // No. But I do want its pelt. Just thinking about it is ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172158"));
                DC(int64(0xdd3d96bada88f668), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f669), EConversationDebugInfo::Executing);
                // If it exists, and if you manage to find it and kill it, ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172158_1609"));
                DC(int64(0xdd3d96bada88f669), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f66a), EConversationDebugInfo::Executing);
                // But if you do, I'll show you how you can extract a ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172159"));
                DC(int64(0xdd3d96bada88f66a), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f663), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdd3d96bada88f663), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_141185 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f66c);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_172253_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141185);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f66d), EConversationDebugInfo::Executing);
                // Where exactly do I look for such a beast? If it's real.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172253_3569"));
                DC(int64(0xdd3d96bada88f66d), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f671), EConversationDebugInfo::Executing);
                
                // The higher mountain passes, where the snow doesn't melt. ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172301"));
                DC(int64(0xdd3d96bada88f671), EConversationDebugInfo::Done);
                DC(int64(0xdd3d96bada88f672), EConversationDebugInfo::Executing);
                // And when I tell you to be careful, this time I really ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172301_2801"));
                DC(int64(0xdd3d96bada88f672), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_BESTIARY_5, Document::UDocumentSegment_CH5_BESTIARY_5_Location);
                DC(int64(0xdd3d96bada88f66f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xdd3d96bada88f66f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_141212 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xdd3d96bada88f673);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_172403_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_141212);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd3d96bada88f674), EConversationDebugInfo::Executing);
                // I'll bring you the pelt.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172403_443"));
                DC(int64(0xdd3d96bada88f674), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_BESTIARY_5, Document::UDocumentSegment_CH5_BESTIARY_5_Collect);
                DC(int64(0xdd3d96bada88f6d3), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_BESTIARY_5_BESTIARY_5_OBJ_HUNTSHADOWBEAST.StartQuest();
                DC(int64(0xdd3d96bada88f6d3), EConversationDebugInfo::Done);
                DC(int64(0x8c610e294072d6e1), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"SpawnShadowBeastFrost");
                DC(int64(0x8c610e294072d6e1), EConversationDebugInfo::Done);
                DB(int64(0xdd3d96bada88f67a), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Fur_Trained))
                {
                    DC(int64(0xdd3d96bada88f67c), EConversationDebugInfo::Executing);
                    // Huh…famous last words.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172521"));
                    DC(int64(0xdd3d96bada88f67c), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f67f), EConversationDebugInfo::Executing);
                    // Remember everything I've taught you. You'll need it.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172540"));
                    DC(int64(0xdd3d96bada88f67f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xdd3d96bada88f683), EConversationDebugInfo::Executing);
                    
                    // I have no idea how to harvest a pelt, though.
                    Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172552_491"));
                    DC(int64(0xdd3d96bada88f683), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f682), EConversationDebugInfo::Executing);
                    
                    // Are you joking? You're about to mess with the most ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172552"));
                    DC(int64(0xdd3d96bada88f682), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f689), EConversationDebugInfo::Executing);
                    // Fine - let's change that. You start at the legs, then ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172853"));
                    DC(int64(0xdd3d96bada88f689), EConversationDebugInfo::Done);
                    DC(int64(0xc553335a7bc73b7a), EConversationDebugInfo::Executing);
                    
                    // She said the same thing ... 
                    Hero.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_113530"));
                    DC(int64(0xc553335a7bc73b7a), EConversationDebugInfo::Done);
                    DC(int64(0xc553335a7bc73b7b), EConversationDebugInfo::Executing);
                    
                    // Huh?
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_113539"));
                    DC(int64(0xc553335a7bc73b7b), EConversationDebugInfo::Done);
                    DC(int64(0xc553335a7bc73b7d), EConversationDebugInfo::Executing);
                    
                    // Never mind.
                    Hero.AI.Say(LocText("TEXT_WIP_XHVTSEI_20250122_113553"));
                    DC(int64(0xc553335a7bc73b7d), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f68a), EConversationDebugInfo::Executing);
                    
                    // All right ... Keep your blade at a flat angle. Too deep ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172854"));
                    DC(int64(0xdd3d96bada88f68a), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f68b), EConversationDebugInfo::Executing);
                    // Now, if you die, at least you know how it would've been ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_172905"));
                    DC(int64(0xdd3d96bada88f68b), EConversationDebugInfo::Done);
                    DC(int64(0xdd3d96bada88f686), EConversationDebugInfo::Executing);
                    Hero.LearnSkillForFree(UGE_Skill_Hunting_Fur_Trained);
                    DC(int64(0xdd3d96bada88f686), EConversationDebugInfo::Done);
                }
                DC(int64(0xdd3d96bada88f680), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdd3d96bada88f680), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalorn203001 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xc5fc492f37f52af5);
            default Caption = LocText("TEXT_WIP_XPWRGKF_20250114_095643");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceCavalorn203001);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5fc492f37f52af8), Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning());
                    DB(int64(0xc5fc492f37f5c37c), G1R.Cavalorn_BestiaryDiscovered != 0);
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1 != nullptr && !Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1.IsRunning())
                    return false;
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5fc492f37f52af0), EConversationDebugInfo::Executing);
                // I found another bestiary volume.
                Hero.AI.Say(LocText("TEXT_WIP_XPWRGKF_20250114_095643"));
                DC(int64(0xc5fc492f37f52af0), EConversationDebugInfo::Done);
                DC(int64(0xc5fc492f37f52af1), EConversationDebugInfo::Executing);
                
                // Let me see.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105420_41"));
                DC(int64(0xc5fc492f37f52af1), EConversationDebugInfo::Done);
                DC(int64(0xeec39d0ff5f1c9f6), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_CAVALORN.SucceedQuest();
                DC(int64(0xeec39d0ff5f1c9f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCavalorn203019 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xc5fc492f37f52b03);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn134683);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalorn203001);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_BESTIARY_1, Document::UDocumentSegment_CH1_BESTIARY_1_Cavalorn);
                DB(int64(0x123f53d08c63ced9), Cavalorn != nullptr && Cavalorn.IsSitting());
                
                if (Cavalorn != nullptr && Cavalorn.IsSitting())
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_01, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0xc6ce23fd64a4e3e7), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBookSeated);
                    DC(int64(0xc6ce23fd64a4e3e7), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Cavalorn, UItWr_Book_Bestiary_01, 1);
                    DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                    DC(int64(0xc6ce23fd64a4e3e7), EConversationDebugInfo::Executing);
                    Cavalorn.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadBook);
                    DC(int64(0xc6ce23fd64a4e3e7), EConversationDebugInfo::Done);
                }
                DB(int64(0xc5fc492f37f5c375), G1R.Cavalorn_BestiaryDiscovered == 0);
                
                if (G1R.Cavalorn_BestiaryDiscovered == 0)
                {
                    DC(int64(0x4513bda582bdae72), EConversationDebugInfo::Executing);
                    // Some kind of study on the local wildlife.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105546"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0x4513bda582bdae72), EConversationDebugInfo::Done);
                    DC(int64(0x4513bda582bdae73), EConversationDebugInfo::Executing);
                    
                    // That's interesting. It's a bestiary.
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105546_2238"));
                    DC(int64(0x4513bda582bdae73), EConversationDebugInfo::Done);
                    DC(int64(0x4513bda582bdae74), EConversationDebugInfo::Executing);
                    // Would've come in handy a while ago - when even a few ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105610"));
                    DC(int64(0x4513bda582bdae74), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xeec39d0ff5f1c863), EConversationDebugInfo::Executing);
                    
                    // Some kind of study on the local wildlife.
                    Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105546"));
                    DC(int64(0xeec39d0ff5f1c863), EConversationDebugInfo::Done);
                    DC(int64(0xeec39d0ff5f1c864), EConversationDebugInfo::Executing);
                    
                    // Would've come in handy a while ago - when even a few ...
                    Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105610"));
                    DC(int64(0xeec39d0ff5f1c864), EConversationDebugInfo::Done);
                }
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Cavalorn.AddItemToInventory(UItWr_Book_Bestiary_01, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Executing);
                Cavalorn.AI.GiveItemTo(Hero, UItWr_Book_Bestiary_01, 1);
                DC(int64(0x4513bda582bdae71), EConversationDebugInfo::Done);
                DC(int64(0x691ef330623ca064), EConversationDebugInfo::Executing);
                // Have you read it?
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_142412_1924"));
                DC(int64(0x691ef330623ca064), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_134756,
                    UTopic_Cavalorn_134776
                );
            }
        }
        
        
        class UTopic_Cavalorn_134756 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdae77);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105731_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_134756);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdae78), EConversationDebugInfo::Executing);
                // Yes, I thought it could help me survive.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105731_1924"));
                DC(int64(0x4513bda582bdae78), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae7f), EConversationDebugInfo::Executing);
                
                // Smart of you. A lot of people get killed by beasts just ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105740"));
                DC(int64(0x4513bda582bdae7f), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae80), EConversationDebugInfo::Executing);
                // So I hope you took something away from it, too.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105759"));
                DC(int64(0x4513bda582bdae80), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Executing);
                
                // What do you mean?
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110923"));
                DC(int64(0x4513bda582bdaee6), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Executing);
                
                // I'll ask you some questions, all right? And if you get ...
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_110930"));
                DC(int64(0x4513bda582bdaee7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Cavalorn_1351572,
                    UTopic_Cavalorn_135177
                );
            }
        }
        
        
        class UTopic_Cavalorn_134776 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdae7b);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_105731_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdae7c), EConversationDebugInfo::Executing);
                // Not yet.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105731_3436"));
                DC(int64(0x4513bda582bdae7c), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae81), EConversationDebugInfo::Executing);
                
                // Knowledge is probably your best weapon.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105822"));
                DC(int64(0x4513bda582bdae81), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae82), EConversationDebugInfo::Executing);
                // Read it. Understand it. And then we'll talk.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_105831"));
                DC(int64(0x4513bda582bdae82), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdae83), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdae83), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Cavalorn_1351572 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaee9);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Cavalorn_1351572);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Executing);
                // Fire away.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_2386"));
                DC(int64(0x4513bda582bdaeea), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER1_BESTIARY_1_BESTIARY_1_OBJ_TEST.StartQuest();
                DC(int64(0x4513bda582bdaf3c), EConversationDebugInfo::Done);
                DC(int64(0x31a0e6acb319ffea), EConversationDebugInfo::Executing);
                G1R.Cavalorn_BestiaryQuestionRunning = 1;
                DC(int64(0x31a0e6acb319ffea), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Cavalorn_135177 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x4513bda582bdaeed);
            default Caption = LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Executing);
                // Not interested.
                Hero.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111009_1609"));
                DC(int64(0x4513bda582bdaeee), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Executing);
                
                // Your choice.
                Cavalorn.AI.Say(LocText("TEXT_WIP_ZRHZVIF_20250109_111024"));
                DC(int64(0x4513bda582bdaef1), EConversationDebugInfo::Done);
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4513bda582bdaef2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalornExit : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x2ef8bd322c6eb68d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ea53522c330c56e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8ea53522c330c56e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCavalornHunter : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x2ef8bd322c6eb68f);
            default Caption = LocText("DIA_CAVALORN_HUNTER_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceCavalornHunter);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ea53522c330c56f), EConversationDebugInfo::Executing);
                // What are you doing out here?
                Hero.AI.Say(LocText("DIA_CAVALORN_HUNTER_15_00"));
                DC(int64(0x8ea53522c330c56f), EConversationDebugInfo::Done);
                DC(int64(0x8ea53522c330c570), EConversationDebugInfo::Executing);
                
                // Hunt. Scavengers, mostly.
                Cavalorn.AI.Say(LocText("DIA_CAVALORN_HUNTER_12_01"));
                DC(int64(0x8ea53522c330c570), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_CAVALORN, Document::UDocumentSegment_Glossary_UL_STT_CAVALORN_Introduction_Trader);
            }
        }
        
        
        class UChoiceCavalornLehrer : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x2ef8bd322c6eb692);
            default Caption = LocText("DIA_CAVALORN_LEHRER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8c6cac4f0c215776), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                return Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_STT_CAVALORN, Document::UDocumentSegment_Glossary_UL_STT_CAVALORN_Teacher2);
                DB(int64(0x2ef8bd322c6eb695), G1R.LogCavalorntrain == 0);
                
                if (G1R.LogCavalorntrain == 0)
                {
                    DC(int64(0x2ef8bd322c6eb696), EConversationDebugInfo::Executing);
                    G1R.LogCavalorntrain = 1;
                    DC(int64(0x2ef8bd322c6eb696), EConversationDebugInfo::Done);
                }
                DC(int64(0x8ea53522c330c572), EConversationDebugInfo::Executing);
                // Can you teach me something about hunting?
                Hero.AI.Say(LocText("DIA_CAVALORN_LEHRER_15_00"));
                DC(int64(0x8ea53522c330c572), EConversationDebugInfo::Done);
                DC(int64(0x8ea53522c330c573), EConversationDebugInfo::Executing);
                
                // Depends. What do you want to know?
                Cavalorn.AI.Say(LocText("DIA_CAVALORN_LEHRER_12_01"));
                DC(int64(0x8ea53522c330c573), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceCavalornLehrerBow,
                    UChoiceCavalornLehrerBow2,
                    UTopic_Cavalorn_210443
                );
            }
        }
        
        
        class UChoiceCavalornLehrerBow : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xc986e43b0f9c511b);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090827_2566");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca915fba22af69dd), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                    DB(int64(0x1766d81a13701e19), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca915fba22af69c0), EConversationDebugInfo::Executing);
                // Can you teach me to become better with a bow? 
                Hero.AI.Say(LocText("DIA_CAVALORN_LEHRER_BOW_15_00"));
                DC(int64(0xca915fba22af69c0), EConversationDebugInfo::Done);
                DB(int64(0x2e5b9d25c35607e3), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Trained));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Trained))
                {
                    DB(int64(0xa6b4c2eb914fd68f), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Trained));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Trained))
                    {
                        DC(int64(0xa7deef969d1cb3ee), EConversationDebugInfo::Executing);
                        // Hmm.. I guess I could.
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132346"));
                        DC(int64(0xa7deef969d1cb3ee), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3ef), EConversationDebugInfo::Executing);
                        // The biggest mistake almost every beginner makes is ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132421"));
                        DC(int64(0xa7deef969d1cb3ef), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3f0), EConversationDebugInfo::Executing);
                        // Also, keep your shoulders relaxed - it's hard, but it'll ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132615"));
                        DC(int64(0xa7deef969d1cb3f0), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3f1), EConversationDebugInfo::Executing);
                        // Oh, that should be enough for a start. Now practice, ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132720"));
                        DC(int64(0xa7deef969d1cb3f1), EConversationDebugInfo::Done);
                        DC(int64(0xca915fba22af69ea), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Bow_Trained);
                        DC(int64(0xca915fba22af69ea), EConversationDebugInfo::Done);
                        DC(int64(0xca915fba22af69eb), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xca915fba22af69eb), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa6b4c2eb914fd697), EConversationDebugInfo::Executing);
                        // Can you afford fifty nuggs?
                        Cavalorn.AI.Say(LocText("TEXT_WIP_PDMMTZB_20260211_121237_41"));
                        DC(int64(0xa6b4c2eb914fd697), EConversationDebugInfo::Done);
                        DC(int64(0xa6b4c2eb914fd6c3), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa6b4c2eb914fd6c3), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xca915fba22af69be), EConversationDebugInfo::Executing);
                    // Huh... I would, but you're not ready yet.
                    Cavalorn.AI.Say(LocText("TEXT_DDIAZ_20231017_111900_41"));
                    DC(int64(0xca915fba22af69be), EConversationDebugInfo::Done);
                    DC(int64(0xca915fba22af69ce), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xca915fba22af69ce), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceCavalornLehrerBow2 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0xc986e43b0f9c5114);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_090827_3792");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca915fba22af69df), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained));
                    DB(int64(0xca915fba22af69e0), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master));
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Trained))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Ranged_Bow_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca915fba22af69c6), EConversationDebugInfo::Executing);
                // Can you teach me to become a master archer? 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20231017_114902"));
                DC(int64(0xca915fba22af69c6), EConversationDebugInfo::Done);
                DB(int64(0xca915fba22af69ca), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Ranged_Bow_Master))
                {
                    DB(int64(0xa6b4c2eb914fd6ad), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Ranged_Bow_Master))
                    {
                        DC(int64(0xa7deef969d1cb3ea), EConversationDebugInfo::Executing);
                        // Ha! That's a big word. But I can show you some more ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132024"));
                        DC(int64(0xa7deef969d1cb3ea), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3eb), EConversationDebugInfo::Executing);
                        // First of all, don't strain too much when you're aiming - ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132034"));
                        DC(int64(0xa7deef969d1cb3eb), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3ec), EConversationDebugInfo::Executing);
                        // Second, try to really root yourself to the ground when ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132217"));
                        DC(int64(0xa7deef969d1cb3ec), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb3ed), EConversationDebugInfo::Executing);
                        // Finally, control your breathing. Hold it right until you ...
                        Cavalorn.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_132303"));
                        DC(int64(0xa7deef969d1cb3ed), EConversationDebugInfo::Done);
                        DC(int64(0x2e5b9d25c35607e5), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Ranged_Bow_Master);
                        DC(int64(0x2e5b9d25c35607e5), EConversationDebugInfo::Done);
                        DC(int64(0x2e5b9d25c35607e6), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x2e5b9d25c35607e6), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa6b4c2eb914fd6b8), EConversationDebugInfo::Executing);
                        // Sure. As soon as I get a hundred nuggs from you.
                        Cavalorn.AI.Say(LocText("TEXT_WIP_PDMMTZB_20260211_121447_2083"));
                        DC(int64(0xa6b4c2eb914fd6b8), EConversationDebugInfo::Done);
                        DC(int64(0xa6b4c2eb914fd6ca), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0xa6b4c2eb914fd6ca), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xca915fba22af69cf), EConversationDebugInfo::Executing);
                    // Huh... I would, but you're not ready yet.
                    Cavalorn.AI.Say(LocText("TEXT_DDIAZ_20231017_111900_41"));
                    DC(int64(0xca915fba22af69cf), EConversationDebugInfo::Done);
                    DC(int64(0xca915fba22af69d1), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xca915fba22af69d1), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Cavalorn_210443 : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x40028a00fd630ef9);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceStt336CavalornSellbow : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x2ef8bd322c6eb699);
            default Caption = LocText("STT_336_CAVALORN_SELLBOW_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCavalornHunter);
            default Rules.HideIfKnows(UChoiceStt336CavalornSellbow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ea53522c330c574), EConversationDebugInfo::Executing);
                // Any idea where I can get a bow?
                Hero.AI.Say(LocText("STT_336_CAVALORN_SELLBOW_INFO_15_01"));
                DC(int64(0x8ea53522c330c574), EConversationDebugInfo::Done);
                DC(int64(0x8ea53522c330c575), EConversationDebugInfo::Executing);
                
                // From me, actually. I make and sell the best bows in the ...
                Cavalorn.AI.Say(LocText("STT_336_CAVALORN_SELLBOW_INFO_12_02"));
                DC(int64(0x8ea53522c330c575), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceStt336CavalornTrade : UTopic_Hero__UL_STT_CAVALORN_336
        {
            default DebugId = int64(0x2ef8bd322c6eb69d);
            default Caption = LocText("STT_336_CAVALORN_TRADE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt336CavalornSellbow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ea53522c330c576), EConversationDebugInfo::Executing);
                
                // Show me those bows you're selling.
                Hero.AI.Say(LocText("STT_336_CAVALORN_TRADE_INFO_15_01"));
                DC(int64(0x8ea53522c330c576), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168d31), Cavalorn != nullptr && Cavalorn.IsAngryTowards(Hero));
                
                if (Cavalorn != nullptr && Cavalorn.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168d33), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Cavalorn.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_121557"));
                    DC(int64(0x7ec56dc721168d33), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_336_cavalorn_trade_exit_1");
                    DC(int64(0x7ec56dc721168d36), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168d36), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2ef8bd322c6eb69f), EConversationDebugInfo::Executing);
                    Cavalorn.AI.StartTradingWith(Hero);
                    DC(int64(0x2ef8bd322c6eb69f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_336_cavalorn_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */