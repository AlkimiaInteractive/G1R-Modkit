#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OC_STT : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_STT";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OC_STT";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_AboutCamp_OC_STT() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UInfo_Hi : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x716b63fb436e32b4);
            default Caption = LocText("Info_Stt_10_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32b6), EConversationDebugInfo::Executing);
                // Hi!
                Hero.AI.Say(LocText("Info_Stt_10_DieLage_15_00"));
                DC(int64(0x716b63fb436e32b6), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c153bbf), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply1);
                DC(int64(0x9927cf000c153bbf), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_STT_150738,
                    UTopic_Generic_AboutCamp_OC_STT_150758,
                    UTopic_Generic_AboutCamp_OC_STT_150786
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150738 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f482de);
            default Caption = LocText("Info_Stt_10_EinerVonEuchWerden_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150738);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply2)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4836d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32a1), EConversationDebugInfo::Executing);
                // I wanna be a Shadow.
                Hero.AI.Say(LocText("Info_Stt_10_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e32a1), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca30), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply2);
                DC(int64(0x9927cf000c15ca30), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_STT_150818,
                    UTopic_Generic_AboutCamp_OC_STT_150838
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150758 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f482e2);
            default Caption = LocText("Info_Stt_10_DasLager_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150758);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply4)) return false;
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply5)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32b1), EConversationDebugInfo::Executing);
                // What can you tell me about the Camp?
                Hero.AI.Say(LocText("Info_Stt_10_DasLager_15_00"));
                DC(int64(0x716b63fb436e32b1), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca33), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply4);
                DC(int64(0x9927cf000c15ca33), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca34), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply5);
                DC(int64(0x9927cf000c15ca34), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150786 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f482ea);
            default Caption = LocText("Info_Stt_10_WichtigePersonen_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150786);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply6)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32ad), EConversationDebugInfo::Executing);
                
                // Who should I know around here?
                Hero.AI.Say(LocText("Info_Stt_10_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e32ad), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca38), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply6);
                DC(int64(0x9927cf000c15ca38), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150818 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f482f5);
            default Caption = LocText("Info_Stt_10_EinerVonEuchWerden_Ja_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150818);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply3)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32a9), EConversationDebugInfo::Executing);
                
                // Yeah, I did.
                Hero.AI.Say(LocText("Info_Stt_10_EinerVonEuchWerden_Ja_15_00"));
                DC(int64(0x716b63fb436e32a9), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca31), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply3);
                DC(int64(0x9927cf000c15ca31), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150838 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f482f9);
            default Caption = LocText("Info_Stt_10_EinerVonEuchWerden_Nein_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150838);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply7)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32a5), EConversationDebugInfo::Executing);
                
                // Not yet.
                Hero.AI.Say(LocText("Info_Stt_10_EinerVonEuchWerden_Nein_15_00"));
                DC(int64(0x716b63fb436e32a5), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca32), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Hi_Reply7);
                DC(int64(0x9927cf000c15ca32), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_HowareSTT : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x716b63fb436e32c7);
            default Caption = LocText("Info_Stt_12_DieLage_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32c9), EConversationDebugInfo::Executing);
                
                // So, how are things?
                Hero.AI.Say(LocText("Info_Stt_12_DieLage_15_00"));
                DC(int64(0x716b63fb436e32c9), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca39), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply1);
                DC(int64(0x9927cf000c15ca39), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_AboutCamp_OC_STT_150874,
                    UTopic_Generic_AboutCamp_OC_STT_150894
                );
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150874 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f48306);
            default Caption = LocText("Info_Stt_12_DasLager_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150874);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply2)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32c5), EConversationDebugInfo::Executing);
                // Just wanna know what's going on around the Camp.
                Hero.AI.Say(LocText("Info_Stt_12_DasLager_15_00"));
                DC(int64(0x716b63fb436e32c5), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca3a), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply2);
                DC(int64(0x9927cf000c15ca3a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Generic_AboutCamp_OC_STT_150894 : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x4e041d4835f4830a);
            default Caption = LocText("Info_Stt_12_EinerVonEuchWerden_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Generic_AboutCamp_OC_STT_150894);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply3)) return false;
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply4)) return false;
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply5)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e041d4835f4836f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32ba), EConversationDebugInfo::Executing);
                
                // I'd like to join the Shadows.
                Hero.AI.Say(LocText("Info_Stt_12_EinerVonEuchWerden_15_00"));
                DC(int64(0x716b63fb436e32ba), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca3b), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply3);
                DC(int64(0x9927cf000c15ca3b), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca3c), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply4);
                DC(int64(0x9927cf000c15ca3c), EConversationDebugInfo::Done);
                DC(int64(0x716b63fb436e32bd), EConversationDebugInfo::Executing);
                
                // What happened to the rest?
                Hero.AI.Say(LocText("Info_Stt_12_EinerVonEuchWerden_15_03"));
                DC(int64(0x716b63fb436e32bd), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca3e), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_HowareSTT_Reply5);
                DC(int64(0x9927cf000c15ca3e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UInfo_Whoruns : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x716b63fb436e32bf);
            default Caption = LocText("Info_Stt_12_WichtigePersonen_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Whoruns_Reply1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x716b63fb436e32c1), EConversationDebugInfo::Executing);
                
                // Who runs this place?
                Hero.AI.Say(LocText("Info_Stt_12_WichtigePersonen_15_00"));
                DC(int64(0x716b63fb436e32c1), EConversationDebugInfo::Done);
                DC(int64(0x9927cf000c15ca3f), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_Whoruns_Reply1);
                DC(int64(0x9927cf000c15ca3f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCSTTBye : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x26cbf72826445710);
            default Caption = LocText("TEXT_WIP_UAOYHKE_20250204_191153");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTBye_Ambient1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x26cbf7282644570e), EConversationDebugInfo::Executing);
                
                // See you around.
                Hero.AI.Say(LocText("TEXT_WIP_UAOYHKE_20250204_191153"));
                DC(int64(0x26cbf7282644570e), EConversationDebugInfo::Done);
                DC(int64(0x897f5716afbd2eb3), EConversationDebugInfo::Executing);
                
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTBye_Ambient1);
                DC(int64(0x897f5716afbd2eb3), EConversationDebugInfo::Done);
                DC(int64(0x26cbf72826445712), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x26cbf72826445712), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UOCSTTGuy : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x36d532d724ac1902);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCSTTGuy);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac1902));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTGuy_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab869), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTGuy_Ambient1);
                DC(int64(0x4eec0d260e3ab869), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCSTTNerve : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x36d532d724ac18fe);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCSTTNerve);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18fe));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTNerve_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab868), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTNerve_Ambient1);
                DC(int64(0x4eec0d260e3ab868), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCSTTWait : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x722d62fdc5af99e0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCSTTWait);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWait_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x722d62fdc5af99e9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xc2bbabf13f180ba3), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab865), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWait_Ambient1);
                DC(int64(0x4eec0d260e3ab865), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCSTTWelcome : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x722d62fdc5af99e4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCSTTWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWelcome_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x722d62fdc5af99e9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    DB(int64(0xc2bbabf13f180ba4), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab866), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTWelcome_Ambient1);
                DC(int64(0x4eec0d260e3ab866), EConversationDebugInfo::Done);
            }
        }
        
        
        class UOCSTTYou : UTopic_Hero__GENERIC_ABOUTCAMP_OC_STT
        {
            default DebugId = int64(0x36d532d724ac18fa);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UOCSTTYou);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_QRQTACJ_20240605_190749"), int64(0x36d532d724ac18fa));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_AboutCamp_OC_STT.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTYou_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1921), Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f));
                }
                
                return Hero != nullptr && Hero.IsCloseToCharacter(Generic_AboutCamp_OC_STT, 800.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4eec0d260e3ab867), EConversationDebugInfo::Executing);
                Generic_AboutCamp_OC_STT.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_AboutCamp_OC_STT_OCSTTYou_Ambient1);
                DC(int64(0x4eec0d260e3ab867), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */