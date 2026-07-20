#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_UOS_VARRAGHASHOR : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_UOS_VARRAGHASHOR";
        }
        
        
        class UTopic_Hero__ST_UOS_VARRAGHASHOR : UG1RDialogTopic
        {
            default ForCharacter = n"ST_UOS_VARRAGHASHOR";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVarragHashor() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceVarraghashor213881 : UTopic_Hero__ST_UOS_VARRAGHASHOR
        {
            default DebugId = int64(0x6d674a47775984da);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceVarraghashor213881);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Hashor);
                DB(int64(0xeb9df711e4fa6c12), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x6d674a47775984de), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0x537d81787eb5b05c), EConversationDebugInfo::Executing);
                    // Who ... disturbs ... my ... 
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM VARRAG HASHOR");
                    DC(int64(0x537d81787eb5b05c), EConversationDebugInfo::Done);
                    DC(int64(0x537d81787eb5b05d), EConversationDebugInfo::Executing);
                    // Vigil ...
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_02"), ForceCameraPreset = n"INDIVIDUAL CU VARRAG HASHOR");
                    DC(int64(0x537d81787eb5b05d), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972ccd), EConversationDebugInfo::Executing);
                    
                    // That one didn't age well ... 
                    Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_152419"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0xb3c216ffb4972ccd), EConversationDebugInfo::Done);
                    DC(int64(0x537d81787eb5b05e), EConversationDebugInfo::Executing);
                    
                    // Meet .. the ... end. 
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_03"), ForceCameraPreset = n"WIDE VARRAG HASHOR");
                    DC(int64(0x537d81787eb5b05e), EConversationDebugInfo::Done);
                    DC(int64(0x537d81787eb5b05f), EConversationDebugInfo::Executing);
                    
                    // The question is whose. 
                    Hero.AI.Say(LocText("INFO_HIGHPRIEST1_15_04"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0x537d81787eb5b05f), EConversationDebugInfo::Done);
                    DC(int64(0xb1a309601b98551f), EConversationDebugInfo::Executing);
                    VarragHashor.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0xb1a309601b98551f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varraghashor_213881_exit_1");
                    DC(int64(0x6d674a47775a2477), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6d674a47775a2477), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6d674a47775a243f), EConversationDebugInfo::Executing);
                    // Who ... disturbs ... my ... 
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_01"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM VARRAG HASHOR");
                    DC(int64(0x6d674a47775a243f), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2442), EConversationDebugInfo::Executing);
                    // Vigil ...
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_02"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL CU VARRAG HASHOR");
                    DC(int64(0x6d674a47775a2442), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2443), EConversationDebugInfo::Executing);
                    // Meet .. the ... end. 
                    VarragHashor.AI.Say(LocText("INFO_HIGHPRIEST1_17_03"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"WIDE VARRAG HASHOR");
                    DC(int64(0x6d674a47775a2443), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2445), EConversationDebugInfo::Executing);
                    VarragHashor.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0x6d674a47775a2445), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varraghashor_213881_exit_2");
                    DC(int64(0x6d674a47775a247a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6d674a47775a247a), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */