#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_SC_TPL : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_SC_TPL";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_SC_TPL";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_SC_TPL() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericAboutcampScTpl150872 : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x26cbf72826445733);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf72826445735), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445735), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UInfo_SCTPLEAboutcamp : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33ee);
            default Caption = LocText("Info_Tpl_8_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply1)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4837f), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x4ffb106f82233f13), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33f0), EConversationDebugInfo::Executing);
                // What can you tell me about your Camp?
                Hero.AI.Say(LocText("Info_Tpl_8_DasLager_15_00"));
                DC(int64(0x716b63fb436e33f0), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92da), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply1);
                DC(int64(0x753971b5b56e92da), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92db), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEAboutcamp_Reply2);
                DC(int64(0x753971b5b56e92db), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLEBecometpl : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33ce);
            default Caption = LocText("Info_Tpl_13_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply1)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply2)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply3)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply4)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4837a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4ffb106f82233f0d), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33d0), EConversationDebugInfo::Executing);
                
                // I want to become a templar - just like you.
                Hero.AI.Say(LocText("Info_Tpl_13_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e33d0), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2196), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply1);
                DC(int64(0x753971b5b56f2196), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2197), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply2);
                DC(int64(0x753971b5b56f2197), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2198), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply3);
                DC(int64(0x753971b5b56f2198), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2199), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEBecometpl_Reply4);
                DC(int64(0x753971b5b56f2199), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLECouldyou : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33e3);
            default Caption = LocText("Info_Tpl_8_EinerVonEuchWerden_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply1)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4837a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4ffb106f82233f11), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33e5), EConversationDebugInfo::Executing);
                
                // Could you use another capable man?
                Hero.AI.Say(LocText("Info_Tpl_8_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e33e5), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92d6), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply1);
                DC(int64(0x753971b5b56e92d6), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92d7), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLECouldyou_Reply2);
                DC(int64(0x753971b5b56e92d7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLEHowisgoing : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33dd);
            default Caption = LocText("Info_Tpl_13_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply1)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4837f), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x4ffb106f82233f0c), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33df), EConversationDebugInfo::Executing);
                
                // How's it going?
                Hero.AI.Say(LocText("Info_Tpl_13_DieLage_15_00"));
                DC(int64(0x716b63fb436e33df), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2194), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply1);
                DC(int64(0x753971b5b56f2194), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e33e1), EConversationDebugInfo::Executing);
                
                // Sounds meaningful ...
                Hero.AI.Say(LocText("Info_Tpl_13_DieLage_15_02"));
                DC(int64(0x716b63fb436e33e1), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2195), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEHowisgoing_Reply2);
                DC(int64(0x753971b5b56f2195), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLETakealook : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33d9);
            default Caption = LocText("Info_Tpl_13_DasLager_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETakealook_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ffb106f82233f0b), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                    DB(int64(0xf1fdf18e2f43b3cb), G1R != nullptr && G1R.HasReachedChapter(4));
                }
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33db), EConversationDebugInfo::Executing);
                
                // I'd like to take a look around inside the Sleeper Temple ...
                Hero.AI.Say(LocText("Info_Tpl_13_DasLager_15_00"));
                DC(int64(0x716b63fb436e33db), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f2193), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETakealook_Reply1);
                DC(int64(0x753971b5b56f2193), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLETellme : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33e8);
            default Caption = LocText("Info_Tpl_8_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply1)) return false;
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4837f), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0x4ffb106f82233f12), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33ea), EConversationDebugInfo::Executing);
                
                // Can you tell me who's in charge here?
                Hero.AI.Say(LocText("Info_Tpl_8_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e33ea), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92d8), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply1);
                DC(int64(0x753971b5b56e92d8), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e33ec), EConversationDebugInfo::Executing);
                
                // Who are your gurus?
                Hero.AI.Say(LocText("Info_Tpl_8_WichtigePersonen_15_02"));
                DC(int64(0x716b63fb436e33ec), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92d9), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLETellme_Reply2);
                DC(int64(0x753971b5b56e92d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLEverything : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33f3);
            default Caption = LocText("Info_Tpl_8_DieLage_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEverything_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ffb106f82233f10), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                return Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33f5), EConversationDebugInfo::Executing);
                
                // Everything all right with you?
                Hero.AI.Say(LocText("Info_Tpl_8_DieLage_15_00"));
                DC(int64(0x716b63fb436e33f5), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56e92d5), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEverything_Reply1);
                DC(int64(0x753971b5b56e92d5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_SCTPLEWhocharge : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0x716b63fb436e33d5);
            default Caption = LocText("Info_Tpl_13_WichtigePersonen_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEWhocharge_Reply1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4ffb106f82233f0e), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar));
                }
                
                return Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e33d7), EConversationDebugInfo::Executing);
                
                // Who's in charge here?
                Hero.AI.Say(LocText("Info_Tpl_13_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e33d7), EConversationDebugInfo::Done);
                DC(int64(0x753971b5b56f219a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLEWhocharge_Reply1);
                DC(int64(0x753971b5b56f219a), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCTPLInfidel : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0xc2bbabf13f180bbe);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCTPLInfidel);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLInfidel_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f));
                    DB(int64(0x4ffb106f82233f14), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ad5d0166d20a33b), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLInfidel_Ambient1);
                DC(int64(0x4ad5d0166d20a33b), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCTPLNevercome : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0xc2bbabf13f180bca);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCTPLNevercome);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_YQBMRVC_20240430_124507"), int64(0xc2bbabf13f180bca));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLNevercome_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bc7), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f));
                    DB(int64(0x4ffb106f82233f15), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ad5d0166d20a33c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLNevercome_Ambient1);
                DC(int64(0x4ad5d0166d20a33c), EConversationDebugInfo::Done);
            }
        }
        
        
        class USCTPLSleeper : UTopic_Hero__GENERIC_ABOUTCAMP_SC_TPL
        {
            default DebugId = int64(0xc2bbabf13f180bfb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(USCTPLSleeper);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_SC_TPL.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLSleeper_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc2bbabf13f180bff), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded());
                    DB(int64(0xc2bbabf13f180c00), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f));
                    DB(int64(0x4ffb106f82233f16), Generic_AboutCamp_SC_TPL != nullptr && Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_SC_TPL, 800.0f))
                    return false;
                
                if (Generic_AboutCamp_SC_TPL != nullptr && !Generic_AboutCamp_SC_TPL.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4ad5d0166d20a33d), EConversationDebugInfo::Executing);
                Generic_AboutCamp_SC_TPL.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_SC_TPL_SCTPLSleeper_Ambient1);
                DC(int64(0x4ad5d0166d20a33d), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */