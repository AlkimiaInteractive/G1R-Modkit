#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_GENERIC_PAYFINE : UConversationCharacterSettings
        {
            default ForCharacter = n"GENERIC_PAYFINE";
        }
        
        
        class UTopic_Hero__GENERIC_PAYFINE : UG1RDialogTopic
        {
            default ForCharacter = n"GENERIC_PAYFINE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGeneric_PayFine() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGenericPayfine : UTopic_Hero__GENERIC_PAYFINE
        {
            default DebugId = int64(0xce749450b5b8cb2e);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_130339");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe5df58c8cfbb494e), Generic_PayFine != nullptr && Generic_PayFine.CanDemandPaymentForCrimes(Other));
                }
                
                return Generic_PayFine != nullptr && Generic_PayFine.CanDemandPaymentForCrimes(Other);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xce749450b5b8cb2c), EConversationDebugInfo::Executing);
                // I think I might be in trouble. I'd pay just to get rid ...
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_130339"));
                DC(int64(0xce749450b5b8cb2c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Generic_PayFine_214600,
                    UTopic_Generic_PayFine_214620
                );
            }
        }
        
        
        class UTopic_Generic_PayFine_214600 : UTopic_Hero__GENERIC_PAYFINE
        {
            default DebugId = int64(0xccae1a1714fa70e2);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_130950_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            default PropertyTags.AddTag(GameplayTag::Conversation_PayFine);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_PayFine.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_GoodResolution1)) return false;
                if (!Generic_PayFine.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_FoolResolution1)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccae1a1714fa70e3), EConversationDebugInfo::Executing);
                // I hope this is enough...
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_130950_41"));
                DC(int64(0xccae1a1714fa70e3), EConversationDebugInfo::Done);
                DB(int64(0xccae1a1714fa70fc), Generic_PayFine != nullptr && Generic_PayFine.CanCharacterPayCrimeFines(Other));
                
                if (Generic_PayFine != nullptr && Generic_PayFine.CanCharacterPayCrimeFines(Other))
                {
                    DC(int64(0xccae1a1714fa7102), EConversationDebugInfo::Executing);
                    Generic_PayFine.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_GoodResolution1);
                    DC(int64(0xccae1a1714fa7102), EConversationDebugInfo::Done);
                    DC(int64(0xb81276e1e35154fd), EConversationDebugInfo::Executing);
                    Generic_PayFine.AI.TakeOreForCrimeFinesFromCharacter(Other);
                    DC(int64(0xb81276e1e35154fd), EConversationDebugInfo::Done);
                    DC(int64(0xb81276e1e35154ff), EConversationDebugInfo::Executing);
                    Generic_PayFine.AI.ForgiveAllTheftRelatedCrimesByCriminal(Other);
                    DC(int64(0xb81276e1e35154ff), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xccae1a1714fa7100), EConversationDebugInfo::Executing);
                    Generic_PayFine.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_FoolResolution1);
                    DC(int64(0xccae1a1714fa7100), EConversationDebugInfo::Done);
                    DC(int64(0xb81276e1e35154fb), EConversationDebugInfo::Executing);
                    Generic_PayFine.AI.StartAttackingImmediatelyLootOnly(Other);
                    DC(int64(0xb81276e1e35154fb), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Generic_PayFine_214620 : UTopic_Hero__GENERIC_PAYFINE
        {
            default DebugId = int64(0xccae1a1714fa70e6);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_130950_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (!Generic_PayFine.Voiceline.HasVoicelineFor(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_BadResolution)) return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xccae1a1714fa70e7), EConversationDebugInfo::Executing);
                // I've changed my mind. I'm not paying after all.
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_130950_2238"));
                DC(int64(0xccae1a1714fa70e7), EConversationDebugInfo::Done);
                DC(int64(0xccae1a1714fa70ec), EConversationDebugInfo::Executing);
                
                Generic_PayFine.AI.Say(GameplayTag::Sound_Voice_Conversation_Generic_PayFine_generic_payfine_BadResolution);
                DC(int64(0xccae1a1714fa70ec), EConversationDebugInfo::Done);
                DC(int64(0xb81276e1e35154f9), EConversationDebugInfo::Executing);
                Generic_PayFine.AI.StartAttackingImmediatelyLootOnly(Other);
                DC(int64(0xb81276e1e35154f9), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */