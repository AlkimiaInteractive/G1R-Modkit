#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_HERO : UConversationCharacterSettings
        {
            default ForCharacter = n"HERO";
            default VoiceTypeSubsets.Add(FVoiceTypeSubset(GameplayTag::VoiceType_G1R_Voice01_Hero));
        }
        
        
        class UTopic_Hero__HERO : UG1RDialogTopic
        {
            default ForCharacter = n"HERO";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHero() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetCROW() const property
            {
                return GetCharacter(n"CROW");
            }
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return GetCharacter(n"OG_GUR_BAALLUKOR_1211");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
        }
        
        
        class UChoiceHero148621 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x4c66a80b988c6c19);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4c66a80b988c6c18), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4c66a80b988c6c18), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHero148638 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd77);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148638);
            default Rules.HideIfKnows(UTopic_Hero_BranCorpse);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_Ricelord_Corpse", 300.0f, int64(0xe80015e5fc45fd77));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd75), EConversationDebugInfo::Executing);
                // Ugh ... that smell.
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115418"));
                DC(int64(0xe80015e5fc45fd75), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148672 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd7f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148672);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                    DB(int64(0x488d42a076c31cd1), Hero != nullptr && Hero.HasDefeated(BaalLukor));
                    DB(int64(0x5c5254a4f15ebfd), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasDefeated(BaalLukor))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_DISCOVER.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd7d), EConversationDebugInfo::Executing);
                // So that just happened ... Kalom and Angar should hear ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115657"));
                DC(int64(0xe80015e5fc45fd7d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148689 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd83);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148689);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"FP_NYRAS_FOCUS", 500.0f, int64(0xe80015e5fc45fd83));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JVXAWSC_20240411_203247"), int64(0xe80015e5fc45fd83));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x488d42a076c31ce4), Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x488d42a076c31ceb), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(CROW, -100.0f));
                    DB(int64(0x23954b13af2f097b), Hero != nullptr && Hero.HasRecentlyDefeated(Nyras));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.CanSenseAnyAliveCharacterOfKind(CROW, -100.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Nyras))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd81), EConversationDebugInfo::Executing);
                // That bird again ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115834"));
                DC(int64(0xe80015e5fc45fd81), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148705 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd87);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148705);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JVXAWSC_20240411_203247"), int64(0xe80015e5fc45fd87));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x488d42a076c31ce4), Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x488d42a076c31cef), Hero != nullptr && !Hero.CanSenseAnyAliveCharacterOfKind(Nyras, -100.0f));
                    DB(int64(0x23954b13af2f097c), Hero != nullptr && Hero.HasRecentlyDefeated(Nyras));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && Hero.CanSenseAnyAliveCharacterOfKind(Nyras, -100.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Nyras))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd85), EConversationDebugInfo::Executing);
                // And there's that ... Let's get that stone and take it ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115840"));
                DC(int64(0xe80015e5fc45fd85), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148721 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd8b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148721);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_STORY_APPROACH_NYRAS_FOCUS", 500.0f, int64(0xe80015e5fc45fd8b));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_JVXAWSC_20240411_203247"), int64(0xe80015e5fc45fd8b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x488d42a076c31ce3), Hero != nullptr && !Hero.HasRecentlyDefeated(Nyras));
                    DB(int64(0x488d42a076c31ce4), Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasRecentlyDefeated(Nyras))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd89), EConversationDebugInfo::Executing);
                // There. That's the focus stone.
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115842"));
                DC(int64(0xe80015e5fc45fd89), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148740 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd8f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148740);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_Caine_Hut", 200.0f, int64(0xe80015e5fc45fd8f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x488d42a076c31dde), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd8e), EConversationDebugInfo::Executing);
                // Someone's been smoking ... Let's look around.
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120017_2801"));
                DC(int64(0xe80015e5fc45fd8e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148756 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd93);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148756);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9992203cb3d283), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0x188124b8621e6b80), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd91), EConversationDebugInfo::Executing);
                // Hmm ... what's this, some ritual place? Maybe the ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120019"));
                DC(int64(0xe80015e5fc45fd91), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148772 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd97);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148772);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x2afefc2a4e073596), Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Orc, 1));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Orc, 1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd95), EConversationDebugInfo::Executing);
                // Close one. Let's see what he has on him.
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120021"));
                DC(int64(0xe80015e5fc45fd95), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148788 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd9b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default bIsAmbientTopic = true;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHero148804);
            default Rules.HideIfKnows(UChoiceHero148788);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x488d42a076c31d87), Hero != nullptr && Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Amulet_Ulu_Talisman, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd99), EConversationDebugInfo::Executing);
                // What ... that thing feels magical. Hm. Guess I should ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120022"));
                DC(int64(0xe80015e5fc45fd99), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148804_0 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd9f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148804);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_Finding_Caine", 400.0f, int64(0xe80015e5fc45fd9f));
            default Rules.HideIfKnows(UChoiceHero148804_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd9d), EConversationDebugInfo::Executing);
                // That's got to be Caine.
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120025"));
                DC(int64(0xe80015e5fc45fd9d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148804 : UTopic_Hero__HERO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHero148804_0);
            default Rules.HideIfKnows(UChoiceHero148804);
            default DebugId = int64(0xe80015e5fc45fd9f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_CAINE, Document::UDocumentSegment_Glossary_SC_NOV_CAINE_Dead);
            }
        }
        
        
        class UChoiceHero148827 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fda3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148827);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x488d42a076c31d40), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x488d42a076c31d41), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f));
                    DB(int64(0x488d42a076c31d44), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_IXHZGRJ_20240322_000239")));
                    DB(int64(0x488d42a076c31d40), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x488d42a076c31d41), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f));
                    DB(int64(0x488d42a076c31d44), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_OPTVPFF_20240311_123649_2083")));
                    DB(int64(0x488d42a076c31d40), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x488d42a076c31d41), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f));
                    DB(int64(0x488d42a076c31d44), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_IXHZGRJ_20240322_001125")));
                    DB(int64(0x488d42a076c31d40), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x488d42a076c31d41), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f));
                    DB(int64(0x488d42a076c31d44), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_110829_41")));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_IXHZGRJ_20240322_000239")))
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_OPTVPFF_20240311_123649_2083")))
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_IXHZGRJ_20240322_001125")))
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning() && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_Story_Finding_Caine_Huts", 700.0f) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_MWAGUXL_20240319_110829_41")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fda1), EConversationDebugInfo::Executing);
                // Damned huts all look the same ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120314"));
                DC(int64(0xe80015e5fc45fda1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero148844 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fda7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero148844);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER != nullptr && Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER != nullptr && Quest::SwampCamp_SCCHAPTER3_RANKUPTEMPLAR_RANKUPTEMPLAR_OBJ_SCATTER.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fda5), EConversationDebugInfo::Executing);
                // May you find peace. 
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_120358"));
                DC(int64(0xe80015e5fc45fda5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero157978 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xee660343e7b519a9);
            default Caption = LocText("TEXT_WIP_PFZFBUC_20250214_133746");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero157978);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_TELEPORT_02", 500.0f, int64(0xee660343e7b519a9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xee660343e7b5a49a), G1R.TeleportToWaterMagesBlockedDone != 0);
                }
                
                return G1R.TeleportToWaterMagesBlockedDone != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xee660343e7b519a7), EConversationDebugInfo::Executing);
                // That's not the usual spot ... 
                Hero.AI.Say(LocText("TEXT_WIP_PFZFBUC_20250214_133746"));
                DC(int64(0xee660343e7b519a7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198515 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1565);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198515);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac3a6), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK.IsRunning());
                    DB(int64(0xe2c139ea929ac3f0), Hero != nullptr && Hero.IsSitting());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_ASK.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1563), EConversationDebugInfo::Executing);
                // I need to find Caine’s hut, but they all look the same. ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_162106"));
                DC(int64(0x111332844d2a1563), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198551 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a156d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198551);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac3ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.IsRunning());
                    DB(int64(0xe2c139ea929ac3f3), Hero != nullptr && Hero.IsSitting());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a156b), EConversationDebugInfo::Executing);
                // May the Hearing begin. For better or worse ... Well. ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_162324"));
                DC(int64(0x111332844d2a156b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198588 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1575);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198588);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac3a8), Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE.IsRunning());
                    DB(int64(0xe2c139ea929ac3f1), Hero != nullptr && Hero.IsSitting());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1573), EConversationDebugInfo::Executing);
                // Those goblins have a lair somewhere ... That's where the ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_163608"));
                DC(int64(0x111332844d2a1573), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198605 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1579);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198605);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_TINYNYE_20240424_144020"), int64(0x111332844d2a1579));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac3b1), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    DB(int64(0xe2c139ea929ac3b3), G1R.GatheredTemplars == 3);
                    DB(int64(0xe2c139ea929ac3f2), Hero != nullptr && Hero.IsSitting());
                }
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    return false;
                
                if (G1R.GatheredTemplars != 3)
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1577), EConversationDebugInfo::Executing);
                // There's no convincing Ian. Not by myself, at least ... ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_163716"));
                DC(int64(0x111332844d2a1577), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198623 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a157d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198623);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac407), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xe2c139ea929ac408), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xe2c139ea929ac468), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a157c), EConversationDebugInfo::Executing);
                // Better head back to the Camp and tell them what happened ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_163857_2801"));
                DC(int64(0x111332844d2a157c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198641 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1581);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198641);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PKRDULC_20240503_135537"), int64(0x111332844d2a1581));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac46a), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xe2c139ea929ac483), Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_OBJ_HELP.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a157f), EConversationDebugInfo::Executing);
                // The boys are meeting by the lighthouse ... Probably ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_163958"));
                DC(int64(0x111332844d2a157f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198665 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1585);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198665);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac4cb), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xe2c139ea929ac4cc), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted());
                    DB(int64(0xe2c139ea929ac4cd), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.HasBeenStarted())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES_FIREMAGES_OBJ_ESCAPE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1583), EConversationDebugInfo::Executing);
                // Gotta talk to the Water Mages.
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_164103"));
                DC(int64(0x111332844d2a1583), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198682 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1589);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198682);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_XARDAS_DISTURB_14_01"), int64(0x111332844d2a1589));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe2c139ea929ac4d5), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xe2c139ea929ac4d6), Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER4_FINDXARDAS != nullptr && !Quest::NewCamp_NCCHAPTER4_FINDXARDAS.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1587), EConversationDebugInfo::Executing);
                // He lives alone in some remote tower ... Can't be that ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_164403"));
                DC(int64(0x111332844d2a1587), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198699 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a158d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198699);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a2f), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning());
                    DB(int64(0xca02e9dbc498a30), Hero != nullptr && Hero.IsSitting());
                }
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a158b), EConversationDebugInfo::Executing);
                // I gotta get into that temple somehow - either with the ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_164518"));
                DC(int64(0x111332844d2a158b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198733 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1595);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198733);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a56), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xca02e9dbc498a57), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a1593), EConversationDebugInfo::Executing);
                // The power of the gods right here in my hands ... or part ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_165051"));
                DC(int64(0x111332844d2a1593), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198775 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a159d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198775);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a59), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xca02e9dbc498a5a), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a159b), EConversationDebugInfo::Executing);
                // Tarrok's in the Free Mine ... If he's still alive ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_170121"));
                DC(int64(0x111332844d2a159b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero198896 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a15a1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero198896);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_OTOWN_TEMPLE_ENTRANCE2", 500.0f, int64(0x111332844d2a15a1));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a7f), Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0));
                    DB(int64(0x579119dc88635093), Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0))
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a159f), EConversationDebugInfo::Executing);
                // I ... kind of feel like I missed something ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_170541"));
                DC(int64(0x111332844d2a159f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero199166 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a15a5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero199166);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_ST_INNER_ENTRANCE", 500.0f, int64(0x111332844d2a15a5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a82), Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a15a4), EConversationDebugInfo::Executing);
                // That's the right way ... but not the right time ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_170843_2483"));
                DC(int64(0x111332844d2a15a4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226591 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37e9);
            default Caption = LocText("TEXT_WIP_MCQMNHI_20260416_174103");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226591);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf3817), G1R != nullptr && G1R.IsInChapter(1));
                    DB(int64(0x2a6b316a3caf3818), Hero != nullptr && Hero.IsSitting());
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf37e7), EConversationDebugInfo::Executing);
                // That letter's gotta get to the mages … one way or ...
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_174103"));
                DC(int64(0x2a6b316a3caf37e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226637 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37ed);
            default Caption = LocText("TEXT_WIP_NCQMNHI_20260417_091315");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226637);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf3859), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf385a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xce2b7c6b95aae4c5), EConversationDebugInfo::Executing);
                // If I wanna join the Old Camp, I'll have to win Diego ...
                Hero.AI.Say(LocText("TEXT_WIP_NCQMNHI_20260417_091315"));
                DC(int64(0xce2b7c6b95aae4c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226682 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37f1);
            default Caption = LocText("TEXT_WIP_MCQMNHI_20260416_174246");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226682);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf3857), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf3858), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf3856), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf37ef), EConversationDebugInfo::Executing);
                // I'd better pick a camp. Wandering around on my own won't ...
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_174246"));
                DC(int64(0x2a6b316a3caf37ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226730 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37f5);
            default Caption = LocText("TEXT_WIP_MCQMNHI_20260416_174649");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226730);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf385d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf385e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && !Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf37f3), EConversationDebugInfo::Executing);
                // If I wanna join the Swamp Camp, I'll have to impress ...
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_174649"));
                DC(int64(0x2a6b316a3caf37f3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226746 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37f9);
            default Caption = LocText("TEXT_WIP_MCQMNHI_20260416_174718");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226746);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf385b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x2a6b316a3caf384b), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf384c), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf384d), Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning());
                    DB(int64(0x2a6b316a3caf385c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && !Quest::OldCamp_OCCHAPTER1_JOINOC.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning() && Quest::NewCamp_NCCHAPTER1_JOINNC != nullptr && Quest::NewCamp_NCCHAPTER1_JOINNC.IsRunning() && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf37f7), EConversationDebugInfo::Executing);
                // The bandits seem to know how things work around here. ...
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_174718"));
                DC(int64(0x2a6b316a3caf37f7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226762_0 : UTopic_Hero__HERO
        {
            default DebugId = int64(0x2a6b316a3caf37fd);
            default Caption = LocText("TEXT_WIP_MCQMNHI_20260416_174733");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226762);
            
            default Rules.HideIfKnows(UChoiceHero226762_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2a6b316a3caf381a), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf381b), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning());
                    DB(int64(0x2a6b316a3caf3849), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                    DB(int64(0x2a6b316a3caf381a), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0x2a6b316a3caf381b), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning());
                    DB(int64(0x2a6b316a3caf3848), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning());
                }
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.IsRunning() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                if (Hero != nullptr && Hero.IsSitting() && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.IsRunning() && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf37fb), EConversationDebugInfo::Executing);
                // Caine should be somewhere in the Swamp Camp.
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_174733"));
                DC(int64(0x2a6b316a3caf37fb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226762 : UTopic_Hero__HERO
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHero226762_0);
            default Rules.HideIfKnows(UChoiceHero226762);
            default DebugId = int64(0x2a6b316a3caf37fd);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2a6b316a3caf3815), EConversationDebugInfo::Executing);
                // Probably where Cor Kalom is ...
                Hero.AI.Say(LocText("TEXT_WIP_MCQMNHI_20260416_175452"));
                DC(int64(0x2a6b316a3caf3815), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero226924 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xce2b7c6b95aae4c8);
            default Caption = LocText("TEXT_WIP_NCQMNHI_20260417_093148");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero226924);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xce2b7c6b95aae4e9), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xce2b7c6b95aae4ea), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0xce2b7c6b95aae4eb), Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && !Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP != nullptr && Quest::NewCamp_NCCHAPTER2_GOTOPSICAMP.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xce2b7c6b95aae4c6), EConversationDebugInfo::Executing);
                // Lares wants a word about a task ...
                Hero.AI.Say(LocText("TEXT_WIP_NCQMNHI_20260417_093148"));
                DC(int64(0xce2b7c6b95aae4c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero227050 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xce2b7c6b95aae4e2);
            default Caption = LocText("TEXT_WIP_NCQMNHI_20260417_100959");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero227050);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xce2b7c6b95aae4e9), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xce2b7c6b95aae4ea), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xce2b7c6b95aae4eb), Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && !Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_GOTOPSI != nullptr && Quest::OldCamp_OCCHAPTER2_GOTOPSI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xce2b7c6b95aae4e0), EConversationDebugInfo::Executing);
                // I'm sure Raven's got some task for me ...
                Hero.AI.Say(LocText("TEXT_WIP_NCQMNHI_20260417_100959"));
                DC(int64(0xce2b7c6b95aae4e0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHero227176 : UTopic_Hero__HERO
        {
            default DebugId = int64(0xce2b7c6b95aae4e6);
            default Caption = LocText("TEXT_WIP_NCQMNHI_20260417_101129");
            default PriorityRank = 3;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceHero227176);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xce2b7c6b95aae4e9), Hero != nullptr && Hero.IsSitting());
                    DB(int64(0xce2b7c6b95aae4ea), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xce2b7c6b95aae4eb), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsSitting())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xce2b7c6b95aae4e4), EConversationDebugInfo::Executing);
                // Cor Kalom will probably tell me all about my duties as a ...
                Hero.AI.Say(LocText("TEXT_WIP_NCQMNHI_20260417_101129"));
                DC(int64(0xce2b7c6b95aae4e4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Hero_BranCorpse : UTopic_Hero__HERO
        {
            default DebugId = int64(0xe80015e5fc45fd7b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UTopic_Hero_BranCorpse);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Story_Corpse_Bran_Found", 350.0f, int64(0xe80015e5fc45fd7b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe80015e5fc45fdaa), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe80015e5fc45fd79), EConversationDebugInfo::Executing);
                // That could be Bran ... huh. Oughta search him just to be ...
                Hero.AI.Say(LocText("TEXT_WIP_ALMGWQG_20250203_115603"));
                DC(int64(0xe80015e5fc45fd79), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BodyFound);
            }
        }
        
        
        class UTopic_Hero_STHeroInfoUrizielXardas : UTopic_Hero__HERO
        {
            default DebugId = int64(0x111332844d2a1591);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UTopic_Hero_STHeroInfoUrizielXardas);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Hero_Info_UrizielXardas", 500.0f, int64(0x111332844d2a1591));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_XARDAS_LOADSWORD_14_03"), int64(0x111332844d2a1591));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca02e9dbc498a33), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Uriziel_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x111332844d2a158f), EConversationDebugInfo::Executing);
                // That sword ... Xardas is gonna want to take a look at it ...
                Hero.AI.Say(LocText("TEXT_WIP_QZHEMRL_20250620_164623"));
                DC(int64(0x111332844d2a158f), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */