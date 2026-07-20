#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_KDF_DRAGO_403 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_KDF_DRAGO_403";
        }
        
        
        class UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_DRAGO_403";
            default WithCharacter = n"OC_EBR_BARTHOLO_106";
            
            AGothicCharacterState GetDrago() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
        }
        
        
        class UTopic_Hero__OC_KDF_DRAGO_403 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_KDF_DRAGO_403";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDrago() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetBartholo() const property
            {
                return GetCharacter(n"OC_EBR_BARTHOLO_106");
            }
        }
        
        
        class UChoiceDrago105761_0 : UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403
        {
            default DebugId = int64(0xbfa11b5924e00d30);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDrago105761);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceDrago105761_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbfa11b5924e00d33), Drago != nullptr && Drago.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Drago_403_WaitYard));
                    DB(int64(0xbfa11b5924e00d5a), Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted());
                    DB(int64(0xbfa11b5924e00d5b), Hero != nullptr && Hero.IsCloseToCharacter(Drago, 1500.0f));
                }
                
                if (Drago != nullptr && !Drago.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Drago_403_WaitYard))
                    return false;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES != nullptr && !Quest::ValleyOfMines_VoMCHAPTER4_FIREMAGES.HasBeenStarted())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Drago, 1500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00d2f), EConversationDebugInfo::Executing);
                // ... answer's the same. We won't become your bloodhounds, ...
                Drago.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_113510_2238"));
                DC(int64(0xbfa11b5924e00d2f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrago105761_1 : UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrago105761_0);
            default Rules.HideIfKnows(UChoiceDrago105761_1);
            default DebugId = int64(0xbfa11b5924e00d30);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00d5c), EConversationDebugInfo::Executing);
                
                // It's not about becoming a bloodhound, it's about earning ...
                Bartholo.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_113635"));
                DC(int64(0xbfa11b5924e00d5c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrago105761_2 : UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrago105761_1);
            default Rules.HideIfKnows(UChoiceDrago105761_2);
            default DebugId = int64(0xbfa11b5924e00d30);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00d5d), EConversationDebugInfo::Executing);
                
                // Is there anything else?
                Drago.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_113636"));
                DC(int64(0xbfa11b5924e00d5d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrago105761_3 : UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrago105761_2);
            default Rules.HideIfKnows(UChoiceDrago105761_3);
            default DebugId = int64(0xbfa11b5924e00d30);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00d5e), EConversationDebugInfo::Executing);
                
                // You're a fool, Drago. Conceited, lazy fool.
                Bartholo.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_113637"));
                DC(int64(0xbfa11b5924e00d5e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDrago105761 : UTopic_OC_EBR_BARTHOLO_106__OC_KDF_DRAGO_403
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDrago105761_3);
            default Rules.HideIfKnows(UChoiceDrago105761);
            default DebugId = int64(0xbfa11b5924e00d30);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbfa11b5924e00d5f), EConversationDebugInfo::Executing);
                
                // Well, now you've convinced me.
                Drago.AI.Say(LocText("TEXT_WIP_ZOVLFV_20241105_113725"));
                DC(int64(0xbfa11b5924e00d5f), EConversationDebugInfo::Done);
                DC(int64(0xbfa11b5924e00d61), EConversationDebugInfo::Executing);
                Bartholo.ExchangeDailyRoutineToClass(UDailyRoutine_OC_EBR_Bartholo_106_Start);
                DC(int64(0xbfa11b5924e00d61), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKdf403DragoExit : UTopic_Hero__OC_KDF_DRAGO_403
        {
            default DebugId = int64(0x31e65e19dc0f2394);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x31e65e19dc0f2395), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x31e65e19dc0f2395), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKdf403DragoRune : UTopic_Hero__OC_KDF_DRAGO_403
        {
            default DebugId = int64(0x31e65e19dc0f238f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceKdf403DragoRune);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb7d0dc2c6e09623c), Drago != nullptr && Drago.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x910f181a68326c72), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xce11cc9452ea4c2f), Drago != nullptr && !Drago.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Drago_403_WaitYard));
                }
                
                if (Drago != nullptr && !Drago.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (Drago != nullptr && Drago.HasAssignedDailyRoutine(UDailyRoutine_OC_KDF_Drago_403_WaitYard))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x31e65e19dc0f2390), EConversationDebugInfo::Executing);
                // Here, take this rune as a gift of Innos. May it serve ...
                Drago.AI.Say(LocText("KDF_403_DRAGO_RUNE_INFO_13_01"));
                DC(int64(0x31e65e19dc0f2390), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_DRAGO, Document::UDocumentSegment_Glossary_OC_KDF_DRAGO_Introduction);
                DB(int64(0x63ca372f5fe90846), Hero != nullptr && Hero.HasItem(UItAr_Rune_FireBolt, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItAr_Rune_FireBolt, 1, 0))
                {
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                    Drago.AddItemToInventory(UItAr_Rune_Heal, 0);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f889), EConversationDebugInfo::Executing);
                    Drago.AI.GiveItemTo(Hero, UItAr_Rune_Heal, 1);
                    DC(int64(0x191e63576510f889), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                    Drago.AddItemToInventory(UItAr_Rune_FireBolt, 0);
                    DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                    DC(int64(0x191e63576510f889), EConversationDebugInfo::Executing);
                    Drago.AI.GiveItemTo(Hero, UItAr_Rune_FireBolt, 1);
                    DC(int64(0x191e63576510f889), EConversationDebugInfo::Done);
                }
                DC(int64(0x31e65e19dc0f2393), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x31e65e19dc0f2393), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */