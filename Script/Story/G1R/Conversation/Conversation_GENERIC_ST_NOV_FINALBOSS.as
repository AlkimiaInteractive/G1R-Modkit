#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_ST_NOV_FINALBOSS : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_ST_NOV_FINALBOSS";
        }
        
        
        class UTopic_Hero__GENERIC_ST_NOV_FINALBOSS : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_ST_NOV_FINALBOSS";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNOV() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UTopic_NOV_SleeperAfterHarpies : UTopic_Hero__GENERIC_ST_NOV_FINALBOSS
        {
            default DebugId = int64(0x724b9324b0a98951);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient1)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient2)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient3)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient4)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient5)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a83a1c4641505dd), G1R.NovicesSleeper_Mumbling_Phase01.IsValid() && G1R.NovicesSleeper_Mumbling_Phase01.IsMoreThanXMinutesAgo(20));
                    DB(int64(0x2407c335893c74f), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning());
                    DB(int64(0x2407c335893c750), Hero != nullptr && Hero.IsCloseToCharacter(NOV, 3500.0f));
                    DB(int64(0x724b9324b0a98954), Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.HasSucceeded());
                }
                
                if (G1R.NovicesSleeper_Mumbling_Phase01.IsValid() && !G1R.NovicesSleeper_Mumbling_Phase01.IsMoreThanXMinutesAgo(20))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(NOV, 3500.0f))
                    return false;
                
                if (Quest::FreeMine_BALOROS_WAFFE != nullptr && !Quest::FreeMine_BALOROS_WAFFE.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x724b9324b0a98962), G1R.Novices_Mumbling_Phase01 == 0);
                DB(int64(0x724b9324b0a98963), G1R.Novices_Mumbling_Phase01 == 1);
                DB(int64(0x724b9324b0a98964), G1R.Novices_Mumbling_Phase01 == 2);
                DB(int64(0x724b9324b0a98965), G1R.Novices_Mumbling_Phase01 == 3);
                
                if (G1R.Novices_Mumbling_Phase01 == 0)
                {
                    DC(int64(0x897f5716afbc9f93), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient1);
                    DC(int64(0x897f5716afbc9f93), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase01 += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase01 == 1)
                {
                    DC(int64(0x897f5716afbc9f94), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient2);
                    DC(int64(0x897f5716afbc9f94), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase01 += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase01 == 2)
                {
                    DC(int64(0x897f5716afbc9f95), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient3);
                    DC(int64(0x897f5716afbc9f95), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase01 += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase01 == 3)
                {
                    DC(int64(0x897f5716afbc9f96), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient4);
                    DC(int64(0x897f5716afbc9f96), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase01 += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x897f5716afbc9f97), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterHarpies_Ambient5);
                    DC(int64(0x897f5716afbc9f97), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase01 = 0;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                DC(int64(0x57a8ddfd8a50c945), EConversationDebugInfo::Executing);
                G1R.NovicesSleeper_Mumbling_Phase01 = FInGameTime::Now();
                DC(int64(0x57a8ddfd8a50c945), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_NOV_SleeperAfterOrcs_0 : UTopic_Hero__GENERIC_ST_NOV_FINALBOSS
        {
            default DebugId = int64(0x846f597d9d4ed929);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UTopic_NOV_SleeperAfterOrcs);
            
            default Rules.HideIfKnows(UTopic_NOV_SleeperAfterOrcs_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient1)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient2)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient3)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient4)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient5)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x846f597d9d4ed92c), G1R.NovicesSleeper_Mumbling_Phase02.IsValid() && G1R.NovicesSleeper_Mumbling_Phase02.IsInMoreThanXMinutes(20));
                    DB(int64(0x846f597d9d4ed92d), Quest::FreeMine_BALOROS_WAFFE != nullptr && Quest::FreeMine_BALOROS_WAFFE.IsRunning());
                    DB(int64(0x846f597d9d4ed92e), Hero != nullptr && Hero.IsCloseToCharacter(NOV, 3500.0f));
                    DB(int64(0x846f597d9d4ed92f), Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded());
                }
                
                if (G1R.NovicesSleeper_Mumbling_Phase02.IsValid() && !G1R.NovicesSleeper_Mumbling_Phase02.IsInMoreThanXMinutes(20))
                    return false;
                
                if (Quest::FreeMine_BALOROS_WAFFE != nullptr && !Quest::FreeMine_BALOROS_WAFFE.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(NOV, 3500.0f))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER1_BRINGLIST != nullptr && !Quest::OldCamp_OCCHAPTER1_BRINGLIST.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x846f597d9d4ed931), G1R.Novices_Mumbling_Phase02 == 0);
                DB(int64(0x846f597d9d4ed932), G1R.Novices_Mumbling_Phase02 == 1);
                DB(int64(0x846f597d9d4ed933), G1R.Novices_Mumbling_Phase02 == 2);
                DB(int64(0x846f597d9d4ed934), G1R.Novices_Mumbling_Phase02 == 3);
                
                if (G1R.Novices_Mumbling_Phase02 == 0)
                {
                    DC(int64(0x897f5716afbc9f98), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient1);
                    DC(int64(0x897f5716afbc9f98), EConversationDebugInfo::Done);
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase02 += 1;
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase02 == 1)
                {
                    DC(int64(0x897f5716afbc9f99), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient2);
                    DC(int64(0x897f5716afbc9f99), EConversationDebugInfo::Done);
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase02 += 1;
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase02 == 2)
                {
                    DC(int64(0x897f5716afbc9f9a), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient3);
                    DC(int64(0x897f5716afbc9f9a), EConversationDebugInfo::Done);
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase02 += 1;
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling_Phase02 == 3)
                {
                    DC(int64(0x897f5716afbc9f9b), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient4);
                    DC(int64(0x897f5716afbc9f9b), EConversationDebugInfo::Done);
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase02 += 1;
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x897f5716afbc9f9c), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperAfterOrcs_Ambient5);
                    DC(int64(0x897f5716afbc9f9c), EConversationDebugInfo::Done);
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling_Phase02 = 0;
                    DC(int64(0x846f597d9d4ed953), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_NOV_SleeperAfterOrcs : UTopic_Hero__GENERIC_ST_NOV_FINALBOSS
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_NOV_SleeperAfterOrcs_0);
            default Rules.HideIfKnows(UTopic_NOV_SleeperAfterOrcs);
            default DebugId = int64(0x846f597d9d4ed929);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x846f597d9d4ed98a), EConversationDebugInfo::Executing);
                G1R.NovicesSleeper_Mumbling_Phase02 = FInGameTime::Now();
                DC(int64(0x846f597d9d4ed98a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_NOV_SleeperFound : UTopic_Hero__GENERIC_ST_NOV_FINALBOSS
        {
            default DebugId = int64(0x6da52de458c05583);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient1)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient2)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient3)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient4)) return false;
                if (!NOV.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient5)) return false;
                
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1a83a1c4641505dd), G1R.NovicesSleeper_Mumbling.IsValid() && G1R.NovicesSleeper_Mumbling.IsMoreThanXMinutesAgo(1));
                    DB(int64(0x2407c335893c750), Hero != nullptr && Hero.IsCloseToCharacter(NOV, 10000.0f));
                    DB(int64(0x1e645fec5961fa32), Quest::SleeperTemple_STCHAPTER6_SLEEPER != nullptr && Quest::SleeperTemple_STCHAPTER6_SLEEPER.IsRunning());
                }
                
                if (G1R.NovicesSleeper_Mumbling.IsValid() && !G1R.NovicesSleeper_Mumbling.IsMoreThanXMinutesAgo(1))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(NOV, 10000.0f))
                    return false;
                
                if (Quest::SleeperTemple_STCHAPTER6_SLEEPER != nullptr && !Quest::SleeperTemple_STCHAPTER6_SLEEPER.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x2407c335893c758), G1R.Novices_Mumbling == 0);
                DB(int64(0x57a8ddfd8a50c8c6), G1R.Novices_Mumbling == 1);
                DB(int64(0x57a8ddfd8a50c8c7), G1R.Novices_Mumbling == 2);
                DB(int64(0x57a8ddfd8a50c8c8), G1R.Novices_Mumbling == 3);
                
                if (G1R.Novices_Mumbling == 0)
                {
                    DC(int64(0x897f5716afbc9f8e), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient1);
                    DC(int64(0x897f5716afbc9f8e), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling == 1)
                {
                    DC(int64(0x897f5716afbc9f8f), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient2);
                    DC(int64(0x897f5716afbc9f8f), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling == 2)
                {
                    DC(int64(0x897f5716afbc9f90), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient3);
                    DC(int64(0x897f5716afbc9f90), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else if (G1R.Novices_Mumbling == 3)
                {
                    DC(int64(0x897f5716afbc9f91), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient4);
                    DC(int64(0x897f5716afbc9f91), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling += 1;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x897f5716afbc9f92), EConversationDebugInfo::Executing);
                    NOV.AI.Say(GameplayTag::Sound_Voice_Conversation_NOV_SleeperFound_Ambient5);
                    DC(int64(0x897f5716afbc9f92), EConversationDebugInfo::Done);
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Executing);
                    G1R.Novices_Mumbling = 0;
                    DC(int64(0x57a8ddfd8a50c8f8), EConversationDebugInfo::Done);
                }
                DC(int64(0x57a8ddfd8a50c945), EConversationDebugInfo::Executing);
                G1R.NovicesSleeper_Mumbling = FInGameTime::Now();
                DC(int64(0x57a8ddfd8a50c945), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */