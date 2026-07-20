#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_ORCTEMPLEWARRIORM02_2042 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_ORCTEMPLEWARRIORM02_2042";
        }
        
        
        class UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_ORCTEMPLEWARRIORM02_2042";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetOrcTempleWarriorM02() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetUrNazkrog() const property
            {
                return GetCharacter(n"OW_OSM_URNAZKROG_2401");
            }
        }
        
        
        class UChoiceOrctemplewarriorm02102697 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0xc5b543ab0417e572);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b543ab0417e571), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5b543ab0417e571), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrctemplewarriorm02102713 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0xc5b543ab0417e576);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5b543ab0417e57a), G1R.UrNazkrog_Permission != 1);
                    DB(int64(0xc5b543ab0417e588), OrcTempleWarriorM02 != nullptr && !OrcTempleWarriorM02.IsRefusingToTalkWith(Hero));
                }
                
                if (G1R.UrNazkrog_Permission == 1)
                    return false;
                
                if (OrcTempleWarriorM02 != nullptr && OrcTempleWarriorM02.IsRefusingToTalkWith(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x315a3a906817910), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x315a3a906817910), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DB(int64(0x315a3a90681791f), G1R.TemplerGuardAdvice == 1);
                    
                    if (G1R.TemplerGuardAdvice == 1)
                    {
                        DC(int64(0x315a3a906817928), EConversationDebugInfo::Executing);
                        // Is the morra deaf? Get away, or you will feel my axe!
                        OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134729_686"));
                        DC(int64(0x315a3a906817928), EConversationDebugInfo::Done);
                        DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Executing);
                        OrcTempleWarriorM02.RefuseToTalk(10);
                        DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_orctemplewarriorm02_102713_exit_1");
                        DC(int64(0x315a3a906817934), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x315a3a906817934), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x315a3a906817919), EConversationDebugInfo::Executing);
                        // Not one step closer, morra. These are sacred grounds. 
                        OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134514"));
                        DC(int64(0x315a3a906817919), EConversationDebugInfo::Done);
                        Subdialog(
                            UTopic_OrcTempleWarriorM02_106522,
                            UTopic_OrcTempleWarriorM02_106542,
                            UTopic_OrcTempleWarriorM02_106820,
                            UTopic_OrcTempleWarriorM02_107633
                        );
                    }
                }
                else
                {
                    DC(int64(0x315a3a906817917), EConversationDebugInfo::Executing);
                    // Not one step closer, morra. These are sacred grounds. 
                    OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134514"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x315a3a906817917), EConversationDebugInfo::Done);
                    DC(int64(0x315a3a906817915), EConversationDebugInfo::Executing);
                    
                    // Whatever he just said, I think that's the temple ...
                    Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134350"));
                    DC(int64(0x315a3a906817915), EConversationDebugInfo::Done);
                    DC(int64(0x315a3a906817916), EConversationDebugInfo::Executing);
                    
                    // Move, morra. Get out of my sight!
                    OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134350_3436"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x315a3a906817916), EConversationDebugInfo::Done);
                    DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Executing);
                    OrcTempleWarriorM02.RefuseToTalk(10);
                    DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Done);
                    DC(int64(0xc5b543ab0417e589), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc5b543ab0417e589), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_OrcTempleWarriorM02_106522 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x315a3a906817939);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_134848_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_OrcTempleWarriorM02_106522);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x315a3a906817944), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                }
                
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x315a3a90681793a), EConversationDebugInfo::Executing);
                // How do I prove myself worthy so that you will allow me ...
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134848_2386"));
                DC(int64(0x315a3a90681793a), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817954), EConversationDebugInfo::Executing);
                
                // You can't. The temple is forbidden even for most of us. 
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135309"));
                DC(int64(0x315a3a906817954), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817956), EConversationDebugInfo::Executing);
                // If it were up to To-Churnagg, you wouldn't even walk ...
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135349"));
                DC(int64(0x315a3a906817956), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681793c), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x315a3a90681793c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OrcTempleWarriorM02_106542 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x315a3a90681793d);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_134848_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_OrcTempleWarriorM02_106542);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x315a3a90681793e), EConversationDebugInfo::Executing);
                // But I have the Ulu-Mulu. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134848_1609"));
                DC(int64(0x315a3a90681793e), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817953), EConversationDebugInfo::Executing);
                
                // You speak our tongue, huh? Well, no matter. 
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135147"));
                DC(int64(0x315a3a906817953), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817949), EConversationDebugInfo::Executing);
                // Yes, you have the Ulu-Mulu, and that is why we don't ...
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_134925"));
                DC(int64(0x315a3a906817949), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681794a), EConversationDebugInfo::Executing);
                // Now go!
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135001"));
                DC(int64(0x315a3a90681794a), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817940), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x315a3a906817940), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OrcTempleWarriorM02_106820 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x315a3a90681794b);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_135016_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_OrcTempleWarriorM02_106820);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x315a3a90681794c), EConversationDebugInfo::Executing);
                // Is this the way to the Sleeper's Temple? 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135016_3569"));
                DC(int64(0x315a3a90681794c), EConversationDebugInfo::Done);
                DC(int64(0x315a3a906817951), EConversationDebugInfo::Executing);
                
                // Even if it were, it doesn't concern you. Go. 
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135030"));
                DC(int64(0x315a3a906817951), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681794e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x315a3a90681794e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OrcTempleWarriorM02_107633 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x315a3a906817957);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_135409_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_OrcTempleWarriorM02_107633);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x315a3a906817958), EConversationDebugInfo::Executing);
                // All right. I'm going. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135409_2801"));
                DC(int64(0x315a3a906817958), EConversationDebugInfo::Done);
                DC(int64(0x315a3a90681795f), EConversationDebugInfo::Executing);
                
                // (growls) 
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_135441"));
                DC(int64(0x315a3a90681795f), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Executing);
                OrcTempleWarriorM02.RefuseToTalk(10);
                DC(int64(0xc5b543ab0417e587), EConversationDebugInfo::Done);
                DC(int64(0xba882af48e323aa0), EConversationDebugInfo::Executing);
                G1R.TemplerGuardAdvice = 1;
                DC(int64(0xba882af48e323aa0), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e589), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5b543ab0417e589), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrctemplewarriorm02102769 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0xc5b543ab0417e57e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02102769);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_TEMPLE", 200.0f, int64(0xc5b543ab0417e57e));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5b543ab0417e581), G1R.UrNazkrog_Permission != 1);
                }
                
                return G1R.UrNazkrog_Permission != 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b543ab0417e57d), EConversationDebugInfo::Executing);
                // You just won't listen, will you? DIE!
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_ZVGQKWK_20240712_161557_1924"));
                DC(int64(0xc5b543ab0417e57d), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e584), EConversationDebugInfo::Executing);
                OrcTempleWarriorM02.AI.StartAttackingImmediately(Hero);
                DC(int64(0xc5b543ab0417e584), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e58a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5b543ab0417e58a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrctemplewarriorm02105905_0 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x139618153f077522);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105905);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_TEMPLE", 800.0f, int64(0x139618153f077522));
            default Rules.RequireCharacterCloseToWaypoint(n"OW_OSM_URNAZKROG_2401", n"WP_OTOWN_TEMPLE", 1000.0f, int64(0x139618153f077522));
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105905_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x49ea5111455ba6d4), G1R.UrNazkrog_Permission == 1);
                    DB(int64(0xd22f0664a188dc77), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded());
                }
                
                if (G1R.UrNazkrog_Permission != 1)
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077520), EConversationDebugInfo::Executing);
                // What ...?
                OrcTempleWarriorM02.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_150304_41"));
                DC(int64(0x139618153f077520), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrctemplewarriorm02105905 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrctemplewarriorm02105905_0);
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105905);
            default DebugId = int64(0x139618153f077522);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077532), EConversationDebugInfo::Executing);
                OrcTempleWarriorM02.AI.DrawCombatWeapon();
                DC(int64(0x139618153f077532), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrctemplewarriorm02105936_0 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default DebugId = int64(0x139618153f077537);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default bIsAmbientTopic = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrctemplewarriorm02105905);
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105936);
            
            default ExtraCharactersToInvite.Add(n"OW_OSM_URNAZKROG_2401");
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105936_0);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139618153f077539), EConversationDebugInfo::Executing);
                // Stand aside. The morra follows my command. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_150436"));
                DC(int64(0x139618153f077539), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrctemplewarriorm02105936 : UTopic_Hero__OW_OWR_ORCTEMPLEWARRIORM02_2042
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrctemplewarriorm02105936_0);
            default Rules.HideIfKnows(UChoiceOrctemplewarriorm02105936);
            default DebugId = int64(0x139618153f077537);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf049e8b73b78be21), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf049e8b73b78be21), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */