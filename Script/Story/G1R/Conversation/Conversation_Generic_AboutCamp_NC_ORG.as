#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_NC_ORG : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_ORG";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_ORG";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_NC_ORG() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampNcOrg150596 : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x26cbf728264456d1);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf728264456d3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf728264456d3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_NCORGCanIherb : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31f9);
            default Caption = LocText("Info_Org_7_Krautprobe_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES2)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f481ac), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                    DB(int64(0x5f3c8045a840718c), Generic_AboutCamp_NC_ORG != nullptr && !Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_NC_ORG != nullptr && Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31fb), EConversationDebugInfo::Executing);
                // Can I interest you in a herb roll?
                Hero.AI.Say(LocText("Info_Org_7_Krautprobe_15_00"));
                DC(int64(0x716b63fb436e31fb), EConversationDebugInfo::Done);
                DB(int64(0x4e041d4835f48209), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0x4e041d4835f48238), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_ORG, UItMi_Joint_01, 1);
                    DC(int64(0x4e041d4835f48238), EConversationDebugInfo::Done);
                    DC(int64(0xbeb4a8daf9c5c62f), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES);
                    DC(int64(0xbeb4a8daf9c5c62f), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f4824e), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AddItemToInventory(UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f4824e), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f4825d), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.GiveItemTo(Hero, UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f4825d), EConversationDebugInfo::Done);
                    DC(int64(0xfead4c0fd871b734), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0xfead4c0fd871b734), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a8407157), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.StoreStoryEventInMemory(n"SellWeed_Daily", Hero);
                    DC(int64(0x5f3c8045a8407157), EConversationDebugInfo::Done);
                    DC(int64(0x9f61f5828e358f93), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyYES2);
                    DC(int64(0x9f61f5828e358f93), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGCanIherb_exit_1");
                }
                else
                {
                    DC(int64(0xbeb4a8daf9c5c62e), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGCanIherb_ReplyNO);
                    DC(int64(0xbeb4a8daf9c5c62e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGCanIherb_exit_2");
                }
            }
        }
        
        
        class UInfo_NCORGHowarething : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x4717c7c7e533d1e);
            default Caption = LocText("Info_Org_6_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4717c7c7e533d1f), EConversationDebugInfo::Executing);
                // How are things?
                Hero.AI.Say(LocText("Info_Org_6_DieLage_15_00"));
                DC(int64(0x4717c7c7e533d1f), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5ce), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply1);
                DC(int64(0xbeb4a8daf9c5c5ce), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5cf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowarething_Reply2);
                DC(int64(0xbeb4a8daf9c5c5cf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGHowits : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31d2);
            default Caption = LocText("Info_Org_13_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowits_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31d4), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Org_13_DieLage_15_00"));
                DC(int64(0x716b63fb436e31d4), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5ee), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGHowits_Reply1);
                DC(int64(0xbeb4a8daf9c5c5ee), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGIhavetojoin : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31e1);
            default Caption = LocText("Info_Org_7_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012db), EConversationDebugInfo::Unimplemented);
                    DB(int64(0x79d923a3093e9e5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x79d923a3093e9e6), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0xb5690bae01563972), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted());
                }
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31e3), EConversationDebugInfo::Executing);
                
                // What do I have to do to join this Camp?
                Hero.AI.Say(LocText("Info_Org_7_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e31e3), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c633), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply1);
                DC(int64(0xbeb4a8daf9c5c633), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e31e5), EConversationDebugInfo::Executing);
                
                // And how am I supposed to do that?
                Hero.AI.Say(LocText("Info_Org_7_EinerVonEuchWerden_15_02"));
                DC(int64(0x716b63fb436e31e5), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c634), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIhavetojoin_Reply2);
                DC(int64(0xbeb4a8daf9c5c634), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGIwannajoin : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x4717c7c7e533d0f);
            default Caption = LocText("Info_Org_6_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply0)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4717c7c7e533d10), EConversationDebugInfo::Executing);
                
                // I wanna join your crew!
                Hero.AI.Say(LocText("Info_Org_6_EinerVonEuchWerden_15_00"));
                DC(int64(0x4717c7c7e533d10), EConversationDebugInfo::Done);
                DC(int64(0x14cbef70f45508a9), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply0);
                DC(int64(0x14cbef70f45508a9), EConversationDebugInfo::Done);
                DC(int64(0x79d923a3093ea11), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply1);
                DC(int64(0x79d923a3093ea11), EConversationDebugInfo::Done);
                DC(int64(0x4717c7c7e533d13), EConversationDebugInfo::Executing);
                
                // Like what?
                Hero.AI.Say(LocText("Info_Org_6_EinerVonEuchWerden_15_03"));
                DC(int64(0x4717c7c7e533d13), EConversationDebugInfo::Done);
                DC(int64(0x9b6042c796841bad), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannajoin_Reply2);
                DC(int64(0x9b6042c796841bad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGIwannaknow : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31ce);
            default Caption = LocText("Info_Org_13_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannaknow_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31d0), EConversationDebugInfo::Executing);
                
                // I wanna know more about this Camp.
                Hero.AI.Say(LocText("Info_Org_13_DasLager_15_00"));
                DC(int64(0x716b63fb436e31d0), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5f1), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGIwannaknow_Reply1);
                DC(int64(0xbeb4a8daf9c5c5f1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGSmokerolls : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x4717c7c7e533d22);
            default Caption = LocText("Info_Org_6_Krautprobe_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES2)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f481ac), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                    DB(int64(0x5f3c8045a840718c), Generic_AboutCamp_NC_ORG != nullptr && !Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0));
                    DC(int64(0x4638bb553280130e), EConversationDebugInfo::Unimplemented);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_NC_ORG != nullptr && Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0))
                    return false;
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4717c7c7e533d23), EConversationDebugInfo::Executing);
                
                // I've got some smoke rolls. You want one?
                Hero.AI.Say(LocText("Info_Org_6_Krautprobe_15_00"));
                DC(int64(0x4717c7c7e533d23), EConversationDebugInfo::Done);
                DB(int64(0x4e041d4835f481d0), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0x4e041d4835f481da), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_ORG, UItMi_Joint_01, 1);
                    DC(int64(0x4e041d4835f481da), EConversationDebugInfo::Done);
                    DC(int64(0xbeb4a8daf9c5c61a), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES1);
                    DC(int64(0xbeb4a8daf9c5c61a), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f481ea), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AddItemToInventory(UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f481ea), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f481f5), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.GiveItemTo(Hero, UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f481f5), EConversationDebugInfo::Done);
                    DC(int64(0xfead4c0fd871b732), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0xfead4c0fd871b732), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a8407159), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.StoreStoryEventInMemory(n"SellWeed_Daily", Hero);
                    DC(int64(0x5f3c8045a8407159), EConversationDebugInfo::Done);
                    DC(int64(0x9b6042c796841bb2), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyYES2);
                    DC(int64(0x9b6042c796841bb2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGSmokerolls_exit_1");
                }
                else
                {
                    DC(int64(0x9b6042c796841baf), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGSmokerolls_ReplyNO);
                    DC(int64(0x9b6042c796841baf), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGSmokerolls_exit_2");
                }
            }
        }
        
        
        class UInfo_NCORGTellme : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31ec);
            default Caption = LocText("Info_Org_7_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply2)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012dc), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31ee), EConversationDebugInfo::Executing);
                // What can you tell me about this Camp?
                Hero.AI.Say(LocText("Info_Org_7_DasLager_15_00"));
                DC(int64(0x716b63fb436e31ee), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c630), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply1);
                DC(int64(0xbeb4a8daf9c5c630), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c631), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply2);
                DC(int64(0xbeb4a8daf9c5c631), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e31f1), EConversationDebugInfo::Executing);
                
                // What's your deal with Gomez?
                Hero.AI.Say(LocText("Info_Org_7_DasLager_15_03"));
                DC(int64(0x716b63fb436e31f1), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c632), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTellme_Reply3);
                DC(int64(0xbeb4a8daf9c5c632), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWhatdoIhave : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31c6);
            default Caption = LocText("Info_Org_13_EinerVonEuchWerden_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatdoIhave_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48367), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DC(int64(0x4638bb553280132b), EConversationDebugInfo::Unimplemented);
                    DB(int64(0xb5690bae015638c6), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31c8), EConversationDebugInfo::Executing);
                
                // What do I have to do to join the Camp?
                Hero.AI.Say(LocText("Info_Org_13_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e31c8), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5ef), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatdoIhave_Reply1);
                DC(int64(0xbeb4a8daf9c5c5ef), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWhatIknow : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x4717c7c7e533d1a);
            default Caption = LocText("Info_Org_6_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4717c7c7e533d1b), EConversationDebugInfo::Executing);
                
                // What should I know about this place?
                Hero.AI.Say(LocText("Info_Org_6_DasLager_15_00"));
                DC(int64(0x4717c7c7e533d1b), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5cc), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply1);
                DC(int64(0xbeb4a8daf9c5c5cc), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5cd), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhatIknow_Reply2);
                DC(int64(0xbeb4a8daf9c5c5cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWhoscalling : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31ca);
            default Caption = LocText("Info_Org_13_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhoscalling_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31cc), EConversationDebugInfo::Executing);
                
                // Who's calling the shots around here?
                Hero.AI.Say(LocText("Info_Org_13_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e31cc), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5f0), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhoscalling_Reply1);
                DC(int64(0xbeb4a8daf9c5c5f0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWhosin : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x4717c7c7e533d15);
            default Caption = LocText("Info_Org_6_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply2)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DC(int64(0x4638bb55328012e0), EConversationDebugInfo::Unimplemented);
                }
                
                return /* Skip: has_assigned_daily_routine */ false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4717c7c7e533d16), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Org_6_WichtigePersonen_15_00"));
                DC(int64(0x4717c7c7e533d16), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5c9), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply1);
                DC(int64(0xbeb4a8daf9c5c5c9), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5ca), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply2);
                DC(int64(0xbeb4a8daf9c5c5ca), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5cb), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosin_Reply3);
                DC(int64(0xbeb4a8daf9c5c5cb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWhosleader : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31e7);
            default Caption = LocText("Info_Org_7_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x716b63fb436e31e8), Generic_AboutCamp_NC_ORG != nullptr && Generic_AboutCamp_NC_ORG.HasVoicetype(GameplayTag::VoiceType_G1_Voice7));
                    DB(int64(0x4e041d4835f48368), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DC(int64(0x4638bb55328012de), EConversationDebugInfo::Unimplemented);
                }
                
                if (Generic_AboutCamp_NC_ORG != nullptr && !Generic_AboutCamp_NC_ORG.HasVoicetype(GameplayTag::VoiceType_G1_Voice7))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31e9), EConversationDebugInfo::Executing);
                
                // Who's your leader?
                Hero.AI.Say(LocText("Info_Org_7_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e31e9), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c621), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply1);
                DC(int64(0xbeb4a8daf9c5c621), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c622), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWhosleader_Reply2);
                DC(int64(0xbeb4a8daf9c5c622), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGWorkaround : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31f3);
            default Caption = LocText("Info_Org_7_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply2)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply3)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x716b63fb436e31f4), Generic_AboutCamp_NC_ORG != nullptr && Generic_AboutCamp_NC_ORG.HasVoicetype(GameplayTag::VoiceType_G1_Voice7));
                    DC(int64(0x4638bb55328012dd), EConversationDebugInfo::Unimplemented);
                }
                
                if (Generic_AboutCamp_NC_ORG != nullptr && !Generic_AboutCamp_NC_ORG.HasVoicetype(GameplayTag::VoiceType_G1_Voice7))
                    return false;
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31f5), EConversationDebugInfo::Executing);
                
                // How do things work around here?
                Hero.AI.Say(LocText("Info_Org_7_DieLage_15_00"));
                DC(int64(0x716b63fb436e31f5), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c623), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply1);
                DC(int64(0xbeb4a8daf9c5c623), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c62c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply2);
                DC(int64(0xbeb4a8daf9c5c62c), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c62d), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGWorkaround_Reply3);
                DC(int64(0xbeb4a8daf9c5c62d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCORGYoulook : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x716b63fb436e31d6);
            default Caption = LocText("Info_Org_13_Krautprobe_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_Reply1)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f481ac), Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted());
                    DB(int64(0x5f3c8045a840718c), Generic_AboutCamp_NC_ORG != nullptr && !Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0));
                    DC(int64(0x4638bb553280132a), EConversationDebugInfo::Unimplemented);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_SPREADJOINTS != nullptr && !Quest::NewCamp_NCCHAPTER1_SPREADJOINTS.HasBeenStarted())
                    return false;
                
                if (Generic_AboutCamp_NC_ORG != nullptr && Generic_AboutCamp_NC_ORG.HasItem(UItMi_Joint_01, 1, 0))
                    return false;
                
                if (/* Skip: has_assigned_daily_routine */ false)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e31d8), EConversationDebugInfo::Executing);
                
                // You look like you could do with some swampweed.
                Hero.AI.Say(LocText("Info_Org_13_Krautprobe_15_00"));
                DC(int64(0x716b63fb436e31d8), EConversationDebugInfo::Done);
                DC(int64(0xbeb4a8daf9c5c5f2), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_Reply1);
                DC(int64(0xbeb4a8daf9c5c5f2), EConversationDebugInfo::Done);
                DB(int64(0x4e041d4835f481b6), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0x4e041d4835f481c2), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_ORG, UItMi_Joint_01, 1);
                    DC(int64(0x4e041d4835f481c2), EConversationDebugInfo::Done);
                    DC(int64(0x4e041d4835f481c4), EConversationDebugInfo::Executing);
                    Hero.AddItemToInventory(UItMi_Orenugget, 10);
                    DC(int64(0x4e041d4835f481c4), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a8407115), EConversationDebugInfo::Executing);
                    G1R.NC_JointsDistributed += 1;
                    DC(int64(0x5f3c8045a8407115), EConversationDebugInfo::Done);
                    DC(int64(0x5f3c8045a840715b), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.StoreStoryEventInMemory(n"SellWeed_Daily", Hero);
                    DC(int64(0x5f3c8045a840715b), EConversationDebugInfo::Done);
                    DC(int64(0xbeb4a8daf9c5c5f4), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyYES);
                    DC(int64(0xbeb4a8daf9c5c5f4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGYoulook_exit_1");
                }
                else
                {
                    DC(int64(0xbeb4a8daf9c5c5f3), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGYoulook_ReplyNO);
                    DC(int64(0xbeb4a8daf9c5c5f3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCORGYoulook_exit_2");
                }
            }
        }
        
        
        class UNCORGBackMine : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0xed4abbb5972f513b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGBackMine);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xed4abbb5972f513b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBackMine_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f50e6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0xed4abbb5972f5124), G1R != nullptr && G1R.IsInChapter(4));
                    DB(int64(0xed4abbb5972f51d4), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad138), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBackMine_Reply1);
                DC(int64(0x8a90f148bbaad138), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGBrother : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x36d532d724ac18da);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGBrother);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18da));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18da));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBrother_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad137), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGBrother_Reply1);
                DC(int64(0x8a90f148bbaad137), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGDontcare : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0xed4abbb5972f514f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGDontcare);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGDontcare_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f518b), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0xed4abbb5972f5192), G1R != nullptr && !G1R.HasReachedChapter(6));
                    DB(int64(0xed4abbb5972f51e8), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f));
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(6))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad13a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGDontcare_Reply1);
                DC(int64(0x8a90f148bbaad13a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGGod : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x36d532d724ac1877);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGGod);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGGod_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1817), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f));
                    DB(int64(0x36d532d724ac1818), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x36d532d724ac1841), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded());
                    DB(int64(0x36d532d724ac1885), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad134), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGGod_Reply1);
                DC(int64(0x8a90f148bbaad134), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGMages : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x36d532d724ac187b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGMages);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGMages_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1817), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f));
                    DB(int64(0x36d532d724ac1818), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x36d532d724ac1841), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded());
                    DB(int64(0x36d532d724ac1885), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad135), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGMages_Reply1);
                DC(int64(0x8a90f148bbaad135), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGOldCamp : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x36d532d724ac18d6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGOldCamp);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18d6));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18d6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGOldCamp_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad136), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGOldCamp_Reply1);
                DC(int64(0x8a90f148bbaad136), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGReds : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0x36d532d724ac1870);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGReds);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGReds_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1817), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f));
                    DB(int64(0x36d532d724ac1818), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                    DB(int64(0x36d532d724ac1841), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded());
                    DB(int64(0x36d532d724ac1885), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 700.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad133), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGReds_Reply1);
                DC(int64(0x8a90f148bbaad133), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCORGTheypay : UTopic_Hero__GENERIC_ABOUTCAMP_NC_ORG
        {
            default DebugId = int64(0xed4abbb5972f5145);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCORGTheypay);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0xed4abbb5972f5145));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTheypay_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xed4abbb5972f50e6), Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded());
                    DB(int64(0xed4abbb5972f5124), G1R != nullptr && G1R.IsInChapter(4));
                    DB(int64(0xed4abbb5972f51d4), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.HasSucceeded())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(4))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_ORG, 600.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad139), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_ORG_NCORGTheypay_Reply1);
                DC(int64(0x8a90f148bbaad139), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */