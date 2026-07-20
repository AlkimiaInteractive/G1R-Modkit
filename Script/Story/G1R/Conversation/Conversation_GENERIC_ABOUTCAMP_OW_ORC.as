#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ABOUTCAMP_OW_ORC : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OW_ORC";
        }
        
        
        class UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ABOUTCAMP_OW_ORC";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetOW() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetUmakhal() const property
            {
                return GetCharacter(n"OW_OPS_UMAKHAL_2402");
            }
            
            AGothicCharacterState GetGrazkrak() const property
            {
                return GetCharacter(n"OW_OWR_GRAZKRAK_2400");
            }
        }
        
        
        class UTopic_OW_OWORCAxe : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac196a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCAxe_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.HasReachedChapter(5));
                    DB(int64(0x1cd377dbb192f628), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5))
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d44601c), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCAxe_Ambient1);
                DC(int64(0x58409067d44601c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCDontspeak : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac195e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCDontspeak_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.HasReachedChapter(5));
                    DB(int64(0x1cd377dbb192f628), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5))
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_OBJ_BURIAL.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d446017), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCDontspeak_Ambient1);
                DC(int64(0x58409067d446017), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCDontyou : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac1966);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCDontyou_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.IsInChapter(6));
                    DB(int64(0x1cd377dbb192f65b), Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(6))
                    return false;
                
                if (Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH != nullptr && !Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_STEALTHPATH.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d44601b), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCDontyou_Ambient1);
                DC(int64(0x58409067d44601b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCGrowl : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac1962);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCGrowl_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.HasReachedChapter(5));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d446016), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCGrowl_Ambient1);
                DC(int64(0x58409067d446016), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCMorra : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac1956);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCMorra_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.HasReachedChapter(5));
                    DB(int64(0x1cd377dbb192f629), Umakhal != nullptr && Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.HasReachedChapter(5))
                    return false;
                
                if (Umakhal != nullptr && !Umakhal.HasAssignedDailyRoutine(UDailyRoutine_OW_OPS_Umakhal_2402_Follow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d446019), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCMorra_Ambient1);
                DC(int64(0x58409067d446019), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCTricked : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac1952);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_OW_OWORCTricked);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCTricked_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.IsInChapter(5));
                    DB(int64(0x36d532d724ac19a1), Hero != nullptr && Hero.HasDefeated(Grazkrak));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(5))
                    return false;
                
                if (Hero != nullptr && !Hero.HasDefeated(Grazkrak))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d446018), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCTricked_Ambient1);
                DC(int64(0x58409067d446018), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_OW_OWORCWhat : UTopic_Hero__GENERIC_ABOUTCAMP_OW_ORC
        {
            default DebugId = int64(0x36d532d724ac195a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!OW.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_OW_OWORCWhat_Ambient1)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36d532d724ac1994), Hero != nullptr && Hero.IsCloseToCharacter(OW, 700.0f));
                    DB(int64(0x36d532d724ac1995), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(OW, 700.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(6))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x58409067d44601a), EConversationDebugInfo::Executing);
                OW.AI.Say(GameplayTag::Sound_Voice_Conversation_OW_OWORCWhat_Ambient1);
                DC(int64(0x58409067d44601a), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */