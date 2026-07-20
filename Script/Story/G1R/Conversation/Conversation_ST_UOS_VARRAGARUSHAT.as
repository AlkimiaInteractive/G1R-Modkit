#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_UOS_VARRAGARUSHAT : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_UOS_VARRAGARUSHAT";
        }
        
        
        class UTopic_Hero__ST_UOS_VARRAGARUSHAT : UG1RDialogTopic
        {
            default ForCharacter = n"ST_UOS_VARRAGARUSHAT";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVarragArushat() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceHighpriest5 : UTopic_Hero__ST_UOS_VARRAGARUSHAT
        {
            default DebugId = int64(0xc943d94564ad2643);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceHighpriest5);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Arushat);
                DB(int64(0x3232d7843c92b716), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0xdcc68d847c243a2b), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0xc943d94564ad2648), EConversationDebugInfo::Executing);
                    // A morra? What has become of my people that they would ...
                    VarragArushat.AI.Say(LocText("INFO_HIGHPRIEST5_17_04"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0xc943d94564ad2648), EConversationDebugInfo::Done);
                    DC(int64(0x3232d7843c92b721), EConversationDebugInfo::Executing);
                    
                    // Long story.
                    Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_224058"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0x3232d7843c92b721), EConversationDebugInfo::Done);
                    DC(int64(0xc943d94564ad2649), EConversationDebugInfo::Executing);
                    
                    // And he speaks our tongue. What are you doing here, ...
                    VarragArushat.AI.Say(LocText("INFO_HIGHPRIEST5_17_05"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0xc943d94564ad2649), EConversationDebugInfo::Done);
                    Subdialog(
                        UVarragArushat_110954,
                        UVarragArushat_110974,
                        UVarragArushat_109331
                    );
                    DC(int64(0xb3c216ffb4972cc5), EConversationDebugInfo::Executing);
                    // I will not let you tarnish these halls with your stink ...
                    VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151249_443"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0xb3c216ffb4972cc5), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972cc6), EConversationDebugInfo::Executing);
                    // Time to die. 
                    VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151317"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0xb3c216ffb4972cc6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x3232d7843c92b71a), EConversationDebugInfo::Executing);
                    // A morra? What has become of my people that they would ...
                    VarragArushat.AI.Say(LocText("INFO_HIGHPRIEST5_17_04"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0x3232d7843c92b71a), EConversationDebugInfo::Done);
                    DC(int64(0x3232d7843c92b722), EConversationDebugInfo::Executing);
                    
                    // I have no idea what you just said - and I don't care. 
                    Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_224714"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0x3232d7843c92b722), EConversationDebugInfo::Done);
                    DC(int64(0x3232d7843c92b723), EConversationDebugInfo::Executing);
                    
                    // Time to die. 
                    VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151317"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL CLOSE UP ORC");
                    DC(int64(0x3232d7843c92b723), EConversationDebugInfo::Done);
                }
                DC(int64(0xb1a309601b985519), EConversationDebugInfo::Executing);
                VarragArushat.SetRelationshipTowards(Hero, ERelationship::Enemy);
                DC(int64(0xb1a309601b985519), EConversationDebugInfo::Done);
                DC(int64(0xc943d94564ad264e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc943d94564ad264e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UVarragArushat_110954 : UTopic_Hero__ST_UOS_VARRAGARUSHAT
        {
            default DebugId = int64(0x3232d7843c92b728);
            default Caption = LocText("TEXT_WIP_UFXCIAC_20240902_224901_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragArushat_110954);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3232d7843c92b729), EConversationDebugInfo::Executing);
                // Krushak will kill you all. You'll never be able to ...
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_224901_2785"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x3232d7843c92b729), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972cc3), EConversationDebugInfo::Executing);
                
                // We will see about that. 
                VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151040"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972cc3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragArushat_110974 : UTopic_Hero__ST_UOS_VARRAGARUSHAT
        {
            default DebugId = int64(0x3232d7843c92b72c);
            default Caption = LocText("TEXT_WIP_UFXCIAC_20240902_224901_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragArushat_110974);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3232d7843c92b72d), EConversationDebugInfo::Executing);
                
                // Does it make a difference?
                Hero.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_224901_3286"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x3232d7843c92b72d), EConversationDebugInfo::Done);
                DC(int64(0x3232d7843c92b732), EConversationDebugInfo::Executing);
                
                // No. It does not. 
                VarragArushat.AI.Say(LocText("TEXT_WIP_UFXCIAC_20240902_224912"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0x3232d7843c92b732), EConversationDebugInfo::Done);
            }
        }
        
        
        class UVarragArushat_109331 : UTopic_Hero__ST_UOS_VARRAGARUSHAT
        {
            default DebugId = int64(0xb3c216ffb4972cc7);
            default Caption = LocText("TEXT_WIP_VFXCIAC_20240903_151322_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UVarragArushat_109331);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb3c216ffb4972cc8), EConversationDebugInfo::Executing);
                
                // I'm here to submit to Krushak. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151322_1769"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xb3c216ffb4972cc8), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ccb), EConversationDebugInfo::Executing);
                
                // ...
                VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151352"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972ccb), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972ccc), EConversationDebugInfo::Executing);
                // No. No, you are not. I can feel it all over you - the ...
                VarragArushat.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_151415"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xb3c216ffb4972ccc), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */