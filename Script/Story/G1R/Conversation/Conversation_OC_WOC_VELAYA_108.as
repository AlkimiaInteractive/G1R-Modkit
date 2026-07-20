#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_WOC_VELAYA_108 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_WOC_VELAYA_108";
        }
        
        
        class UTopic_Hero__OC_WOC_VELAYA_108 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_WOC_VELAYA_108";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVelaya() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetArto() const property
            {
                return GetCharacter(n"OC_EBR_ARTO_102");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetRaven() const property
            {
                return GetCharacter(n"OC_EBR_RAVEN_105");
            }
            
            AGothicCharacterState GetScar() const property
            {
                return GetCharacter(n"OC_EBR_SCAR_101");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD08_223() const property
            {
                return GetCharacter(n"OC_GRD_GUARD08_223");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD42_294N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD42_294N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD43_295N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD43_295N");
            }
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetSyra() const property
            {
                return GetCharacter(n"OC_WOC_SYRA_109");
            }
        }
        
        
        class UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_WOC_VELAYA_108";
            default WithCharacter = n"OC_WOC_SERAPHIA_110";
            
            AGothicCharacterState GetVelaya() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetArto() const property
            {
                return GetCharacter(n"OC_EBR_ARTO_102");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
            
            AGothicCharacterState GetGomez() const property
            {
                return GetCharacter(n"OC_EBR_GOMEZ_100");
            }
            
            AGothicCharacterState GetRaven() const property
            {
                return GetCharacter(n"OC_EBR_RAVEN_105");
            }
            
            AGothicCharacterState GetScar() const property
            {
                return GetCharacter(n"OC_EBR_SCAR_101");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD04_218() const property
            {
                return GetCharacter(n"OC_GRD_GUARD04_218");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD08_223() const property
            {
                return GetCharacter(n"OC_GRD_GUARD08_223");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD25_245() const property
            {
                return GetCharacter(n"OC_GRD_GUARD25_245");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD42_294N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD42_294N");
            }
            
            AGothicCharacterState GetOC_GRD_GUARD43_295N() const property
            {
                return GetCharacter(n"OC_GRD_GUARD43_295N");
            }
            
            AGothicCharacterState GetSeraphia() const property
            {
                return GetCharacter(n"OC_WOC_SERAPHIA_110");
            }
            
            AGothicCharacterState GetSyra() const property
            {
                return GetCharacter(n"OC_WOC_SYRA_109");
            }
        }
        
        
        class UChoiceVelaya134729 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0x57b48daa1d064fae);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fad), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57b48daa1d064fad), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVelaya134745 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0x57b48daa1d064fb2);
            default Caption = LocText("TEXT_WIP_UKEKYCE_20250109_114920_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceVelaya134745);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea68b2), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57b48daa1d064fb0), EConversationDebugInfo::Executing);
                // I need to talk to you.
                Hero.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_114920_1924"));
                DC(int64(0x57b48daa1d064fb0), EConversationDebugInfo::Done);
                DC(int64(0x57b48daa1d064fb1), EConversationDebugInfo::Executing);
                
                // What do you want? If you're looking for trouble, I'll ...
                Velaya.AI.Say(LocText("TEXT_WIP_UKEKYCE_20250109_114920_2785"));
                DC(int64(0x57b48daa1d064fb1), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68b4), EConversationDebugInfo::Executing);
                
                // Shhh. Syra wants to leave. For the Swamp Camp. She wants ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113204"));
                DC(int64(0xb11e587503ea68b4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68b5), EConversationDebugInfo::Executing);
                
                // Leave? If she really means it ... It's about time.
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113221"));
                DC(int64(0xb11e587503ea68b5), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68b6), EConversationDebugInfo::Executing);
                
                // You're in, then?
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113233"));
                DC(int64(0xb11e587503ea68b6), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68b7), EConversationDebugInfo::Executing);
                
                // Absolutely. I know they'd kill us for that but I'm ...
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_113241"));
                DC(int64(0xb11e587503ea68b7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_DREAMEDLAND, Document::UDocumentSegment_CH3_DREAMEDLAND_Velaya);
                DC(int64(0x821db0237f618642), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_DREAMEDLAND_DREAMEDLAND_OBJ_TALKVELAYA.SucceedQuest();
                DC(int64(0x821db0237f618642), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68b8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb11e587503ea68b8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVelaya136965 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea68dc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceVelaya136965);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb11e587503ea68df), Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded());
                    DB(int64(0xb11e587503ea68e0), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                    DB(int64(0xb11e587503ea68e1), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::OldCamp_OCCHAPTER3_DREAMEDLAND != nullptr && !Quest::OldCamp_OCCHAPTER3_DREAMEDLAND.HasSucceeded())
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea68db), EConversationDebugInfo::Executing);
                // When are we leaving? What's Syra saying?
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_115142_3569"));
                DC(int64(0xb11e587503ea68db), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea68e2), EConversationDebugInfo::Executing);
                
                // She's waiting for the right moment.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_120027"));
                DC(int64(0xb11e587503ea68e2), EConversationDebugInfo::Done);
                DC(int64(0x303e62cc4980f62), EConversationDebugInfo::Executing);
                
                // That makes sense.
                Velaya.AI.Say(LocText("TEXT_WIP_THVTSEI_20250126_174212"));
                DC(int64(0x303e62cc4980f62), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139_0 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea69b1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            
            default Rules.HideIfKnows(UChoiceVelaya137139);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Velaya_Finale", 1000.0f, int64(0xb11e587503ea69b1));
            default Rules.HideIfKnows(UChoiceVelaya137139_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6e3ed4925c0b285f), Velaya != nullptr && Velaya.HasAssignedDailyRoutine(UDailyRoutine_OC_WOC_Velaya_108_Finale));
                    DB(int64(0x552b62514959c4cc), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.IsRunning());
                }
                
                if (Velaya != nullptr && !Velaya.HasAssignedDailyRoutine(UDailyRoutine_OC_WOC_Velaya_108_Finale))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b0), EConversationDebugInfo::Executing);
                // Traitor!
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155201_1340"), TargetCharacter = Seraphia.Character, Posture = GameplayTag::Posture_Standing_Accusation01);
                DC(int64(0xb11e587503ea69b0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139_1 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVelaya137139_0);
            default Rules.HideIfKnows(UChoiceVelaya137139_1);
            default DebugId = int64(0xb11e587503ea69b1);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b3), EConversationDebugInfo::Executing);
                // She's dead because of YOU! Because YOU went to Gomez and ...
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155227"), Posture = GameplayTag::Posture_Standing_Accusation02);
                DC(int64(0xb11e587503ea69b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139_2 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVelaya137139_1);
            default Rules.HideIfKnows(UChoiceVelaya137139_2);
            default DebugId = int64(0xb11e587503ea69b1);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b4), EConversationDebugInfo::Executing);
                
                // I'm not a traitor!
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155242"), Posture = GameplayTag::Posture_Standing_Accusation03);
                DC(int64(0xb11e587503ea69b4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139_3 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVelaya137139_2);
            default Rules.HideIfKnows(UChoiceVelaya137139_3);
            default DebugId = int64(0xb11e587503ea69b1);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b5), EConversationDebugInfo::Executing);
                // But I did tell him, yes - because it was a stupid plan ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155252"), Posture = GameplayTag::Posture_Standing_Accusation04);
                DC(int64(0xb11e587503ea69b5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139_4 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVelaya137139_3);
            default Rules.HideIfKnows(UChoiceVelaya137139_4);
            default DebugId = int64(0xb11e587503ea69b1);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b6), EConversationDebugInfo::Executing);
                // We were all going to get caught! At least the two of us ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155256"), Posture = GameplayTag::Posture_Standing_Accusation05);
                DC(int64(0xb11e587503ea69b6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137139 : UTopic_OC_WOC_SERAPHIA_110__OC_WOC_VELAYA_108
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVelaya137139_4);
            default Rules.HideIfKnows(UChoiceVelaya137139);
            default DebugId = int64(0xb11e587503ea69b1);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69b7), EConversationDebugInfo::Executing);
                
                // But Syra is dead - because of you. You might as well ...
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_155307"), Posture = GameplayTag::Posture_Standing_Accusation06);
                DC(int64(0xb11e587503ea69b7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVelaya137435 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea6a02);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_162828");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceVelaya137435);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OC_WOC_VELAYA_108", n"FP_SC_YEBERION_CHAMBER", 1500.0f, int64(0xb11e587503ea6a02));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea6a00), EConversationDebugInfo::Executing);
                
                // Velaya. You made it.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162828"));
                DC(int64(0xb11e587503ea6a00), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea6a01), EConversationDebugInfo::Executing);
                
                // Thanks to you. I owe you for that.
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162828_1351"));
                DC(int64(0xb11e587503ea6a01), EConversationDebugInfo::Done);
                DC(int64(0x303e62cc4980f64), EConversationDebugInfo::Executing);
                
                // Ah, don't mention it.
                Hero.AI.Say(LocText("TEXT_WIP_THVTSEI_20250126_175206"));
                DC(int64(0x303e62cc4980f64), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea6a06), EConversationDebugInfo::Executing);
                
                // Well, you do have my thanks. I think I'll stay here ... ...
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_163118"));
                DC(int64(0xb11e587503ea6a06), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Escape);
            }
        }
        
        
        class UChoiceVelaya145496 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0x5a726b557cb7982f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceVelaya145496);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0c9d4e4e04bf669), OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66a), OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66b), OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66d), Arto != nullptr && Arto.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66e), Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf66f), Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf670), Raven != nullptr && Raven.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf671), Scar != nullptr && Scar.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0c9d4e4e04bf683), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x6c528962981d5b0f), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted());
                    DB(int64(0x319978557233a258), G1R.WomenSaved != 0);
                }
                
                if (OC_GRD_GUARD04_218 != nullptr && OC_GRD_GUARD04_218.IsEveryoneOfThisKindDead() && OC_GRD_GUARD08_223 != nullptr && OC_GRD_GUARD08_223.IsEveryoneOfThisKindDead() && OC_GRD_GUARD25_245 != nullptr && OC_GRD_GUARD25_245.IsEveryoneOfThisKindDead() && Arto != nullptr && Arto.IsEveryoneOfThisKindDead() && Bartholo != nullptr && Bartholo.IsEveryoneOfThisKindDead() && Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead() && Raven != nullptr && Raven.IsEveryoneOfThisKindDead() && Scar != nullptr && Scar.IsEveryoneOfThisKindDead() && Hero != nullptr && Hero.IsInConversation() && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasBeenStarted())
                    return true;
                
                if (G1R.WomenSaved != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5a726b557cb7982e), EConversationDebugInfo::Executing);
                // You're a hero - thank you for all you did.
                Velaya.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_125559_41"));
                DC(int64(0x5a726b557cb7982e), EConversationDebugInfo::Done);
                DC(int64(0x5a726b557cb79831), EConversationDebugInfo::Executing);
                // Imagine we had actually tried to flee. What would've ...
                Velaya.AI.Say(LocText("TEXT_WIP_CIVTSEI_20250129_125720"));
                DC(int64(0x5a726b557cb79831), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Safe);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_GomezKo);
                DC(int64(0x319978557232f475), EConversationDebugInfo::Executing);
                Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_Saved);
                DC(int64(0x319978557232f475), EConversationDebugInfo::Done);
                DC(int64(0x319978557232f47d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Seraphia))) { Seraphia.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Seraphia_110_Saved); }
                DC(int64(0x319978557232f47d), EConversationDebugInfo::Done);
                DC(int64(0x319978557232f47f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Syra))) { Syra.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Syra_109_Saved); }
                DC(int64(0x319978557232f47f), EConversationDebugInfo::Done);
                DC(int64(0x319978557233a256), EConversationDebugInfo::Executing);
                G1R.WomenSaved = 1;
                DC(int64(0x319978557233a256), EConversationDebugInfo::Done);
                DB(int64(0xf0c9d4e4e04bf68b), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded())
                {
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.SucceedQuest();
                    DC(int64(0xf0c9d4e4e04bf676), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_velaya_145496_exit_1");
                    DC(int64(0xf0c9d4e4e04bf69f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf69f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_velaya_145496_exit_2");
                    DC(int64(0xf0c9d4e4e04bf69c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf0c9d4e4e04bf69c), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceVelaya216062 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0x4a38d6ceb86aa541);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceVelaya216062);
            
            default ExtraCharactersToInvite.Add(n"OC_WOC_SERAPHIA_110");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Velaya_Finale", 250.0f, int64(0x4a38d6ceb86aa541));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc7e5ffdc280bc345), Velaya != nullptr && Velaya.HasAssignedDailyRoutine(UDailyRoutine_OC_WOC_Velaya_108_Finale));
                    DB(int64(0x552b62514959c4cd), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.IsRunning());
                }
                
                if (Velaya != nullptr && !Velaya.HasAssignedDailyRoutine(UDailyRoutine_OC_WOC_Velaya_108_Finale))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && !Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4a38d6ceb86aa53d), EConversationDebugInfo::Executing);
                // Can you just calm down and tell me what happened?
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_160644"), ForceCameraPreset = n"PACK SHOT 2 VELAYA FINALE").RunDetached();
                DC(int64(0x4a38d6ceb86aa53d), EConversationDebugInfo::Done);
                DC(int64(0x4a38d6ceb86aa54a), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"WP_Velaya_Finale_NHConver");
                DC(int64(0x4a38d6ceb86aa54a), EConversationDebugInfo::Done);
                DC(int64(0x513e50389ae32d3), EConversationDebugInfo::Executing);
                Velaya.AI.WaitUntilNoLongerSpeaking();
                DC(int64(0x513e50389ae32d3), EConversationDebugInfo::Done);
                DC(int64(0xdc1919a0f4dc34ed), EConversationDebugInfo::Executing);
                Velaya.AI.TurnToCharacter(Hero);
                DC(int64(0xdc1919a0f4dc34ed), EConversationDebugInfo::Done);
                DC(int64(0x33339117b96ee7d4), EConversationDebugInfo::Executing);
                UWorldPointManager::Get().CallGlobalEvent(n"OnVelayaFinale");
                DC(int64(0x33339117b96ee7d4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69ce), EConversationDebugInfo::Executing);
                // What happened? Syra trusted us, and this backstabbing ...
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_160644_2316"), ForceCameraPreset = n"OTS MEDIUM VELAYA VELAYA FINALE", TargetCharacter = Seraphia.Character, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69ce), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69d3), EConversationDebugInfo::Executing);
                // She told him everything!
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161041"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69d3), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69d4), EConversationDebugInfo::Executing);
                
                // You don't get it, do you? I was trying to save us.
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161057"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY", TargetCharacter = Velaya.Character, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69d4), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69d5), EConversationDebugInfo::Executing);
                // If we run away, we'd all be dead now!
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161059"), ForceCameraPreset = n"INDIVIDUAL CLOSEUP SERAPHIA VELAYA FINALE", TargetCharacter = Hero.Character, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69d5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Velaya_137211,
                    UTopic_Velaya_137231,
                    UTopic_Velaya_137284
                );
                DC(int64(0x7be0d64321e562f8), EConversationDebugInfo::Executing);
                Velaya.AI.AlignAtInteractionSpot(n"FP_OC_SPEAK_GOMEZ_ROOM");
                DC(int64(0x7be0d64321e562f8), EConversationDebugInfo::Done);
                DC(int64(0x7be0d64321e562fc), EConversationDebugInfo::Executing);
                Seraphia.AI.AlignAtInteractionSpot(n"FP_OC_SPEAK_GOMEZ_ROOM2");
                DC(int64(0x7be0d64321e562fc), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69ec), EConversationDebugInfo::Executing);
                Velaya.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Murder);
                DC(int64(0xb11e587503ea69ec), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69ee), EConversationDebugInfo::Executing);
                Seraphia.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Murdered, 9);
                DC(int64(0xb11e587503ea69ee), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69f2), EConversationDebugInfo::Executing);
                Seraphia.Kill();
                DC(int64(0xb11e587503ea69f2), EConversationDebugInfo::Done);
                DC(int64(0x6c528962981d5b22), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND.SucceedQuest();
                DC(int64(0x6c528962981d5b22), EConversationDebugInfo::Done);
                DC(int64(0x1ed8fb9f755a1723), EConversationDebugInfo::Executing);
                Seraphia.NPCState.RemoveFromWorld();
                DC(int64(0x1ed8fb9f755a1723), EConversationDebugInfo::Done);
                DC(int64(0x1ed8fb9f755a175c), EConversationDebugInfo::Executing);
                G1R.ActivateStoryDataLayer("SeraphiaMurder");
                DC(int64(0x1ed8fb9f755a175c), EConversationDebugInfo::Done);
                DB(int64(0xb11e587503ea69f6), Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead());
                
                if (Gomez != nullptr && Gomez.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0xb11e587503ea69f8), EConversationDebugInfo::Executing);
                    // This is it. I have to get out of here.
                    Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162012_3334"), ForceCameraPreset = n"INDIVIDUAL CLOSEUP VELAYA END FINALE", bUnskippable = true);
                    DC(int64(0xb11e587503ea69f8), EConversationDebugInfo::Done);
                    DC(int64(0xb11e587503ea69fb), EConversationDebugInfo::Executing);
                    // It's either the Swamp Camp now, or nothing.
                    Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162055"), ForceCameraPreset = n"PACK SHOT 1 VELAYA FINALE", TargetCharacter = Hero.Character, bUnskippable = true);
                    DC(int64(0xb11e587503ea69fb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Discussion);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_NoGuards);
                    DC(int64(0xf9dd277662800cdf), EConversationDebugInfo::Executing);
                    Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_SwampCamp);
                    DC(int64(0xf9dd277662800cdf), EConversationDebugInfo::Done);
                    DC(int64(0xf9dd277662800daf), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.SucceedQuest();
                    DC(int64(0xf9dd277662800daf), EConversationDebugInfo::Done);
                    DC(int64(0xf9dd277662800ce4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf9dd277662800ce4), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xb11e587503ea69fa), EConversationDebugInfo::Executing);
                    // All right. Now, I need one more thing - just a small ...
                    Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162015_3511"), ForceCameraPreset = n"INDIVIDUAL CLOSEUP VELAYA END FINALE", bUnskippable = true);
                    DC(int64(0xb11e587503ea69fa), EConversationDebugInfo::Done);
                    DC(int64(0xb11e587503ea69fc), EConversationDebugInfo::Executing);
                    
                    // Which is?
                    Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162133"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Velaya.Character, bUnskippable = true);
                    DC(int64(0xb11e587503ea69fc), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Discussion);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_WOC_VELAYA, Document::UDocumentSegment_Glossary_OC_WOC_VELAYA_Traitor);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_Alarm);
                    DC(int64(0xa863a5c8f7ea893a), EConversationDebugInfo::Executing);
                    Velaya.AI.TurnToCharacter(Hero);
                    DC(int64(0xa863a5c8f7ea893a), EConversationDebugInfo::Done);
                    DC(int64(0xa863a5c8f7ea8944), EConversationDebugInfo::Executing);
                    // Guards! He killed her!
                    Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_162137"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character, bUnskippable = true);
                    DC(int64(0xa863a5c8f7ea8944), EConversationDebugInfo::Done);
                    DC(int64(0xb11e587503ea69ff), EConversationDebugInfo::Executing);
                    Velaya.ExchangeDailyRoutineToClass(UDailyRoutine_OC_WOC_Velaya_108_SwampCamp);
                    DC(int64(0xb11e587503ea69ff), EConversationDebugInfo::Done);
                    DC(int64(0xf9dd277662800db1), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.SucceedQuest();
                    DC(int64(0xf9dd277662800db1), EConversationDebugInfo::Done);
                    DC(int64(0x33339117b96ee7d0), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(OC_GRD_GUARD43_295N)) && ensure(IsValid(OC_GRD_GUARD43_295N.AI))) { OC_GRD_GUARD43_295N.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent); }
                    DC(int64(0x33339117b96ee7d0), EConversationDebugInfo::Done);
                    DC(int64(0x33339117b96ee7d2), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(OC_GRD_GUARD42_294N)) && ensure(IsValid(OC_GRD_GUARD42_294N.AI))) { OC_GRD_GUARD42_294N.AI.StartFightCustomWithWeapon(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Kill, GameplayTag::AIConflict_Duration_Permanent); }
                    DC(int64(0x33339117b96ee7d2), EConversationDebugInfo::Done);
                    DC(int64(0x6e3ed4925c0b285e), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6e3ed4925c0b285e), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Velaya_137211 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea69d7);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_161219_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Velaya_137211);
            
            default ExtraCharactersToInvite.Add(n"OC_WOC_SERAPHIA_110");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69d8), EConversationDebugInfo::Executing);
                // Velaya is right. You betrayed them, Seraphia.
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161219_153"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Seraphia.Character, bUnskippable = true);
                DC(int64(0xb11e587503ea69d8), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69df), EConversationDebugInfo::Executing);
                
                // I didn't want this - not like that. I just wanted to ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161254"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Hero.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69df), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69e0), EConversationDebugInfo::Executing);
                
                // You don't deserve it.
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161332"), ForceCameraPreset = n"PACK SHOT 3 VELAYA FINALE", TargetCharacter = Seraphia.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69e0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Velaya_137231 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea69db);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_161219_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Velaya_137231);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69dc), EConversationDebugInfo::Executing);
                
                // Seraphia was trying to protect herself. Maybe you should ...
                Hero.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161219_94"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Seraphia.Character, bUnskippable = true);
                DC(int64(0xb11e587503ea69dc), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69e1), EConversationDebugInfo::Executing);
                
                // Syra is dead - and you're defending HER?
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161515"), ForceCameraPreset = n"PACK SHOT 3 VELAYA FINALE", TargetCharacter = Seraphia.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69e1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Velaya_137284 : UTopic_Hero__OC_WOC_VELAYA_108
        {
            default DebugId = int64(0xb11e587503ea69e4);
            default Caption = LocText("TEXT_WIP_WKHQRQD_20250110_161550");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Velaya_137284);
            
            default ExtraCharactersToInvite.Add(n"OC_WOC_SERAPHIA_110");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb11e587503ea69e8), EConversationDebugInfo::Executing);
                // You betrayed Syra. Her blood is on your hands.
                Velaya.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161627"), ForceCameraPreset = n"OTS MEDIUM VELAYA VELAYA FINALE", TargetCharacter = Seraphia.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69e8), EConversationDebugInfo::Done);
                DC(int64(0xb11e587503ea69e9), EConversationDebugInfo::Executing);
                
                // I was only trying to protect myself. Can't you ...
                Seraphia.AI.Say(LocText("TEXT_WIP_WKHQRQD_20250110_161644"), ForceCameraPreset = n"OTS MEDIUM SERAPHIA VELAYA FINALE", TargetCharacter = Velaya.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0xb11e587503ea69e9), EConversationDebugInfo::Done);
                DC(int64(0x303e62cc4980f63), EConversationDebugInfo::Executing);
                
                // No.
                Velaya.AI.Say(LocText("TEXT_WIP_THVTSEI_20250126_174954"), ForceCameraPreset = n"PACK SHOT 3 VELAYA FINALE", TargetCharacter = Seraphia.Character, bUnskippable = true, Posture = GameplayTag::Posture_Standing_Dispute);
                DC(int64(0x303e62cc4980f63), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */