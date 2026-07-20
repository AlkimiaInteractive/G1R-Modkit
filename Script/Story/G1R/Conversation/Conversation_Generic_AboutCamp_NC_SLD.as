#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_NC_SLD : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_SLD";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_SLD";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_NC_SLD() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampNcSld150635 : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x26cbf728264456fd);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445702), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445702), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_NCSLDBecomemerc : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e31ff);
            default Caption = LocText("Info_Sld_11_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply3)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db7e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x380d8861ecb3db84), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                    DB(int64(0x380d8861ecb3db8a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0x380d8861ecb3db8f), G1R.FireMagesDead != 0);
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp) && G1R.FireMagesDead != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3201), EConversationDebugInfo::Executing);
                // I wanna become a mercenary for the Mages.
                Hero.AI.Say(LocText("Info_Sld_11_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e3201), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14586), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply1);
                DC(int64(0xafe1a01e90e14586), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14587), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply2);
                DC(int64(0xafe1a01e90e14587), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3204), EConversationDebugInfo::Executing);
                
                // Well ...
                Hero.AI.Say(LocText("Info_Sld_11_EinerVonEuchWerden_15_03"));
                DC(int64(0x716b63fb436e3204), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14589), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply3);
                DC(int64(0xafe1a01e90e14589), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e1458a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBecomemerc_Reply4);
                DC(int64(0xafe1a01e90e1458a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDDoyouneed : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e321d);
            default Caption = LocText("Info_Sld_8_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db67), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x380d8861ecb3db6c), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e321f), EConversationDebugInfo::Executing);
                
                // Do you need another good man?
                Hero.AI.Say(LocText("Info_Sld_8_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e321f), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b547), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply1);
                DC(int64(0xafe1a01e90e0b547), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b548), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDoyouneed_Reply2);
                DC(int64(0xafe1a01e90e0b548), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDEverything : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3210);
            default Caption = LocText("Info_Sld_11_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db74), G1R.FMTaken == 0);
                }
                
                return G1R.FMTaken == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3212), EConversationDebugInfo::Executing);
                
                // Is everything all right?
                Hero.AI.Say(LocText("Info_Sld_11_DieLage_15_00"));
                DC(int64(0x716b63fb436e3212), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14582), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply1);
                DC(int64(0xafe1a01e90e14582), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3214), EConversationDebugInfo::Executing);
                
                // For now?
                Hero.AI.Say(LocText("Info_Sld_11_DieLage_15_02"));
                DC(int64(0x716b63fb436e3214), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14583), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply2);
                DC(int64(0xafe1a01e90e14583), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14584), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDEverything_Reply3);
                DC(int64(0xafe1a01e90e14584), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDHoware : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3230);
            default Caption = LocText("Info_Sld_8_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDHoware_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db54), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3232), EConversationDebugInfo::Executing);
                
                // How are things?
                Hero.AI.Say(LocText("Info_Sld_8_DieLage_15_00"));
                DC(int64(0x716b63fb436e3232), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b542), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDHoware_Reply1);
                DC(int64(0xafe1a01e90e0b542), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDInterested : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3217);
            default Caption = LocText("Info_Sld_11_Krautprobe_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f481ac), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                    DB(int64(0x5f3c8045a840718c), Generic_AboutCamp_NC_SLD != nullptr && !Generic_AboutCamp_NC_SLD.HasItem(UItMi_Joint_01, 1, 0));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_NC_SLD != nullptr && Generic_AboutCamp_NC_SLD.HasItem(UItMi_Joint_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3219), EConversationDebugInfo::Executing);
                
                // Interested in some herb rolls?
                Hero.AI.Say(LocText("Info_Sld_11_Krautprobe_15_00"));
                DC(int64(0x716b63fb436e3219), EConversationDebugInfo::Done);
                DB(int64(0x4e041d4835f48268), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0xafe1a01e90e1457e), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES);
                    DC(int64(0xafe1a01e90e1457e), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f48279), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f48279), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f4827b), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_SLD, UItMi_Joint_01, 1);
                    DC(int64(0x4e041d4835f4827b), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a8407178), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0x5f3c8045a8407178), EConversationDebugInfo::Done);
                    DC(int64(0x9f61f5828e358fae), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyYES2);
                    DC(int64(0x9f61f5828e358fae), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCSLDInterested_exit_1");
                }
                else
                {
                    DC(int64(0xafe1a01e90e1457f), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDInterested_ReplyNO);
                    DC(int64(0xafe1a01e90e1457f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCSLDInterested_exit_2");
                }
            }
        }
        
        
        class UInfo_NCSLDSmokerolls : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3234);
            default Caption = LocText("Info_Sld_8_Krautprobe_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f481ac), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                    DB(int64(0x5f3c8045a840718c), Generic_AboutCamp_NC_SLD != nullptr && !Generic_AboutCamp_NC_SLD.HasItem(UItMi_Joint_01, 1, 0));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_NC_SLD != nullptr && Generic_AboutCamp_NC_SLD.HasItem(UItMi_Joint_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3236), EConversationDebugInfo::Executing);
                // I've got smoke rolls - do you want one?
                Hero.AI.Say(LocText("Info_Sld_8_Krautprobe_15_00"));
                DC(int64(0x716b63fb436e3236), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b54c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_Reply1);
                DC(int64(0xafe1a01e90e0b54c), EConversationDebugInfo::Done);
                DB(int64(0x5f3c8045a84071f6), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0x5f3c8045a8407178), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0x5f3c8045a8407178), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a840720e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_SLD, UItMi_Joint_01, 1);
                    DC(int64(0x5f3c8045a840720e), EConversationDebugInfo::Done);
                    DC(int64(0xafe1a01e90e0b54e), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES1);
                    DC(int64(0xafe1a01e90e0b54e), EConversationDebugInfo::Done);
                    DC(int64(0xafe1a01e90e0b54f), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyYES2);
                    DC(int64(0xafe1a01e90e0b54f), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a840726f), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AddItemToInventory(UItMi_Orenugget, 10);
                    DC(int64(0x5f3c8045a840726f), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a8407279), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.GiveItemTo(Hero, UItMi_Orenugget, 10);
                    DC(int64(0x5f3c8045a8407279), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCSLDSmokerolls_exit_1");
                    DC(int64(0x5f3c8045a8407237), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x5f3c8045a8407237), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xafe1a01e90e0b550), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDSmokerolls_ReplyNO);
                    DC(int64(0xafe1a01e90e0b550), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCSLDSmokerolls_exit_2");
                    DC(int64(0x5f3c8045a8407228), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x5f3c8045a8407228), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UInfo_NCSLDTroubleCamp : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e320c);
            default Caption = LocText("Info_Sld_11_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDTroubleCamp_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e320e), EConversationDebugInfo::Executing);
                // Is there any trouble in the Camp?
                Hero.AI.Say(LocText("Info_Sld_11_DasLager_15_00"));
                DC(int64(0x716b63fb436e320e), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14585), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDTroubleCamp_Reply1);
                DC(int64(0xafe1a01e90e14585), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDWhatcan : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3229);
            default Caption = LocText("Info_Sld_8_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply3)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db5a), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e322b), EConversationDebugInfo::Executing);
                
                // What can you tell me about this Camp?
                Hero.AI.Say(LocText("Info_Sld_8_DasLager_15_00"));
                DC(int64(0x716b63fb436e322b), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b543), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply1);
                DC(int64(0xafe1a01e90e0b543), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b544), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply2);
                DC(int64(0xafe1a01e90e0b544), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b545), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply3);
                DC(int64(0xafe1a01e90e0b545), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b546), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhatcan_Reply4);
                DC(int64(0xafe1a01e90e0b546), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDWhoischarge : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3207);
            default Caption = LocText("Info_Sld_11_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db6e), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                    DB(int64(0xb5690bae015638b9), G1R != nullptr && G1R.IsInChapter(2));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3209), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Sld_11_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3209), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14580), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply1);
                DC(int64(0xafe1a01e90e14580), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e14581), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoischarge_Reply2);
                DC(int64(0xafe1a01e90e14581), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCSLDWhoscalling : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x716b63fb436e3222);
            default Caption = LocText("Info_Sld_8_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply1)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply2)) return false;
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x380d8861ecb3db60), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xb5690bae015638b8), G1R != nullptr && G1R.IsInChapter(1));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e3224), EConversationDebugInfo::Executing);
                
                // Who's calling the shots in here?
                Hero.AI.Say(LocText("Info_Sld_8_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e3224), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b549), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply1);
                DC(int64(0xafe1a01e90e0b549), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e3226), EConversationDebugInfo::Executing);
                
                // So it's really the Mages who are in charge.
                Hero.AI.Say(LocText("Info_Sld_8_WichtigePersonen_15_02"));
                DC(int64(0x716b63fb436e3226), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b54a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply2);
                DC(int64(0xafe1a01e90e0b54a), EConversationDebugInfo::Done);
                DC(int64(0xafe1a01e90e0b54b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWhoscalling_Reply3);
                DC(int64(0xafe1a01e90e0b54b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDAgainstus : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0xed4abbb5972f519b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDAgainstus);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDAgainstus_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51eb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132cf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDAgainstus_Ambient1);
                DC(int64(0xf2f16114bf1132cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDBlue : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x8f9c81f8353267cf);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDBlue);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBlue_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8f9c81f8353267c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xc2bbabf13f180ba2), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132cb), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDBlue_Ambient1);
                DC(int64(0xf2f16114bf1132cb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDDosomething : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0xed4abbb5972f51a1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDDosomething);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDosomething_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51eb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132d1), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDDosomething_Ambient1);
                DC(int64(0xf2f16114bf1132d1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDFunny : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x36d532d724ac1813);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDFunny);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDFunny_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1817), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f));
                    DB(int64(0x36d532d724ac1818), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x36d532d724ac1841), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132cc), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDFunny_Ambient1);
                DC(int64(0xf2f16114bf1132cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDLast : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x8f9c81f8353267ca);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDLast);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDLast_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8f9c81f8353267c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xc2bbabf13f180ba1), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132ca), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDLast_Ambient1);
                DC(int64(0xf2f16114bf1132ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDNotime : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x36d532d724ac18ca);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDNotime);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18ca));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18ca));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDNotime_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 700.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 700.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132cd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDNotime_Ambient1);
                DC(int64(0xf2f16114bf1132cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDThemages : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0xed4abbb5972f51a7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDThemages);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThemages_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51eb), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132d0), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThemages_Ambient1);
                DC(int64(0xf2f16114bf1132d0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDThetime : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x36d532d724ac18cf);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDThetime);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18cf));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18cf));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThetime_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 700.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 700.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132ce), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDThetime_Ambient1);
                DC(int64(0xf2f16114bf1132ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCSLDWelcome : UTopic_Hero__GENERIC_ABOUTCAMP_NC_SLD
        {
            default DebugId = int64(0x8f9c81f8353267b8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCSLDWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_SLD.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWelcome_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8f9c81f8353267c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xc2bbabf13f180ba0), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_SLD, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf2f16114bf1132c9), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_SLD.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_SLD_NCSLDWelcome_Ambient1);
                DC(int64(0xf2f16114bf1132c9), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */