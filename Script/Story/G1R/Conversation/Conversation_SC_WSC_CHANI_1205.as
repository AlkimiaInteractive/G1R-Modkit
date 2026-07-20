#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_WSC_CHANI_1205 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_WSC_CHANI_1205";
        }
        
        
        class UTopic_Hero__SC_WSC_CHANI_1205 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_WSC_CHANI_1205";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetChani() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceChani214876 : UTopic_Hero__SC_WSC_CHANI_1205
        {
            default DebugId = int64(0xda2d370f76152dfa);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda2d370f76152df9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xda2d370f76152df9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceChani214896 : UTopic_Hero__SC_WSC_CHANI_1205
        {
            default DebugId = int64(0xda2d370f76152dff);
            default Caption = LocText("TEXT_WIP_SEEZYYC_20251212_171518_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceChani214896);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda2d370f76152dfd), EConversationDebugInfo::Executing);
                // How did you end up here?
                Hero.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_171518_41"));
                DC(int64(0xda2d370f76152dfd), EConversationDebugInfo::Done);
                DC(int64(0xda2d370f76152dfe), EConversationDebugInfo::Executing);
                
                // Originally, I was in the Old Camp, a slave of the Ore ...
                Chani.AI.Say(LocText("TEXT_WIP_SEEZYYC_20251212_171518_2083"));
                DC(int64(0xda2d370f76152dfe), EConversationDebugInfo::Done);
                DC(int64(0x855eecab56914c8b), EConversationDebugInfo::Executing);
                // Herb in exchange for supplies. As a sign of good will, I ...
                Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182420"));
                DC(int64(0x855eecab56914c8b), EConversationDebugInfo::Done);
                DC(int64(0x855eecab56914c8c), EConversationDebugInfo::Executing);
                
                // Lucky you.
                Hero.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182422"));
                DC(int64(0x855eecab56914c8c), EConversationDebugInfo::Done);
                DC(int64(0x855eecab56914c8d), EConversationDebugInfo::Executing);
                
                // Lucky? No, luck has nothing to do with it. My destiny ...
                Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182424"));
                DC(int64(0x855eecab56914c8d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_WSC_CHANI, Document::UDocumentSegment_Glossary_SC_WSC_CHANI_Introduction);
            }
        }
        
        
        class UChoiceChani215768 : UTopic_Hero__SC_WSC_CHANI_1205
        {
            default DebugId = int64(0x377765fe256902b0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceChani215768);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902ad), EConversationDebugInfo::Executing);
                // I'm pretty sure, more important things are waiting for ...
                Chani.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_090417_41"));
                DC(int64(0x377765fe256902ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceChani215885 : UTopic_Hero__SC_WSC_CHANI_1205
        {
            default DebugId = int64(0x377765fe256902b8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceChani215885);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x258017cab69a47c7), Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN != nullptr && Quest::OldCamp_OCCHAPTER4_ESCAPEPLAN.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x377765fe256902b5), EConversationDebugInfo::Executing);
                // You rescued Velaya. Thanks.
                Chani.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_090557_2238"));
                DC(int64(0x377765fe256902b5), EConversationDebugInfo::Done);
                DC(int64(0x377765fe256902c4), EConversationDebugInfo::Executing);
                
                // I couldn't save them all.
                Hero.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_090837"));
                DC(int64(0x377765fe256902c4), EConversationDebugInfo::Done);
                DC(int64(0x377765fe256902c5), EConversationDebugInfo::Executing);
                
                // Every life matters. I'm sure you tried everything.
                Chani.AI.Say(LocText("TEXT_WIP_DDAFQQG_20251231_090855"));
                DC(int64(0x377765fe256902c5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceChani216003 : UTopic_Hero__SC_WSC_CHANI_1205
        {
            default DebugId = int64(0x855eecab56914c90);
            default Caption = LocText("TEXT_WIP_CDAFQQG_20251230_182449");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceChani214896);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x258017cab69a470a), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                    DB(int64(0x799714135532be4d), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0x799714135532be4e), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_CDAFQQG_20251230_182546_1924")));
                    DB(int64(0x258017cab69a470a), Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded());
                    DB(int64(0x799714135532be4d), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0x799714135532be4e), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_CDAFQQG_20251230_182616")));
                }
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded() && G1R != nullptr && G1R.HasReachedChapter(3) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_CDAFQQG_20251230_182546_1924")))
                    return true;
                
                if (Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT != nullptr && Quest::OldCamp_OCCHAPTER2_BULLYFORBULLIT.HasSucceeded() && G1R != nullptr && !G1R.HasReachedChapter(3) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_CDAFQQG_20251230_182616")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x855eecab56914c8e), EConversationDebugInfo::Executing);
                
                // Hey, would you say the Swamp Camp is a safe place for ...
                Hero.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182449"));
                DC(int64(0x855eecab56914c8e), EConversationDebugInfo::Done);
                DB(int64(0x855eecab56914c95), G1R != nullptr && !G1R.HasReachedChapter(3));
                
                if (G1R != nullptr && !G1R.HasReachedChapter(3))
                {
                    DC(int64(0x855eecab56914c9c), EConversationDebugInfo::Executing);
                    // I think so, in general. But as long as the preparations ...
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182616"));
                    DC(int64(0x855eecab56914c9c), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914c9d), EConversationDebugInfo::Executing);
                    // After that, we will all be free - and if not, then ...
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182617"));
                    DC(int64(0x855eecab56914c9d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_chani_216003_exit_1");
                }
                else
                {
                    DC(int64(0x855eecab56914c99), EConversationDebugInfo::Executing);
                    // We lost our Master... and Cor Kalom has vanished...
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182546_1924"));
                    DC(int64(0x855eecab56914c99), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914ca0), EConversationDebugInfo::Executing);
                    
                    // Is that a "yes"?
                    Hero.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182644"));
                    DC(int64(0x855eecab56914ca0), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914c9e), EConversationDebugInfo::Executing);
                    
                    // For now, Cor Angar is leading the camp. And the Templars ...
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182640"));
                    DC(int64(0x855eecab56914c9e), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914c9f), EConversationDebugInfo::Executing);
                    // So I would say we are fairly safe, yes. Why do you ask?
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182641"));
                    DC(int64(0x855eecab56914c9f), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914ca1), EConversationDebugInfo::Executing);
                    
                    // Maybe someone is looking for a safe place...
                    Hero.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182715"));
                    DC(int64(0x855eecab56914ca1), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914ca2), EConversationDebugInfo::Executing);
                    
                    // Oh? Another prisoner of the Ore Barons, perhaps?
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182718"));
                    DC(int64(0x855eecab56914ca2), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914ca3), EConversationDebugInfo::Executing);
                    
                    // Maybe.
                    Hero.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182719"));
                    DC(int64(0x855eecab56914ca3), EConversationDebugInfo::Done);
                    DC(int64(0x855eecab56914ca4), EConversationDebugInfo::Executing);
                    
                    // In that case, we would welcome her with open arms. And ...
                    Chani.AI.Say(LocText("TEXT_WIP_CDAFQQG_20251230_182720"));
                    DC(int64(0x855eecab56914ca4), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_chani_216003_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */