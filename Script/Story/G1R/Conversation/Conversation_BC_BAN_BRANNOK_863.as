#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_BC_BAN_BRANNOK_863 : UConversationCharacterSettings
        {
            default ForCharacter = n"BC_BAN_BRANNOK_863";
        }
        
        
        class UTopic_Hero__BC_BAN_BRANNOK_863 : UG1RDialogTopic
        {
            default ForCharacter = n"BC_BAN_BRANNOK_863";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBrannok() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetBandit() const property
            {
                return GetCharacter(n"BC_BAN_ARLIN_852");
            }
            
            AGothicCharacterState GetBC_BAN_BANDIT_22() const property
            {
                return GetCharacter(n"BC_BAN_BANDIT_22");
            }
            
            AGothicCharacterState GetBC_BAN_BANDIT_23() const property
            {
                return GetCharacter(n"BC_BAN_BANDIT_23");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBrannok119214 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x8b2d0bb9d38329e1);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8b2d0bb9d38329e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok119230 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e02c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_BC_GUARD_CAVE", 300.0f, int64(0x2d09cc73ec3e02c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3e06d), G1R.Brannok_Permission == 0);
                    DB(int64(0x12fbdc35861b8b23), G1R.Brannok_Warning == 0);
                }
                
                if (G1R.Brannok_Permission != 0)
                    return false;
                
                if (G1R.Brannok_Warning != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329e4), EConversationDebugInfo::Executing);
                // Now where by Beliar do you think YOU'RE going?
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_111237_2083"));
                DC(int64(0x8b2d0bb9d38329e4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_BRANNOK, Document::UDocumentSegment_Glossary_BC_BAN_BRANNOK_Introduction);
                Subdialog(
                    UTopic_Brannok_136200,
                    UTopic_Brannok_136220,
                    UTopic_Brannok_136242
                );
                DC(int64(0x6f17b48ad99f750a), EConversationDebugInfo::Executing);
                // Look, just turn around unless you got business here. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142323_1769"));
                DC(int64(0x6f17b48ad99f750a), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f750c), EConversationDebugInfo::Executing);
                // Okay? 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142347"));
                DC(int64(0x6f17b48ad99f750c), EConversationDebugInfo::Done);
                DC(int64(0x10ccaf6fa3800632), EConversationDebugInfo::Executing);
                G1R.Brannok_Warning = 1;
                DC(int64(0x10ccaf6fa3800632), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_136200 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x6f17b48ad99f74fa);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_142015_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_136200);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74fb), EConversationDebugInfo::Executing);
                // Through that door. 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142015_1609"));
                DC(int64(0x6f17b48ad99f74fb), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7506), EConversationDebugInfo::Executing);
                
                // Well, then we got ourselves a problem, 'cause that door ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142106"));
                DC(int64(0x6f17b48ad99f7506), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_136220 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x6f17b48ad99f74fe);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_142015_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_136220);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74ff), EConversationDebugInfo::Executing);
                
                // Who's asking? 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142015_2801"));
                DC(int64(0x6f17b48ad99f74ff), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7507), EConversationDebugInfo::Executing);
                
                // The king of Varant. And he hates it when people dodge ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142147"));
                DC(int64(0x6f17b48ad99f7507), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_136242 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x6f17b48ad99f7502);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_142038_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_136242);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f7503), EConversationDebugInfo::Executing);
                
                // I'm just exploring this cave. 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142038_443"));
                DC(int64(0x6f17b48ad99f7503), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7508), EConversationDebugInfo::Executing);
                
                // Well, then we got a problem, cause this cave HATES ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_142250"));
                DC(int64(0x6f17b48ad99f7508), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok119637 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x12fbdc35861b8b29);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_153145");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBrannok119637);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x12fbdc35861b8b2c), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning());
                    DB(int64(0x371beb2adcf6b8e0), G1R.BanditCellVisited > 0);
                }
                
                if (Quest::BanditsCamp_BANDITSTRUST != nullptr && !Quest::BanditsCamp_BANDITSTRUST.IsRunning())
                    return false;
                
                if (G1R.BanditCellVisited <= 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12fbdc35861b8b27), EConversationDebugInfo::Executing);
                
                // I found Arlin.
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_153145"));
                DC(int64(0x12fbdc35861b8b27), EConversationDebugInfo::Done);
                DC(int64(0x12fbdc35861b8b28), EConversationDebugInfo::Executing);
                
                // And?
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_153145_41"));
                DC(int64(0x12fbdc35861b8b28), EConversationDebugInfo::Done);
                DB(int64(0xe3a93d9ae2334159), Bandit != nullptr && Bandit.IsCloseToWaypoint(n"FP_BC_Campfire_02", 5000.0f));
                DB(int64(0xe3a93d9ae233415a), Hero != nullptr && Hero.IsCloseToCharacter(Bandit, 2500.0f));
                
                if (Bandit != nullptr && Bandit.IsCloseToWaypoint(n"FP_BC_Campfire_02", 5000.0f))
                {
                    DC(int64(0xe3a93d9ae233415b), EConversationDebugInfo::Executing);
                    // He didn't talk. I sprang him out. 
                    Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_155554_41"));
                    DC(int64(0xe3a93d9ae233415b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_brannok_119637_exit_1");
                }
                else if (Hero != nullptr && Hero.IsCloseToCharacter(Bandit, 2500.0f))
                {
                    DC(int64(0xe3a93d9ae233415d), EConversationDebugInfo::Executing);
                    // He didn't talk. I sprang him out. 
                    Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_155554_41"));
                    DC(int64(0xe3a93d9ae233415d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_brannok_119637_exit_2");
                }
                else
                {
                    Subdialog(
                        UTopic_Brannok_122194,
                        UTopic_Brannok_122214
                    );
                }
            }
        }
        
        
        class UTopic_Brannok_122194 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x371beb2adcf6b900);
            default Caption = LocText("TEXT_WIP_LHRCFQN_20241212_155554_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_122194);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x371beb2adcf6b909), G1R.BanditCellVisited == 1);
                }
                
                return G1R.BanditCellVisited == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x371beb2adcf6b901), EConversationDebugInfo::Executing);
                // He didn't talk. I sprang him out. 
                Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_155554_41"));
                DC(int64(0x371beb2adcf6b901), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b917), EConversationDebugInfo::Executing);
                
                // Then where is he?
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_155927"));
                DC(int64(0x371beb2adcf6b917), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b918), EConversationDebugInfo::Executing);
                
                // We split up. He should be on his way here. 
                Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_160002"));
                DC(int64(0x371beb2adcf6b918), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f755d), EConversationDebugInfo::Executing);
                
                // Hm. I see. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145818"));
                DC(int64(0x6f17b48ad99f755d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_122214 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x371beb2adcf6b904);
            default Caption = LocText("TEXT_WIP_LHRCFQN_20241212_155554_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_122214);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x371beb2adcf6b90b), G1R.BanditCellVisited == 2);
                }
                
                return G1R.BanditCellVisited == 2;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x371beb2adcf6b905), EConversationDebugInfo::Executing);
                
                // He talked. 
                Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_155554_2238"));
                DC(int64(0x371beb2adcf6b905), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b92f), EConversationDebugInfo::Executing);
                
                // Shame. I trust you handled it? 
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_160834"));
                DC(int64(0x371beb2adcf6b92f), EConversationDebugInfo::Done);
                DB(int64(0xedc84834f122c4e4), Bandit != nullptr && Bandit.IsEveryoneOfThisKindDead());
                DB(int64(0xedc84834f122c4ed), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UPLRCKI_20250107_160503")));
                
                if (Bandit != nullptr && Bandit.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x6f17b48ad99f756e), EConversationDebugInfo::Executing);
                    // He won't be a problem anymore.
                    Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145923"));
                    DC(int64(0x6f17b48ad99f756e), EConversationDebugInfo::Done);
                    DC(int64(0x6f17b48ad99f756f), EConversationDebugInfo::Executing);
                    
                    // Good. 
                    Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145923_292"));
                    DC(int64(0x6f17b48ad99f756f), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_UPLRCKI_20250107_160503")))
                {
                    DC(int64(0x6f17b48ad99f7564), EConversationDebugInfo::Executing);
                    
                    // He looked nice and comfy in that cell. I left him there.
                    Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145920"));
                    DC(int64(0x6f17b48ad99f7564), EConversationDebugInfo::Done);
                    DC(int64(0x6f17b48ad99f7565), EConversationDebugInfo::Executing);
                    
                    // Did you? I'd rather you'd have done him in. But I guess ...
                    Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145920_153"));
                    DC(int64(0x6f17b48ad99f7565), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UChoiceBrannok120201 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e042);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_112337_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBrannok120201);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3e029), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                    DB(int64(0x2d09cc73ec3e025), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0x2d09cc73ec3e027), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning())
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329ed), EConversationDebugInfo::Executing);
                // I really want to go through that door. 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_112337_1924"));
                DC(int64(0x8b2d0bb9d38329ed), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e020), EConversationDebugInfo::Executing);
                
                // (sighs) Beliar's bloody balls. You're tenacious. 
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_115618"));
                DC(int64(0x2d09cc73ec3e020), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f751c), EConversationDebugInfo::Executing);
                // All right. If you do something for me, I might just let ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_143403"));
                DC(int64(0x6f17b48ad99f751c), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f751d), EConversationDebugInfo::Executing);
                // But I'm warning you. It won't be easy.
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_143417"));
                DC(int64(0x6f17b48ad99f751d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok120204 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e039);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_113030_3286");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBrannok120204);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x82d2542e5c65eca6), Hero != nullptr && !Hero.HasDefeated(Brannok));
                    DB(int64(0xe3a93d9ae2334162), Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded());
                    DB(int64(0x371beb2adcf6b8e0), G1R.BanditCellVisited <= 0);
                    DB(int64(0xe3a93d9ae2334148), Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasDefeated(Brannok) && Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded())
                    return true;
                
                if (G1R.BanditCellVisited <= 0 && Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329f6), EConversationDebugInfo::Executing);
                
                // I'm going through that door. Whether you want it or not. 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113030_3286"));
                DC(int64(0x8b2d0bb9d38329f6), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329f9), EConversationDebugInfo::Executing);
                
                // Don't say I didn't warn you.
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113110"));
                DC(int64(0x8b2d0bb9d38329f9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok120207 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e031);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_113901_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBrannok120207);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3def4), Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning());
                    DB(int64(0xe3a93d9ae2334152), G1R.Brannok_Permission <= 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP != nullptr && !Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP.IsRunning())
                    return false;
                
                if (G1R.Brannok_Permission > 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3dee8), EConversationDebugInfo::Executing);
                
                // This is Quentin's camp, isn't it? Lee sent me to take a ...
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113901_41"));
                DC(int64(0x2d09cc73ec3dee8), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3def9), EConversationDebugInfo::Executing);
                
                // Lee, you said? Well, well.
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113959"));
                DC(int64(0x2d09cc73ec3def9), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7559), EConversationDebugInfo::Executing);
                // You're one dumb spy. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145514"));
                DC(int64(0x6f17b48ad99f7559), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok120210 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e033);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_113903_2083");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBrannok120210);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe3a93d9ae2334150), Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning());
                    DB(int64(0xe3a93d9ae2334151), G1R.Brannok_Permission <= 0);
                }
                
                if (Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP != nullptr && !Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP.IsRunning())
                    return false;
                
                if (G1R.Brannok_Permission > 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3deec), EConversationDebugInfo::Executing);
                
                // This is Quentin's camp, isn't it? Thorus sent me to take ...
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113903_2083"));
                DC(int64(0x2d09cc73ec3deec), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f755a), EConversationDebugInfo::Executing);
                
                // Thorus, you said? Well, well. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145557"));
                DC(int64(0x6f17b48ad99f755a), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f755b), EConversationDebugInfo::Executing);
                // You're one dumb spy. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145514"));
                DC(int64(0x6f17b48ad99f755b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok120213 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e048);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_113906_2238");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceBrannok120213);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3def8), Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP != nullptr && Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3def0), EConversationDebugInfo::Executing);
                
                // Baal Orun sent me. He wonders if you're interested in ...
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_113906_2238"));
                DC(int64(0x2d09cc73ec3def0), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3defb), EConversationDebugInfo::Executing);
                
                // Hmm. Interesting. 
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_114513"));
                DC(int64(0x2d09cc73ec3defb), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7556), EConversationDebugInfo::Executing);
                // Thing is, I can't let you in before I know I can trust ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145333"));
                DC(int64(0x6f17b48ad99f7556), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7557), EConversationDebugInfo::Executing);
                // Here's the deal: do something for me, and you can walk ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145343"));
                DC(int64(0x6f17b48ad99f7557), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7558), EConversationDebugInfo::Executing);
                // What do you think?
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145412"));
                DC(int64(0x6f17b48ad99f7558), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBrannok120216 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e037);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_112337_3436");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x82d2542e5c65eca6), Hero != nullptr && !Hero.HasDefeated(Brannok));
                    DB(int64(0xe3a93d9ae2334161), Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded());
                    DB(int64(0x371beb2adcf6b8e0), G1R.BanditCellVisited <= 0);
                    DB(int64(0xe3a93d9ae2334148), Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasDefeated(Brannok) && Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded())
                    return true;
                
                if (G1R.BanditCellVisited <= 0 && Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE != nullptr && !Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329f1), EConversationDebugInfo::Executing);
                
                // I'll be on my way. 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_112337_3436"));
                DC(int64(0x8b2d0bb9d38329f1), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f755c), EConversationDebugInfo::Executing);
                
                // Now you're getting it. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145634"));
                DC(int64(0x6f17b48ad99f755c), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329f4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8b2d0bb9d38329f4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok120278 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e03a);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok120204);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok120207);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok120210);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2d0bb9d38329fb), EConversationDebugInfo::Executing);
                Brannok.AI.StartAttackingImmediately(Hero);
                DC(int64(0x8b2d0bb9d38329fb), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329fd), EConversationDebugInfo::Executing);
                if (ensure(IsValid(BC_BAN_BANDIT_22)) && ensure(IsValid(BC_BAN_BANDIT_22.AI))) { BC_BAN_BANDIT_22.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x8b2d0bb9d38329fd), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329ff), EConversationDebugInfo::Executing);
                if (ensure(IsValid(BC_BAN_BANDIT_23)) && ensure(IsValid(BC_BAN_BANDIT_23.AI))) { BC_BAN_BANDIT_23.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x8b2d0bb9d38329ff), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d3832a00), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8b2d0bb9d3832a00), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok120398 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e04e);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_141048");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok120201);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok120213);
            default Rules.HideIfKnows(UChoiceBrannok120398);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e04c), EConversationDebugInfo::Executing);
                // Whatever it is, I can handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_141048"));
                DC(int64(0x2d09cc73ec3e04c), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e04d), EConversationDebugInfo::Executing);
                
                // You said it. Fine. 
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_141048_3569"));
                DC(int64(0x2d09cc73ec3e04d), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e050), EConversationDebugInfo::Executing);
                // A few days ago, me and a friend of mine were running a, ...
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_143404"));
                DC(int64(0x2d09cc73ec3e050), EConversationDebugInfo::Done);
                DB(int64(0x6f17b48ad99f7521), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x6f17b48ad99f7527), EConversationDebugInfo::Executing);
                    // A couple of your guys had a problem with that, and got a ...
                    Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144201_1340"));
                    DC(int64(0x6f17b48ad99f7527), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x6f17b48ad99f752b), EConversationDebugInfo::Executing);
                    // A couple of Old Campers had a problem with that, and got ...
                    Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144205_3719"));
                    DC(int64(0x6f17b48ad99f752b), EConversationDebugInfo::Done);
                }
                DC(int64(0x6f17b48ad99f7532), EConversationDebugInfo::Executing);
                // Now he's counting meatbugs in Gomez's dungeon. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144252_2316"));
                DC(int64(0x6f17b48ad99f7532), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7539), EConversationDebugInfo::Executing);
                
                // You want me to spring him out. 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144311"));
                DC(int64(0x6f17b48ad99f7539), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f753a), EConversationDebugInfo::Executing);
                
                // Almost. I want you to get in there and find out if he ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144316"));
                DC(int64(0x6f17b48ad99f753a), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f753b), EConversationDebugInfo::Executing);
                // If he did, deal with it. If he didn't, get him out of ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144406"));
                DC(int64(0x6f17b48ad99f753b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Brannok_120595,
                    UTopic_Brannok_120615,
                    UTopic_Brannok_138801,
                    UTopic_Brannok_120641
                );
            }
        }
        
        
        class UTopic_Brannok_120595 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e057);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_143816_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_120595);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e058), EConversationDebugInfo::Executing);
                // What do you mean "deal with it?"
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_143816_443"));
                DC(int64(0x2d09cc73ec3e058), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f753e), EConversationDebugInfo::Executing);
                
                // Do you need me to spell it out for you?
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144438"));
                DC(int64(0x6f17b48ad99f753e), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e05a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2d09cc73ec3e05a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_120615 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e05b);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_143816_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_120615);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e05c), EConversationDebugInfo::Executing);
                // What kind of errand were you running? 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_143816_491"));
                DC(int64(0x2d09cc73ec3e05c), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f753f), EConversationDebugInfo::Executing);
                
                // That, my nosy friend, is none of your business. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144458"));
                DC(int64(0x6f17b48ad99f753f), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e05e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2d09cc73ec3e05e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_138801 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x6f17b48ad99f7540);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_144514_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_138801);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f7541), EConversationDebugInfo::Executing);
                // How am I supposed to get him out of a dungeon?
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144514_3902"));
                DC(int64(0x6f17b48ad99f7541), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7546), EConversationDebugInfo::Executing);
                
                // By doing what you said you would, and "handling it." 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144532"));
                DC(int64(0x6f17b48ad99f7546), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7543), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6f17b48ad99f7543), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Brannok_120641 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e05f);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_145344_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Brannok_120641);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e060), EConversationDebugInfo::Executing);
                // All right. I'll find your guy. 
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_145344_2995"));
                DC(int64(0x2d09cc73ec3e060), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b937), EConversationDebugInfo::Executing);
                
                // Good. His name's Arlin, you'll recognize him. 
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_161157"));
                DC(int64(0x371beb2adcf6b937), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f7549), EConversationDebugInfo::Executing);
                // And here, take this - it'll help him get past the guards ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_144721"));
                DC(int64(0x6f17b48ad99f7549), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b938), EConversationDebugInfo::Executing);
                // Now, please, for the love of Innos, stop pestering me. 
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_161835"));
                DC(int64(0x371beb2adcf6b938), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_FoundCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_Trust);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_FoundCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_Trust);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_FoundCamp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Trust);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Start);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Brannok.AddItemToInventory(UItMs_FakeDiggerClothes, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e065), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST.StartQuest();
                DC(int64(0x2d09cc73ec3e065), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b93a), EConversationDebugInfo::Executing);
                Brannok.AI.GiveItemTo(Hero, UItMs_FakeDiggerClothes, 1);
                DC(int64(0x371beb2adcf6b93a), EConversationDebugInfo::Done);
                DC(int64(0xf2ac185c2a006459), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND.SucceedQuest();
                DC(int64(0xf2ac185c2a006459), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847d861d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND.SucceedQuest();
                DC(int64(0x570acab4847d861d), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142628ae80), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_FIND.SucceedQuest();
                DC(int64(0x8c29f1142628ae80), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e063), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2d09cc73ec3e063), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok120739 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e06a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BC_TUNNEL_BRIDGE", 400.0f, int64(0x2d09cc73ec3e06a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3e06f), G1R.Brannok_Permission == 0);
                    DB(int64(0x12fbdc35861b8b22), G1R.Brannok_Warning == 1);
                }
                
                if (G1R.Brannok_Permission != 0)
                    return false;
                
                if (G1R.Brannok_Warning != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e069), EConversationDebugInfo::Executing);
                // Are you deaf? I said, stay back. 
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_150601_3750"));
                DC(int64(0x2d09cc73ec3e069), EConversationDebugInfo::Done);
                DC(int64(0x2d09cc73ec3e077), EConversationDebugInfo::Executing);
                G1R.Brannok_Warning = 2;
                DC(int64(0x2d09cc73ec3e077), EConversationDebugInfo::Done);
                DC(int64(0x2f5445904abfbf53), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2f5445904abfbf53), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok120763 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x2d09cc73ec3e072);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BC_TUNNEL_BRIDGE", 200.0f, int64(0x2d09cc73ec3e072));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2d09cc73ec3e075), G1R.Brannok_Permission == 0);
                    DB(int64(0x12fbdc35861b8b24), G1R.Brannok_Warning == 2);
                }
                
                if (G1R.Brannok_Permission != 0)
                    return false;
                
                if (G1R.Brannok_Warning != 2)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d09cc73ec3e071), EConversationDebugInfo::Executing);
                // You asked for it. GUYS! OVER HERE!
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_151043_1340"));
                DC(int64(0x2d09cc73ec3e071), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329fb), EConversationDebugInfo::Executing);
                Brannok.AI.StartAttackingImmediately(Hero);
                DC(int64(0x8b2d0bb9d38329fb), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329fd), EConversationDebugInfo::Executing);
                if (ensure(IsValid(BC_BAN_BANDIT_22)) && ensure(IsValid(BC_BAN_BANDIT_22.AI))) { BC_BAN_BANDIT_22.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x8b2d0bb9d38329fd), EConversationDebugInfo::Done);
                DC(int64(0x8b2d0bb9d38329ff), EConversationDebugInfo::Executing);
                if (ensure(IsValid(BC_BAN_BANDIT_23)) && ensure(IsValid(BC_BAN_BANDIT_23.AI))) { BC_BAN_BANDIT_23.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x8b2d0bb9d38329ff), EConversationDebugInfo::Done);
                DC(int64(0x2f5445904abfbf56), EConversationDebugInfo::Executing);
                G1R.Brannok_Warning = 0;
                DC(int64(0x2f5445904abfbf56), EConversationDebugInfo::Done);
                DC(int64(0x2f5445904abfbf54), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2f5445904abfbf54), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok122565 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x371beb2adcf6b932);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok119637);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBrannok232590);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x371beb2adcf6b935), EConversationDebugInfo::Executing);
                // You kept your word, so I'll keep mine. 
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_161022_2785"));
                DC(int64(0x371beb2adcf6b935), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f75aa), EConversationDebugInfo::Executing);
                // The door's open to you. You might wanna have a chat with ...
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_150059"));
                DC(int64(0x6f17b48ad99f75aa), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b936), EConversationDebugInfo::Executing);
                // But I'm warning you: this doesn't mean we're pals now. ...
                Brannok.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_161058"));
                DC(int64(0x371beb2adcf6b936), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f75ab), EConversationDebugInfo::Executing);
                // Clear?
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_150137"));
                DC(int64(0x6f17b48ad99f75ab), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f75ac), EConversationDebugInfo::Executing);
                
                // Clear. 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_150139"));
                DC(int64(0x6f17b48ad99f75ac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_BRANNOK, Document::UDocumentSegment_Glossary_BC_BAN_BRANNOK_Access);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_QUENTIN, Document::UDocumentSegment_Glossary_BC_BAN_QUENTIN_SmallInfo);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_TrustProved);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_TrustProved);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_TrustProved);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Completed);
                DC(int64(0x12fbdc35861b8b2e), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT.SucceedQuest();
                DC(int64(0x12fbdc35861b8b2e), EConversationDebugInfo::Done);
                DC(int64(0x12fbdc35861b8b30), EConversationDebugInfo::Executing);
                G1R.Brannok_Permission = 1;
                DC(int64(0x12fbdc35861b8b30), EConversationDebugInfo::Done);
                DC(int64(0xf2ac185c2a00645c), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS.SucceedQuest();
                DC(int64(0xf2ac185c2a00645c), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847d8639), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS.SucceedQuest();
                DC(int64(0x570acab4847d8639), EConversationDebugInfo::Done);
                DC(int64(0x8c29f1142628ae6d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_SCBANDITSCAMP_SCBANDITSCAMP_OBJ_ACCESS.SucceedQuest();
                DC(int64(0x8c29f1142628ae6d), EConversationDebugInfo::Done);
                DC(int64(0xa863a5c8f7ea8982), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Bandit))) { Bandit.AddItemToInventory(UArmor_BC_BAN_Arlin_852_02, 1); }
                DC(int64(0xa863a5c8f7ea8982), EConversationDebugInfo::Done);
                DC(int64(0xa863a5c8f7ea898b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Bandit))) { Bandit.Inventory.EquipArmorOfClass(UArmor_BC_BAN_Arlin_852_02); }
                DC(int64(0xa863a5c8f7ea898b), EConversationDebugInfo::Done);
                DC(int64(0xa863a5c8f7ea89a3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Bandit))) { Bandit.AddItemToInventory(UItMw_2H_Staff_Scepter, 1); }
                DC(int64(0xa863a5c8f7ea89a3), EConversationDebugInfo::Done);
                DC(int64(0xa863a5c8f7ea89a5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Bandit))) { Bandit.AddItemToInventory(UItRw_Bow_Long_01, 1); }
                DC(int64(0xa863a5c8f7ea89a5), EConversationDebugInfo::Done);
                DC(int64(0xa863a5c8f7ea89a7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Bandit))) { Bandit.AddItemToInventory(UItAm_Arrow, 20); }
                DC(int64(0xa863a5c8f7ea89a7), EConversationDebugInfo::Done);
                DC(int64(0x12fbdc35861b8b31), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x12fbdc35861b8b31), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBrannok146365 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x4dc7a364aabac808);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            
            default Rules.HideIfKnows(UChoiceBrannok146365);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3fad8d97598fa37d), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xb36435628f92e489), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded());
                    DB(int64(0x3fad8d97598fa37d), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xb36435628f92e48a), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded());
                }
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage) && Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded())
                    return true;
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.HasSucceeded())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4dc7a364aabac805), EConversationDebugInfo::Executing);
                // There's one more thing you should know.
                Brannok.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004213_41"));
                DC(int64(0x4dc7a364aabac805), EConversationDebugInfo::Done);
                DC(int64(0x4dc7a364aabac804), EConversationDebugInfo::Executing);
                
                // What is it?
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004213"));
                DC(int64(0x4dc7a364aabac804), EConversationDebugInfo::Done);
                DC(int64(0x4dc7a364aabac80e), EConversationDebugInfo::Executing);
                
                // Quentin doesn't like mages.
                Brannok.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004332"));
                DC(int64(0x4dc7a364aabac80e), EConversationDebugInfo::Done);
                DC(int64(0x4dc7a364aabac80f), EConversationDebugInfo::Executing);
                // At all. 
                Brannok.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004416"));
                DC(int64(0x4dc7a364aabac80f), EConversationDebugInfo::Done);
                DC(int64(0x4dc7a364aabac810), EConversationDebugInfo::Executing);
                
                // In what sense?
                Hero.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004501"));
                DC(int64(0x4dc7a364aabac810), EConversationDebugInfo::Done);
                DC(int64(0x4dc7a364aabac811), EConversationDebugInfo::Executing);
                
                // In the "I'm gonna kill every robe-wearer on sight" ...
                Brannok.AI.Say(LocText("TEXT_WIP_AKGBIDI_20250130_004515"));
                DC(int64(0x4dc7a364aabac811), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_QUENTIN, Document::UDocumentSegment_Glossary_BC_BAN_QUENTIN_HateMages);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_Mages);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_Mages);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_SCBANDITSCAMP, Document::UDocumentSegment_CH3_SCBANDITSCAMP_Mages);
            }
        }
        
        
        class UChoiceBrannok232590 : UTopic_Hero__BC_BAN_BRANNOK_863
        {
            default DebugId = int64(0x561fc590556f3d57);
            default Caption = LocText("TEXT_WIP_PFCKUON_20241209_153145");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceBrannok232590);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x12fbdc35861b8b2c), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning());
                    DB(int64(0x371beb2adcf6b8e0), G1R.BanditCellVisited == 0);
                    DB(int64(0x561fc590556f3d5e), Bandit != nullptr && Bandit.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::BanditsCamp_BANDITSTRUST != nullptr && !Quest::BanditsCamp_BANDITSTRUST.IsRunning())
                    return false;
                
                if (G1R.BanditCellVisited != 0)
                    return false;
                
                if (Bandit != nullptr && !Bandit.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x561fc590556f3d53), EConversationDebugInfo::Executing);
                // I found Arlin.
                Hero.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_153145"));
                DC(int64(0x561fc590556f3d53), EConversationDebugInfo::Done);
                DC(int64(0x561fc590556f3d54), EConversationDebugInfo::Executing);
                
                // And?
                Brannok.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_153145_41"));
                DC(int64(0x561fc590556f3d54), EConversationDebugInfo::Done);
                DC(int64(0x561fc590556f3d60), EConversationDebugInfo::Executing);
                
                // He won't be a problem anymore.
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145923"));
                DC(int64(0x561fc590556f3d60), EConversationDebugInfo::Done);
                DC(int64(0x561fc590556f3d61), EConversationDebugInfo::Executing);
                
                // Good. 
                Brannok.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_145923_292"));
                DC(int64(0x561fc590556f3d61), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */