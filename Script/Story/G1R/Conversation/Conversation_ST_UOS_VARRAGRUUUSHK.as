#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_UOS_VARRAGRUUUSHK : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_UOS_VARRAGRUUUSHK";
        }
        
        
        class UTopic_Hero__ST_UOS_VARRAGRUUUSHK : UG1RDialogTopic
        {
            default ForCharacter = n"ST_UOS_VARRAGRUUUSHK";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVarragRuuushk() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceHighpriest4 : UTopic_Hero__ST_UOS_VARRAGRUUUSHK
        {
            default DebugId = int64(0xdbe59ddd20e182fc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceHighpriest4);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdbe59ddd20e18301), EConversationDebugInfo::Executing);
                // Morra. 
                VarragRuuushk.AI.Say(LocText("INFO_HIGHPRIEST4_17_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                DC(int64(0xdbe59ddd20e18301), EConversationDebugInfo::Done);
                DC(int64(0xb3c216ffb4972d13), EConversationDebugInfo::Executing);
                
                // That's me.
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_163134"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xb3c216ffb4972d13), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Ruuushk);
                DB(int64(0xb3c216ffb4972d17), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x342331416253ae8d), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0xdbe59ddd20e18302), EConversationDebugInfo::Executing);
                    // You die now.
                    VarragRuuushk.AI.Say(LocText("INFO_HIGHPRIEST4_17_02"), ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0xdbe59ddd20e18302), EConversationDebugInfo::Done);
                    DC(int64(0xdbe59ddd20e18303), EConversationDebugInfo::Executing);
                    
                    // I don't think so. 
                    Hero.AI.Say(LocText("INFO_HIGHPRIEST4_15_03"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0xdbe59ddd20e18303), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb3c216ffb4972d18), EConversationDebugInfo::Executing);
                    
                    // You die now.
                    VarragRuuushk.AI.Say(LocText("INFO_HIGHPRIEST4_17_02"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM ORC");
                    DC(int64(0xb3c216ffb4972d18), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d19), EConversationDebugInfo::Executing);
                    
                    // Whatever you just said - "no."
                    Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_163347_1037"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0xb3c216ffb4972d19), EConversationDebugInfo::Done);
                }
                DC(int64(0xb3c216ffb4972d1e), EConversationDebugInfo::Executing);
                // Now die. 
                Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_163437"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xb3c216ffb4972d1e), EConversationDebugInfo::Done);
                DC(int64(0xdbe59ddd20e18305), EConversationDebugInfo::Executing);
                VarragRuuushk.SetRelationshipTowards(Hero, ERelationship::Enemy);
                DC(int64(0xdbe59ddd20e18305), EConversationDebugInfo::Done);
                DC(int64(0xdbe59ddd20e18306), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdbe59ddd20e18306), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */