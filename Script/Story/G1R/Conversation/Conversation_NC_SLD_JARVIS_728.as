#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_JARVIS_728 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_JARVIS_728";
        }
        
        
        class UTopic_Hero__NC_SLD_JARVIS_728 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_JARVIS_728";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJarvis() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceJarvis85298 : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0xc72600f5ec2c8021);
            default Caption = LocText("TEXT_WIP_KIWVLHC_20240313_181751");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisSldinfo);
            default Rules.HideIfKnows(UChoiceJarvis85298);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x868d389bf57c8835), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc72600f5ec2c801f), EConversationDebugInfo::Executing);
                // What if I want to join you? The mercenaries? 
                Hero.AI.Say(LocText("TEXT_WIP_KIWVLHC_20240313_181751"));
                DC(int64(0xc72600f5ec2c801f), EConversationDebugInfo::Done);
                DC(int64(0xc72600f5ec2c8020), EConversationDebugInfo::Executing);
                
                // Ha! Ambitious. I like that. But we're a tight crew, and ...
                Jarvis.AI.Say(LocText("TEXT_WIP_KIWVLHC_20240313_181751_41"));
                DC(int64(0xc72600f5ec2c8020), EConversationDebugInfo::Done);
                DC(int64(0xc72600f5ec2c8023), EConversationDebugInfo::Executing);
                // Try your luck with Lares first. If word gets around that ...
                Jarvis.AI.Say(LocText("TEXT_WIP_KIWVLHC_20240313_181912"));
                DC(int64(0xc72600f5ec2c8023), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvis97990 : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x82fbbe18f8eb3837);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceJarvis97990);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_SATURAS_AMBUSH_14_01"), int64(0x82fbbe18f8eb3837));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x222dae20f194be5b), G1R.FireMagesDead != 0);
                }
                
                return G1R.FireMagesDead != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x82fbbe18f8eb3836), EConversationDebugInfo::Executing);
                // Hey, you!
                Jarvis.AI.Say(LocText("TEXT_WIP_ZWKHAXF_20240527_154504_3719"));
                DC(int64(0x82fbbe18f8eb3836), EConversationDebugInfo::Done);
                DB(int64(0x19f1d0df4e41e87e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x19f1d0df4e41e881), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x19f1d0df4e41e880), EConversationDebugInfo::Executing);
                    // You got some fucking nerve showin' up here. 
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191207_2801"));
                    DC(int64(0x19f1d0df4e41e880), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e883), EConversationDebugInfo::Executing);
                    // Give me one bloody reason I shouldn't kill you right ...
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191250"));
                    DC(int64(0x19f1d0df4e41e883), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e884), EConversationDebugInfo::Executing);
                    
                    // I need to talk to Saturas. I'm the guy who found the ...
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191338"));
                    DC(int64(0x19f1d0df4e41e884), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e885), EConversationDebugInfo::Executing);
                    
                    // You- 
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191357"));
                    DC(int64(0x19f1d0df4e41e885), EConversationDebugInfo::Done);
                    DC(int64(0x27317e27b6a363b), EConversationDebugInfo::Executing);
                    // Oh. Right, of course. Sorry, mate. I'm a bit wound up.
                    Jarvis.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_171425"));
                    DC(int64(0x27317e27b6a363b), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x19f1d0df4e41e887), EConversationDebugInfo::Executing);
                    // You should head back to your swamp. This is a bad time ...
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191434_443"));
                    DC(int64(0x19f1d0df4e41e887), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e896), EConversationDebugInfo::Executing);
                    
                    // I need to talk to Saturas. I'm the guy who found the ...
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191338"));
                    DC(int64(0x19f1d0df4e41e896), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e897), EConversationDebugInfo::Executing);
                    
                    // You- 
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191357"));
                    DC(int64(0x19f1d0df4e41e897), EConversationDebugInfo::Done);
                    DC(int64(0x27317e27b6a363c), EConversationDebugInfo::Executing);
                    // Oh. Right, of course. Sorry, mate. I'm a bit wound up.
                    Jarvis.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_171425"));
                    DC(int64(0x27317e27b6a363c), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x19f1d0df4e41e88b), EConversationDebugInfo::Executing);
                    // Hold up, now's not-
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191537_1769"));
                    DC(int64(0x19f1d0df4e41e88b), EConversationDebugInfo::Done);
                    DC(int64(0x27317e27b6a363d), EConversationDebugInfo::Executing);
                    // Oh. It's you. 
                    Jarvis.AI.Say(LocText("TEXT_WIP_UUKFIKD_20241024_171528"));
                    DC(int64(0x27317e27b6a363d), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e8a2), EConversationDebugInfo::Executing);
                    
                    // Something wrong?
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191708"));
                    DC(int64(0x19f1d0df4e41e8a2), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e8a3), EConversationDebugInfo::Executing);
                    
                    // (scoffs) You better believe it. 
                    Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191713"));
                    DC(int64(0x19f1d0df4e41e8a3), EConversationDebugInfo::Done);
                }
                DC(int64(0x19f1d0df4e41e899), EConversationDebugInfo::Executing);
                // Those fuckin' Reds ... they raided our mine. 
                Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191644_491"));
                DC(int64(0x19f1d0df4e41e899), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8a6), EConversationDebugInfo::Executing);
                
                // Are you serious?
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191837"));
                DC(int64(0x19f1d0df4e41e8a6), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8a8), EConversationDebugInfo::Executing);
                
                // Go on in - but stay away from the mine for now. We'll ...
                Jarvis.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_191905"));
                DC(int64(0x19f1d0df4e41e8a8), EConversationDebugInfo::Done);
                DC(int64(0x82fbbe18f8eb383f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x82fbbe18f8eb383f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJarvisErzhaufen : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c053);
            default Caption = LocText("DIA_JARVIS_ERZHAUFEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisMagier);
            default Rules.HideIfKnows(UChoiceJarvisErzhaufen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c054), EConversationDebugInfo::Executing);
                // So you have a giant pile of ore lying around in the ...
                Hero.AI.Say(LocText("DIA_JARVIS_ERZHAUFEN_15_00"));
                DC(int64(0x8f1f05b8ae66c054), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c055), EConversationDebugInfo::Executing);
                
                // Don't get any ideas. But, yeah, we do - if we gave this ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_ERZHAUFEN_08_01"));
                DC(int64(0x8f1f05b8ae66c055), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c056), EConversationDebugInfo::Executing);
                // But he can keep her. We're gettin' outta here ... ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_ERZHAUFEN_08_02"));
                DC(int64(0x8f1f05b8ae66c056), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvisExit : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c03f);
            default Caption = LocText("TEXT_WIP_KDYGJGI_20250115_111502");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x927b0cef0f024d02), EConversationDebugInfo::Executing);
                
                // See you around.
                Hero.AI.Say(LocText("TEXT_WIP_KDYGJGI_20250115_111502"));
                DC(int64(0x927b0cef0f024d02), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c040), EConversationDebugInfo::Executing);
                
                // Watch your back, mate.
                Jarvis.AI.Say(LocText("DIA_JARVIS_EXIT_08_00"));
                DC(int64(0x8f1f05b8ae66c040), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c041), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x8f1f05b8ae66c041), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJarvisFirst : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c042);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceJarvisFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x927b0cef0f024d01), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(4);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c043), EConversationDebugInfo::Executing);
                // Ain't seen you before. You plannin' to go through this ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_FIRST_08_00"));
                DC(int64(0x8f1f05b8ae66c043), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c044), EConversationDebugInfo::Executing);
                
                // Are you going to stop me?
                Hero.AI.Say(LocText("DIA_JARVIS_FIRST_15_01"));
                DC(int64(0x8f1f05b8ae66c044), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c045), EConversationDebugInfo::Executing);
                
                // Nah, but you oughta know what you're walkin' into. This ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_FIRST_08_02"));
                DC(int64(0x8f1f05b8ae66c045), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c046), EConversationDebugInfo::Executing);
                
                // How?
                Hero.AI.Say(LocText("DIA_JARVIS_FIRST_15_03"));
                DC(int64(0x8f1f05b8ae66c046), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c047), EConversationDebugInfo::Executing);
                
                // Right, first off, there ain't no templars or warders ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_FIRST_08_04"));
                DC(int64(0x8f1f05b8ae66c047), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_JARVIS, Document::UDocumentSegment_Glossary_NC_SLD_JARVIS_Introduction);
                DB(int64(0x91380921a6087f7d), Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("ORG_826_MORDRAG_ATNEWCAMP_11_01")))
                {
                    DC(int64(0x91380921a6087f7f), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"SpawnMonstersAfterMordrag");
                    DC(int64(0x91380921a6087f7f), EConversationDebugInfo::Done);
                }
                DB(int64(0x91380921a6087f81), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RQHNQN_20260123_183831_2785")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_RQHNQN_20260123_183831_2785")))
                {
                    DC(int64(0x91380921a6087f83), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"SpawnMonstersAfterDrax");
                    DC(int64(0x91380921a6087f83), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jarvis_first_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_jarvis_first_exit_2");
                }
            }
        }
        
        
        class UChoiceJarvisMagier : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c04d);
            default Caption = LocText("DIA_JARVIS_MAGIER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisSldinfo);
            default Rules.HideIfKnows(UChoiceJarvisMagier);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c04e), EConversationDebugInfo::Executing);
                // What do the mages do?
                Hero.AI.Say(LocText("DIA_JARVIS_MAGIER_15_00"));
                DC(int64(0x8f1f05b8ae66c04e), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c04f), EConversationDebugInfo::Executing);
                
                // Most of the time, they study the blue ore. 
                Jarvis.AI.Say(LocText("DIA_JARVIS_MAGIER_08_01"));
                DC(int64(0x8f1f05b8ae66c04f), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c050), EConversationDebugInfo::Executing);
                // Their plan is to blow up the whole heap our miners have ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_MAGIER_08_02"));
                DC(int64(0x8f1f05b8ae66c050), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c051), EConversationDebugInfo::Executing);
                
                // Sounds dangerous.
                Hero.AI.Say(LocText("DIA_JARVIS_MAGIER_15_03"));
                DC(int64(0x8f1f05b8ae66c051), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c052), EConversationDebugInfo::Executing);
                
                // They say it's safe. 
                Jarvis.AI.Say(LocText("DIA_JARVIS_MAGIER_08_04"));
                DC(int64(0x8f1f05b8ae66c052), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvisPerm : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c05f);
            default Caption = LocText("DIA_JARVIS_PERM_15_00");
            default PriorityRank = 4;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisMagier);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c060), EConversationDebugInfo::Executing);
                
                // How much more ore do you need? 
                Hero.AI.Say(LocText("DIA_JARVIS_PERM_15_00"));
                DC(int64(0x8f1f05b8ae66c060), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c061), EConversationDebugInfo::Executing);
                
                // A bit. But we're gettin' there. The scrapers work day ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_PERM_08_01"));
                DC(int64(0x8f1f05b8ae66c061), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvisRest : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c05c);
            default Caption = LocText("DIA_JARVIS_REST_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisFirst);
            default Rules.HideIfKnows(UChoiceJarvisRest);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c05d), EConversationDebugInfo::Executing);
                
                // Besides you mercenaries, who else lives here?
                Hero.AI.Say(LocText("DIA_JARVIS_REST_15_00"));
                DC(int64(0x8f1f05b8ae66c05d), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c05e), EConversationDebugInfo::Executing);
                
                // Farmers, scrapers, mages, and Lares's gang. 
                Jarvis.AI.Say(LocText("DIA_JARVIS_REST_08_01"));
                DC(int64(0x8f1f05b8ae66c05e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvisSldinfo : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c048);
            default Caption = LocText("DIA_JARVIS_SLDINFO_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisFirst);
            default Rules.HideIfKnows(UChoiceJarvisSldinfo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c049), EConversationDebugInfo::Executing);
                
                // Mercs ... I think I heard about you. You protect the ...
                Hero.AI.Say(LocText("DIA_JARVIS_SLDINFO_15_00"));
                DC(int64(0x8f1f05b8ae66c049), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c04a), EConversationDebugInfo::Executing);
                
                // The mages and the ore, yeah. We work for General Lee. ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_SLDINFO_08_01"));
                DC(int64(0x8f1f05b8ae66c04a), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c04b), EConversationDebugInfo::Executing);
                // Unlike Gomez and his lot in the Old Camp, we ain't given ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_SLDINFO_08_02"));
                DC(int64(0x8f1f05b8ae66c04b), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee00f0), EConversationDebugInfo::Executing);
                // What's your deal, anyway? You thinkin' about joinin' the ...
                Jarvis.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_130017"));
                DC(int64(0x45f83621a0ee00f0), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee00f1), EConversationDebugInfo::Executing);
                
                // Can I do that?
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_130043"));
                DC(int64(0x45f83621a0ee00f1), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee00f2), EConversationDebugInfo::Executing);
                
                // Well, that depends. The Rice Lord's always after new ...
                Jarvis.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_130050"));
                DC(int64(0x45f83621a0ee00f2), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee00f3), EConversationDebugInfo::Executing);
                
                // What if I want to do something other than farming or ...
                Hero.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_130210"));
                DC(int64(0x45f83621a0ee00f3), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c04c), EConversationDebugInfo::Executing);
                
                // Oh, listen to him - all high and mighty, are we? Well, I ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_SLDINFO_08_03"));
                DC(int64(0x8f1f05b8ae66c04c), EConversationDebugInfo::Done);
                DC(int64(0x45f83621a0ee00f4), EConversationDebugInfo::Executing);
                // They ain't much use for nothin' but if you can show them ...
                Jarvis.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_130352"));
                DC(int64(0x45f83621a0ee00f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJarvisWohaufen : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c057);
            default Caption = LocText("DIA_JARVIS_WOHAUFEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJarvisErzhaufen);
            default Rules.HideIfKnows(UChoiceJarvisWohaufen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c058), EConversationDebugInfo::Executing);
                
                // Where are you keeping that pile?
                Hero.AI.Say(LocText("DIA_JARVIS_WOHAUFEN_15_00"));
                DC(int64(0x8f1f05b8ae66c058), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c059), EConversationDebugInfo::Executing);
                
                // Hmm, got you curious, eh? There's a hole in the middle ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_WOHAUFEN_08_01"));
                DC(int64(0x8f1f05b8ae66c059), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c05a), EConversationDebugInfo::Executing);
                // But I'm warning you, don't even think about nickin' ...
                Jarvis.AI.Say(LocText("DIA_JARVIS_WOHAUFEN_08_02"));
                DC(int64(0x8f1f05b8ae66c05a), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c05b), EConversationDebugInfo::Executing);
                
                // Don't worry. 
                Hero.AI.Say(LocText("DIA_JARVIS_WOHAUFEN_15_03"));
                DC(int64(0x8f1f05b8ae66c05b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld728JarvisAufnahmesoldier : UTopic_Hero__NC_SLD_JARVIS_728
        {
            default DebugId = int64(0x8f1f05b8ae66c062);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceSld728JarvisAufnahmesoldier);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae66b560e11acaf5), Hero != nullptr && Hero.IsCloseToCharacter(Jarvis, 1000.0f));
                    DB(int64(0xae66b560e11acaf6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0xae66b560e11acaf7), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                    DB(int64(0xae66b560e11acaf8), Hero != nullptr && Hero.IsCloseToCharacter(Jarvis, 1000.0f));
                    DB(int64(0xae66b560e11acaf9), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xae66b560e11acafa), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                if (Hero != nullptr && Hero.IsCloseToCharacter(Jarvis, 1000.0f) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue) && Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return true;
                
                if (Hero != nullptr && Hero.IsCloseToCharacter(Jarvis, 1000.0f) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f1f05b8ae66c066), EConversationDebugInfo::Executing);
                Hero.AI.GotoCharacter(Jarvis, 200.0f);
                DC(int64(0x8f1f05b8ae66c066), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c067), EConversationDebugInfo::Executing);
                // Hey, heard about that thing you did in the Old Mine - ...
                Jarvis.AI.Say(LocText("SLD_728_JARVIS_AUFNAHMESOLDIER_INFO_08_01"));
                DC(int64(0x8f1f05b8ae66c067), EConversationDebugInfo::Done);
                DC(int64(0x8f1f05b8ae66c068), EConversationDebugInfo::Executing);
                // We could use someone like you - you should go talk to ...
                Jarvis.AI.Say(LocText("SLD_728_JARVIS_AUFNAHMESOLDIER_INFO_08_02"));
                DC(int64(0x8f1f05b8ae66c068), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */