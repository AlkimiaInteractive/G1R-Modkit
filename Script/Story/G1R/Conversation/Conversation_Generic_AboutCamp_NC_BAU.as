#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_NC_BAU : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_BAU";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_NC_BAU";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_NC_BAU() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampNcBau150561 : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x26cbf728264456a6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf728264456a9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf728264456a9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_NCBAUAreyou : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x178c626039092edd);
            default Caption = LocText("Info_Bau_2_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUAreyou_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e28c85203723b15), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice30));
                    DB(int64(0x1e28c85203723b15), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice24));
                    DB(int64(0x1e28c85203723b15), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice27));
                    DB(int64(0x1f26131dd07cb040), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x1f26131dd07cb04b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                if (Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice30))
                    return true;
                
                if (Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice24))
                    return true;
                
                if (Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasVoicetype(GameplayTag::VoiceType_G1R_Voice27))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x178c626039092ede), EConversationDebugInfo::Executing);
                // Are you all right?
                Hero.AI.Say(LocText("Info_Bau_2_DieLage_15_00"));
                DC(int64(0x178c626039092ede), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8f1186), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUAreyou_Reply1);
                DC(int64(0x732c196a1e8f1186), EConversationDebugInfo::Done);
                DC(int64(0xa80c2176270be0f6), EConversationDebugInfo::Executing);
                
                // I see ...
                Hero.AI.Say(LocText("Info_Bau_2_WichtigePersonen_15_02"));
                DC(int64(0xa80c2176270be0f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUHowsitgo : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x9597734ef34a77f9);
            default Caption = LocText("Info_Bau_4_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowsitgo_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9597734ef34a77fa), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("Info_Bau_4_DieLage_15_00"));
                DC(int64(0x9597734ef34a77fa), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa147), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowsitgo_Reply1);
                DC(int64(0x732c196a1e8fa147), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUHowthings : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x81fa8aa423b87430);
            default Caption = LocText("Info_Bau_9_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowthings_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81fa8aa423b87431), EConversationDebugInfo::Executing);
                
                // How are things?
                Hero.AI.Say(LocText("Info_Bau_9_DieLage_15_00"));
                DC(int64(0x81fa8aa423b87431), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa158), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUHowthings_Reply1);
                DC(int64(0x732c196a1e8fa158), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAULeader : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x9597734ef34a77f2);
            default Caption = LocText("Info_Bau_4_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply1)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f26131dd07cb056), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9597734ef34a77f3), EConversationDebugInfo::Executing);
                
                // Do you have a leader?
                Hero.AI.Say(LocText("Info_Bau_4_WichtigePersonen_15_00"));
                DC(int64(0x9597734ef34a77f3), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa148), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply1);
                DC(int64(0x732c196a1e8fa148), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa149), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAULeader_Reply2);
                DC(int64(0x732c196a1e8fa149), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUSurethings : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x81fa8aa423b87428);
            default Caption = LocText("Info_Bau_9_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply1)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81fa8aa423b87429), EConversationDebugInfo::Executing);
                
                // Who makes sure things run smoothly out here on the ...
                Hero.AI.Say(LocText("Info_Bau_9_WichtigePersonen_15_00"));
                DC(int64(0x81fa8aa423b87429), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa159), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply1);
                DC(int64(0x732c196a1e8fa159), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa15a), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUSurethings_Reply2);
                DC(int64(0x732c196a1e8fa15a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUTellmecamp : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x81fa8aa423b8742c);
            default Caption = LocText("Info_Bau_9_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply1)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48338), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81fa8aa423b8742d), EConversationDebugInfo::Executing);
                
                // Tell me about this Camp.
                Hero.AI.Say(LocText("Info_Bau_9_DasLager_15_00"));
                DC(int64(0x81fa8aa423b8742d), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa156), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply1);
                DC(int64(0x732c196a1e8fa156), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa157), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUTellmecamp_Reply2);
                DC(int64(0x732c196a1e8fa157), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUWater : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x9597734ef34a77fc);
            default Caption = LocText("Info_Bau_4_Wasser_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe9d2afc3c1b4560d), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223c), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0xa086f46286fe223d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0x3fa7e33579bb6a80), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0xe9d2afc3c1b4560e), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223b), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0x3fa7e33579bb6a81), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9597734ef34a77fd), EConversationDebugInfo::Executing);
                
                // Lefty sent me. I got some water for you.
                Hero.AI.Say(LocText("Info_Bau_4_Wasser_15_00"));
                DC(int64(0x9597734ef34a77fd), EConversationDebugInfo::Done);
                DB(int64(0x99e168389af3f37e), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0x99e168389af3f3aa), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_BAU, UItFo_Potion_Water_01, 1);
                    DC(int64(0x99e168389af3f3aa), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188dd30), Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting());
                    
                    if (Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting())
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c57a), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c57a), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c57c), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c57c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                    G1R.Peasants_have_water += 1;
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                    DC(int64(0x732c196a1e8fa154), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyYES);
                    DC(int64(0x732c196a1e8fa154), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188ddd0), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                    
                    if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                    {
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_Info_NCBAUWater_exit_1");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_Info_NCBAUWater_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x732c196a1e8fa153), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWater_ReplyNO);
                    DC(int64(0x732c196a1e8fa153), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCBAUWater_exit_3");
                }
            }
        }
        
        
        class UInfo_NCBAUWaterfromL : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x81fa8aa423b87433);
            default Caption = LocText("Info_Bau_9_Wasser_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe9d2afc3c1b4560d), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223c), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0xa086f46286fe223d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0x3fa7e33579bb6a80), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0xe9d2afc3c1b4560e), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223b), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0x3fa7e33579bb6a81), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81fa8aa423b87434), EConversationDebugInfo::Executing);
                // Lefty sent me. I got some water for you.
                Hero.AI.Say(LocText("Info_Bau_9_Wasser_15_00"));
                DC(int64(0x81fa8aa423b87434), EConversationDebugInfo::Done);
                DB(int64(0x99e168389af3f399), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0x99e168389af3f3b7), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_BAU, UItFo_Potion_Water_01, 1);
                    DC(int64(0x99e168389af3f3b7), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188de90), Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting());
                    
                    if (Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting())
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c584), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c584), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c582), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c582), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                    G1R.Peasants_have_water += 1;
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                    DC(int64(0x732c196a1e8fa165), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyYES);
                    DC(int64(0x732c196a1e8fa165), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188dedc), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                    
                    if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                    {
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_Info_NCBAUWaterfromL_exit_1");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_Info_NCBAUWaterfromL_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x732c196a1e8fa164), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterfromL_ReplyNO);
                    DC(int64(0x732c196a1e8fa164), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCBAUWaterfromL_exit_3");
                }
            }
        }
        
        
        class UInfo_NCBAUWaterLefty : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x178c626039092ee1);
            default Caption = LocText("Info_Bau_2_Wasser_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyYES)) return false;
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyNO)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe9d2afc3c1b4560d), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223c), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0xa086f46286fe223d), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0x3fa7e33579bb6a80), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0xe9d2afc3c1b4560e), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0xa086f46286fe223b), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                    DB(int64(0x3fa7e33579bb6a81), Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning() && Generic_AboutCamp_NC_BAU != nullptr && !Generic_AboutCamp_NC_BAU.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x178c626039092ee2), EConversationDebugInfo::Executing);
                // Lefty sent me. I got some water for you.
                Hero.AI.Say(LocText("Info_Bau_2_Wasser_15_00"));
                DC(int64(0x178c626039092ee2), EConversationDebugInfo::Done);
                DB(int64(0x99e168389af3f3cf), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0x99e168389af3f3ea), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Generic_AboutCamp_NC_BAU, UItFo_Potion_Water_01, 1);
                    DC(int64(0x99e168389af3f3ea), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188dfc6), Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting());
                    
                    if (Generic_AboutCamp_NC_BAU != nullptr && Generic_AboutCamp_NC_BAU.IsSitting())
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c580), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x123f53d08c63c580), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                        RequestCameraReverseShot();
                        DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                        DC(int64(0x123f53d08c63c57e), EConversationDebugInfo::Executing);
                        Generic_AboutCamp_NC_BAU.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x123f53d08c63c57e), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                    G1R.Peasants_have_water += 1;
                    DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                    DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                    DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                    DC(int64(0x732c196a1e8f1184), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyYES);
                    DC(int64(0x732c196a1e8f1184), EConversationDebugInfo::Done);
                    DB(int64(0xd22f0664a188e01c), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                    
                    if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                    {
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Executing);
                        Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                        DC(int64(0x61a39c21bde6d1a2), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_Info_NCBAUWaterLefty_exit_1");
                    }
                    else
                    {
                        
                        Other.Remember(n"choice_Info_NCBAUWaterLefty_exit_2");
                    }
                }
                else
                {
                    DC(int64(0x732c196a1e8f1183), EConversationDebugInfo::Executing);
                    Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWaterLefty_ReplyNO);
                    DC(int64(0x732c196a1e8f1183), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"Info_NCBAUWaterLefty_exit_3");
                }
            }
        }
        
        
        class UInfo_NCBAUWhatcan : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x178c626039092eda);
            default Caption = LocText("Info_Bau_2_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatcan_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1f26131dd07cb02c), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                }
                
                return Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x178c626039092edb), EConversationDebugInfo::Executing);
                // What can you tell me about the camp?
                Hero.AI.Say(LocText("Info_Bau_2_DasLager_15_00"));
                DC(int64(0x178c626039092edb), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8f1185), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatcan_Reply1);
                DC(int64(0x732c196a1e8f1185), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUWhatshould : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x9597734ef34a77f6);
            default Caption = LocText("Info_Bau_4_DasLager_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatshould_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f48336), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9597734ef34a77f7), EConversationDebugInfo::Executing);
                
                // What should I know about this place?
                Hero.AI.Say(LocText("Info_Bau_4_DasLager_15_00"));
                DC(int64(0x9597734ef34a77f7), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8fa146), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUWhatshould_Reply1);
                DC(int64(0x732c196a1e8fa146), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_NCBAUYouwork : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x178c626039092ed6);
            default Caption = LocText("Info_Bau_2_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUYouwork_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x178c626039092ed7), EConversationDebugInfo::Executing);
                
                // You work on the rice fields by choice?
                Hero.AI.Say(LocText("Info_Bau_2_WichtigePersonen_15_00"));
                DC(int64(0x178c626039092ed7), EConversationDebugInfo::Done);
                DC(int64(0x732c196a1e8f1188), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUYouwork_Reply1);
                DC(int64(0x732c196a1e8f1188), EConversationDebugInfo::Done);
                DC(int64(0x178c626039092ed9), EConversationDebugInfo::Executing);
                
                // I see ...
                Hero.AI.Say(LocText("Info_Bau_2_WichtigePersonen_15_02"));
                DC(int64(0x178c626039092ed9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCBAUBadtime : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x36d532d724ac18c2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCBAUBadtime);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18c2));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18c2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBadtime_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f));
                    DB(int64(0x36d532d724ac18a9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad0c0), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBadtime_Reply1);
                DC(int64(0x8a90f148bbaad0c0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCBAUBeliar : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x36d532d724ac18a5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCBAUBeliar);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18a5));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18a5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBeliar_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f));
                    DB(int64(0x36d532d724ac18a9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad0be), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBeliar_Reply1);
                DC(int64(0x8a90f148bbaad0be), EConversationDebugInfo::Done);
            }
        }
        
        
        class UNCBAUBelieve : UTopic_Hero__GENERIC_ABOUTCAMP_NC_BAU
        {
            default DebugId = int64(0x36d532d724ac18be);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UNCBAUBelieve);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FSMIFZI_20240628_230943"), int64(0x36d532d724ac18be));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("INFO_RIORDIAN_MESSAGEWHY_14_06"), int64(0x36d532d724ac18be));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_NC_BAU.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBelieve_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4d34737b412a041), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f));
                    DB(int64(0x36d532d724ac18a9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_NC_BAU, 700.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a90f148bbaad0bf), EConversationDebugInfo::Executing);
                Generic_AboutCamp_NC_BAU.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_NC_BAU_NCBAUBelieve_Reply1);
                DC(int64(0x8a90f148bbaad0bf), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */