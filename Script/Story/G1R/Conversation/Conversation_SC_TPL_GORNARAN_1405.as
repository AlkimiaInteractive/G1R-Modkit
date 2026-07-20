#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_GORNARAN_1405 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_GORNARAN_1405";
        }
        
        
        class UTopic_Hero__SC_TPL_GORNARAN_1405 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_GORNARAN_1405";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaRan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceGornaranExit : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0e0);
            default Caption = LocText("TEXT_CHOICE_GORNARAN_EXIT");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x35659a687ef1a0e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornaranWache : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0e2);
            default Caption = LocText("DIA_GORNARAN_WACHE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa2e8be856cfc81d0), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0e3), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("DIA_GORNARAN_WACHE_15_00"));
                DC(int64(0x35659a687ef1a0e3), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0e4), EConversationDebugInfo::Executing);
                
                // Keeping out the swampsharks. 
                GorNaRan.AI.Say(LocText("DIA_GORNARAN_WACHE_13_01"));
                DC(int64(0x35659a687ef1a0e4), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0e5), EConversationDebugInfo::Executing);
                // I'd give those beasts a wide berth if I were you. ...
                GorNaRan.AI.Say(LocText("DIA_GORNARAN_WACHE_13_02"));
                DC(int64(0x35659a687ef1a0e5), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0e6), EConversationDebugInfo::Executing);
                // Anyway. Duty calls. 
                GorNaRan.AI.Say(LocText("DIA_GORNARAN_WACHE_13_03"));
                DC(int64(0x35659a687ef1a0e6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNARAN, Document::UDocumentSegment_Glossary_SC_TPL_GORNARAN_Introduction);
                DC(int64(0x35659a687ef1a0e7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x35659a687ef1a0e7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1405Gornaran : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0e8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.RangeType = EConversationForceRangeType::FarRange;
            
            default Rules.HideIfKnows(UChoiceTpl1405Gornaran);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x35659a687ef1a0e9), G1R != nullptr && G1R.IsInChapter(6));
                }
                
                return G1R != nullptr && G1R.IsInChapter(6);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0ea), EConversationDebugInfo::Executing);
                // That's close enough. 
                GorNaRan.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_13_01"));
                DC(int64(0x35659a687ef1a0ea), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNARAN, Document::UDocumentSegment_Glossary_SC_TPL_GORNARAN_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNARAN, Document::UDocumentSegment_Glossary_SC_TPL_GORNARAN_CampDivided);
            }
        }
        
        
        class UChoiceTpl1405Gornaran2 : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0eb);
            default Caption = LocText("INFO_TPL_1405_GORNARAN_INFO_15_02");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1405Gornaran);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0ec), EConversationDebugInfo::Executing);
                // What's going on here?
                Hero.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_15_02"));
                DC(int64(0x35659a687ef1a0ec), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0ed), EConversationDebugInfo::Executing);
                
                // Oh, always you infidels with your stupid questions. Why ...
                GorNaRan.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_13_03"));
                DC(int64(0x35659a687ef1a0ed), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1405Gornaran3 : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0ee);
            default Caption = LocText("INFO_TPL_1405_GORNARAN_INFO_15_04");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1405Gornaran);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0ef), EConversationDebugInfo::Executing);
                
                // Don't mind me, I'm just looking around. 
                Hero.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_15_04"));
                DC(int64(0x35659a687ef1a0ef), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f0), EConversationDebugInfo::Executing);
                
                // We don't need infidels looking around. You know what? ...
                GorNaRan.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_13_05"));
                DC(int64(0x35659a687ef1a0f0), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f2), EConversationDebugInfo::Executing);
                GorNaRan.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x35659a687ef1a0f2), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x35659a687ef1a0f3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1405Gornaran4 : UTopic_Hero__SC_TPL_GORNARAN_1405
        {
            default DebugId = int64(0x35659a687ef1a0f4);
            default Caption = LocText("INFO_TPL_1405_GORNARAN_INFO_15_06");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1405Gornaran);
            default Rules.HideIfKnows(UChoiceTpl1405Gornaran4);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x35659a687ef1a0f5), EConversationDebugInfo::Executing);
                // Try and stop me.
                Hero.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_15_06"));
                DC(int64(0x35659a687ef1a0f5), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f6), EConversationDebugInfo::Executing);
                
                // Oh. I will. 
                GorNaRan.AI.Say(LocText("INFO_TPL_1405_GORNARAN_INFO_13_07"));
                DC(int64(0x35659a687ef1a0f6), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f8), EConversationDebugInfo::Executing);
                GorNaRan.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x35659a687ef1a0f8), EConversationDebugInfo::Done);
                DC(int64(0x35659a687ef1a0f9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x35659a687ef1a0f9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */