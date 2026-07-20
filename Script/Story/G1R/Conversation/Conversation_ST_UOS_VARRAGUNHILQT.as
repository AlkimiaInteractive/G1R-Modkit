#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_ST_UOS_VARRAGUNHILQT : UConversationCharacterSettings
        {
            default ForCharacter = n"ST_UOS_VARRAGUNHILQT";
        }
        
        
        class UTopic_Hero__ST_UOS_VARRAGUNHILQT : UG1RDialogTopic
        {
            default ForCharacter = n"ST_UOS_VARRAGUNHILQT";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetVarragUnhilqt() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceVarragunhilqt427272 : UTopic_Hero__ST_UOS_VARRAGUNHILQT
        {
            default DebugId = int64(0x6d674a47775a2481);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceVarragunhilqt427272);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_EXPLORESLEEPERTEMPLE, Document::UDocumentSegment_CH5_EXPLORESLEEPERTEMPLE_Unhilqt);
                DB(int64(0xeb9df711e4fa6c1d), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled));
                DB(int64(0x6d674a47775a2485), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master));
                
                if ((Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Skilled)) || (Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Orcish_Master)))
                {
                    DC(int64(0x9eb77ed8c2af9b4), EConversationDebugInfo::Executing);
                    // Well, well. You aren't among Krushak's chosen, are you? 
                    VarragUnhilqt.AI.Say(LocText("INFO_HIGHPRIEST3_17_01"), ForceCameraPreset = n"INDIVIDUAL MEDIUM VARRAG UNHILQT");
                    DC(int64(0x9eb77ed8c2af9b4), EConversationDebugInfo::Done);
                    DC(int64(0x9eb77ed8c2af9b5), EConversationDebugInfo::Executing);
                    // No, don't say anything. I can see it in your eyes. All ...
                    VarragUnhilqt.AI.Say(LocText("INFO_HIGHPRIEST3_17_02"), ForceCameraPreset = n"WIDE VARRAG UNHILQT");
                    DC(int64(0x9eb77ed8c2af9b5), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d02), EConversationDebugInfo::Executing);
                    
                    // Surprised you can see something at all.
                    Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_160147_292"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0xb3c216ffb4972d02), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d0b), EConversationDebugInfo::Executing);
                    
                    // Your words are as weak as your bones.
                    VarragUnhilqt.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_161147"), ForceCameraPreset = n"WIDE VARRAG UNHILQT");
                    DC(int64(0xb3c216ffb4972d0b), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d0c), EConversationDebugInfo::Executing);
                    // I'll break every last one of them.
                    VarragUnhilqt.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_161206"), ForceCameraPreset = n"INDIVIDUAL CU VARRAG UNHILQT");
                    DC(int64(0xb3c216ffb4972d0c), EConversationDebugInfo::Done);
                    DC(int64(0x9eb77ed8c2af9b8), EConversationDebugInfo::Executing);
                    VarragUnhilqt.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0x9eb77ed8c2af9b8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragunhilqt_427272_exit_1");
                    DC(int64(0x9eb77ed8c2af9b9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x9eb77ed8c2af9b9), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6d674a47775a2489), EConversationDebugInfo::Executing);
                    // Well, well. You aren't among Krushak's chosen, are you? 
                    VarragUnhilqt.AI.Say(LocText("INFO_HIGHPRIEST3_17_01"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL MEDIUM VARRAG UNHILQT");
                    DC(int64(0x6d674a47775a2489), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a248c), EConversationDebugInfo::Executing);
                    // No, don't say anything. I can see it in your eyes. All ...
                    VarragUnhilqt.AI.Say(LocText("INFO_HIGHPRIEST3_17_02"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"WIDE VARRAG UNHILQT");
                    DC(int64(0x6d674a47775a248c), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d04), EConversationDebugInfo::Executing);
                    
                    // No idea what you just said. 
                    Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_160149_94"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                    DC(int64(0xb3c216ffb4972d04), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d07), EConversationDebugInfo::Executing);
                    // Let's get this over with. 
                    Hero.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_160342"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xb3c216ffb4972d07), EConversationDebugInfo::Done);
                    DC(int64(0xb3c216ffb4972d0a), EConversationDebugInfo::Executing);
                    
                    // Die, maggot! 
                    VarragUnhilqt.AI.Say(LocText("TEXT_WIP_VFXCIAC_20240903_160621"), ForceSubtitleLanguage = n"foreign", ForceCameraPreset = n"INDIVIDUAL CU VARRAG UNHILQT");
                    DC(int64(0xb3c216ffb4972d0a), EConversationDebugInfo::Done);
                    DC(int64(0x6d674a47775a2494), EConversationDebugInfo::Executing);
                    VarragUnhilqt.SetRelationshipTowards(Hero, ERelationship::Enemy);
                    DC(int64(0x6d674a47775a2494), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_varragunhilqt_427272_exit_2");
                    DC(int64(0x6d674a47775a2497), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6d674a47775a2497), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */