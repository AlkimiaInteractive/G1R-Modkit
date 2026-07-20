#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OPS_UMAKHAL_2402 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OPS_UMAKHAL_2402";
        }
        
        
        class UTopic_Hero__OW_OPS_UMAKHAL_2402 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OPS_UMAKHAL_2402";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetUmakhal() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceUmakhal100016 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x89835ad73104f75e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceUmakhal100016);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe6bb99a9eea7c1d1), Hero != nullptr && !Hero.IsCloseToWaypoint(n"WP_OTOWN_ENTRANCE", 500.0f));
                }
                
                return Hero != nullptr && !Hero.IsCloseToWaypoint(n"WP_OTOWN_ENTRANCE", 500.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_UMAKHAL, Document::UDocumentSegment_Glossary_OW_OPS_UMAKHAL_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_Umakhal);
                DB(int64(0xa77480f9b999ea49), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x54be46ab90e8c527), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x54be46ab90e8c529), EConversationDebugInfo::Executing);
                    // Well done, morra. You tricked Ur-Nazkrog into letting ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104215_41"));
                    DC(int64(0x54be46ab90e8c529), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9704), EConversationDebugInfo::Executing);
                    // That doesn't mean we will let you do as you wish. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195522"));
                    DC(int64(0x1f7572620bef9704), EConversationDebugInfo::Done);
                    DC(int64(0x54be46ab90e8c52e), EConversationDebugInfo::Executing);
                    // I will follow you - and my axe will be ready. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104318"));
                    DC(int64(0x54be46ab90e8c52e), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Umakhal_104286,
                        UTopic_Umakhal_101413,
                        UTopic_Umakhal_101433,
                        UTopic_Umakhal_109293
                    );
                }
                else
                {
                    DC(int64(0x54be46ab90e8c52f), EConversationDebugInfo::Executing);
                    // Well done, morra. You tricked Ur-Nazkrog into letting ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104215_41"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x54be46ab90e8c52f), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9705), EConversationDebugInfo::Executing);
                    // That doesn't mean we will let you do as you wish. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195522"));
                    DC(int64(0x1f7572620bef9705), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9706), EConversationDebugInfo::Executing);
                    // I will follow you - and my axe will be ready. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104318"));
                    DC(int64(0x1f7572620bef9706), EConversationDebugInfo::Done);
                    DC(int64(0x54be46ab90e8c530), EConversationDebugInfo::Executing);
                    
                    // No idea what he just said ... 
                    Hero.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104557"));
                    DC(int64(0x54be46ab90e8c530), EConversationDebugInfo::Done);
                    DC(int64(0x54be46ab90e8c532), EConversationDebugInfo::Executing);
                    
                    // March on.
                    Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_105247"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x54be46ab90e8c532), EConversationDebugInfo::Done);
                    DC(int64(0x89835ad73104f764), EConversationDebugInfo::Executing);
                    Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
                    DC(int64(0x89835ad73104f764), EConversationDebugInfo::Done);
                    DC(int64(0x89835ad73104f765), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x89835ad73104f765), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Umakhal_104286 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x1f7572620bef96fc);
            default Caption = LocText("TEXT_WIP_DHKWYUI_20240710_195230_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_104286);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1f7572620bef96fd), EConversationDebugInfo::Executing);
                // I hunted down the beasts for an Ulu-Mulu, and I beat ...
                Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195230_686"));
                DC(int64(0x1f7572620bef96fd), EConversationDebugInfo::Done);
                DC(int64(0x1f7572620bef9702), EConversationDebugInfo::Executing);
                
                // It does, but not a trustworthy one. Ur-Shak helped you ...
                Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195252"));
                DC(int64(0x1f7572620bef9702), EConversationDebugInfo::Done);
                DC(int64(0x1f7572620bef9703), EConversationDebugInfo::Executing);
                // But whatever it is you're here to do, I'll make sure to ...
                Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195355"));
                DC(int64(0x1f7572620bef9703), EConversationDebugInfo::Done);
                DC(int64(0x1f7572620bef96ff), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x1f7572620bef96ff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Umakhal_101413 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x54be46ab90e8c534);
            default Caption = LocText("TEXT_WIP_BWGQKWK_20240710_093547_711");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_101413);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54be46ab90e8c535), EConversationDebugInfo::Executing);
                // ...
                Hero.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104938_2238"));
                DC(int64(0x54be46ab90e8c535), EConversationDebugInfo::Done);
                DC(int64(0x54be46ab90e8c540), EConversationDebugInfo::Executing);
                
                // Yes, morra ... play the silent one. I know you speak our ...
                Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_105039"));
                DC(int64(0x54be46ab90e8c540), EConversationDebugInfo::Done);
                DC(int64(0x54be46ab90e8c544), EConversationDebugInfo::Executing);
                // March on.
                Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_105247"));
                DC(int64(0x54be46ab90e8c544), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f764), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
                DC(int64(0x89835ad73104f764), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f765), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89835ad73104f765), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Umakhal_101433 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x54be46ab90e8c538);
            default Caption = LocText("TEXT_WIP_CEVDOTI_20240708_104938_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_101433);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54be46ab90e8c539), EConversationDebugInfo::Executing);
                // I mean you no harm.
                Hero.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_104938_2785"));
                DC(int64(0x54be46ab90e8c539), EConversationDebugInfo::Done);
                DC(int64(0x54be46ab90e8c542), EConversationDebugInfo::Executing);
                
                // Lies. You are a morra, and morra never bode well. 
                Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_105151"));
                DC(int64(0x54be46ab90e8c542), EConversationDebugInfo::Done);
                DC(int64(0x54be46ab90e8c544), EConversationDebugInfo::Executing);
                // March on.
                Umakhal.AI.Say(LocText("TEXT_WIP_CEVDOTI_20240708_105247"));
                DC(int64(0x54be46ab90e8c544), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f764), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
                DC(int64(0x89835ad73104f764), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f765), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89835ad73104f765), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Umakhal_109293 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x3eaee042976dffc1);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_194353_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_109293);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3eaee042976dffc2), EConversationDebugInfo::Executing);
                // What if I just knock you out right here? 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_194353_41"));
                DC(int64(0x3eaee042976dffc2), EConversationDebugInfo::Done);
                DC(int64(0x3eaee042976dffc5), EConversationDebugInfo::Executing);
                
                // Then all of us will be your enemy. But go on - it saves ...
                Umakhal.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_194439"));
                DC(int64(0x3eaee042976dffc5), EConversationDebugInfo::Done);
                DC(int64(0x3eaee042976dffc4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3eaee042976dffc4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUmakhal100460 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0xe6bb99a9eea7c1d4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_ENTRANCE", 200.0f, int64(0xe6bb99a9eea7c1d4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe6bb99a9eea7c1db), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                }
                
                return Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x9caf4c870104c9e6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x1f7572620bef95cb), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x1f7572620bef95cf), EConversationDebugInfo::Executing);
                    // What, is the morra getting scared? Good. Run away, to ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_191326_41"));
                    DC(int64(0x1f7572620bef95cf), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a729), EConversationDebugInfo::Executing);
                    // I'll be here when you return. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172005"));
                    DC(int64(0x107e5d28efd1a729), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a72b), EConversationDebugInfo::Executing);
                    
                    // I don't mind. 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172055"));
                    DC(int64(0x107e5d28efd1a72b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x1f7572620bef95d3), EConversationDebugInfo::Executing);
                    
                    // What, is the morra getting scared? Good. Run away, to ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_191326_41"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef95d3), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a72c), EConversationDebugInfo::Executing);
                    // I'll be here when you return. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172005"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x107e5d28efd1a72c), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a72d), EConversationDebugInfo::Executing);
                    
                    // Don't think he'll follow me past here. 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172206"));
                    DC(int64(0x107e5d28efd1a72d), EConversationDebugInfo::Done);
                }
                DC(int64(0xe6bb99a9eea7c1df), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance);
                DC(int64(0xe6bb99a9eea7c1df), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a679d6), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.SucceedQuest();
                DC(int64(0xd57b2dc71a679d6), EConversationDebugInfo::Done);
                DC(int64(0xe6bb99a9eea7c1e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe6bb99a9eea7c1e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal102098 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0xa77480f9b999ea96);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89835ad73104f762), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone));
                    DB(int64(0x9d5bf4c6fa761b5a), Hero != nullptr && !Hero.IsCloseToWaypoint(n"WP_OTOWN_THRONE_ROOM", 600.0f));
                    DB(int64(0x2d0b0d17dbaca32a), G1R.HeroInsideThroneRoom == 0);
                }
                
                if (Umakhal != nullptr && !Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone))
                    return false;
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OTOWN_THRONE_ROOM", 600.0f))
                    return false;
                
                if (G1R.HeroInsideThroneRoom != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x107e5d28efd1a749), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x107e5d28efd1a75d), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    DC(int64(0x107e5d28efd1a74d), EConversationDebugInfo::Executing);
                    // You vermin! You think you can trick me? You snuck out ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172708_2238"));
                    DC(int64(0x107e5d28efd1a74d), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a75c), EConversationDebugInfo::Executing);
                    
                    // I'd never do that. 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172755"));
                    DC(int64(0x107e5d28efd1a75c), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76c), EConversationDebugInfo::Executing);
                    
                    // Funny! So funny I feel like sinking my fist into the ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173156"));
                    DC(int64(0x107e5d28efd1a76c), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76d), EConversationDebugInfo::Executing);
                    // But I have orders ... and I will obey them. You will ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173213"));
                    DC(int64(0x107e5d28efd1a76d), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76e), EConversationDebugInfo::Executing);
                    // Not as long as your stink taints this ordôkh.
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173231"));
                    DC(int64(0x107e5d28efd1a76e), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                {
                    DC(int64(0x107e5d28efd1a765), EConversationDebugInfo::Executing);
                    // You vermin! You think you can trick me? You snuck out ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172708_2238"));
                    DC(int64(0x107e5d28efd1a765), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76a), EConversationDebugInfo::Executing);
                    
                    // I, um ... 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173002"));
                    DC(int64(0x107e5d28efd1a76a), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76b), EConversationDebugInfo::Executing);
                    
                    // No more games from now on! You will never lose me again, ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173032"));
                    DC(int64(0x107e5d28efd1a76b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x107e5d28efd1a751), EConversationDebugInfo::Executing);
                    // You vermin! You think you can trick me? You snuck out ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172708_2238"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x107e5d28efd1a751), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a76f), EConversationDebugInfo::Executing);
                    // No more games from now on! You will never lose me again, ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173032"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x107e5d28efd1a76f), EConversationDebugInfo::Done);
                }
                DC(int64(0xa77480f9b999ea9b), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
                DC(int64(0xa77480f9b999ea9b), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a679dc), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.RestartQuest();
                DC(int64(0xd57b2dc71a679dc), EConversationDebugInfo::Done);
                DC(int64(0xa77480f9b999ea9e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa77480f9b999ea9e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal102545 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x9caf4c870104c9ef);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_ARENA", 200.0f, int64(0x9caf4c870104c9ef));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9caf4c870104c9f5), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                }
                
                return Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x9caf4c870104ca16), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x9caf4c870104c9f8), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x9caf4c870104c9fa), EConversationDebugInfo::Executing);
                    // What, the morra wants to fight? Good. Saves me some ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112409_2083"));
                    DC(int64(0x9caf4c870104c9fa), EConversationDebugInfo::Done);
                    DC(int64(0x9caf4c870104ca11), EConversationDebugInfo::Executing);
                    // I'll wait here. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112904"));
                    DC(int64(0x9caf4c870104ca11), EConversationDebugInfo::Done);
                    DC(int64(0x9caf4c870104c9f9), EConversationDebugInfo::Executing);
                    
                    // I don't mind. 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172055"));
                    DC(int64(0x9caf4c870104c9f9), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9caf4c870104c9fc), EConversationDebugInfo::Executing);
                    
                    // What, the morra wants to fight? Good. Saves me some ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112409_2083"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x9caf4c870104c9fc), EConversationDebugInfo::Done);
                    DC(int64(0x9caf4c870104ca13), EConversationDebugInfo::Executing);
                    // I'll wait here. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112904"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x9caf4c870104ca13), EConversationDebugInfo::Done);
                    DC(int64(0x9caf4c870104c9fb), EConversationDebugInfo::Executing);
                    
                    // Hmm ... seems he won't follow me into the arena. 
                    Hero.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112411"));
                    DC(int64(0x9caf4c870104c9fb), EConversationDebugInfo::Done);
                }
                DC(int64(0x9caf4c870104ca00), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena);
                DC(int64(0x9caf4c870104ca00), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a679d8), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.SucceedQuest();
                DC(int64(0xd57b2dc71a679d8), EConversationDebugInfo::Done);
                DC(int64(0x9caf4c870104ca03), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9caf4c870104ca03), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal102625 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x9caf4c870104ca06);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceUmakhal102625);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9caf4c870104ca09), Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasSucceeded());
                }
                
                return Quest::ORCENCLAVE_THECHAMPIONBURIAL != nullptr && Quest::ORCENCLAVE_THECHAMPIONBURIAL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9caf4c870104ca0c), EConversationDebugInfo::Executing);
                // ... You did it. You passed Ur-Nazkrog's trial. 
                Umakhal.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112706"));
                DC(int64(0x9caf4c870104ca0c), EConversationDebugInfo::Done);
                DC(int64(0x9caf4c870104ca0d), EConversationDebugInfo::Executing);
                
                // I did? 
                Hero.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_112707"));
                DC(int64(0x9caf4c870104ca0d), EConversationDebugInfo::Done);
                DC(int64(0x16d1286c64c7f0d2), EConversationDebugInfo::Executing);
                
                // Yes. And she told me to take my eyes off you once this ...
                Umakhal.AI.Say(LocText("TEXT_WIP_BHKWYUI_20240712_181607"));
                DC(int64(0x16d1286c64c7f0d2), EConversationDebugInfo::Done);
                DC(int64(0x16d1286c64c7f0d3), EConversationDebugInfo::Executing);
                // What do you seek here, morra? What is all this about? 
                Umakhal.AI.Say(LocText("TEXT_WIP_BHKWYUI_20240712_181618"));
                DC(int64(0x16d1286c64c7f0d3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_UMAKHAL, Document::UDocumentSegment_Glossary_OW_OPS_UMAKHAL_StopFollowing);
                DC(int64(0x9caf4c870104ca0f), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Start);
                DC(int64(0x9caf4c870104ca0f), EConversationDebugInfo::Done);
                DC(int64(0x9caf4c870104ca10), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9caf4c870104ca10), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal103900 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x107e5d28efd1a77a);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_173545");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x107e5d28efd1a77d), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                    DB(int64(0x9caf4c870104c9ea), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    return false;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x107e5d28efd1a778), EConversationDebugInfo::Executing);
                // Will you never stop following me? 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173545"));
                DC(int64(0x107e5d28efd1a778), EConversationDebugInfo::Done);
                DC(int64(0x107e5d28efd1a779), EConversationDebugInfo::Executing);
                
                // I don't understand, and I don't want to. Shut up and ...
                Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173545_3436"), ForceSubtitleLanguage = n"foreign");
                DC(int64(0x107e5d28efd1a779), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUmakhal104155 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x107e5d28efd1a780);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_173736");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x107e5d28efd1a783), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                    DB(int64(0x9caf4c870104c9ec), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                    return true;
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x107e5d28efd1a77e), EConversationDebugInfo::Executing);
                
                // I challenge you to a duel. 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173736"));
                DC(int64(0x107e5d28efd1a77e), EConversationDebugInfo::Done);
                DC(int64(0x107e5d28efd1a77f), EConversationDebugInfo::Executing);
                
                // (laughs) You think I'm so stupid? My orders are to watch ...
                Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173736_686"));
                DC(int64(0x107e5d28efd1a77f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Umakhal_104433,
                    UTopic_Umakhal_104413,
                    UTopic_Umakhal_105084
                );
                DC(int64(0x107e5d28efd1a792), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x107e5d28efd1a792), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Umakhal_104433 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x107e5d28efd1a789);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_173917_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_104433);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x107e5d28efd1a790), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x107e5d28efd1a78a), EConversationDebugInfo::Executing);
                // Do you fear me so much? 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173917_3569"));
                DC(int64(0x107e5d28efd1a78a), EConversationDebugInfo::Done);
                DC(int64(0x107e5d28efd1a793), EConversationDebugInfo::Executing);
                
                // I fear no one. Especially not a morra. 
                Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_174249"));
                DC(int64(0x107e5d28efd1a793), EConversationDebugInfo::Done);
                DC(int64(0x107e5d28efd1a794), EConversationDebugInfo::Executing);
                // But I won't fall for your bait. Move. 
                Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_174333"));
                DC(int64(0x107e5d28efd1a794), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Umakhal_104413 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x107e5d28efd1a785);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_173917_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_104413);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x107e5d28efd1a78e), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x107e5d28efd1a786), EConversationDebugInfo::Executing);
                
                // Are you ... um ... dammit, I can't pronounce that. 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_173917_3984"));
                DC(int64(0x107e5d28efd1a786), EConversationDebugInfo::Done);
                DC(int64(0x107e5d28efd1a791), EConversationDebugInfo::Executing);
                
                // Enough of this. Move. 
                Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_174132"));
                DC(int64(0x107e5d28efd1a791), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Umakhal_105084 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x107e5d28efd1a795);
            default Caption = LocText("TEXT_WIP_CHKWYUI_20240711_174407_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Umakhal_105084);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x107e5d28efd1a796), EConversationDebugInfo::Executing);
                
                // Fine. 
                Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_174407_2801"));
                DC(int64(0x107e5d28efd1a796), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceUmakhal99842 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x89835ad73104f749);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89835ad73104f748), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89835ad73104f748), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal99858 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x89835ad73104f74d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9caf4c870104c9f4), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OTOWN_ARENA2", 200.0f));
                    DB(int64(0xc413ac721f07eb07), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena));
                    DB(int64(0xf3b0e534411c65c4), Umakhal != nullptr && Umakhal.IsCloseToWaypoint(n"FP_OTOWN_STAND_50", 500.0f));
                    DB(int64(0xc413ac721f07eb08), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance));
                    DB(int64(0x35b41f65960b834a), Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_OTOWN_STAND_50", 500.0f));
                }
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_OTOWN_ARENA2", 200.0f) && Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitArena))
                    return true;
                
                if (Umakhal != nullptr && Umakhal.IsCloseToWaypoint(n"FP_OTOWN_STAND_50", 500.0f) && Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_WaitEntrance) && Hero != nullptr && Hero.IsCloseToWaypoint(n"FP_OTOWN_STAND_50", 500.0f))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x9caf4c870104c9e9), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x107e5d28efd1a731), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x107e5d28efd1a735), EConversationDebugInfo::Executing);
                    // Is the morra done snooping around? Good. I will follow ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172515_41"));
                    DC(int64(0x107e5d28efd1a735), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a744), EConversationDebugInfo::Executing);
                    
                    // Of course you will.
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172602"));
                    DC(int64(0x107e5d28efd1a744), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x107e5d28efd1a739), EConversationDebugInfo::Executing);
                    
                    // Is the morra done snooping around? Good. I will follow ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172515_41"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x107e5d28efd1a739), EConversationDebugInfo::Done);
                    DC(int64(0x107e5d28efd1a745), EConversationDebugInfo::Executing);
                    
                    // Whatever you just said ... 
                    Hero.AI.Say(LocText("TEXT_WIP_CHKWYUI_20240711_172640"));
                    DC(int64(0x107e5d28efd1a745), EConversationDebugInfo::Done);
                }
                DC(int64(0x9d5bf4c6fa761b58), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
                DC(int64(0x9d5bf4c6fa761b58), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a679da), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.RestartQuest();
                DC(int64(0xd57b2dc71a679da), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f74f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89835ad73104f74f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceUmakhal99903 : UTopic_Hero__OW_OPS_UMAKHAL_2402
        {
            default DebugId = int64(0x89835ad73104f752);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_THRONE_ROOM", 300.0f, int64(0x89835ad73104f752));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89835ad73104f75a), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                }
                
                return Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OPS_UMAKHAL, Document::UDocumentSegment_Glossary_OW_OPS_UMAKHAL_ThroneRoom);
                DB(int64(0x1f7572620bef95e1), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x1f7572620bef95fe), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    DC(int64(0x1f7572620bef9600), EConversationDebugInfo::Executing);
                    // What do you think you're doing? This is the warchief's ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_192346_2238"));
                    DC(int64(0x1f7572620bef9600), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef968e), EConversationDebugInfo::Executing);
                    
                    // And?
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193636"));
                    DC(int64(0x1f7572620bef968e), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9690), EConversationDebugInfo::Executing);
                    
                    // You ... I ... (exhales) I'm not allowed to go in there. ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193814"));
                    DC(int64(0x1f7572620bef9690), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9691), EConversationDebugInfo::Executing);
                    
                    // But I am? 
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193849"));
                    DC(int64(0x1f7572620bef9691), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9692), EConversationDebugInfo::Executing);
                    
                    // Um ... No. 
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193853"));
                    DC(int64(0x1f7572620bef9692), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96d9), EConversationDebugInfo::Executing);
                    
                    // Yes, I am. I wield the Ulu-Mulu, so I may enter - but ...
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193908"));
                    DC(int64(0x1f7572620bef96d9), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96da), EConversationDebugInfo::Executing);
                    
                    // Cursed morra ... you think you're smart, don't you? All ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_194114"));
                    DC(int64(0x1f7572620bef96da), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96db), EConversationDebugInfo::Executing);
                    // But if you do anything foolish, I WILL follow - and I ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_194137"));
                    DC(int64(0x1f7572620bef96db), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96f2), EConversationDebugInfo::Executing);
                    
                    // (to himself) You're welcome to try. 
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_194242"));
                    DC(int64(0x1f7572620bef96f2), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled))
                {
                    DC(int64(0x1f7572620bef95ed), EConversationDebugInfo::Executing);
                    
                    // What do you think you're doing? This is the warchief's ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_192346_2238"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef95ed), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96f3), EConversationDebugInfo::Executing);
                    
                    // Dammit ... this too fast.
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_195111"));
                    DC(int64(0x1f7572620bef96f3), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96f4), EConversationDebugInfo::Executing);
                    
                    // Of course you don't ... (exhales) I am not allowed in ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_192822"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef96f4), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef96f5), EConversationDebugInfo::Executing);
                    // I will not follow you, but I will watch from outside. Do ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193005"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef96f5), EConversationDebugInfo::Done);
                    DC(int64(0x16d1286c64c7f0cd), EConversationDebugInfo::Executing);
                    
                    // Not sure what that was about ... seems like he can't ...
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193523"));
                    DC(int64(0x16d1286c64c7f0cd), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x1f7572620bef95e7), EConversationDebugInfo::Executing);
                    
                    // What do you think you're doing? This is the warchief's ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_192346_2238"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef95e7), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef960e), EConversationDebugInfo::Executing);
                    // Of course you don't ... (exhales) I am not allowed in ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_192822"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef960e), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef9610), EConversationDebugInfo::Executing);
                    // I will not follow you, but I will watch from outside. Do ...
                    Umakhal.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193005"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x1f7572620bef9610), EConversationDebugInfo::Done);
                    DC(int64(0x1f7572620bef961e), EConversationDebugInfo::Executing);
                    
                    // Not sure what that was about ... seems like he can't ...
                    Hero.AI.Say(LocText("TEXT_WIP_DHKWYUI_20240710_193523"));
                    DC(int64(0x1f7572620bef961e), EConversationDebugInfo::Done);
                }
                DC(int64(0x89835ad73104f758), EConversationDebugInfo::Executing);
                Umakhal.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OPS_Umakhal_2402_WaitThrone);
                DC(int64(0x89835ad73104f758), EConversationDebugInfo::Done);
                DC(int64(0xd57b2dc71a679d4), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_RIDOFUMAKHAL.SucceedQuest();
                DC(int64(0xd57b2dc71a679d4), EConversationDebugInfo::Done);
                DC(int64(0x89835ad73104f759), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89835ad73104f759), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */