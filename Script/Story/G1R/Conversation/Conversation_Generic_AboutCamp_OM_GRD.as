#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OM_GRD : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OM_GRD";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OM_GRD";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_OM_GRD() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampOmGrd150771 : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x26cbf72826445720);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445722), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445722), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_OMGRDCanyou : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3341);
            default Caption = LocText("Info_Mine_Grd_7_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDCanyou_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3343), EConversationDebugInfo::Executing);
                // Can you tell me who's in charge here?
                Hero.AI.Say(LocText("Info_Mine_Grd_7_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3343), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0259), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDCanyou_Reply1);
                DC(int64(0x1ee81109d13d0259), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDDoyou : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3345);
            default Caption = LocText("Info_Mine_Grd_7_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDDoyou_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3347), EConversationDebugInfo::Executing);
                
                // Do you know anything about the crawlers?
                Hero.AI.Say(LocText("Info_Mine_Grd_7_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e3347), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0258), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDDoyou_Reply1);
                DC(int64(0x1ee81109d13d0258), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDHowsit : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3329);
            default Caption = LocText("Info_Mine_Grd_13_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDHowsit_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e332b), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Mine_Grd_13_DieLage_15_00"));
                DC(int64(0x716b63fb436e332b), EConversationDebugInfo::Done);
                DC(int64(0x86b64da5908df03), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDHowsit_Reply1);
                DC(int64(0x86b64da5908df03), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDIsevery : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3349);
            default Caption = LocText("Info_Mine_Grd_7_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDIsevery_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e334b), EConversationDebugInfo::Executing);
                
                // Is everything all right?
                Hero.AI.Say(LocText("Info_Mine_Grd_7_DieLage_15_00"));
                DC(int64(0x716b63fb436e334b), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0256), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDIsevery_Reply1);
                DC(int64(0x1ee81109d13d0256), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDTellme : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3335);
            default Caption = LocText("Info_Mine_Grd_6_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellme_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3337), EConversationDebugInfo::Executing);
                
                // Tell me about the crawlers.
                Hero.AI.Say(LocText("Info_Mine_Grd_6_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e3337), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0254), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellme_Reply1);
                DC(int64(0x1ee81109d13d0254), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDTellmine : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e333d);
            default Caption = LocText("Info_Mine_Grd_7_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellmine_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e333f), EConversationDebugInfo::Executing);
                
                // Tell me about the Mine.
                Hero.AI.Say(LocText("Info_Mine_Grd_7_Mine_15_00"));
                DC(int64(0x716b63fb436e333f), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0257), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDTellmine_Reply1);
                DC(int64(0x1ee81109d13d0257), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDWhatcan : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3325);
            default Caption = LocText("Info_Mine_Grd_13_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatcan_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3327), EConversationDebugInfo::Executing);
                
                // What can you tell me about the crawlers?
                Hero.AI.Say(LocText("Info_Mine_Grd_13_DasLager_15_00"));
                DC(int64(0x716b63fb436e3327), EConversationDebugInfo::Done);
                DC(int64(0x86b64da5908df06), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatcan_Reply1);
                DC(int64(0x86b64da5908df06), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDWhatsthe : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e331d);
            default Caption = LocText("Info_Mine_Grd_13_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsthe_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e331f), EConversationDebugInfo::Executing);
                
                // What's the deal with the Mine?
                Hero.AI.Say(LocText("Info_Mine_Grd_13_Mine_15_00"));
                DC(int64(0x716b63fb436e331f), EConversationDebugInfo::Done);
                DC(int64(0x86b64da5908df05), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatsthe_Reply1);
                DC(int64(0x86b64da5908df05), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDWhocalls : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3321);
            default Caption = LocText("Info_Mine_Grd_13_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhocalls_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3323), EConversationDebugInfo::Executing);
                
                // Who calls the shots around here?
                Hero.AI.Say(LocText("Info_Mine_Grd_13_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3323), EConversationDebugInfo::Done);
                DC(int64(0x86b64da5908df04), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhocalls_Reply1);
                DC(int64(0x86b64da5908df04), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMGRDWhosgot : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x716b63fb436e3331);
            default Caption = LocText("Info_Mine_Grd_6_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhosgot_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3333), EConversationDebugInfo::Executing);
                
                // Who's got the say in here?
                Hero.AI.Say(LocText("Info_Mine_Grd_6_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3333), EConversationDebugInfo::Done);
                DC(int64(0x1ee81109d13d0255), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhosgot_Reply1);
                DC(int64(0x1ee81109d13d0255), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOMGRDWhatword : UTopic_Hero__GENERIC_ABOUTCAMP_OM_GRD
        {
            default DebugId = int64(0x85b47f805b94701f);
            default Caption = LocText("TEXT_WIP_EDTFPHF_20250319_122003");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_GRD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatword_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x52016d69426fda5f), Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && !Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning());
                    DB(int64(0xc18b6629d7a970ef), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CONVOY != nullptr && Quest::NewCamp_NCCHAPTER1_CONVOY.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x85b47f805b94701d), EConversationDebugInfo::Executing);
                
                // What's the word?
                Hero.AI.Say(LocText("TEXT_WIP_EDTFPHF_20250319_122003"));
                DC(int64(0x85b47f805b94701d), EConversationDebugInfo::Done);
                DC(int64(0x85b47f805b94701e), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_GRD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_GRD_OMGRDWhatword_Reply1);
                DC(int64(0x85b47f805b94701e), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */