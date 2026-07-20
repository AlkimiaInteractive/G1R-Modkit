#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_FM_SLD : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_SLD";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_SLD";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_FM_SLD() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampFmSld150532 : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0x26cbf7282644568e);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445691), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445691), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_FMSLDAllgood : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0xc6fa414be146ae91);
            default Caption = LocText("Info_Mine_Sld_8_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDAllgood_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc6fa414be146ae92), EConversationDebugInfo::Executing);
                // Everything in order?
                Hero.AI.Say(LocText("Info_Mine_Sld_8_DieLage_15_00"));
                DC(int64(0xc6fa414be146ae92), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDAllgood_Reply1);
                DC(int64(0xb9b15dd8726bab8c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDHowcan : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0xc6fa414be146ae85);
            default Caption = LocText("Info_Mine_Sld_8_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4832f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc6fa414be146ae86), EConversationDebugInfo::Executing);
                
                // How can I join this crew here?
                Hero.AI.Say(LocText("Info_Mine_Sld_8_EinerVonEuchWerden_15_00"));
                DC(int64(0xc6fa414be146ae86), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8d), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply1);
                DC(int64(0xb9b15dd8726bab8d), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowcan_Reply2);
                DC(int64(0xb9b15dd8726bab8e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDHowits : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0x6b6978fb2672cfa6);
            default Caption = LocText("Info_Mine_Sld_11_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowits_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b6978fb2672cfa7), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Mine_Sld_11_DieLage_15_00"));
                DC(int64(0x6b6978fb2672cfa7), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e5), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowits_Reply1);
                DC(int64(0x26b775160fcfe7e5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDHowjoin : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0x6b6978fb2672cf9a);
            default Caption = LocText("Info_Mine_Sld_11_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4832c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b6978fb2672cf9b), EConversationDebugInfo::Executing);
                
                // How can I join you?
                Hero.AI.Say(LocText("Info_Mine_Sld_11_EinerVonEuchWerden_15_00"));
                DC(int64(0x6b6978fb2672cf9b), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e1), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply1);
                DC(int64(0x26b775160fcfe7e1), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e2), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDHowjoin_Reply2);
                DC(int64(0x26b775160fcfe7e2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDIsthere : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0x6b6978fb2672cfa2);
            default Caption = LocText("Info_Mine_Sld_11_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b6978fb2672cfa3), EConversationDebugInfo::Executing);
                
                // Is there anything special going on here?
                Hero.AI.Say(LocText("Info_Mine_Sld_11_DasLager_15_00"));
                DC(int64(0x6b6978fb2672cfa3), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e6), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply1);
                DC(int64(0x26b775160fcfe7e6), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e7), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDIsthere_Reply2);
                DC(int64(0x26b775160fcfe7e7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDWhatsdeal : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0xc6fa414be146ae8d);
            default Caption = LocText("Info_Mine_Sld_8_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc6fa414be146ae8e), EConversationDebugInfo::Executing);
                
                // What's the deal here?
                Hero.AI.Say(LocText("Info_Mine_Sld_8_DasLager_15_00"));
                DC(int64(0xc6fa414be146ae8e), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply1);
                DC(int64(0xb9b15dd8726bab8a), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhatsdeal_Reply2);
                DC(int64(0xb9b15dd8726bab8b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDWhorules : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0x6b6978fb2672cf9e);
            default Caption = LocText("Info_Mine_Sld_11_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6b6978fb2672cf9f), EConversationDebugInfo::Executing);
                
                // Who's giving orders around here?
                Hero.AI.Say(LocText("Info_Mine_Sld_11_WichtigePersonen_15_00"));
                DC(int64(0x6b6978fb2672cf9f), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e3), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply1);
                DC(int64(0x26b775160fcfe7e3), EConversationDebugInfo::Done);
                DC(int64(0x26b775160fcfe7e4), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhorules_Reply2);
                DC(int64(0x26b775160fcfe7e4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSLDWhosthebsss : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SLD
        {
            default DebugId = int64(0xc6fa414be146ae89);
            default Caption = LocText("Info_Mine_Sld_8_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc6fa414be146ae8a), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Mine_Sld_8_WichtigePersonen_15_00"));
                DC(int64(0xc6fa414be146ae8a), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab8f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply1);
                DC(int64(0xb9b15dd8726bab8f), EConversationDebugInfo::Done);
                DC(int64(0xb9b15dd8726bab90), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SLD_FMSLDWhosthebsss_Reply2);
                DC(int64(0xb9b15dd8726bab90), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */