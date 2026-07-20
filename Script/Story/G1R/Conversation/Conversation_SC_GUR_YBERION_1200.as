#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_YBERION_1200 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_YBERION_1200";
        }
        
        
        class UTopic_Hero__SC_GUR_YBERION_1200 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_YBERION_1200";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetYBerion() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return GetCharacter(n"OG_GUR_BAALLUKOR_1211");
            }
            
            AGothicCharacterState GetCorKalom() const property
            {
                return GetCharacter(n"SC_GUR_CORKALOM_1201");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
            
            AGothicCharacterState GetTalas() const property
            {
                return GetCharacter(n"SC_NOV_TALAS_1300");
            }
            
            AGothicCharacterState GetChani() const property
            {
                return GetCharacter(n"SC_WSC_CHANI_1205");
            }
            
            AGothicCharacterState GetNatalia() const property
            {
                return GetCharacter(n"SC_WSC_NATALIA_1207");
            }
        }
        
        
        class UTopic_SC_GUR_CORKALOM_1201__SC_GUR_YBERION_1200 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_YBERION_1200";
            default WithCharacter = n"SC_GUR_CORKALOM_1201";
            
            AGothicCharacterState GetYBerion() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetBaalLukor() const property
            {
                return GetCharacter(n"OG_GUR_BAALLUKOR_1211");
            }
            
            AGothicCharacterState GetCorKalom() const property
            {
                return GetCharacter(n"SC_GUR_CORKALOM_1201");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
            
            AGothicCharacterState GetNyras() const property
            {
                return GetCharacter(n"SC_NOV_NYRAS_1303");
            }
            
            AGothicCharacterState GetTalas() const property
            {
                return GetCharacter(n"SC_NOV_TALAS_1300");
            }
            
            AGothicCharacterState GetChani() const property
            {
                return GetCharacter(n"SC_WSC_CHANI_1205");
            }
            
            AGothicCharacterState GetNatalia() const property
            {
                return GetCharacter(n"SC_WSC_NATALIA_1207");
            }
        }
        
        
        class UChoiceGur1200YberionEarn : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c06f);
            default Caption = LocText("GUR_1200_YBERION_EARN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGur1200YberionEarn);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x324d2e51cd61c070), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded());
                    DB(int64(0x324d2e51cd61c071), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0x324d2e51cd61c072), G1R != nullptr && G1R.IsInChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c073), EConversationDebugInfo::Executing);
                // You mentioned a reward. 
                Hero.AI.Say(LocText("GUR_1200_YBERION_EARN_INFO_15_01"));
                DC(int64(0x324d2e51cd61c073), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c074), EConversationDebugInfo::Executing);
                
                // You're right, I did. Even if what you did for us cannot ...
                YBerion.AI.Say(LocText("GUR_1200_YBERION_EARN_INFO_12_02"));
                DC(int64(0x324d2e51cd61c074), EConversationDebugInfo::Done);
                DC(int64(0xaedf7f2d953a79eb), EConversationDebugInfo::Executing);
                
                // Some ore won't hurt ... 
                Hero.AI.Say(LocText("TEXT_WIP_FVWRRSJ_20240330_010450"));
                DC(int64(0xaedf7f2d953a79eb), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c075), EConversationDebugInfo::Executing);
                
                // Perhaps not. Here, take this - it's a talisman that will ...
                YBerion.AI.Say(LocText("GUR_1200_YBERION_EARN_INFO_12_03"));
                DC(int64(0x324d2e51cd61c075), EConversationDebugInfo::Done);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                YBerion.AddItemToInventory(UItAt_Amulet_Fire, 1);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c077), EConversationDebugInfo::Executing);
                YBerion.AI.GiveItemTo(Hero, UItAt_Amulet_Fire, 1);
                DC(int64(0x324d2e51cd61c077), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberion105709_0 : UTopic_SC_GUR_CORKALOM_1201__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x46d28e9d6b0ffd87);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceYberion105709);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceYberion105709_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x46d28e9d6b0ffd8b), Hero != nullptr && Hero.IsCloseToCharacter(YBerion, 500.0f));
                    DB(int64(0x46d28e9d6b0ffd8c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0x46d28e9d6b0ffd8d), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(YBerion, 500.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x46d28e9d6b0ffd86), EConversationDebugInfo::Executing);
                // I hear you, but you must learn to trust, Kalom. He will ...
                YBerion.AI.Say(LocText("TEXT_WIP_ZMPPQAN_20241021_140345_41"));
                DC(int64(0x46d28e9d6b0ffd86), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberion105709 : UTopic_SC_GUR_CORKALOM_1201__SC_GUR_YBERION_1200
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceYberion105709_0);
            default Rules.HideIfKnows(UChoiceYberion105709);
            default DebugId = int64(0x46d28e9d6b0ffd87);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x46d28e9d6b0ffd89), EConversationDebugInfo::Executing);
                
                // If you say so.
                CorKalom.AI.Say(LocText("TEXT_WIP_ZMPPQAN_20241021_140412"));
                DC(int64(0x46d28e9d6b0ffd89), EConversationDebugInfo::Done);
                DC(int64(0x46d28e9d6b0ffd8e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x46d28e9d6b0ffd8e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberion109422 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x94c121f544b5d19c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceYberionBringfocusRunning);
            default Rules.HideIfKnows(UChoiceYberion109422);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x94c121f544b5d1a8), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x94c121f544b5d1a9), Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x94c121f544b5d1aa), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x94c121f544b5d19b), EConversationDebugInfo::Executing);
                // What is it? There'll be time for idle conversation ...
                YBerion.AI.Say(LocText("TEXT_WIP_RNLEVXM_20241001_141329_41"));
                DC(int64(0x94c121f544b5d19b), EConversationDebugInfo::Done);
                DC(int64(0x94c121f544b5d19f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x94c121f544b5d19f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberion109454 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x94c121f544b5d1a2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceYberion109422);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x94c121f544b5d1ac), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                    DB(int64(0x94c121f544b5d1ad), Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x94c121f544b5d1ae), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x94c121f544b5d1a1), EConversationDebugInfo::Executing);
                // The Sleeper guides us. 
                YBerion.AI.Say(LocText("TEXT_WIP_RNLEVXM_20241001_141524_2238"));
                DC(int64(0x94c121f544b5d1a1), EConversationDebugInfo::Done);
                DC(int64(0x94c121f544b5d1a5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x94c121f544b5d1a5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberion113927 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xb3c216ffb4972d77);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceYberion113927);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORKALOM_1201");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_Yberion_MCEggs", 200.0f, int64(0xb3c216ffb4972d77));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe254bbcb8b4c9848), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0x46d28e9d6b0ffd84), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972d74), EConversationDebugInfo::Executing);
                // You did it. Didn't you? You found the crawler's lair. 
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_165529_2332"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xb3c216ffb4972d74), EConversationDebugInfo::Done);
                DC(int64(0x456b0c7da18dfac8), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"WP_Yberion_MCEggs");
                DC(int64(0x456b0c7da18dfac8), EConversationDebugInfo::Done);
                DC(int64(0x7ed7fb252a2139b0), EConversationDebugInfo::Executing);
                YBerion.AI.TurnToCharacter(Hero);
                DC(int64(0x7ed7fb252a2139b0), EConversationDebugInfo::Done);
                DC(int64(0x7ed7fb252a2139b6), EConversationDebugInfo::Executing);
                CorKalom.AI.TurnToCharacter(Hero);
                DC(int64(0x7ed7fb252a2139b6), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_114193,
                    UYBerion_114055
                );
            }
        }
        
        
        class UYBerion_114193 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xb3c216ffb4972d8d);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_165752_2483");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_114193);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972d8e), EConversationDebugInfo::Executing);
                // What were you two talking about? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_165752_2483"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xb3c216ffb4972d8e), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972d93), EConversationDebugInfo::Executing);
                
                // Nothing that should concern you. All is happening as it ...
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_165801"), ForceCameraPreset = n"MCEGGS OTS");
                DC(int64(0xb3c216ffb4972d93), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf195), EConversationDebugInfo::Executing);
                // Now tell me: have you found the nest?
                YBerion.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_165002"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xebd1924233aaf195), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972d90), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb3c216ffb4972d90), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_114055 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xb3c216ffb4972d86);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_165652_1246");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_114055);
            
            default ExtraCharactersToInvite.Add(n"SC_GUR_CORKALOM_1201");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972d87), EConversationDebugInfo::Executing);
                // The lair, their queen, and a whole lot of crawler eggs. ...
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_165652_1246"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", bUnskippable = true);
                DC(int64(0xb3c216ffb4972d87), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d29b3), EConversationDebugInfo::Executing);
                
                // What's that? An egg?  
                CorKalom.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_145226"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Hero.Character, bUnskippable = true);
                DC(int64(0x65f4f79c338d29b3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_YBERION, Document::UDocumentSegment_Glossary_SC_GUR_YBERION_Invocation);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_GREAT_INVOCATION, Document::UDocumentSegment_CH2_GREAT_INVOCATION_Start);
                DC(int64(0x58ce4b6055b18785), EConversationDebugInfo::Executing);
                CorKalom.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_InspectEgg);
                DC(int64(0x58ce4b6055b18785), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d29b4), EConversationDebugInfo::Executing);
                // (studies the egg) Sleeper be praised ... yes. Yes, that ...
                CorKalom.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_145230"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Hero.Character, bUnskippable = true);
                DC(int64(0x65f4f79c338d29b4), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972d99), EConversationDebugInfo::Executing);
                
                // Perfect. 
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_170310"), TargetCharacter = CorKalom.Character, ForceCameraPreset = n"MCEGGS WIDE", bUnskippable = true);
                DC(int64(0xb3c216ffb4972d99), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972d9f), EConversationDebugInfo::Executing);
                // Again you have met my expectations. I no longer have any ...
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_170950"), TargetCharacter = Hero.Character, ForceCameraPreset = n"MCEGGS OTS");
                DC(int64(0xb3c216ffb4972d9f), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972dae), EConversationDebugInfo::Executing);
                // Kalom. If the ichor in the eggs is enough, how long do ...
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171105"), TargetCharacter = CorKalom.Character, ForceCameraPreset = n"MCEGGS WIDE");
                DC(int64(0xb3c216ffb4972dae), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d29af), EConversationDebugInfo::Executing);
                
                // Hmm. Probably tonight. 
                CorKalom.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_145028"), TargetCharacter = YBerion.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x65f4f79c338d29af), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972db1), EConversationDebugInfo::Executing);
                
                // Then this is when the Great Awakening will take place. 
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171153"), TargetCharacter = CorKalom.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xb3c216ffb4972db1), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972db2), EConversationDebugInfo::Executing);
                // You should also be there. 
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171201"), TargetCharacter = Hero.Character, ForceCameraPreset = n"MCEGGS OTS");
                DC(int64(0xb3c216ffb4972db2), EConversationDebugInfo::Done);
                DB(int64(0xb3c216ffb4972db4), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xb3c216ffb4972dba), EConversationDebugInfo::Executing);
                    // You may not be one of us, but after all you did for us, ...
                    YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171225_1723"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xb3c216ffb4972dba), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb3c216ffb4972dbe), EConversationDebugInfo::Executing);
                    // You did this Brotherhood a great service, novice. And ...
                    YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171228_651"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xb3c216ffb4972dbe), EConversationDebugInfo::Done);
                }
                DC(int64(0xb3c216ffb4972dc2), EConversationDebugInfo::Executing);
                // I will be expecting you. 
                YBerion.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_171631_1702"), TargetCharacter = Hero.Character, ForceCameraPreset = n"MCEGGS OTS");
                DC(int64(0xb3c216ffb4972dc2), EConversationDebugInfo::Done);
                DC(int64(0x46d28e9d6b0ffd90), EConversationDebugInfo::Executing);
                CorKalom.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorKalom_1201_PreparePotionsForOneHour);
                DC(int64(0x46d28e9d6b0ffd90), EConversationDebugInfo::Done);
                DC(int64(0x5afbc1c43a134be8), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_RETURN.SucceedQuest();
                DC(int64(0x5afbc1c43a134be8), EConversationDebugInfo::Done);
                DC(int64(0xf4a792f8583f3fac), EConversationDebugInfo::Executing);
                G1R.BeforeYberionInvocation();
                DC(int64(0xf4a792f8583f3fac), EConversationDebugInfo::Done);
                DC(int64(0x1dce4f30748f6d42), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION.StartQuest();
                DC(int64(0x1dce4f30748f6d42), EConversationDebugInfo::Done);
                DC(int64(0xba8443f1d174ef19), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_MAP.SucceedQuest();
                DC(int64(0xba8443f1d174ef19), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5d7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Natalia))) { Natalia.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Natalia_1207_Invocation); }
                DC(int64(0x258017cab699a5d7), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5d9), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Chani))) { Chani.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Chani_1205_Invocation); }
                DC(int64(0x258017cab699a5d9), EConversationDebugInfo::Done);
                DC(int64(0x1adaa959afbb8cf2), EConversationDebugInfo::Executing);
                Hero.RemoveAllItemsFromInventory(UItAt_Crawlerqueen);
                DC(int64(0x1adaa959afbb8cf2), EConversationDebugInfo::Done);
                DC(int64(0x46d28e9d6b0ffd93), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x46d28e9d6b0ffd93), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberion85161 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x59245830ef758fc5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceYberion85161);
            
            default ExtraCharactersToInvite.Add(n"OG_GUR_BAALLUKOR_1211");
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_RWAGUXL_20240314_153447"), int64(0x59245830ef758fc5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe3bda590fcab1dc6), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x59245830ef758fc4), EConversationDebugInfo::Executing);
                // You have arrived.
                YBerion.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_111555_41"));
                DC(int64(0x59245830ef758fc4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_YBERION, Document::UDocumentSegment_Glossary_SC_GUR_YBERION_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MEETYBERION, Document::UDocumentSegment_CH2_MEETYBERION_Completed);
                DC(int64(0xde08ee3482ca40d8), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET.SucceedQuest();
                DC(int64(0xde08ee3482ca40d8), EConversationDebugInfo::Done);
                DC(int64(0x8fff7990b6743acf), EConversationDebugInfo::Unimplemented);
                
                if (/* Skip:  */ false)
                {
                    DC(int64(0x8fff7990b6743acb), EConversationDebugInfo::Executing);
                    // Wait, I know you. I saw you, in that ... vision.
                    Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_010817_2785"));
                    DC(int64(0x8fff7990b6743acb), EConversationDebugInfo::Done);
                    DC(int64(0x1fd4b7d32313e065), EConversationDebugInfo::Executing);
                    
                    // You did, and so did I. The Sleeper crossed our paths, ...
                    YBerion.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_090715"));
                    DC(int64(0x1fd4b7d32313e065), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x8fff7990b6743ad1), EConversationDebugInfo::Executing);
                    
                    // Do I know you?
                    Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_010907_3436"));
                    DC(int64(0x8fff7990b6743ad1), EConversationDebugInfo::Done);
                    DC(int64(0x377bb24005675152), EConversationDebugInfo::Executing);
                    
                    // No. But I have seen you before ... in a vision that the ...
                    YBerion.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_203254"));
                    DC(int64(0x377bb24005675152), EConversationDebugInfo::Done);
                }
                DC(int64(0x94c121f544b5d199), EConversationDebugInfo::Executing);
                // (perplexed) This ... is him? 
                BaalLukor.AI.Say(LocText("TEXT_WIP_RNLEVXM_20241001_141038"));
                DC(int64(0x94c121f544b5d199), EConversationDebugInfo::Done);
                DC(int64(0x8fff7990b6743ad6), EConversationDebugInfo::Executing);
                
                // (Responding to Lukor) Yes, Lukor.
                YBerion.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_011130"));
                DC(int64(0x8fff7990b6743ad6), EConversationDebugInfo::Done);
                DC(int64(0x377bb24005675153), EConversationDebugInfo::Executing);
                // You're here to tell me about our missing brother, aren't ...
                YBerion.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_203642"));
                DC(int64(0x377bb24005675153), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd5fe), EConversationDebugInfo::Executing);
                
                // ... Yes.
                Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_195259"));
                DC(int64(0x76486bff00dbd5fe), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd5ff), EConversationDebugInfo::Executing);
                
                // How?
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_195310"));
                DC(int64(0x76486bff00dbd5ff), EConversationDebugInfo::Done);
                DC(int64(0x8fff7990b6743ad7), EConversationDebugInfo::Executing);
                
                // He had a vision that led him to some old tomb ... an ...
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_011130_3286"));
                DC(int64(0x8fff7990b6743ad7), EConversationDebugInfo::Done);
                DC(int64(0xa763b51929e0e9b5), EConversationDebugInfo::Executing);
                Hero.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ShowAmulet);
                DC(int64(0xa763b51929e0e9b5), EConversationDebugInfo::Done);
                DC(int64(0x377bb24005675155), EConversationDebugInfo::Executing);
                // Here, I found this on the orc. Cor Kalom thought you had ...
                Hero.AI.Say(LocText("TEXT_WIP_LTMTGUC_20240408_204849"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x377bb24005675155), EConversationDebugInfo::Done);
                DC(int64(0x59245830ef758fce), EConversationDebugInfo::Executing);
                
                // Praise the Sleeper. This is the key. 
                YBerion.AI.Say(LocText("TEXT_WIP_NWAGUXL_20240318_112021"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x59245830ef758fce), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd5d6), EConversationDebugInfo::Executing);
                // You must do something for us. Something important.
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_110821"), ForceCameraPreset = n"TWO SHOT COWBOY");
                DC(int64(0x76486bff00dbd5d6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberion86508 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe3bda590fcab1deb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceYberion86508);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe3bda590fcab1df5), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0xe3bda590fcab1df6), Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x11c32c4f8d97d0d9), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1dea), EConversationDebugInfo::Executing);
                // You found it. Didn't you?
                YBerion.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_133702_41"));
                DC(int64(0xe3bda590fcab1dea), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc05), EConversationDebugInfo::Executing);
                
                // Yes. Here it is. 
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_215413"));
                DC(int64(0x9c7ad88e45e2dc05), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_Completed);
                DC(int64(0x40993ccb42646e64), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemToLook(YBerion, UItMs_Focus_01, 1);
                DC(int64(0x40993ccb42646e64), EConversationDebugInfo::Done);
                DC(int64(0x1b60bfc8f3121a23), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItMs_Focus_01, 1, 0);
                DC(int64(0x1b60bfc8f3121a23), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc06), EConversationDebugInfo::Executing);
                // I knew it. By the Sleeper, I knew it. How did you do it?
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_215418"));
                DC(int64(0x9c7ad88e45e2dc06), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2dc07), EConversationDebugInfo::Executing);
                
                // The amulet destroyed the barrier somehow.
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_215652"));
                DC(int64(0x9c7ad88e45e2dc07), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ac92), EConversationDebugInfo::Executing);
                
                // As expected. Well done. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134353"));
                DC(int64(0x2d52bbd05b27ac92), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_88677,
                    UYBerion_88697
                );
            }
        }
        
        
        class UYBerion_88677 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x2d52bbd05b27ac97);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_134430_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_88677);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27ac98), EConversationDebugInfo::Executing);
                // "As expected?" Did you know what this amulet could do?
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134430_2083"));
                DC(int64(0x2d52bbd05b27ac98), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27aca6), EConversationDebugInfo::Executing);
                
                // I did not. Only that the Sleeper wanted us to find it - ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134457"));
                DC(int64(0x2d52bbd05b27aca6), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_89083,
                    UYBerion_89103
                );
            }
        }
        
        
        class UYBerion_88697 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x2d52bbd05b27ac9b);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_135223");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_88697);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27acd4), EConversationDebugInfo::Executing);
                // And now what? Are you gonna use that focus for the ...
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135223"));
                DC(int64(0x2d52bbd05b27acd4), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acd8), EConversationDebugInfo::Executing);
                
                // We will - but there are two obstacles we must take care ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135240_1609"));
                DC(int64(0x2d52bbd05b27acd8), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ace3), EConversationDebugInfo::Executing);
                // I want you to help us again. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135401"));
                DC(int64(0x2d52bbd05b27ace3), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1dee), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_RETURN.SucceedQuest();
                DC(int64(0xe3bda590fcab1dee), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_89083 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x2d52bbd05b27acaa);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_134616_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_89083);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27acab), EConversationDebugInfo::Executing);
                // You're reading too much into this. 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134616_2785"));
                DC(int64(0x2d52bbd05b27acab), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acb4), EConversationDebugInfo::Executing);
                // I was just looking for Caine. That I found the amulet ...
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134804"));
                DC(int64(0x2d52bbd05b27acb4), EConversationDebugInfo::Done);
                DB(int64(0x2d52bbd05b27acb9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x2d52bbd05b27acbc), EConversationDebugInfo::Executing);
                    // Your skepticism is refreshing. Especially for a novice.
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134908"));
                    DC(int64(0x2d52bbd05b27acbc), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x2d52bbd05b27acce), EConversationDebugInfo::Executing);
                    // Yes, that's what it must look like to you. 
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135106"));
                    DC(int64(0x2d52bbd05b27acce), EConversationDebugInfo::Done);
                }
                DC(int64(0x2d52bbd05b27acc8), EConversationDebugInfo::Executing);
                // But there is no coincidence. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135042"));
                DC(int64(0x2d52bbd05b27acc8), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acc9), EConversationDebugInfo::Executing);
                
                // Why did I even ask ... 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135042_2386"));
                DC(int64(0x2d52bbd05b27acc9), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acad), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2d52bbd05b27acad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_89103 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x2d52bbd05b27acae);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_134616_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_89103);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27acaf), EConversationDebugInfo::Executing);
                // And now what? Are you gonna use that focus for the ...
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_134616_3286"));
                DC(int64(0x2d52bbd05b27acaf), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acd8), EConversationDebugInfo::Executing);
                
                // We will - but there are two obstacles we must take care ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135240_1609"));
                DC(int64(0x2d52bbd05b27acd8), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ace3), EConversationDebugInfo::Executing);
                // I want you to help us again. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_135401"));
                DC(int64(0x2d52bbd05b27ace3), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1dee), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_RETURN.SucceedQuest();
                DC(int64(0xe3bda590fcab1dee), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberion86715 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x6813516c7d50204c);
            default Caption = LocText("TEXT_WIP_FVXAWSC_20240415_140740");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceYberion86715);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6813516c7d50204f), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2d52bbd05b27acfe), EConversationDebugInfo::Executing);
                // What other thing do you need my help with? 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_140740"));
                DC(int64(0x2d52bbd05b27acfe), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27acff), EConversationDebugInfo::Executing);
                
                // Simple. There's a tome in the Colony that we believe ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_141007"));
                DC(int64(0x2d52bbd05b27acff), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad00), EConversationDebugInfo::Executing);
                // The mages requested it from King Rhobar in the early ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_141228"));
                DC(int64(0x2d52bbd05b27ad00), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad01), EConversationDebugInfo::Executing);
                
                // You want that book for the ritual?
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_141250"));
                DC(int64(0x2d52bbd05b27ad01), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1df7), EConversationDebugInfo::Executing);
                
                // Yes. We recently sent a novice, Talas, to retrieve it ...
                YBerion.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_142654"));
                DC(int64(0xe3bda590fcab1df7), EConversationDebugInfo::Done);
                DB(int64(0x2d52bbd05b27ad08), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x2d52bbd05b27ad0c), EConversationDebugInfo::Executing);
                    // Here, take this - it will identify you as one of my ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_141808_443"));
                    DC(int64(0x2d52bbd05b27ad0c), EConversationDebugInfo::Done);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                    YBerion.AddItemToInventory(UItAt_Amulet_Brotherhood, 1);
                    DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                    DC(int64(0x456b0c7da18dfac8), EConversationDebugInfo::Executing);
                    YBerion.AI.GiveItemTo(Hero, UItAt_Amulet_Brotherhood, 1);
                    DC(int64(0x456b0c7da18dfac8), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UYBerion_266966,
                    UYBerion_86879,
                    UYBerion_86899,
                    UYBerion_87329,
                    UYBerion_87189
                );
            }
        }
        
        
        class UYBerion_266966 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x535be5b0b8948663);
            default Caption = LocText("TEXT_WIP_GTYFCYK_20240411_195647_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_266966);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_THORUS_KDWSIEGEL_09_01"), int64(0x535be5b0b8948663));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x535be5b0b894866a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x535be5b0b8948664), EConversationDebugInfo::Executing);
                // I'm a bandit. Thorus won't just let me stroll into the ...
                Hero.AI.Say(LocText("TEXT_WIP_GTYFCYK_20240411_195647_41"));
                DC(int64(0x535be5b0b8948664), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad13), EConversationDebugInfo::Executing);
                
                // That is true. I would give you my sigil, but they won't ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_142049"));
                DC(int64(0x2d52bbd05b27ad13), EConversationDebugInfo::Done);
                DC(int64(0x535be5b0b8948667), EConversationDebugInfo::Executing);
                // However, the Water Mages are known to send messengers ...
                YBerion.AI.Say(LocText("TEXT_WIP_GTYFCYK_20240411_195723"));
                DC(int64(0x535be5b0b8948667), EConversationDebugInfo::Done);
                DC(int64(0x535be5b0b8948666), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x535be5b0b8948666), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_86879 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe3bda590fcab1dfa);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_142802_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_86879);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1dfb), EConversationDebugInfo::Executing);
                // Which of the mages should I talk to? 
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_142802_1924"));
                DC(int64(0xe3bda590fcab1dfb), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e02), EConversationDebugInfo::Executing);
                
                // Do as you will. 
                YBerion.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_142838"));
                DC(int64(0xe3bda590fcab1e02), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1dfd), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe3bda590fcab1dfd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_86899 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe3bda590fcab1dfe);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_142802_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_86899);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1dff), EConversationDebugInfo::Executing);
                // Any idea why your guy is taking so long? 
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_142802_3436"));
                DC(int64(0xe3bda590fcab1dff), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e03), EConversationDebugInfo::Executing);
                
                // No. He's a faithful servant of the Sleeper. As I said, ...
                YBerion.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_143026"));
                DC(int64(0xe3bda590fcab1e03), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e01), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe3bda590fcab1e01), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_87329 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe3bda590fcab1e36);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_144412_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_87329);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe3bda590fcab1e77), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xe3bda590fcab1e78), Hero != nullptr && Hero.HasSaid(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_05_04")));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (Hero != nullptr && !Hero.HasSaid(LocText("DIA_FINGERS_BECOMESHADOW_TEACHME_05_04")))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e37), EConversationDebugInfo::Executing);
                // I'm guessing it's also the "Sleeper's will" that I do ...
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_144412_686"));
                DC(int64(0xe3bda590fcab1e37), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad14), EConversationDebugInfo::Executing);
                
                // In some ways, it is, in others, it isn't. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_143045"));
                DC(int64(0x2d52bbd05b27ad14), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad32), EConversationDebugInfo::Executing);
                
                // I was hoping for a straight answer. 
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_144331"));
                DC(int64(0x2d52bbd05b27ad32), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad33), EConversationDebugInfo::Executing);
                
                // Believe me, I know this must be strange for you - but I ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_144405"));
                DC(int64(0x2d52bbd05b27ad33), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad3f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x2d52bbd05b27ad3f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_87189 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe3bda590fcab1e04);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_143142_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_87189);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e05), EConversationDebugInfo::Executing);
                // Alright. I'll have a chat with the fire mages. 
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_143142_3286"));
                DC(int64(0xe3bda590fcab1e05), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad42), EConversationDebugInfo::Executing);
                
                // And I'll be waiting. 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_144806"));
                DC(int64(0x2d52bbd05b27ad42), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_Start);
                DC(int64(0xe3bda590fcab1e30), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK.StartQuest();
                DC(int64(0xe3bda590fcab1e30), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869daca), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OldMineTunnel); }
                DC(int64(0x8a9901902869daca), EConversationDebugInfo::Done);
                DC(int64(0xb3ffc89d555e15fe), EConversationDebugInfo::Executing);
                G1R.AlmanacQuest();
                DC(int64(0xb3ffc89d555e15fe), EConversationDebugInfo::Done);
                DC(int64(0x404f884e5367df02), EConversationDebugInfo::Executing);
                G1R.InExtremoBegin();
                DC(int64(0x404f884e5367df02), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e35), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3bda590fcab1e35), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberion86738 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x6813516c7d502052);
            default Caption = LocText("TEXT_WIP_KYPYEZL_20240326_114300");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceYberion86738);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6813516c7d502055), Hero != nullptr && Hero.HasItem(UItWr_Book_Focus, 1, 0));
                    DB(int64(0x6813516c7d502056), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Book_Focus, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6813516c7d502050), EConversationDebugInfo::Executing);
                // I bring you the book.
                Hero.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_114300"));
                DC(int64(0x6813516c7d502050), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_Completed);
                DB(int64(0xa3e119ebe950a5ca), Hero != nullptr && Hero.HasListenedTo(LocText("NOV_1300_TALAS_UR_INFO_02_02")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("NOV_1300_TALAS_UR_INFO_02_02")))
                {
                    DC(int64(0xa3e119ebe950a5cc), EConversationDebugInfo::Executing);
                    // So you do. What of Talas? 
                    YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_114300_41"));
                    DC(int64(0xa3e119ebe950a5cc), EConversationDebugInfo::Done);
                    DB(int64(0xe6a87e4844750379), Talas != nullptr && !Talas.IsEveryoneOfThisKindDead());
                    
                    if (Talas != nullptr && !Talas.IsEveryoneOfThisKindDead())
                    {
                        DC(int64(0xe6a87e484475037b), EConversationDebugInfo::Executing);
                        // I heard he has returned. 
                        YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184916_1924"));
                        DC(int64(0xe6a87e484475037b), EConversationDebugInfo::Done);
                    }
                    Subdialog(
                        UYBerion_100752,
                        UYBerion_100772
                    );
                }
                DC(int64(0x6813516c7d502065), EConversationDebugInfo::Executing);
                Hero.RemoveItemFromInventory(UItWr_Book_Focus, 1, 0);
                DC(int64(0x6813516c7d502065), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d502090), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_RETURN.SucceedQuest();
                DC(int64(0x6813516c7d502090), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d5022a2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Talas))) { Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Backincamp); }
                DC(int64(0x6813516c7d5022a2), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d5020fa), EConversationDebugInfo::Executing);
                // Your efforts shall be rewarded. Here - choose. 
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124139_2785"));
                DC(int64(0x6813516c7d5020fa), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_87147,
                    UYBerion_87167,
                    UYBerion_87190
                );
                DB(int64(0x2d52bbd05b27ad53), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0x2d52bbd05b27ad64), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x2d52bbd05b27ad61), EConversationDebugInfo::Executing);
                    // You have done our Brotherhood a tremendous service, ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150109_3750"));
                    DC(int64(0x2d52bbd05b27ad61), EConversationDebugInfo::Done);
                    DC(int64(0xe6a87e4844750397), EConversationDebugInfo::Executing);
                    // With that said ... 
                    YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_190157"));
                    DC(int64(0xe6a87e4844750397), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0x2d52bbd05b27ad66), EConversationDebugInfo::Executing);
                    // You've done our Brothehood a tremendous, service, ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150222_731"));
                    DC(int64(0x2d52bbd05b27ad66), EConversationDebugInfo::Done);
                    DC(int64(0x2d52bbd05b27ad6f), EConversationDebugInfo::Executing);
                    // And while I'm not fool enough to believe you did this ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150346"));
                    DC(int64(0x2d52bbd05b27ad6f), EConversationDebugInfo::Done);
                    DC(int64(0xe6a87e4844750398), EConversationDebugInfo::Executing);
                    // With that said ... 
                    YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_190157"));
                    DC(int64(0xe6a87e4844750398), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x2d52bbd05b27ad71), EConversationDebugInfo::Executing);
                    // I know you aren't a man of faith, bandit, but you have ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150422_3719"));
                    DC(int64(0x2d52bbd05b27ad71), EConversationDebugInfo::Done);
                    DC(int64(0x2d52bbd05b27ad74), EConversationDebugInfo::Executing);
                    // And while I'm not fool enough to believe you did this ...
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150346"));
                    DC(int64(0x2d52bbd05b27ad74), EConversationDebugInfo::Done);
                    DC(int64(0xe6a87e4844750399), EConversationDebugInfo::Executing);
                    // With that said ... 
                    YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_190157"));
                    DC(int64(0xe6a87e4844750399), EConversationDebugInfo::Done);
                }
                DC(int64(0x2d52bbd05b27ad69), EConversationDebugInfo::Executing);
                // Let me guess: you're going to ask me for another favor?
                Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150304"));
                DC(int64(0x2d52bbd05b27ad69), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad6a), EConversationDebugInfo::Executing);
                
                // (faint snort) Indeed, I am. A picture is forming in the ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150304_1340"));
                DC(int64(0x2d52bbd05b27ad6a), EConversationDebugInfo::Done);
                DC(int64(0x2d52bbd05b27ad79), EConversationDebugInfo::Executing);
                // And while many of my own may not like what it shows, I ...
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_150545"));
                DC(int64(0x2d52bbd05b27ad79), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d5020bb), EConversationDebugInfo::Executing);
                // Cor Kalom has spent the past moons preparing the ...
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_121928_2238"));
                DC(int64(0x6813516c7d5020bb), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d5020dd), EConversationDebugInfo::Executing);
                // Go and tell him you are to help him with the issue at ...
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_123636"));
                DC(int64(0x6813516c7d5020dd), EConversationDebugInfo::Done);
                DC(int64(0xaedf7f2d953a79ef), EConversationDebugInfo::Executing);
                
                // ... Alright. 
                Hero.AI.Say(LocText("TEXT_WIP_FVWRRSJ_20240330_012241"));
                DC(int64(0xaedf7f2d953a79ef), EConversationDebugInfo::Done);
                DC(int64(0x4470dcbb2e2caffb), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_KALOM.StartQuest();
                DC(int64(0x4470dcbb2e2caffb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_100752 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xbd3986b5b236e166);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_142832_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_100752);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e167), EConversationDebugInfo::Executing);
                // He's useless. He didn't even make it into the castle. 
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142832_292"));
                DC(int64(0xbd3986b5b236e167), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e178), EConversationDebugInfo::Executing);
                
                // ... I see. Still, well done. 
                YBerion.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142852"));
                DC(int64(0xbd3986b5b236e178), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_100772 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xbd3986b5b236e16a);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_142832_1037");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_100772);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e16b), EConversationDebugInfo::Executing);
                
                // The warders were holding him up. He helped me get the ...
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142832_1037"));
                DC(int64(0xbd3986b5b236e16b), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e179), EConversationDebugInfo::Executing);
                
                // I see. Well done. 
                YBerion.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142938"));
                DC(int64(0xbd3986b5b236e179), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_87147 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x6813516c7d502125);
            default Caption = LocText("TEXT_WIP_KYPYEZL_20240326_124304_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_87147);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6813516c7d502126), EConversationDebugInfo::Executing);
                
                // Those scrolls will do nicely. 
                Hero.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124304_3286"));
                DC(int64(0x6813516c7d502126), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d50214b), EConversationDebugInfo::Executing);
                
                // A sound choice. Use them wisely.
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124406"));
                DC(int64(0x6813516c7d50214b), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d50216f), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItAr_Scroll_Sleep, 3);
                DC(int64(0x6813516c7d50216f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_87167 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x6813516c7d502129);
            default Caption = LocText("TEXT_WIP_KYPYEZL_20240326_124304_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_87167);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6813516c7d50212a), EConversationDebugInfo::Executing);
                // I'll take the ore. 
                Hero.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124304_2386"));
                DC(int64(0x6813516c7d50212a), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d50214c), EConversationDebugInfo::Executing);
                
                // Naturally. 
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124408"));
                DC(int64(0x6813516c7d50214c), EConversationDebugInfo::Done);
                DC(int64(0xe1d4c5f5f3f87418), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItMi_Orenugget, 150);
                DC(int64(0xe1d4c5f5f3f87418), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_87190 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x6813516c7d50213a);
            default Caption = LocText("TEXT_WIP_KYPYEZL_20240326_124341_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_87190);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6813516c7d50213b), EConversationDebugInfo::Executing);
                // These potions look good. 
                Hero.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124341_3984"));
                DC(int64(0x6813516c7d50213b), EConversationDebugInfo::Done);
                DC(int64(0x6813516c7d50214d), EConversationDebugInfo::Executing);
                
                // Very well. May they nourish your spirit. 
                YBerion.AI.Say(LocText("TEXT_WIP_KYPYEZL_20240326_124409"));
                DC(int64(0x6813516c7d50214d), EConversationDebugInfo::Done);
                DC(int64(0xe1d4c5f5f3f8741a), EConversationDebugInfo::Executing);
                Hero.AddItemToInventory(UItFo_Potion_Mana_02, 5);
                DC(int64(0xe1d4c5f5f3f8741a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberionBringfocus : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c036);
            default Caption = LocText("SIT_2_PSI_YBERION_BRINGFOCUS_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceYberionBringfocus);
            
            default ExtraCharactersToInvite.Add(n"OG_GUR_BAALLUKOR_1211");
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KVXAWSC_20240412_110821"), int64(0x324d2e51cd61c036));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x324d2e51cd61c038), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted());
                    DB(int64(0x324d2e51cd61c039), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasBeenStarted())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c03a), EConversationDebugInfo::Executing);
                // What do you need from me?
                Hero.AI.Say(LocText("SIT_2_PSI_YBERION_BRINGFOCUS_INFO_15_01"));
                DC(int64(0x324d2e51cd61c03a), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c03b), EConversationDebugInfo::Executing);
                
                // Do you know what a focus stone is?
                YBerion.AI.Say(LocText("SIT_2_PSI_YBERION_BRINGFOCUS_INFO_12_02"));
                DC(int64(0x324d2e51cd61c03b), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_89505,
                    UYBerion_89525
                );
                DC(int64(0x9c7ad88e45e2db40), EConversationDebugInfo::Executing);
                // They rose from the earth when the mages cast their ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_181400"));
                DC(int64(0x9c7ad88e45e2db40), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db42), EConversationDebugInfo::Executing);
                // Since then, the focus stones have been on the surface, ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_181430"));
                DC(int64(0x9c7ad88e45e2db42), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db48), EConversationDebugInfo::Executing);
                // We need such a focus stone for our ritual - the Great ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182022"));
                DC(int64(0x9c7ad88e45e2db48), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db49), EConversationDebugInfo::Executing);
                // YOU will change that.
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182106"));
                DC(int64(0x9c7ad88e45e2db49), EConversationDebugInfo::Done);
                DC(int64(0x94c121f544b5d1af), EConversationDebugInfo::Executing);
                
                // Master, what are you ...?
                BaalLukor.AI.Say(LocText("TEXT_WIP_RNLEVXM_20241001_161827"));
                DC(int64(0x94c121f544b5d1af), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db4c), EConversationDebugInfo::Executing);
                
                // It's the Sleeper's will.
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182254"));
                DC(int64(0x9c7ad88e45e2db4c), EConversationDebugInfo::Done);
                Subdialog(
                    UYBerion_91251,
                    UYBerion_93702,
                    UYBerion_91446,
                    UYBerion_91271
                );
            }
        }
        
        
        class UYBerion_89505 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x9c7ad88e45e2db35);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_181053_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_89505);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db36), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_181053_2083"));
                DC(int64(0x9c7ad88e45e2db36), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_89525 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x9c7ad88e45e2db39);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_181053_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_89525);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db3a), EConversationDebugInfo::Executing);
                // Aren't they what messed up the barrier?
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_181053_1924"));
                DC(int64(0x9c7ad88e45e2db3a), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db3e), EConversationDebugInfo::Executing);
                
                // Indeed.
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_181211"));
                DC(int64(0x9c7ad88e45e2db3e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_91251 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x9c7ad88e45e2db4e);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_182313_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_91251);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db4f), EConversationDebugInfo::Executing);
                
                // You sound quite sure about this. 
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182313_3286"));
                DC(int64(0x9c7ad88e45e2db4f), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd606), EConversationDebugInfo::Executing);
                
                // Yes - and that must confuse you.
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_200556"));
                DC(int64(0x76486bff00dbd606), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd619), EConversationDebugInfo::Executing);
                // Suffice it so say that, from a distance, even the most ...
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_201027"));
                DC(int64(0x76486bff00dbd619), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd616), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x76486bff00dbd616), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_93702 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x76486bff00dbd633);
            default Caption = LocText("TEXT_WIP_KVXAWSC_20240412_201844_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_93702);
            
            default ExtraCharactersToInvite.Add(n"OG_GUR_BAALLUKOR_1211");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x76486bff00dbd63a), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x76486bff00dbd634), EConversationDebugInfo::Executing);
                // If I'm going to help you, you'll have to make it worth ...
                Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_201844_1924"));
                DC(int64(0x76486bff00dbd634), EConversationDebugInfo::Done);
                DC(int64(0x94c121f544b5d1b0), EConversationDebugInfo::Executing);
                
                // You insolent ...
                BaalLukor.AI.Say(LocText("TEXT_WIP_RNLEVXM_20241001_161947"));
                DC(int64(0x94c121f544b5d1b0), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd640), EConversationDebugInfo::Executing);
                
                // Calm, Lukor. I knew he would ask.
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_202043"));
                DC(int64(0x76486bff00dbd640), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd65b), EConversationDebugInfo::Executing);
                // Serving the Sleeper is a great honor, but you don't ...
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_202559"));
                DC(int64(0x76486bff00dbd65b), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd636), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x76486bff00dbd636), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_91446 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x9c7ad88e45e2db56);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_182401_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_91446);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db57), EConversationDebugInfo::Executing);
                // How did these focus stones get into the earth to start ...
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182401_3984"));
                DC(int64(0x9c7ad88e45e2db57), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db66), EConversationDebugInfo::Executing);
                
                // That remains a mystery. They look neither orcish nor ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182752"));
                DC(int64(0x9c7ad88e45e2db66), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db59), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9c7ad88e45e2db59), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_91271 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x9c7ad88e45e2db52);
            default Caption = LocText("TEXT_WIP_IVXAWSC_20240410_182313_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_91271);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c7ad88e45e2db53), EConversationDebugInfo::Executing);
                // Let me guess: you think this amulet will help me get to ...
                Hero.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_182313_2386"));
                DC(int64(0x9c7ad88e45e2db53), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db6a), EConversationDebugInfo::Executing);
                
                // I want you to wear it, yes. As for everything else ... ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_183219"));
                DC(int64(0x9c7ad88e45e2db6a), EConversationDebugInfo::Done);
                DC(int64(0xebd1924233aaf194), EConversationDebugInfo::Executing);
                // There is a focus stone site not far from the camp. One ...
                YBerion.AI.Say(LocText("TEXT_WIP_RGTRMXB_20240923_163103"));
                DC(int64(0xebd1924233aaf194), EConversationDebugInfo::Done);
                DC(int64(0x9c7ad88e45e2db6c), EConversationDebugInfo::Executing);
                // He's usually near the camp gate. Talk to him, and he ...
                YBerion.AI.Say(LocText("TEXT_WIP_IVXAWSC_20240410_183335"));
                DC(int64(0x9c7ad88e45e2db6c), EConversationDebugInfo::Done);
                DC(int64(0x76486bff00dbd632), EConversationDebugInfo::Executing);
                // I will be waiting.
                YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_201835"));
                DC(int64(0x76486bff00dbd632), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_NYRAS, Document::UDocumentSegment_Glossary_SC_NOV_NYRAS_Entrance);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FOCUS, Document::UDocumentSegment_CH2_FOCUS_Start);
                DC(int64(0x324d2e51cd61c048), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS.StartQuest();
                DC(int64(0x324d2e51cd61c048), EConversationDebugInfo::Done);
                DC(int64(0xf2bcd76daccd71bc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Nyras))) { Nyras.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Nyras_1303_Wait); }
                DC(int64(0xf2bcd76daccd71bc), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e56), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Talas))) { Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_OldCampWait); }
                DC(int64(0xe3bda590fcab1e56), EConversationDebugInfo::Done);
                DC(int64(0x1f3d20e544aef55f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1f3d20e544aef55f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberionBringfocusRunning : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c056);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceYberionBringfocus);
            default Rules.HideIfKnows(UChoiceYberionBringfocusRunning);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x324d2e51cd61c057), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning());
                    DB(int64(0x324d2e51cd61c058), Hero != nullptr && !Hero.HasItem(UItMs_Focus_01, 1, 0));
                    DB(int64(0x1fd4b7d32313e06f), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && !Quest::SwampCamp_SCCHAPTER2_FOCUS.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c05a), EConversationDebugInfo::Executing);
                // You know what to do. Find Nyras, and find the focus. 
                YBerion.AI.Say(LocText("INFO_YBERION_BRINGFOCUS_RUNNING_12_02"));
                DC(int64(0x324d2e51cd61c05a), EConversationDebugInfo::Done);
                DC(int64(0x94c121f544b5d19e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x94c121f544b5d19e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberionExit : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c029);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c02a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x324d2e51cd61c02a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceYberionNyras : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c068);
            default Caption = LocText("TEXT_WIP_TXHZGRJ_20240329_161437_1428");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceYberionNyras);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x324d2e51cd61c069), Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c06a), EConversationDebugInfo::Executing);
                // Something else happened when we got the focus ...
                Hero.AI.Say(LocText("INFO_YBERION_NYRAS_15_01"));
                DC(int64(0x324d2e51cd61c06a), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c06d), EConversationDebugInfo::Executing);
                
                // Tell me.
                YBerion.AI.Say(LocText("INFO_YBERION_NYRAS_12_04"));
                DC(int64(0x324d2e51cd61c06d), EConversationDebugInfo::Done);
                DC(int64(0xaedf7f2d953a79e8), EConversationDebugInfo::Executing);
                
                // Nyras snapped. He tried to take the focus stone, and ...
                Hero.AI.Say(LocText("TEXT_WIP_FVWRRSJ_20240330_010232"));
                DC(int64(0xaedf7f2d953a79e8), EConversationDebugInfo::Done);
                DC(int64(0xa98fcc988ec18fe9), EConversationDebugInfo::Executing);
                
                // ... What happened? 
                YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_133706"));
                DC(int64(0xa98fcc988ec18fe9), EConversationDebugInfo::Done);
                DB(int64(0x76486bff00dbd5d8), Nyras != nullptr && !Nyras.IsEveryoneOfThisKindDead());
                
                if (Nyras != nullptr && !Nyras.IsEveryoneOfThisKindDead())
                {
                    DC(int64(0x76486bff00dbd5d9), EConversationDebugInfo::Executing);
                    // I knocked some sense back into him. He doesn't even ...
                    Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111638"));
                    DC(int64(0x76486bff00dbd5d9), EConversationDebugInfo::Done);
                    DC(int64(0x76486bff00dbd5da), EConversationDebugInfo::Executing);
                    
                    // I ... see. This is strange indeed. Maybe the stone's ...
                    YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111638_41"));
                    DC(int64(0x76486bff00dbd5da), EConversationDebugInfo::Done);
                    DC(int64(0xa98fcc988ec18fe8), EConversationDebugInfo::Executing);
                    // I will have a word with him. 
                    YBerion.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_133610"));
                    DC(int64(0xa98fcc988ec18fe8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x76486bff00dbd5db), EConversationDebugInfo::Executing);
                    
                    // He's dead. I had no choice. 
                    Hero.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111644"));
                    DC(int64(0x76486bff00dbd5db), EConversationDebugInfo::Done);
                    DC(int64(0x76486bff00dbd5dc), EConversationDebugInfo::Executing);
                    
                    // I understand. A great loss for our Brotherhood ... a ...
                    YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111644_2083"));
                    DC(int64(0x76486bff00dbd5dc), EConversationDebugInfo::Done);
                    DC(int64(0xa98fcc988ec18fea), EConversationDebugInfo::Executing);
                    
                    // What could have caused it? 
                    Hero.AI.Say(LocText("TEXT_WIP_FVXAWSC_20240415_133853"));
                    DC(int64(0xa98fcc988ec18fea), EConversationDebugInfo::Done);
                    DC(int64(0x76486bff00dbd5df), EConversationDebugInfo::Executing);
                    
                    // Probably the stone's force field. It has been known to ...
                    YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111802"));
                    DC(int64(0x76486bff00dbd5df), EConversationDebugInfo::Done);
                    DC(int64(0x76486bff00dbd5e0), EConversationDebugInfo::Executing);
                    // Either way, we will investigate this. You did what had ...
                    YBerion.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_111852"));
                    DC(int64(0x76486bff00dbd5e0), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UYBerion_110328,
                    UYBerion_110348
                );
            }
        }
        
        
        class UYBerion_110328 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe6a87e4844750366);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_184438_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_110328);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6a87e4844750367), EConversationDebugInfo::Executing);
                // Could the Sleeper be behind this?
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184438_41"));
                DC(int64(0xe6a87e4844750367), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e484475036f), EConversationDebugInfo::Executing);
                
                // Why? 
                YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184536"));
                DC(int64(0xe6a87e484475036f), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750371), EConversationDebugInfo::Executing);
                
                // I mean, you keep talking about him "whispering" into ...
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184541"));
                DC(int64(0xe6a87e4844750371), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750372), EConversationDebugInfo::Executing);
                
                // I see what you mean - but no. The Sleeper has no ...
                YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184616"));
                DC(int64(0xe6a87e4844750372), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750373), EConversationDebugInfo::Executing);
                // As I said, it must have been the force field. I've heard ...
                YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184709"));
                DC(int64(0xe6a87e4844750373), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e4844750369), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xe6a87e4844750369), EConversationDebugInfo::Done);
            }
        }
        
        
        class UYBerion_110348 : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0xe6a87e484475036a);
            default Caption = LocText("TEXT_WIP_FGXCIAC_20240909_184438_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UYBerion_110348);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6a87e484475036b), EConversationDebugInfo::Executing);
                // Just thought I'd let you know.
                Hero.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184438_2238"));
                DC(int64(0xe6a87e484475036b), EConversationDebugInfo::Done);
                DC(int64(0xe6a87e484475036e), EConversationDebugInfo::Executing);
                
                // And you were right to do so. 
                YBerion.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_184458"));
                DC(int64(0xe6a87e484475036e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceYberionWache : UTopic_Hero__SC_GUR_YBERION_1200
        {
            default DebugId = int64(0x324d2e51cd61c02b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_RWAGUXL_20240314_153447"), int64(0x324d2e51cd61c02b));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x324d2e51cd61c02d), EConversationDebugInfo::Executing);
                // What - who are you? Who let you in? GUARDS!
                YBerion.AI.Say(LocText("DIA_YBERION_WACHE_12_00"));
                DC(int64(0x324d2e51cd61c02d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_YBERION, Document::UDocumentSegment_Glossary_SC_GUR_YBERION_Introduction);
                Print("Skipped YBerion.AI.SignalIntruderAlert(Hero)");
                DC(int64(0x129327624d028c2d), EConversationDebugInfo::Executing);
                YBerion.AI.StartAttackingImmediately(Hero);
                DC(int64(0x129327624d028c2d), EConversationDebugInfo::Done);
                DC(int64(0x324d2e51cd61c02f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x324d2e51cd61c02f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */