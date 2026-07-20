#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OW_OWR_TOCHURNAGG_2403 : UConversationCharacterSettings
        {
            default ForCharacter = n"OW_OWR_TOCHURNAGG_2403";
        }
        
        
        class UTopic_Hero__OW_OWR_TOCHURNAGG_2403 : UG1RDialogTopic
        {
            default ForCharacter = n"OW_OWR_TOCHURNAGG_2403";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetToChurnagg() const property
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
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM03_2043() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM03_2043");
            }
            
            AGothicCharacterState GetOW_OWR_ORCTEMPLEWARRIORM04_2044() const property
            {
                return GetCharacter(n"OW_OWR_ORCTEMPLEWARRIORM04_2044");
            }
        }
        
        
        class UChoiceTochurnagg103012 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x5f713b767244c5a1);
            default Caption = LocText("TEXT_WIP_EPWDQLC_20240829_220817");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5b543ab0417e59a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5b543ab0417e59a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTochurnagg107280 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x5f713b767244c5a3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTochurnagg107280);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5f713b767244c5a6), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    DB(int64(0xd1f3e866dd874f3a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f713b767244c58e), EConversationDebugInfo::Executing);
                // You.
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220046_41"));
                DC(int64(0x5f713b767244c58e), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c593), EConversationDebugInfo::Executing);
                // Why aren't you in the temple? I saw you enter.
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220233"));
                DC(int64(0x5f713b767244c593), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c594), EConversationDebugInfo::Executing);
                
                // Things happened.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220429"));
                DC(int64(0x5f713b767244c594), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c595), EConversationDebugInfo::Executing);
                
                // Hmm. But you are not with the hairless morra. I can feel ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220436"));
                DC(int64(0x5f713b767244c595), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c596), EConversationDebugInfo::Executing);
                // But it doesn't matter anymore. They are there as we ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220533"));
                DC(int64(0x5f713b767244c596), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c597), EConversationDebugInfo::Executing);
                // Krushak will wake. And no one can stop him.
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220655"));
                DC(int64(0x5f713b767244c597), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c598), EConversationDebugInfo::Executing);
                
                // We'll see about that.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220735"));
                DC(int64(0x5f713b767244c598), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c599), EConversationDebugInfo::Executing);
                
                // What?
                ToChurnagg.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220747"));
                DC(int64(0x5f713b767244c599), EConversationDebugInfo::Done);
                DC(int64(0x5f713b767244c59a), EConversationDebugInfo::Executing);
                
                // Nothing.
                Hero.AI.Say(LocText("TEXT_WIP_EPWDQLC_20240829_220749"));
                DC(int64(0x5f713b767244c59a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTochurnagg144060 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0xcf6cde32246c7b16);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceTochurnagg144060);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_UGKWYUI_20240719_145229"), int64(0xcf6cde32246c7b16));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_PVXGRO_20250121_121159_2801"), int64(0xcf6cde32246c7b16));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7b14), EConversationDebugInfo::Executing);
                
                // Enough of the talking, morra. Do as Ur-Nazkrog told you. 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_120639_3286"));
                DC(int64(0xcf6cde32246c7b14), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTochurnagg215959 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x3e82def5e4c8a2c7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTochurnagg215959);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OTOWN_THRONE_GUARD", 500.0f, int64(0x3e82def5e4c8a2c7));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_TOCHURNAGG, Document::UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Introduction);
                DB(int64(0x3e82def5e4c8a2cb), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x3e82def5e4c8a2cc), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0xa06e76894337f488), EConversationDebugInfo::Executing);
                    // A filthy morra in our midst. Didn't think I'd live to ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_105325_41"));
                    DC(int64(0xa06e76894337f488), EConversationDebugInfo::Done);
                    DC(int64(0xa06e76894337f487), EConversationDebugInfo::Executing);
                    
                    // There's a first time for everything.
                    Hero.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_105325"));
                    DC(int64(0xa06e76894337f487), EConversationDebugInfo::Done);
                    DC(int64(0xacdc388fccb95d1), EConversationDebugInfo::Executing);
                    
                    // You came here for Krusahk, not for us, I get that. But ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_161123"));
                    DC(int64(0xacdc388fccb95d1), EConversationDebugInfo::Done);
                    DC(int64(0xacdc388fccb95d7), EConversationDebugInfo::Executing);
                    // His waking will be the end of your race. Are you sure ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_161458"));
                    DC(int64(0xacdc388fccb95d7), EConversationDebugInfo::Done);
                    DB(int64(0x3e82def5e4c8a2d3), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                    
                    if (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master))
                    {
                        DC(int64(0xacdc388fccb95db), EConversationDebugInfo::Executing);
                        // It's not our place to question the will of the gods.
                        Hero.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_162027"));
                        DC(int64(0xacdc388fccb95db), EConversationDebugInfo::Done);
                        DC(int64(0xa06e76894337f4d1), EConversationDebugInfo::Executing);
                        
                        // Ha! Are you saying the "gods" have "sent" you?
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114115"));
                        DC(int64(0xa06e76894337f4d1), EConversationDebugInfo::Done);
                        DC(int64(0xa06e76894337f4ba), EConversationDebugInfo::Executing);
                        
                        // I'm not. But can you tell what the Sleeper will really ...
                        Hero.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114018_3569"));
                        DC(int64(0xa06e76894337f4ba), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95de), EConversationDebugInfo::Executing);
                        
                        // He will bring fire and darkness, death and destruction ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_163351"));
                        DC(int64(0xacdc388fccb95de), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95df), EConversationDebugInfo::Executing);
                        // And all those who are still alive afterwards will serve ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_163433"));
                        DC(int64(0xacdc388fccb95df), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95e0), EConversationDebugInfo::Executing);
                        
                        // Sounds like you know Krushak's will pretty well ... But ...
                        Hero.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_163632"));
                        DC(int64(0xacdc388fccb95e0), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95e1), EConversationDebugInfo::Executing);
                        
                        // Don't ... try and confuse me with your words. The ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_164030"));
                        DC(int64(0xacdc388fccb95e1), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95e2), EConversationDebugInfo::Executing);
                        // They know our calling. And mine is to lead the army that ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_164239"));
                        DC(int64(0xacdc388fccb95e2), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95e3), EConversationDebugInfo::Executing);
                        // There's no doubt about it.
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_164400"));
                        DC(int64(0xacdc388fccb95e3), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95e4), EConversationDebugInfo::Executing);
                        
                        // All right. I'll probably see you later.
                        Hero.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_164610"));
                        DC(int64(0xacdc388fccb95e4), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa06e76894337f4b6), EConversationDebugInfo::Executing);
                        // The Sleeper calls to me.
                        Hero.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114018_3984"));
                        DC(int64(0xa06e76894337f4b6), EConversationDebugInfo::Done);
                        DC(int64(0xa06e76894337f4d0), EConversationDebugInfo::Executing);
                        
                        // (scoffs) And even IF that's true, I don't understand for ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114113"));
                        DC(int64(0xa06e76894337f4d0), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95dc), EConversationDebugInfo::Executing);
                        // So the Temple stays out of bounds for you. It's OUR ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_162552"));
                        DC(int64(0xacdc388fccb95dc), EConversationDebugInfo::Done);
                        DC(int64(0xacdc388fccb95dd), EConversationDebugInfo::Executing);
                        // And it'll be YOUR purpose to bring about the demise of ...
                        ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_162735"));
                        DC(int64(0xacdc388fccb95dd), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x3e82def5e4c8a2ce), EConversationDebugInfo::Executing);
                    // A filthy morra in our midst. Didn't think I'd live to ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_105325_41"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x3e82def5e4c8a2ce), EConversationDebugInfo::Done);
                    DC(int64(0x3e82def5e4c943a3), EConversationDebugInfo::Executing);
                    // You came here for Krusahk, not for us, I get that. But ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_161123"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x3e82def5e4c943a3), EConversationDebugInfo::Done);
                    DC(int64(0x3e82def5e4c943a4), EConversationDebugInfo::Executing);
                    // His waking will be the end of your race. Are you sure ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_QSCJSZB_20250228_161458"), ForceSubtitleLanguage = n"foreign");
                    DC(int64(0x3e82def5e4c943a4), EConversationDebugInfo::Done);
                    DC(int64(0xa06e76894337f4c5), EConversationDebugInfo::Executing);
                    
                    // I don't understand you - but I respect you.
                    Hero.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114048_2801"));
                    DC(int64(0xa06e76894337f4c5), EConversationDebugInfo::Done);
                    DC(int64(0xa06e76894337f4d2), EConversationDebugInfo::Executing);
                    
                    // You come here, not even speaking our tongue. Pf. Clear ...
                    ToChurnagg.AI.Say(LocText("TEXT_WIP_OHOYLVC_20250228_114117"));
                    DC(int64(0xa06e76894337f4d2), EConversationDebugInfo::Done);
                }
                DC(int64(0xa06e76894337f4cc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa06e76894337f4cc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTochurnagg218049 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x7df34decaa0d47f7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTochurnagg218049);
            
            default ExtraCharactersToInvite.Add(n"OW_OSM_URNAZKROG_2401");
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OTOWN_TEMPLE_ENTRANCE2", 100.0f, int64(0x7df34decaa0d47f7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf2929ba655750fb), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.IsRunning());
                    DB(int64(0x95d01d95936fec49), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded());
                }
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.IsRunning())
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7df34decaa0d47f6), EConversationDebugInfo::Executing);
                // WHAT BY BÂLYAR IS THIS?!
                ToChurnagg.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_134752_2238"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0x7df34decaa0d47f6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OW_OWR_TOCHURNAGG, Document::UDocumentSegment_Glossary_OW_OWR_TOCHURNAGG_Discussion);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_IntelligenceCompleted);
                DC(int64(0x7df34decaa0d480b), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(ToChurnagg);
                DC(int64(0x7df34decaa0d480b), EConversationDebugInfo::Done);
                DC(int64(0x48f58c49d4b296dc), EConversationDebugInfo::Executing);
                ToChurnagg.AI.TurnToCharacter(Hero);
                DC(int64(0x48f58c49d4b296dc), EConversationDebugInfo::Done);
                DC(int64(0xde82c0f270e189c0), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_GUIDE.SucceedQuest();
                DC(int64(0xde82c0f270e189c0), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e75ea), EConversationDebugInfo::Executing);
                // What now?
                Hero.AI.Say(LocText("TEXT_WIP_DEVDOTI_20240709_143220"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC NH");
                DC(int64(0x99226617b81e75ea), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d07db), EConversationDebugInfo::Executing);
                
                // Calm your voice, To-Churnagg. The morra works Krushak's ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_163727_41"), TargetCharacter = ToChurnagg.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0x5141a597590d07db), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e75ec), EConversationDebugInfo::Executing);
                
                // Krushak's will? Have you lost your mind now? He is a ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_163758"), TargetCharacter = UrNazkrog.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC", Posture = GameplayTag::Posture_Standing_Forced_Outraged01);
                DC(int64(0x99226617b81e75ec), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e75ed), EConversationDebugInfo::Executing);
                //  I will not stand for this. I will NOT!
                ToChurnagg.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_163843"), TargetCharacter = Hero.Character, ForceCameraPreset = n"Orc Temple Entrance Wide", Posture = GameplayTag::Posture_Standing_Forced_Outraged02);
                DC(int64(0x99226617b81e75ed), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e75fd), EConversationDebugInfo::Executing);
                
                // He WORKS Krushak's will! Now respect my authority or die ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_163904_2238"), TargetCharacter = ToChurnagg.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH", Posture = GameplayTag::Posture_Standing_Forced_Outraged03);
                DC(int64(0x99226617b81e75fd), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e75fe), EConversationDebugInfo::Executing);
                
                // But ... this is ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_164019"), TargetCharacter = Hero.Character, ForceCameraPreset = n"TWO SHOT EXTRA FULL", Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x99226617b81e75fe), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e760c), EConversationDebugInfo::Executing);
                // Speak, then. How does he do Krushak's will? What do you ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_164137"), TargetCharacter = UrNazkrog.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0x99226617b81e760c), EConversationDebugInfo::Done);
                DC(int64(0x99226617b81e760d), EConversationDebugInfo::Executing);
                
                // I'll explain everything, but not now. Step back and let ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QQMJVWL_20250211_164141"), TargetCharacter = ToChurnagg.Character, ForceCameraPreset = n"Orc Temple Entrance TC", Posture = GameplayTag::Posture_Standing_Forced_Outraged04);
                DC(int64(0x99226617b81e760d), EConversationDebugInfo::Done);
                DC(int64(0x6bbe7049f5d6d16), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.SucceedQuest();
                DC(int64(0x6bbe7049f5d6d16), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cc5), EConversationDebugInfo::Executing);
                // Is it true, morra? Does Krushak work through you?
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163132_2995"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0xf13de99deb210cc5), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cff), EConversationDebugInfo::Executing);
                
                // All I know is that I need to get into that temple.
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_165928"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH");
                DC(int64(0xf13de99deb210cff), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210d00), EConversationDebugInfo::Executing);
                
                // (snorts) Do you, now. Fine. 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_165951"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xf13de99deb210d00), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210d01), EConversationDebugInfo::Executing);
                // Even if you were lying and trying to harm Krushak, he ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_170011"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xf13de99deb210d01), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210d02), EConversationDebugInfo::Executing);
                // As would our fallen kin who still guard the temple. 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_170033"), ForceCameraPreset = n"Orc Temple Entrance Wide");
                DC(int64(0xf13de99deb210d02), EConversationDebugInfo::Done);
                DC(int64(0xb7a01b526b440405), EConversationDebugInfo::Executing);
                UrNazkrog.AI.TurnToCharacter(Hero);
                DC(int64(0xb7a01b526b440405), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_ToChurnagg_213867,
                    UTopic_ToChurnagg_213887,
                    UTopic_ToChurnagg_213909
                );
            }
        }
        
        
        class UTopic_ToChurnagg_213867 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x5141a597590d07e9);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_132948_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_ToChurnagg_213867);
            
            default ExtraCharactersToInvite.Add(n"OW_OSM_URNAZKROG_2401");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5141a597590d07f6), EConversationDebugInfo::Executing);
                // Once I'm inside, where will I find Krushak?
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132948_1924"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH", TargetCharacter = UrNazkrog.Character);
                DC(int64(0x5141a597590d07f6), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d07f7), EConversationDebugInfo::Executing);
                
                // That, I cannot say. But I know that Krushak will guide ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_133005"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", TargetCharacter = Hero.Character, Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x5141a597590d07f7), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d07f8), EConversationDebugInfo::Executing);
                // IF he wishes you to find him, then you will. If not ... 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_133146"), ForceCameraPreset = n"WIDE SPEAK 500", TargetCharacter = Hero.Character);
                DC(int64(0x5141a597590d07f8), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d07f9), EConversationDebugInfo::Executing);
                
                // I get it. 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_133159"), ForceCameraPreset = n"Orc Temple Entrance NHCU", TargetCharacter = UrNazkrog.Character);
                DC(int64(0x5141a597590d07f9), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d0804), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5141a597590d0804), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_ToChurnagg_213887 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x5141a597590d07ed);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_132328_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_ToChurnagg_213887);
            
            default ExtraCharactersToInvite.Add(n"OW_OSM_URNAZKROG_2401");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5141a597590d07ff), EConversationDebugInfo::Executing);
                // What was that about "fallen kin" in the temple? 
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132328_41"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH", TargetCharacter = UrNazkrog.Character);
                DC(int64(0x5141a597590d07ff), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d0800), EConversationDebugInfo::Executing);
                
                // To-Churnagg meant our grave guards. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132551"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", TargetCharacter = Hero.Character, Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x5141a597590d0800), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d0801), EConversationDebugInfo::Executing);
                // When our ancestors sealed the temple, they also sealed ...
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132808"), ForceCameraPreset = n"WIDE SPEAK 500", TargetCharacter = Hero.Character);
                DC(int64(0x5141a597590d0801), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d0802), EConversationDebugInfo::Executing);
                
                // Undead?
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132920"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC NH", TargetCharacter = UrNazkrog.Character);
                DC(int64(0x5141a597590d0802), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d0803), EConversationDebugInfo::Executing);
                
                // That is what you morra call them. 
                UrNazkrog.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132924"), ForceCameraPreset = n"Orc Temple Entrance UrnazkrogCU", TargetCharacter = Hero.Character);
                DC(int64(0x5141a597590d0803), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d080f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x5141a597590d080f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_ToChurnagg_213909 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x5141a597590d07f1);
            default Caption = LocText("TEXT_WIP_QDZOJWI_20240722_132328_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_ToChurnagg_213909);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5141a597590d080a), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_QDZOJWI_20240722_132328_2238"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH");
                DC(int64(0x5141a597590d080a), EConversationDebugInfo::Done);
                DC(int64(0x5141a597590d080e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5141a597590d080e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTochurnagg218682 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0x95d01d95936fec51);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTochurnagg218682);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OTOWN_TEMPLE_ENTRANCE2", 200.0f, int64(0x95d01d95936fec51));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf2929ba655750fb), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.IsRunning());
                    DB(int64(0x95d01d95936fec49), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded());
                }
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.IsRunning())
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x95d01d95936fec60), EConversationDebugInfo::Executing);
                RequestCameraSnapToInteractionSpot(FInteractionSpotHandle(n"FP_OTOWN_TEMPLE_ENTRANCE2"));
                DC(int64(0x95d01d95936fec60), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_ACCESSSLEEPERTEMPLE, Document::UDocumentSegment_CH5_ACCESSSLEEPERTEMPLE_StealthCompleted);
                DC(int64(0xf8212cf01d0616ee), EConversationDebugInfo::Executing);
                // I told Ur-Nazkrog the morra was trouble. But no, she ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163128_491"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC").RunDetached();
                DC(int64(0xf8212cf01d0616ee), EConversationDebugInfo::Done);
                DC(int64(0xf8212cf01d0616e4), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"WP_OTOWN_TEMPLE_ENTRANCE_NH");
                DC(int64(0xf8212cf01d0616e4), EConversationDebugInfo::Done);
                DC(int64(0xf8212cf01d0616f8), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(ToChurnagg);
                DC(int64(0xf8212cf01d0616f8), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cd7), EConversationDebugInfo::Executing);
                // Tell me: how did you get in here?
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163357"), ForceCameraPreset = n"Orc Temple Entrance Wide");
                DC(int64(0xf13de99deb210cd7), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cd8), EConversationDebugInfo::Executing);
                
                // I have my ways. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163404"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC NH");
                DC(int64(0xf13de99deb210cd8), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cd9), EConversationDebugInfo::Executing);
                
                // Keeping your secrets, are you? Fine. It doesn't matter. 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163412"), ForceCameraPreset = n"Orc Temple Entrance Wide");
                DC(int64(0xf13de99deb210cd9), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cda), EConversationDebugInfo::Executing);
                // Ulu-Mulu or not, no morra should tarnish these sacred ...
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163418"), ForceCameraPreset = n"Orc Temple Entrance ToChurnaggCU");
                DC(int64(0xf13de99deb210cda), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_ToChurnagg_112143,
                    UTopic_ToChurnagg_112163
                );
                DC(int64(0xf13de99deb210ce9), EConversationDebugInfo::Executing);
                // Draw that blade and die with the honor you never had!
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163600_3719"), ForceCameraPreset = n"Orc Temple Entrance Wide");
                DC(int64(0xf13de99deb210ce9), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e5a3), EConversationDebugInfo::Executing);
                ToChurnagg.AI.StartAttackingImmediately(Hero);
                DC(int64(0xc5b543ab0417e5a3), EConversationDebugInfo::Done);
                DC(int64(0x1e264f28c821a32), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM03_2043)) && ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM03_2043.AI))) { OW_OWR_ORCTEMPLEWARRIORM03_2043.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x1e264f28c821a32), EConversationDebugInfo::Done);
                DC(int64(0x1e264f28c821a34), EConversationDebugInfo::Executing);
                if (ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM04_2044)) && ensure(IsValid(OW_OWR_ORCTEMPLEWARRIORM04_2044.AI))) { OW_OWR_ORCTEMPLEWARRIORM04_2044.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x1e264f28c821a34), EConversationDebugInfo::Done);
                DC(int64(0x95d01d95936fec4e), EConversationDebugInfo::Executing);
                Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_ENTRANCE.SucceedQuest();
                DC(int64(0x95d01d95936fec4e), EConversationDebugInfo::Done);
                DC(int64(0xc5b543ab0417e5a6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5b543ab0417e5a6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_ToChurnagg_112143 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0xf13de99deb210cde);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_163454_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_ToChurnagg_112143);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210cdf), EConversationDebugInfo::Executing);
                // Krushak isn't on your side. He will destroy everything, ...
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163454_3750"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC NH");
                DC(int64(0xf13de99deb210cdf), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210ce6), EConversationDebugInfo::Executing);
                
                // KRUSHAK will bring an end to your rotten race! 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163520"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xf13de99deb210ce6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_ToChurnagg_112163 : UTopic_Hero__OW_OWR_TOCHURNAGG_2403
        {
            default DebugId = int64(0xf13de99deb210ce2);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_163454_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_ToChurnagg_112163);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210ce3), EConversationDebugInfo::Executing);
                
                // Then I guess I'll just have to kill you. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163454_1340"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC NH");
                DC(int64(0xf13de99deb210ce3), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210cec), EConversationDebugInfo::Executing);
                
                // (snorts) Words, words, words. All right, then. 
                ToChurnagg.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_163654"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xf13de99deb210cec), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */