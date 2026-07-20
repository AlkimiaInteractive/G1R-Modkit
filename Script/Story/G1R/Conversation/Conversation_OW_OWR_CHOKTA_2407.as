#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_CHOKTA_2407 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_CHOKTA_2407";
        }
        
        
        class UTopic_Hero__OW_OWR_CHOKTA_2407 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_CHOKTA_2407";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetChokta() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetOA_BITER_ARENA_01() const property
            {
                return GetCharacter(n"OA_BITER_ARENA_01");
            }
            
            AGothicCharacterState GetOA_LIZARD_FIRE_01() const property
            {
                return GetCharacter(n"OA_LIZARD_FIRE_01");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
        }
        
        
        class UChoiceChokta111037 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x7be83a9005437482);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceChokta111037);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be83a9005437481), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7be83a9005437481), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta111053 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x7be83a9005437486);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::CloseRange;
            
            default Rules.HideIfKnows(UChoiceChokta111053);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7be83a9005437489), Grazkrak != nullptr && Grazkrak.IsEveryoneOfThisKindDead());
                }
                
                return Grazkrak != nullptr && Grazkrak.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_CHOKTA, Document::UDocumentSegment_Glossary_OW_OWR_CHOKTA_Introduction);
                DB(int64(0x9f55e13cce4b84e8), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0x9f55e13cce4b84eb), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x7be83a900543748e), EConversationDebugInfo::Executing);
                    // Well, well. It's the killer of Grazkrak. Hmm ... 
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_101847_1924"));
                    DC(int64(0x7be83a900543748e), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806832), EConversationDebugInfo::Executing);
                    
                    // Something on your mind? 
                    Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132536"));
                    DC(int64(0xd149ca31be806832), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806834), EConversationDebugInfo::Executing);
                    
                    // He speaks our tongue?
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132616"));
                    DC(int64(0xd149ca31be806834), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806835), EConversationDebugInfo::Executing);
                    
                    // A bit. 
                    Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132624"));
                    DC(int64(0xd149ca31be806835), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806836), EConversationDebugInfo::Executing);
                    
                    // Huh. Interesting. 
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132638"));
                    DC(int64(0xd149ca31be806836), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806837), EConversationDebugInfo::Executing);
                    // Tell me. How would the morra like to wield an orcish ...
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132705"));
                    DC(int64(0xd149ca31be806837), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_CHOKTA, Document::UDocumentSegment_Glossary_OW_OWR_CHOKTA_Teacher);
                    Subdialog(
                        UTopic_Chokta_116118,
                        UTopic_Chokta_111254,
                        UTopic_Chokta_111176,
                        UTopic_Chokta_111196
                    );
                }
                else
                {
                    DC(int64(0x7be83a9005437491), EConversationDebugInfo::Executing);
                    // Well, well. It's the killer of Grazkrak. Hmm ... 
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_101847_1924"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x7be83a9005437491), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be80682f), EConversationDebugInfo::Executing);
                    
                    // Um ... 
                    Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132334"));
                    DC(int64(0xd149ca31be80682f), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806830), EConversationDebugInfo::Executing);
                    
                    // You won't last in here, morra. Not a day. 
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132428"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xd149ca31be806830), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806831), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xd149ca31be806831), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Chokta_116118 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd149ca31be806838);
            default Caption = LocText("TEXT_WIP_OMXZLYD_20241202_132800_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_116118);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd149ca31be806839), EConversationDebugInfo::Executing);
                // Are you offering to teach me? 
                Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132800_41"));
                DC(int64(0xd149ca31be806839), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be806855), EConversationDebugInfo::Executing);
                
                // Ha. Maybe I am. 
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132856"));
                DC(int64(0xd149ca31be806855), EConversationDebugInfo::Done);
                DB(int64(0x7be83a90054374a7), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    DC(int64(0xd149ca31be806857), EConversationDebugInfo::Executing);
                    // Or maybe I just want to see how a puny morra fares with ...
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132958_2083"));
                    DC(int64(0xd149ca31be806857), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be80685a), EConversationDebugInfo::Executing);
                    // The closer I watch him fight, the better we know how to ...
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133134"));
                    DC(int64(0xd149ca31be80685a), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be80685b), EConversationDebugInfo::Executing);
                    
                    // That's reassuring. 
                    Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133304"));
                    DC(int64(0xd149ca31be80685b), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806867), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xd149ca31be806867), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xd149ca31be806859), EConversationDebugInfo::Executing);
                    // Or maybe I just want to see how a puny morra fares with ...
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_132958_2083"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xd149ca31be806859), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be80685c), EConversationDebugInfo::Executing);
                    // The closer I watch him fight, the better we know how to ...
                    Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133134"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0xd149ca31be80685c), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be80685d), EConversationDebugInfo::Executing);
                    
                    // ... That was a bit too fast for me. 
                    Hero.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133342"));
                    DC(int64(0xd149ca31be80685d), EConversationDebugInfo::Done);
                    DC(int64(0xd149ca31be806866), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0xd149ca31be806866), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Chokta_111254 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x7be83a90054374a2);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_102502_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111254);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be83a90054374a3), EConversationDebugInfo::Executing);
                // You want me to fight you? With an orcish weapon? 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_102502_686"));
                DC(int64(0x7be83a90054374a3), EConversationDebugInfo::Done);
                DC(int64(0x7be83a90054374a8), EConversationDebugInfo::Executing);
                
                // Not me. Beasts. First small ones, then, if the morra is ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_102633"));
                DC(int64(0x7be83a90054374a8), EConversationDebugInfo::Done);
                DC(int64(0x7be83a90054374ac), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x7be83a90054374ac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_111176 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x7be83a900543749a);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_102336_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111176);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be83a900543749b), EConversationDebugInfo::Executing);
                // All right. Why not. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_102336_2785"));
                DC(int64(0x7be83a900543749b), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be80686b), EConversationDebugInfo::Executing);
                
                // Bolder than I thought. 
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133857"));
                DC(int64(0xd149ca31be80686b), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be80686d), EConversationDebugInfo::Executing);
                // Here, take this blade. The morra will fight small ...
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133922"));
                DC(int64(0xd149ca31be80686d), EConversationDebugInfo::Done);
                DC(int64(0x2d6fc4301f2ead2b), EConversationDebugInfo::Executing);
                // But you'll follow our rules!
                Chokta.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_083359"));
                DC(int64(0x2d6fc4301f2ead2b), EConversationDebugInfo::Done);
                DC(int64(0x2d6fc4301f2ead2c), EConversationDebugInfo::Executing);
                // You'll fight with a real weapon, an orcish weapon!
                Chokta.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_083433"));
                DC(int64(0x2d6fc4301f2ead2c), EConversationDebugInfo::Done);
                DC(int64(0x2d6fc4301f2ead2d), EConversationDebugInfo::Executing);
                // You won't leave the arena and you'll fight without ...
                Chokta.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_083438"));
                DC(int64(0x2d6fc4301f2ead2d), EConversationDebugInfo::Done);
                DC(int64(0x2d6fc4301f2ead2e), EConversationDebugInfo::Executing);
                // Understand, Morra? Are you brave enough, Morra?
                Chokta.AI.Say(LocText("TEXT_WIP_SNKNJXI_20260205_083507"));
                DC(int64(0x2d6fc4301f2ead2e), EConversationDebugInfo::Done);
                DC(int64(0x94969f3c4c3e5550), EConversationDebugInfo::Executing);
                
                // Bring it on. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113422_3569"));
                DC(int64(0x94969f3c4c3e5550), EConversationDebugInfo::Done);
                DC(int64(0x469fa7f24a02d0e3), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMw_2H_Axe_Orc_01, 1);
                DC(int64(0x469fa7f24a02d0e3), EConversationDebugInfo::Done);
                DC(int64(0x469fa7f24a02d0e5), EConversationDebugInfo::Executing);
                Chokta.ExchangeDailyRoutineToClass(UDailyRoutine_OW_OWR_Chokta_2407_Fight);
                DC(int64(0x469fa7f24a02d0e5), EConversationDebugInfo::Done);
                DC(int64(0x3e4eb7c34fe1dc86), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipMeleeWeaponOfClass(UItMw_2H_Axe_Orc_01);
                DC(int64(0x3e4eb7c34fe1dc86), EConversationDebugInfo::Done);
                DC(int64(0x3e4eb7c34fe1dc88), EConversationDebugInfo::Executing);
                Hero.Inventory.UnequipArmor();
                DC(int64(0x3e4eb7c34fe1dc88), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef200a), EConversationDebugInfo::Executing);
                Hero.AI.DrawCombatWeapon();
                DC(int64(0xd9a78473bcef200a), EConversationDebugInfo::Done);
                DC(int64(0x469fa7f24a02d0f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x469fa7f24a02d0f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Chokta_111196 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x7be83a900543749e);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_102336_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111196);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be83a900543749f), EConversationDebugInfo::Executing);
                // I don't have time for this. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_102336_3286"));
                DC(int64(0x7be83a900543749f), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be806868), EConversationDebugInfo::Executing);
                
                // (scoffs) Is the morra afraid he'll get hurt? 
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133511"));
                DC(int64(0xd149ca31be806868), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be806869), EConversationDebugInfo::Executing);
                // As he wants. 
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133543"));
                DC(int64(0xd149ca31be806869), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be80686a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd149ca31be80686a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta111324 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c342);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceChokta186576);
            default Rules.HideIfKnows(UChoiceChokta111324);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf1b6d7268a9d22d7), G1R.Chokta_angry == 0);
                    DB(int64(0x1f212b244ed01084), OA_BITER_ARENA_01 != nullptr && OA_BITER_ARENA_01.IsEveryoneOfThisKindDead());
                    DB(int64(0x91ce0f4a5c8faabe), IsCharacterInWorld(OA_BITER_ARENA_01));
                }
                
                if (G1R.Chokta_angry != 0)
                    return false;
                
                if (OA_BITER_ARENA_01 != nullptr && !OA_BITER_ARENA_01.IsEveryoneOfThisKindDead())
                    return false;
                
                if (!IsCharacterInWorld(OA_BITER_ARENA_01))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x776c6ba090968698), G1R.Chokta_angry_counter < 2);
                
                if (G1R.Chokta_angry_counter < 2)
                {
                    DC(int64(0x776c6ba090968691), EConversationDebugInfo::Executing);
                    // Hmm ... not as bad as I expected. How does it feel? To ...
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_112253_2785"));
                    DC(int64(0x776c6ba090968691), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Chokta_118756,
                        UTopic_Chokta_118776
                    );
                    DC(int64(0xd933485856a2c352), EConversationDebugInfo::Executing);
                    // Never swing them like human swords. The morra must feel ...
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_112259"));
                    DC(int64(0xd933485856a2c352), EConversationDebugInfo::Done);
                    DC(int64(0xd933485856a2c353), EConversationDebugInfo::Executing);
                    // The morra must trust the steel - then it will lead him ...
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_112300"));
                    DC(int64(0xd933485856a2c353), EConversationDebugInfo::Done);
                    DC(int64(0xd933485856a2c35a), EConversationDebugInfo::Executing);
                    
                    // I'll see what I can do. 
                    Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113021"));
                    DC(int64(0xd933485856a2c35a), EConversationDebugInfo::Done);
                    DC(int64(0xd933485856a2c369), EConversationDebugInfo::Executing);
                    Hero.LearnSkill(UGE_Skill_Melee_Orc_Trained);
                    DC(int64(0xd933485856a2c369), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x8464134c35ad2e2e), EConversationDebugInfo::Executing);
                    // I should have known the morra don't have it in them. ...
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_175026_443"));
                    DC(int64(0x8464134c35ad2e2e), EConversationDebugInfo::Done);
                    DC(int64(0x91ce0f4a5c8faab0), EConversationDebugInfo::Executing);
                    G1R.Chokta_angry = 1;
                    DC(int64(0x91ce0f4a5c8faab0), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Chokta_118756 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x96b7d6e30cb0283f);
            default Caption = LocText("TEXT_WIP_VMXZLYD_20241205_122507_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_118756);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x96b7d6e30cb02840), EConversationDebugInfo::Executing);
                // Good. 
                Hero.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_122507_41"));
                DC(int64(0x96b7d6e30cb02840), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb02849), EConversationDebugInfo::Executing);
                
                // Really? It didn't look this way. 
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_122550"));
                DC(int64(0x96b7d6e30cb02849), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_118776 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x96b7d6e30cb02843);
            default Caption = LocText("TEXT_WIP_VMXZLYD_20241205_122507_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_118776);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x96b7d6e30cb02844), EConversationDebugInfo::Executing);
                
                // They're clunky. 
                Hero.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_122507_2238"));
                DC(int64(0x96b7d6e30cb02844), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb02848), EConversationDebugInfo::Executing);
                
                // Ha. That's because they're not made for tiny morra ...
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_122539"));
                DC(int64(0x96b7d6e30cb02848), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceChokta111596 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c35e);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceChokta111324);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe7294299b972c540), G1R.Chokta_angry == 0);
                }
                
                return G1R.Chokta_angry == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c363), EConversationDebugInfo::Executing);
                // Better. Not good, but better. 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113136_686"));
                DC(int64(0xd933485856a2c363), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c39e), EConversationDebugInfo::Executing);
                // Now, is the morra ready for the real test? 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_114821"));
                DC(int64(0xd933485856a2c39e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Chokta_111657,
                    UTopic_Chokta_111677,
                    UTopic_Chokta_111938
                );
            }
        }
        
        
        class UTopic_Chokta_111657 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c373);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_113422_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111657);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c374), EConversationDebugInfo::Executing);
                // What "real test?"
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113422_3984"));
                DC(int64(0xd933485856a2c374), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c37f), EConversationDebugInfo::Executing);
                
                // A REAL fight with a REAL beast. The morra will wear no ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_114013"));
                DC(int64(0xd933485856a2c37f), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb02850), EConversationDebugInfo::Executing);
                // If he succeeds, I will teach him mastery. If not ... 
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_123003"));
                DC(int64(0x96b7d6e30cb02850), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c380), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xd933485856a2c380), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_111677 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c377);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_113422_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111677);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c378), EConversationDebugInfo::Executing);
                // Bring it on. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113422_3569"));
                DC(int64(0xd933485856a2c378), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb02851), EConversationDebugInfo::Executing);
                
                // So be it. 
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_123022"));
                DC(int64(0x96b7d6e30cb02851), EConversationDebugInfo::Done);
                DC(int64(0x5b034aca33bcb26f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5b034aca33bcb26f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Chokta_111938 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c3a0);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_114842_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_111938);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c3a1), EConversationDebugInfo::Executing);
                // Give me some time to prepare first. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_114842_443"));
                DC(int64(0xd933485856a2c3a1), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c3b0), EConversationDebugInfo::Executing);
                
                // Then prepare fast. 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_115735"));
                DC(int64(0xd933485856a2c3b0), EConversationDebugInfo::Done);
                DC(int64(0x1f212b244ed0104b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f212b244ed0104b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta111921 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c39a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Chokta_111677);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Chokta_112087);
            default Rules.HideIfKnows(UChoiceChokta111921);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c386), EConversationDebugInfo::Executing);
                // Shed the armor and take the blade, morra. We begin. 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_114301"));
                DC(int64(0xd933485856a2c386), EConversationDebugInfo::Done);
                DB(int64(0xd933485856a2c38a), Hero != nullptr && Hero.HasItem(UItMw_2H_Axe_Orc_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMw_2H_Axe_Orc_01, 1, 0))
                {
                    
                }
                else
                {
                    DC(int64(0xd933485856a2c396), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMw_2H_Axe_Orc_01, 1);
                    DC(int64(0xd933485856a2c396), EConversationDebugInfo::Done);
                }
                DC(int64(0xd933485856a2c38c), EConversationDebugInfo::Executing);
                Hero.Inventory.EquipMeleeWeaponOfClass(UItMw_2H_Axe_Orc_01);
                DC(int64(0xd933485856a2c38c), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c38e), EConversationDebugInfo::Executing);
                Hero.Inventory.UnequipArmor();
                DC(int64(0xd933485856a2c38e), EConversationDebugInfo::Done);
                DC(int64(0x5b034aca33bcb26e), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnOrcMastered");
                DC(int64(0x5b034aca33bcb26e), EConversationDebugInfo::Done);
                DC(int64(0xd9a78473bcef200c), EConversationDebugInfo::Executing);
                Hero.AI.DrawMeleeWeapon();
                DC(int64(0xd9a78473bcef200c), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c399), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd933485856a2c399), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta111990 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x91e7d66bb2de9f38);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceChokta111921);
            default Rules.HideIfKnows(UChoiceChokta111990);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf1b6d7268a9d22d7), G1R.Chokta_angry_counter < 3);
                    DB(int64(0x7dfa3dae3a58068f), OA_LIZARD_FIRE_01 != nullptr && OA_LIZARD_FIRE_01.IsEveryoneOfThisKindDead());
                    DB(int64(0x91ce0f4a5c8faab5), IsCharacterInWorld(OA_LIZARD_FIRE_01));
                }
                
                if (G1R.Chokta_angry_counter >= 3)
                    return false;
                
                if (OA_LIZARD_FIRE_01 != nullptr && !OA_LIZARD_FIRE_01.IsEveryoneOfThisKindDead())
                    return false;
                
                if (!IsCharacterInWorld(OA_LIZARD_FIRE_01))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91e7d66bb2de9f3f), EConversationDebugInfo::Executing);
                // Ha! And here I thought I would get to see a morra burnt ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_181613"));
                DC(int64(0x91e7d66bb2de9f3f), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb0285c), EConversationDebugInfo::Executing);
                
                // I guess this means I passed? 
                Hero.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_123245"));
                DC(int64(0x96b7d6e30cb0285c), EConversationDebugInfo::Done);
                DC(int64(0x91e7d66bb2de9f43), EConversationDebugInfo::Executing);
                
                // Yes. The morra is still weak, as all of them are, but ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_182016"));
                DC(int64(0x91e7d66bb2de9f43), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb0285d), EConversationDebugInfo::Executing);
                // Listen, then. An orcish blade is not a tool like the ...
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_123334"));
                DC(int64(0x96b7d6e30cb0285d), EConversationDebugInfo::Done);
                DC(int64(0x91e7d66bb2de9f44), EConversationDebugInfo::Executing);
                // If the morra wants to truly learn to fight with it, he ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_182351"));
                DC(int64(0x91e7d66bb2de9f44), EConversationDebugInfo::Done);
                DC(int64(0x96b7d6e30cb0285e), EConversationDebugInfo::Executing);
                // Hunt well, morra. 
                Chokta.AI.Say(LocText("TEXT_WIP_VMXZLYD_20241205_123532"));
                DC(int64(0x96b7d6e30cb0285e), EConversationDebugInfo::Done);
                DC(int64(0x91e7d66bb2de9f46), EConversationDebugInfo::Executing);
                // Go now. I have seen enough, and I'm weary of your stink. 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_182623"));
                DC(int64(0x91e7d66bb2de9f46), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c369), EConversationDebugInfo::Executing);
                Hero.LearnSkill(UGE_Skill_Melee_Orc_Master);
                DC(int64(0xd933485856a2c369), EConversationDebugInfo::Done);
                DC(int64(0x91e7d66bb2de9f54), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91e7d66bb2de9f54), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta112034 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c3b8);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_115930");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Chokta_111938);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_TKWAAOH_20241125_115735"), int64(0xd933485856a2c3b8));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_VMXZLYD_20241205_123022"), int64(0xd933485856a2c3b8));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c3b4), EConversationDebugInfo::Executing);
                // About that test of yours ... 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_115930"));
                DC(int64(0xd933485856a2c3b4), EConversationDebugInfo::Done);
                DC(int64(0xd933485856a2c3b5), EConversationDebugInfo::Executing);
                
                // Grew a spine?
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_115930_1769"));
                DC(int64(0xd933485856a2c3b5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Chokta_112087,
                    UTopic_Chokta_112107
                );
            }
        }
        
        
        class UTopic_Chokta_112087 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c3c5);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_113422_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_112087);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c3c6), EConversationDebugInfo::Executing);
                // Bring it on. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_113422_3569"));
                DC(int64(0xd933485856a2c3c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_112107 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0xd933485856a2c3c9);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_114842_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Chokta_112107);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd933485856a2c3ca), EConversationDebugInfo::Executing);
                // Give me some time to prepare first. 
                Hero.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_114842_443"));
                DC(int64(0xd933485856a2c3ca), EConversationDebugInfo::Done);
                DB(int64(0xd933485856a2c3d4), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                {
                    DC(int64(0xd933485856a2c3db), EConversationDebugInfo::Executing);
                    // Then prepare fast. 
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_115735"));
                    DC(int64(0xd933485856a2c3db), EConversationDebugInfo::Done);
                    DC(int64(0x1f212b244ed0104a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1f212b244ed0104a), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xd933485856a2c3e8), EConversationDebugInfo::Executing);
                    // Hah! ... Morra ... need warm ... soup first? ... Come ...
                    Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_115739"));
                    DC(int64(0xd933485856a2c3e8), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceChokta186576 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x469fa7f24a02d0e6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Chokta_111176);
            default Rules.HideIfKnows(UChoiceChokta186576);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OA_STANDAROUND_01", 200.0f, int64(0x469fa7f24a02d0e6));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be83a90054374b8), EConversationDebugInfo::Executing);
                // Arms feeling weak yet? 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_103834"));
                DC(int64(0x7be83a90054374b8), EConversationDebugInfo::Done);
                DC(int64(0xd149ca31be80686e), EConversationDebugInfo::Executing);
                // Fight!
                Chokta.AI.Say(LocText("TEXT_WIP_OMXZLYD_20241202_133955"));
                DC(int64(0xd149ca31be80686e), EConversationDebugInfo::Done);
                DC(int64(0x3e4eb7c34fe1dc60), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnOrcTrained");
                DC(int64(0x3e4eb7c34fe1dc60), EConversationDebugInfo::Done);
                DC(int64(0x3e4eb7c34fe1dc7b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3e4eb7c34fe1dc7b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChokta221276 : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x776c6ba09096869b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceChokta111921);
            default Rules.HideIfKnows(UChoiceChokta221276);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf1b6d7268a9d22d7), G1R.Chokta_angry_counter >= 3);
                }
                
                return G1R.Chokta_angry_counter >= 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x776c6ba09096869a), EConversationDebugInfo::Executing);
                // I should have known the morra don't have it in them. ...
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_175026_443"));
                DC(int64(0x776c6ba09096869a), EConversationDebugInfo::Done);
                DC(int64(0x91ce0f4a5c8faab0), EConversationDebugInfo::Executing);
                G1R.Chokta_angry = 1;
                DC(int64(0x91ce0f4a5c8faab0), EConversationDebugInfo::Done);
                DC(int64(0x776c6ba0909686a0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x776c6ba0909686a0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Chokta_WarningChoktaArena : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x568d61f5bf011ddb);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_174237_2386");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && !Hero.IsCloseToWaypoint(n"OA_ARENABATTLE_TRAIN", 1100.0f));
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && !Hero.IsCloseToWaypoint(n"OA_ARENABATTLE_TRAIN", 1100.0f));
                }
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f) && Hero != nullptr && !Hero.IsCloseToWaypoint(n"OA_ARENABATTLE_TRAIN", 1100.0f))
                    return true;
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f) && Hero != nullptr && !Hero.IsCloseToWaypoint(n"OA_ARENABATTLE_TRAIN", 1100.0f))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x568d61f5bf011de7), EConversationDebugInfo::Executing);
                // What, running already? Pathetic. 
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_174237_2386"));
                DC(int64(0x568d61f5bf011de7), EConversationDebugInfo::Done);
                DC(int64(0x91ce0f4a5c8faaae), EConversationDebugInfo::Executing);
                G1R.Chokta_angry_counter += 1;
                DC(int64(0x91ce0f4a5c8faaae), EConversationDebugInfo::Done);
                DC(int64(0x776c6ba0909686a6), EConversationDebugInfo::Executing);
                Chokta.AI.WaitSeconds(2);
                DC(int64(0x776c6ba0909686a6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_WarningChoktaArmor : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x8464134c35ad2e3e);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_175308_3750");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && Hero.Inventory.HasEquippedAnyArmor());
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && Hero.Inventory.HasEquippedAnyArmor());
                }
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f) && Hero != nullptr && Hero.Inventory.HasEquippedAnyArmor())
                    return true;
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f) && Hero != nullptr && Hero.Inventory.HasEquippedAnyArmor())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8464134c35ad2e44), EConversationDebugInfo::Executing);
                // Coward! I said, no armor!
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_175308_3750"));
                DC(int64(0x8464134c35ad2e44), EConversationDebugInfo::Done);
                DC(int64(0x91ce0f4a5c8faaac), EConversationDebugInfo::Executing);
                G1R.Chokta_angry_counter += 1;
                DC(int64(0x91ce0f4a5c8faaac), EConversationDebugInfo::Done);
                DC(int64(0x776c6ba0909686a4), EConversationDebugInfo::Executing);
                Chokta.AI.WaitSeconds(2);
                DC(int64(0x776c6ba0909686a4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Chokta_WarningChoktaWeapon : UTopic_Hero__OW_OWR_CHOKTA_2407
        {
            default DebugId = int64(0x568d61f5bf011db7);
            default Caption = LocText("TEXT_WIP_TKWAAOH_20241125_173859_2238");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            default ForceSettings.bDoAmbientDuringCombat = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && !Hero.Inventory.HasEquippedItem(UItMw_2H_Axe_Orc_01));
                    DB(int64(0x568d61f5bf011dc3), Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f));
                    DB(int64(0x568d61f5bf011dc4), Hero != nullptr && !Hero.Inventory.HasEquippedItem(UItMw_2H_Axe_Orc_01));
                }
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_LIZARD_FIRE_01, 3000.0f) && Hero != nullptr && !Hero.Inventory.HasEquippedItem(UItMw_2H_Axe_Orc_01))
                    return true;
                
                if (Chokta != nullptr && Chokta.CanSenseAnyAliveCharacterOfKind(OA_BITER_ARENA_01, 3000.0f) && Hero != nullptr && !Hero.Inventory.HasEquippedItem(UItMw_2H_Axe_Orc_01))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x568d61f5bf011dc8), EConversationDebugInfo::Executing);
                // What is the morra doing? Use an orcish blade!
                Chokta.AI.Say(LocText("TEXT_WIP_TKWAAOH_20241125_173859_2238"));
                DC(int64(0x568d61f5bf011dc8), EConversationDebugInfo::Done);
                DC(int64(0x91ce0f4a5c8faaaa), EConversationDebugInfo::Executing);
                G1R.Chokta_angry_counter += 1;
                DC(int64(0x91ce0f4a5c8faaaa), EConversationDebugInfo::Done);
                DC(int64(0x776c6ba0909686a2), EConversationDebugInfo::Executing);
                Chokta.AI.WaitSeconds(2);
                DC(int64(0x776c6ba0909686a2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */