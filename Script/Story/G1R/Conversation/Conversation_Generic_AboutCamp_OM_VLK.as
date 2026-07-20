#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OM_VLK : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OM_VLK";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OM_VLK";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_OM_VLK() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampOmVlk150800 : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x26cbf72826445726);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445729), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445729), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_OMVLKAboutMC : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e338b);
            default Caption = LocText("Info_Mine_Vlk_4_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMC_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e338d), EConversationDebugInfo::Executing);
                // What do you know about minecrawlers?
                Hero.AI.Say(LocText("Info_Mine_Vlk_4_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e338d), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09513), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMC_Reply1);
                DC(int64(0x95fa85efa5d09513), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKAboutMine : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3382);
            default Caption = LocText("Info_Mine_Vlk_4_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3384), EConversationDebugInfo::Executing);
                
                // Tell me about the mine.
                Hero.AI.Say(LocText("Info_Mine_Vlk_4_Mine_15_00"));
                DC(int64(0x716b63fb436e3384), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09511), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply1);
                DC(int64(0x95fa85efa5d09511), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09512), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKAboutMine_Reply2);
                DC(int64(0x95fa85efa5d09512), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKHowareyou : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e338f);
            default Caption = LocText("Info_Mine_Vlk_4_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowareyou_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3391), EConversationDebugInfo::Executing);
                
                // How are you?
                Hero.AI.Say(LocText("Info_Mine_Vlk_4_DieLage_15_00"));
                DC(int64(0x716b63fb436e3391), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09510), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowareyou_Reply1);
                DC(int64(0x95fa85efa5d09510), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKHowdigger : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e336c);
            default Caption = LocText("Info_Mine_Vlk_2_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowdigger_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e336e), EConversationDebugInfo::Executing);
                
                // How are you?
                Hero.AI.Say(LocText("Info_Mine_Vlk_2_DieLage_15_00"));
                DC(int64(0x716b63fb436e336e), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d00652), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowdigger_Reply1);
                DC(int64(0x95fa85efa5d00652), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKHowsit : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e337d);
            default Caption = LocText("Info_Mine_Vlk_3_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e337f), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Mine_Vlk_3_DieLage_15_00"));
                DC(int64(0x716b63fb436e337f), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply1);
                DC(int64(0x95fa85efa5d0950a), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsit_Reply2);
                DC(int64(0x95fa85efa5d0950b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKHowsitgoing : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e335a);
            default Caption = LocText("Info_Mine_Vlk_1_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsitgoing_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e335c), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Mine_Vlk_1_DieLage_15_00"));
                DC(int64(0x716b63fb436e335c), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09505), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKHowsitgoing_Reply1);
                DC(int64(0x95fa85efa5d09505), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKTell : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e334d);
            default Caption = LocText("Info_Mine_Vlk_1_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e334f), EConversationDebugInfo::Executing);
                
                // Tell me about the mine.
                Hero.AI.Say(LocText("Info_Mine_Vlk_1_Mine_15_00"));
                DC(int64(0x716b63fb436e334f), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09506), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply1);
                DC(int64(0x95fa85efa5d09506), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09507), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTell_Reply2);
                DC(int64(0x95fa85efa5d09507), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKTellmeabout : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3370);
            default Caption = LocText("Info_Mine_Vlk_3_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmeabout_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3372), EConversationDebugInfo::Executing);
                
                // Tell me about the mine.
                Hero.AI.Say(LocText("Info_Mine_Vlk_3_Mine_15_00"));
                DC(int64(0x716b63fb436e3372), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmeabout_Reply1);
                DC(int64(0x95fa85efa5d0950c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKTellmecaves : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e335e);
            default Caption = LocText("Info_Mine_Vlk_2_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3360), EConversationDebugInfo::Executing);
                
                // Tell me about the mine.
                Hero.AI.Say(LocText("Info_Mine_Vlk_2_Mine_15_00"));
                DC(int64(0x716b63fb436e3360), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d00653), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply1);
                DC(int64(0x95fa85efa5d00653), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d00654), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTellmecaves_Reply2);
                DC(int64(0x95fa85efa5d00654), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhatdo : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3367);
            default Caption = LocText("Info_Mine_Vlk_2_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3369), EConversationDebugInfo::Executing);
                
                // What do you know about minecrawlers?
                Hero.AI.Say(LocText("Info_Mine_Vlk_2_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e3369), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0064f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply1);
                DC(int64(0x95fa85efa5d0064f), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d00650), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdo_Reply2);
                DC(int64(0x95fa85efa5d00650), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhatdoyou : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3378);
            default Caption = LocText("Info_Mine_Vlk_3_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply1)) return false;
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e337a), EConversationDebugInfo::Executing);
                
                // What do you know about minecrawlers?
                Hero.AI.Say(LocText("Info_Mine_Vlk_3_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e337a), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950d), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply1);
                DC(int64(0x95fa85efa5d0950d), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatdoyou_Reply2);
                DC(int64(0x95fa85efa5d0950e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhatmine : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3356);
            default Caption = LocText("Info_Mine_Vlk_1_Minecrawler_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatmine_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3358), EConversationDebugInfo::Executing);
                
                // What do you know about minecrawlers?
                Hero.AI.Say(LocText("Info_Mine_Vlk_1_Minecrawler_15_00"));
                DC(int64(0x716b63fb436e3358), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09508), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhatmine_Reply1);
                DC(int64(0x95fa85efa5d09508), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhocalls : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3374);
            default Caption = LocText("Info_Mine_Vlk_3_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocalls_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3376), EConversationDebugInfo::Executing);
                
                // Who calls the shots around here?
                Hero.AI.Say(LocText("Info_Mine_Vlk_3_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3376), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d0950f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocalls_Reply1);
                DC(int64(0x95fa85efa5d0950f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhocharge : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3352);
            default Caption = LocText("Info_Mine_Vlk_1_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocharge_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3354), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Mine_Vlk_1_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3354), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09509), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhocharge_Reply1);
                DC(int64(0x95fa85efa5d09509), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhohas : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3363);
            default Caption = LocText("Info_Mine_Vlk_2_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhohas_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3365), EConversationDebugInfo::Executing);
                
                // Who has the say round here?
                Hero.AI.Say(LocText("Info_Mine_Vlk_2_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3365), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d00651), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhohas_Reply1);
                DC(int64(0x95fa85efa5d00651), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_OMVLKWhorules : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x716b63fb436e3387);
            default Caption = LocText("Info_Mine_Vlk_4_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhorules_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa1909a3302284525), Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE != nullptr && !Quest::SwampCamp_SCCHAPTER2_GREAT_INVOCATION_GREAT_INVOCATION_OBJ_PARTICIPATE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3389), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Mine_Vlk_4_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3389), EConversationDebugInfo::Done);
                DC(int64(0x95fa85efa5d09514), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWhorules_Reply1);
                DC(int64(0x95fa85efa5d09514), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOMVLKTemplar : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x9bf422ec628f87db);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOMVLKTemplar);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTemplar_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180b92), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xc2bbabf13f180b93), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xc2bbabf13f180ba7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207cc), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKTemplar_Ambient1);
                DC(int64(0x4f222b4b7ac207cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOMVLKWrong : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x9bf422ec628f87df);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOMVLKWrong);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWrong_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180b92), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xc2bbabf13f180b93), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xc2bbabf13f180ba8), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207cd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKWrong_Ambient1);
                DC(int64(0x4f222b4b7ac207cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOMVLKYOU : UTopic_Hero__GENERIC_ABOUTCAMP_OM_VLK
        {
            default DebugId = int64(0x9bf422ec628f87e3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOMVLKYOU);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OM_VLK.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKYOU_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180b92), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xc2bbabf13f180b93), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xc2bbabf13f180ba9), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OM_VLK, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f222b4b7ac207ce), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OM_VLK.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OM_VLK_OMVLKYOU_Ambient1);
                DC(int64(0x4f222b4b7ac207ce), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */