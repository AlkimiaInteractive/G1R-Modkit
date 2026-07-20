#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_FM_SFB : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_SFB";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_SFB";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_FM_SFB() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampFmSfb150321 : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x26cbf72826445634);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445638), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445638), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_FMSFBHowdo : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x180b026902235a0e);
            default Caption = LocText("Info_SFB_1_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x35548fea246a35d4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x180b026902235a0f), EConversationDebugInfo::Executing);
                // How do I join the diggers?
                Hero.AI.Say(LocText("Info_SFB_1_EinerVonEuchWerden_15_00"));
                DC(int64(0x180b026902235a0f), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc786), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply1);
                DC(int64(0x32770ec649fcc786), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc787), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply2);
                DC(int64(0x32770ec649fcc787), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc788), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowdo_Reply3);
                DC(int64(0x32770ec649fcc788), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBHowsit : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x180b026902235a1a);
            default Caption = LocText("Info_SFB_1_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply3)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x180b026902235a1b), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_SFB_1_DieLage_15_00"));
                DC(int64(0x180b026902235a1b), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc78c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply1);
                DC(int64(0x32770ec649fcc78c), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc78d), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply2);
                DC(int64(0x32770ec649fcc78d), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc78e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBHowsit_Reply3);
                DC(int64(0x32770ec649fcc78e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBIwannaknow : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x1aff03658dccd18f);
            default Caption = LocText("Info_SFB_2_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBIwannaknow_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1aff03658dccd190), EConversationDebugInfo::Executing);
                
                // I wanna know more about this Camp.
                Hero.AI.Say(LocText("Info_SFB_2_DasLager_15_00"));
                DC(int64(0x1aff03658dccd190), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bad), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBIwannaknow_Reply1);
                DC(int64(0x2b0ba04eb05f6bad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatcamp : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x5f9da8cfa3e900d4);
            default Caption = LocText("Info_SFB_5_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatcamp_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48326), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f9da8cfa3e900d5), EConversationDebugInfo::Executing);
                
                // What does this Camp have to offer?
                Hero.AI.Say(LocText("Info_SFB_5_DasLager_15_00"));
                DC(int64(0x5f9da8cfa3e900d5), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bae), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatcamp_Reply1);
                DC(int64(0x2b0ba04eb05f6bae), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatdo : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x1aff03658dccd188);
            default Caption = LocText("Info_SFB_2_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatdo_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48325), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1aff03658dccd189), EConversationDebugInfo::Executing);
                
                // What do I have to do if I wanna join you?
                Hero.AI.Say(LocText("Info_SFB_2_EinerVonEuchWerden_15_00"));
                DC(int64(0x1aff03658dccd189), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6baa), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatdo_Reply1);
                DC(int64(0x2b0ba04eb05f6baa), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatif : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x5f9da8cfa3e900c8);
            default Caption = LocText("Info_SFB_5_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48327), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f9da8cfa3e900c9), EConversationDebugInfo::Executing);
                
                // What if I wanna join you?
                Hero.AI.Say(LocText("Info_SFB_5_EinerVonEuchWerden_15_00"));
                DC(int64(0x5f9da8cfa3e900c9), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb2), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply1);
                DC(int64(0x2b0ba04eb05f6bb2), EConversationDebugInfo::Done);
                DC(int64(0x5f9da8cfa3e900cb), EConversationDebugInfo::Executing);
                
                // No, as a digger.
                Hero.AI.Say(LocText("Info_SFB_5_EinerVonEuchWerden_15_02"));
                DC(int64(0x5f9da8cfa3e900cb), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb4), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply2);
                DC(int64(0x2b0ba04eb05f6bb4), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb5), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatif_Reply3);
                DC(int64(0x2b0ba04eb05f6bb5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatisthis : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x180b026902235a16);
            default Caption = LocText("Info_SFB_1_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48328), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x180b026902235a17), EConversationDebugInfo::Executing);
                
                // What is this place?
                Hero.AI.Say(LocText("Info_SFB_1_DasLager_15_00"));
                DC(int64(0x180b026902235a17), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc78a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply1);
                DC(int64(0x32770ec649fcc78a), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc78b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatisthis_Reply2);
                DC(int64(0x32770ec649fcc78b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatslife : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x5f9da8cfa3e900d7);
            default Caption = LocText("Info_SFB_5_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5b96c6ef369e9f96), Generic_AboutCamp_FM_SFB != nullptr && !Generic_AboutCamp_FM_SFB.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45));
                }
                
                return Generic_AboutCamp_FM_SFB != nullptr && !Generic_AboutCamp_FM_SFB.HasVoicetype(GameplayTag::VoiceType_G1R_Voice45);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f9da8cfa3e900d8), EConversationDebugInfo::Executing);
                
                // What's life like here?
                Hero.AI.Say(LocText("Info_SFB_5_DieLage_15_00"));
                DC(int64(0x5f9da8cfa3e900d8), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6baf), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply1);
                DC(int64(0x2b0ba04eb05f6baf), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb0), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply2);
                DC(int64(0x2b0ba04eb05f6bb0), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb1), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslife_Reply3);
                DC(int64(0x2b0ba04eb05f6bb1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhatslifehe : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x1aff03658dccd192);
            default Caption = LocText("Info_SFB_2_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply3)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4832a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1aff03658dccd193), EConversationDebugInfo::Executing);
                
                // What's life like here?
                Hero.AI.Say(LocText("Info_SFB_2_DieLage_15_00"));
                DC(int64(0x1aff03658dccd193), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb8), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply1);
                DC(int64(0x2b0ba04eb05f6bb8), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bb9), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply2);
                DC(int64(0x2b0ba04eb05f6bb9), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bba), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply3);
                DC(int64(0x2b0ba04eb05f6bba), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bbb), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhatslifehe_Reply4);
                DC(int64(0x2b0ba04eb05f6bbb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhoaround : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x180b026902235a13);
            default Caption = LocText("Info_SFB_1_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoaround_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x180b026902235a14), EConversationDebugInfo::Executing);
                
                // Who's in charge around here?
                Hero.AI.Say(LocText("Info_SFB_1_WichtigePersonen_15_00"));
                DC(int64(0x180b026902235a14), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc789), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoaround_Reply1);
                DC(int64(0x32770ec649fcc789), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhoscharge : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x1aff03658dccd18b);
            default Caption = LocText("Info_SFB_2_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x35548fea246a35d6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1aff03658dccd18c), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_SFB_2_WichtigePersonen_15_00"));
                DC(int64(0x1aff03658dccd18c), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bab), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply1);
                DC(int64(0x2b0ba04eb05f6bab), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bac), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhoscharge_Reply2);
                DC(int64(0x2b0ba04eb05f6bac), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMSFBWhosimport : UTopic_Hero__GENERIC_ABOUTCAMP_FM_SFB
        {
            default DebugId = int64(0x5f9da8cfa3e900ce);
            default Caption = LocText("Info_SFB_5_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply1)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply2)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply3)) return false;
                if (!Generic_AboutCamp_FM_SFB.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x716b63fb436e31b1), Generic_AboutCamp_FM_SFB != nullptr && Generic_AboutCamp_FM_SFB.HasVoicetype(GameplayTag::VoiceType_G1_Voice5));
                }
                
                return Generic_AboutCamp_FM_SFB != nullptr && Generic_AboutCamp_FM_SFB.HasVoicetype(GameplayTag::VoiceType_G1_Voice5);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f9da8cfa3e900cf), EConversationDebugInfo::Executing);
                
                // Who's important here?
                Hero.AI.Say(LocText("Info_SFB_5_WichtigePersonen_15_00"));
                DC(int64(0x5f9da8cfa3e900cf), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bbd), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply1);
                DC(int64(0x2b0ba04eb05f6bbd), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bbe), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply2);
                DC(int64(0x2b0ba04eb05f6bbe), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bbf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply3);
                DC(int64(0x2b0ba04eb05f6bbf), EConversationDebugInfo::Done);
                DC(int64(0x2b0ba04eb05f6bc0), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_SFB.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_SFB_FMSFBWhosimport_Reply4);
                DC(int64(0x2b0ba04eb05f6bc0), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */