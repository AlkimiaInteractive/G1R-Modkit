#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_SHRAT_1356 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_SHRAT_1356";
        }
        
        
        class UTopic_Hero__SC_NOV_SHRAT_1356 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_SHRAT_1356";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetShrat() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceShratComewithme : UTopic_Hero__SC_NOV_SHRAT_1356
        {
            default DebugId = int64(0x12ca83f066f1fc29);
            default Caption = LocText("DIA_SHRAT_COMEWITHME_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceShratJoinpsi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x12ca83f066f1fc2a), Shrat != nullptr && !Shrat.IsInPartyWith(Hero));
                }
                
                return Shrat != nullptr && !Shrat.IsInPartyWith(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12ca83f066f1fc2b), EConversationDebugInfo::Executing);
                // Why not. Let's go.
                Hero.AI.Say(LocText("DIA_SHRAT_COMEWITHME_15_00"));
                DC(int64(0x12ca83f066f1fc2b), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc2c), EConversationDebugInfo::Executing);
                
                // That's what I like to hear. Lead the way!
                Shrat.AI.Say(LocText("DIA_SHRAT_COMEWITHME_02_01"));
                DC(int64(0x12ca83f066f1fc2c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_SHRAT, Document::UDocumentSegment_Glossary_SC_NOV_SHRAT_Party);
                DC(int64(0x12ca83f066f1fc2d), EConversationDebugInfo::Executing);
                Shrat.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_Follow);
                DC(int64(0x12ca83f066f1fc2d), EConversationDebugInfo::Done);
                DC(int64(0x95195e22c1219fa3), EConversationDebugInfo::Executing);
                Shrat.JoinPartyOf(Hero);
                DC(int64(0x95195e22c1219fa3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceShratExit : UTopic_Hero__SC_NOV_SHRAT_1356
        {
            default DebugId = int64(0x12ca83f066f1fc1c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12ca83f066f1fc1d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x12ca83f066f1fc1d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceShratJoinpsi : UTopic_Hero__SC_NOV_SHRAT_1356
        {
            default DebugId = int64(0x12ca83f066f1fc25);
            default Caption = LocText("DIA_SHRAT_JOINPSI_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceShratWhyhere);
            default Rules.HideIfKnows(UChoiceShratJoinpsi);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x868d389bf57c8835), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12ca83f066f1fc26), EConversationDebugInfo::Executing);
                // I want to join the Brotherhood. Can you help me?
                Hero.AI.Say(LocText("DIA_SHRAT_JOINPSI_15_00"));
                DC(int64(0x12ca83f066f1fc26), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc27), EConversationDebugInfo::Executing);
                
                // What, you wanna join those loons? (scoffs) I'd have long ...
                Shrat.AI.Say(LocText("DIA_SHRAT_JOINPSI_02_01"));
                DC(int64(0x12ca83f066f1fc27), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc28), EConversationDebugInfo::Executing);
                // Come to think of it ... we could travel together, ...
                Shrat.AI.Say(LocText("DIA_SHRAT_JOINPSI_02_02"));
                DC(int64(0x12ca83f066f1fc28), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceShratLeaveme : UTopic_Hero__SC_NOV_SHRAT_1356
        {
            default DebugId = int64(0x12ca83f066f1fc2e);
            default Caption = LocText("DIA_SHRAT_LEAVEME_15_00");
            default PriorityRank = 5;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x12ca83f066f1fc2f), Shrat != nullptr && Shrat.IsInPartyWith(Hero));
                }
                
                return Shrat != nullptr && Shrat.IsInPartyWith(Hero);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12ca83f066f1fc30), EConversationDebugInfo::Executing);
                
                // It's time to part ways. I'll travel alone for a bit.
                Hero.AI.Say(LocText("DIA_SHRAT_LEAVEME_15_00"));
                DC(int64(0x12ca83f066f1fc30), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc31), EConversationDebugInfo::Executing);
                
                // What, already? Fine, I guess. I'll head back to me shack ...
                Shrat.AI.Say(LocText("DIA_SHRAT_LEAVEME_02_01"));
                DC(int64(0x12ca83f066f1fc31), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_SHRAT, Document::UDocumentSegment_Glossary_SC_NOV_SHRAT_LeftParty);
                DC(int64(0x12ca83f066f1fc32), EConversationDebugInfo::Executing);
                Shrat.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Shrat_1356_Start);
                DC(int64(0x12ca83f066f1fc32), EConversationDebugInfo::Done);
                DC(int64(0x95195e22c1219fa1), EConversationDebugInfo::Executing);
                Shrat.LeavePartyOf(Hero);
                DC(int64(0x95195e22c1219fa1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceShratWhyhere : UTopic_Hero__SC_NOV_SHRAT_1356
        {
            default DebugId = int64(0x12ca83f066f1fc1e);
            default Caption = LocText("DIA_SHRAT_WHYHERE_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceShratWhyhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x12ca83f066f1fc1f), EConversationDebugInfo::Executing);
                // What are you doing all the way out here? 
                Hero.AI.Say(LocText("DIA_SHRAT_WHYHERE_15_00"));
                DC(int64(0x12ca83f066f1fc1f), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc20), EConversationDebugInfo::Executing);
                
                // Have I given you permission to speak to me? 
                Shrat.AI.Say(LocText("DIA_SHRAT_WHYHERE_02_01"));
                DC(int64(0x12ca83f066f1fc20), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc21), EConversationDebugInfo::Executing);
                // Sorry, just kiddin', mate. I'm gettin' some space ...
                Shrat.AI.Say(LocText("DIA_SHRAT_WHYHERE_02_02"));
                DC(int64(0x12ca83f066f1fc21), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc22), EConversationDebugInfo::Executing);
                // "Do not speak to me!" - "Beg the Sleeper for ...
                Shrat.AI.Say(LocText("DIA_SHRAT_WHYHERE_02_03"));
                DC(int64(0x12ca83f066f1fc22), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc23), EConversationDebugInfo::Executing);
                // Fuckin' hell. How's anybody supposed to stay sane with ...
                Shrat.AI.Say(LocText("DIA_SHRAT_WHYHERE_02_04"));
                DC(int64(0x12ca83f066f1fc23), EConversationDebugInfo::Done);
                DC(int64(0x12ca83f066f1fc24), EConversationDebugInfo::Executing);
                // Anyway, I'm Shrat, Novice of the First Rank. And that's ...
                Shrat.AI.Say(LocText("DIA_SHRAT_WHYHERE_02_05"));
                DC(int64(0x12ca83f066f1fc24), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_SHRAT, Document::UDocumentSegment_Glossary_SC_NOV_SHRAT_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */