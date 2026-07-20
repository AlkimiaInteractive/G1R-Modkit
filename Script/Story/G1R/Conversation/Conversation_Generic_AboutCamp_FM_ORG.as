#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_FM_ORG : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_ORG";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_FM_ORG";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_FM_ORG() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampFmOrg150287 : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0x26cbf728264455fb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445631), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445631), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_FMORGAreyouok : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xd4507429c8cbe94);
            default Caption = LocText("Info_Mine_Org_13_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGAreyouok_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4507429c8cbe95), EConversationDebugInfo::Executing);
                // Everything all right with you?
                Hero.AI.Say(LocText("Info_Mine_Org_13_DieLage_15_00"));
                DC(int64(0xd4507429c8cbe95), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc77f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGAreyouok_Reply1);
                DC(int64(0x32770ec649fcc77f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGHoware : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0x98df0de0847380ad);
            default Caption = LocText("Info_Mine_Org_7_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGHoware_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x98df0de0847380ae), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Mine_Org_7_DieLage_15_00"));
                DC(int64(0x98df0de0847380ae), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fc3888), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGHoware_Reply1);
                DC(int64(0x32770ec649fc3888), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGSomething : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xd4507429c8cbe8d);
            default Caption = LocText("Info_Mine_Org_13_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGSomething_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4507429c8cbe8e), EConversationDebugInfo::Executing);
                
                // Why don't you tell me more about this place?
                Hero.AI.Say(LocText("Info_Mine_Org_13_Mine_15_00"));
                DC(int64(0xd4507429c8cbe8e), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc77c), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGSomething_Reply1);
                DC(int64(0x32770ec649fcc77c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGTellme : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0x98df0de0847380a6);
            default Caption = LocText("Info_Mine_Org_7_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGTellme_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x35548fea246a35d1), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x98df0de0847380a7), EConversationDebugInfo::Executing);
                
                // Can you tell me more about the Camp?
                Hero.AI.Say(LocText("Info_Mine_Org_7_Mine_15_00"));
                DC(int64(0x98df0de0847380a7), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc749), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGTellme_Reply1);
                DC(int64(0x32770ec649fcc749), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGWhatgoes : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xf1de295670d1d0d9);
            default Caption = LocText("Info_Mine_Org_6_Mine_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply1)) return false;
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf1de295670d1d0da), EConversationDebugInfo::Executing);
                
                // What's going on in the Mine?
                Hero.AI.Say(LocText("Info_Mine_Org_6_Mine_15_00"));
                DC(int64(0xf1de295670d1d0da), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc781), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply1);
                DC(int64(0x32770ec649fcc781), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc782), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhatgoes_Reply2);
                DC(int64(0x32770ec649fcc782), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGWhogives : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xf1de295670d1d0dd);
            default Caption = LocText("Info_Mine_Org_6_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply1)) return false;
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf1de295670d1d0de), EConversationDebugInfo::Executing);
                
                // Who gives orders around here?
                Hero.AI.Say(LocText("Info_Mine_Org_6_WichtigePersonen_15_00"));
                DC(int64(0xf1de295670d1d0de), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc783), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply1);
                DC(int64(0x32770ec649fcc783), EConversationDebugInfo::Done);
                DC(int64(0xf1de295670d1d0e0), EConversationDebugInfo::Executing);
                
                // How did you "work the system," then?
                Hero.AI.Say(LocText("Info_Mine_Org_6_WichtigePersonen_15_01"));
                DC(int64(0xf1de295670d1d0e0), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc784), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhogives_Reply2);
                DC(int64(0x32770ec649fcc784), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGWhoscharge : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0x98df0de0847380a9);
            default Caption = LocText("Info_Mine_Org_7_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply1)) return false;
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x98df0de0847380aa), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Mine_Org_7_WichtigePersonen_15_00"));
                DC(int64(0x98df0de0847380aa), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc762), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply1);
                DC(int64(0x32770ec649fcc762), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc763), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhoscharge_Reply2);
                DC(int64(0x32770ec649fcc763), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGWhostheboss : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xd4507429c8cbe90);
            default Caption = LocText("Info_Mine_Org_13_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply1)) return false;
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4507429c8cbe91), EConversationDebugInfo::Executing);
                
                // Who's giving orders around here?
                Hero.AI.Say(LocText("Info_Mine_Org_13_WichtigePersonen_15_00"));
                DC(int64(0xd4507429c8cbe91), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc77d), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply1);
                DC(int64(0x32770ec649fcc77d), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc77e), EConversationDebugInfo::Executing);
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGWhostheboss_Reply2);
                DC(int64(0x32770ec649fcc77e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_FMORGYoudont : UTopic_Hero__GENERIC_ABOUTCAMP_FM_ORG
        {
            default DebugId = int64(0xf1de295670d1d0e2);
            default Caption = LocText("Info_Mine_Org_6_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_FM_ORG.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGYoudont_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf1de295670d1d0e3), EConversationDebugInfo::Executing);
                
                // You don't look like you're working too hard.
                Hero.AI.Say(LocText("Info_Mine_Org_6_DieLage_15_00"));
                DC(int64(0xf1de295670d1d0e3), EConversationDebugInfo::Done);
                DC(int64(0x32770ec649fcc780), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_FM_ORG.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_FM_ORG_FMORGYoudont_Reply1);
                DC(int64(0x32770ec649fcc780), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */