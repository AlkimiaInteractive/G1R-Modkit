#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_WSC_NATALIA_1207 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_WSC_NATALIA_1207";
        }
        
        
        class UTopic_Hero__SC_WSC_NATALIA_1207 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_WSC_NATALIA_1207";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNatalia() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNatalia214919 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default DebugId = int64(0xda2d370f76152e02);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda2d370f76152e01), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xda2d370f76152e01), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNatalia214939 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default DebugId = int64(0xda2d370f76152e07);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_171601_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNatalia214939);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda2d370f76152e05), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_171601_1924"));
                DC(int64(0xda2d370f76152e05), EConversationDebugInfo::Done);
                DC(int64(0xda2d370f76152e06), EConversationDebugInfo::Executing);
                
                // Among other things, I make sure that all the candles are ...
                Natalia.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_171601_2785"));
                DC(int64(0xda2d370f76152e06), EConversationDebugInfo::Done);
                DC(int64(0x377765fe256902c6), EConversationDebugInfo::Executing);
                
                // Well, that sounds like a lot of work.
                Hero.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_094836"));
                DC(int64(0x377765fe256902c6), EConversationDebugInfo::Done);
                DC(int64(0x377765fe256902c7), EConversationDebugInfo::Executing);
                
                // Yes... And I listen to the words of the Master and try ...
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_094843"));
                DC(int64(0x377765fe256902c7), EConversationDebugInfo::Done);
                DC(int64(0x377765fe256902c8), EConversationDebugInfo::Executing);
                // Strangers do not often come to the temple... I hope you ...
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_094941"));
                DC(int64(0x377765fe256902c8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_WSC_NATALIA, Document::UDocumentSegment_Glossary_SC_WSC_NATALIA_Introduction);
                DC(int64(0x258017cab69a47e6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x258017cab69a47e6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNatalia216279 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default DebugId = int64(0x377765fe256902cb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceNatalia216279);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x258017cab69a47ec), Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP != nullptr && Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902ca), EConversationDebugInfo::Executing);
                // Master Y'Berion thinks highly of you. I hope you will ...
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_095000_2785"));
                DC(int64(0x377765fe256902ca), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNatalia216298_0 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default DebugId = int64(0x377765fe256902cf);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceNatalia216298);
            
            default Rules.HideIfKnows(UChoiceNatalia216298_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x258017cab69a47ee), G1R != nullptr && G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902ce), EConversationDebugInfo::Executing);
                // The Sleeper, a demon...? Master Y'Berion realized it too ...
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_095027_3286"));
                DC(int64(0x377765fe256902ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNatalia216298 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNatalia216298_0);
            default Rules.HideIfKnows(UChoiceNatalia216298);
            default DebugId = int64(0x377765fe256902cf);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902d1), EConversationDebugInfo::Executing);
                // Even if everything seems meaningless without the ...
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_095052"));
                DC(int64(0x377765fe256902d1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNatalia216318 : UTopic_Hero__SC_WSC_NATALIA_1207
        {
            default DebugId = int64(0x377765fe256902d4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceNatalia216318);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x258017cab69a47f0), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902d3), EConversationDebugInfo::Executing);
                // Take heart. You will accomplish what lies before you.
                Natalia.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_095059_2386"));
                DC(int64(0x377765fe256902d3), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */