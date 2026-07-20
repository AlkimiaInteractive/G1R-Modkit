#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_UOS_VARRAGKASORG : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_UOS_VARRAGKASORG";
        }
        
        
        class UTopic_Hero__ST_UOS_VARRAGKASORG : UG1RDialogTopic
        {
            default ForCharacter = n"ST_UOS_VARRAGKASORG";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVarragKasorg() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceVarragkasorg226967 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0x7cf845349041dce3);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVarragkasorg427130);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Kasorg);
                DB(int64(0x6d674a47775a244f), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                DB(int64(0xeb9df711e4fa6c28), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)))
                {
                    DC(int64(0x8a15c252d81c3497), EConversationDebugInfo::Executing);
                    // Who is this? I can't see. It's all ... darkness. 
                    VarragKasorg.AI.Say(LocText("INFO_HIGHPRIEST2_17_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0x8a15c252d81c3497), EConversationDebugInfo::Done);
                    Subdialog(
                        UVarragKasorg_110147,
                        UVarragKasorg_110167
                    );
                    DC(int64(0x8a15c252d81c349b), EConversationDebugInfo::Executing);
                    VarragKasorg.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0x8a15c252d81c349b), EConversationDebugInfo::Done);
                    DC(int64(0x8a15c252d81c349c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x8a15c252d81c349c), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6d674a47775a2456), EConversationDebugInfo::Executing);
                    // Who is this? I can't see. It's all ... darkness. 
                    VarragKasorg.AI.Say(LocText("INFO_HIGHPRIEST2_17_01"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0x6d674a47775a2456), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a245e), EConversationDebugInfo::Executing);
                    // (long exhale) 
                    VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154844"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0x6d674a47775a245e), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a245f), EConversationDebugInfo::Executing);
                    // Trespasser. 
                    VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154923"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0x6d674a47775a245f), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2460), EConversationDebugInfo::Executing);
                    // This is your end. 
                    VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154949"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0x6d674a47775a2460), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2462), EConversationDebugInfo::Executing);
                    VarragKasorg.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0x6d674a47775a2462), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UVarragKasorg_110147 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972ccf);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_153543_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_110147);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cd0), EConversationDebugInfo::Executing);
                // Who are you? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153543_491"));
                DC(int64(0xb3c216ffb4972cd0), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cd8), EConversationDebugInfo::Executing);
                
                // Skargok. At least that's who I was ... Then the Great Ur ...
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153800"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972cd8), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cd9), EConversationDebugInfo::Executing);
                // My heart for Krushak. For the end of the endless war ...
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153904"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xb3c216ffb4972cd9), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cda), EConversationDebugInfo::Executing);
                // I never wanted it. But ... I had to, you see? It was an ...
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153920"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xb3c216ffb4972cda), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cdb), EConversationDebugInfo::Executing);
                // Then why doesn't it feel this way? 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153952"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972cdb), EConversationDebugInfo::Done);
                Subdialog(
                    UVarragKasorg_110977,
                    UVarragKasorg_110997,
                    UVarragKasorg_111786,
                    UVarragKasorg_111839
                );
            }
        }
        
        
        class UVarragKasorg_110167 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972cd3);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_153543_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_110167);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cd4), EConversationDebugInfo::Executing);
                // Time to die, you maggot sponge. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153543_3750"));
                DC(int64(0xb3c216ffb4972cd4), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cd7), EConversationDebugInfo::Executing);
                
                // But ... why? 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_153659"));
                DC(int64(0xb3c216ffb4972cd7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragKasorg_110977 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972cdd);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_154030_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_110977);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cde), EConversationDebugInfo::Executing);
                
                // What do you mean, the "Great Ur" found your gift? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154030_731"));
                DC(int64(0xb3c216ffb4972cde), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ce5), EConversationDebugInfo::Executing);
                
                // My magic. Balyar doesn't give it to many, but he gave it ...
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154054"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972ce5), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ce6), EConversationDebugInfo::Executing);
                // That's why he made me Varrag. A sacrifice for Krushak. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154319"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xb3c216ffb4972ce6), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ce0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb3c216ffb4972ce0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragKasorg_110997 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972ce1);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_154030_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_110997);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972ce2), EConversationDebugInfo::Executing);
                // Shouldn't you be trying to kill me? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154030_3719"));
                DC(int64(0xb3c216ffb4972ce2), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ce7), EConversationDebugInfo::Executing);
                
                // I ... I should. But I don't want to kill anyone. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154429"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972ce7), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cee), EConversationDebugInfo::Executing);
                // I just want ... rest. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154540"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                DC(int64(0xb3c216ffb4972cee), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ce4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xb3c216ffb4972ce4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragKasorg_111786 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972cef);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_154556_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_111786);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cf0), EConversationDebugInfo::Executing);
                // I'll leave you be. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154556_3902"));
                DC(int64(0xb3c216ffb4972cf0), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cf8), EConversationDebugInfo::Executing);
                
                // Yes ... I don't want to fight you. I-
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154700"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC", Posture = GameplayTag::Posture_Standing_Forced_Possessed01);
                DC(int64(0xb3c216ffb4972cf8), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cf9), EConversationDebugInfo::Executing);
                // AGH. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154720"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", Posture = GameplayTag::Posture_Standing_Forced_Possessed02);
                DC(int64(0xb3c216ffb4972cf9), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cfa), EConversationDebugInfo::Executing);
                
                // What's happening? 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154806"));
                DC(int64(0xb3c216ffb4972cfa), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cfb), EConversationDebugInfo::Executing);
                
                // Krushak, he's ... he's in my heart again. No. No, no, ...
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154812"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", Posture = GameplayTag::Posture_Standing_Forced_Possessed03);
                DC(int64(0xb3c216ffb4972cfb), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cfc), EConversationDebugInfo::Executing);
                // (long exhale) 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154844"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC", Posture = GameplayTag::Posture_Standing_Forced_Possessed04);
                DC(int64(0xb3c216ffb4972cfc), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cfd), EConversationDebugInfo::Executing);
                // Trespasser. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154923"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC", Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0xb3c216ffb4972cfd), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cfe), EConversationDebugInfo::Executing);
                // This is your end. 
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154949"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC", Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0xb3c216ffb4972cfe), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragKasorg_111839 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0xb3c216ffb4972cf3);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_154615_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragKasorg_111839);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cf4), EConversationDebugInfo::Executing);
                
                // Time to die. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154615_153"));
                DC(int64(0xb3c216ffb4972cf4), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cf7), EConversationDebugInfo::Executing);
                
                // What? But ... why?
                VarragKasorg.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_154625"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972cf7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceVarragkasorg427130 : UTopic_Hero__ST_UOS_VARRAGKASORG
        {
            default DebugId = int64(0x6d674a47775a244c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceVarragkasorg427130);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x7cf845349041dce6), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_1", 700.0f));
                DB(int64(0x7cf845349041dce7), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_2", 700.0f));
                DB(int64(0x7cf845349041dce8), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_3", 700.0f));
                
                if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_1", 700.0f))
                {
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Executing);
                    Hero.AI.GotoWaypoint(n"FP_ENCOUNTER_1");
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragkasorg_427130_exit_1");
                }
                else if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_2", 700.0f))
                {
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Executing);
                    Hero.AI.GotoWaypoint(n"FP_ENCOUNTER_4");
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragkasorg_427130_exit_2");
                }
                else if (Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_PUZZLE_CONVERSATION_3", 700.0f))
                {
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Executing);
                    Hero.AI.GotoWaypoint(n"FP_ENCOUNTER_3");
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragkasorg_427130_exit_3");
                }
                else
                {
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Executing);
                    Hero.AI.GotoWaypoint(n"FP_ENCOUNTER_2");
                    DC(int64(0x7cf845349041dceb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragkasorg_427130_exit_4");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */