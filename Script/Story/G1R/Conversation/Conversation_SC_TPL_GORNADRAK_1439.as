#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_GORNADRAK_1439 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_GORNADRAK_1439";
        }
        
        
        class UTopic_Hero__SC_TPL_GORNADRAK_1439 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_GORNADRAK_1439";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaDrak() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGornadrakExit : UTopic_Hero__SC_TPL_GORNADRAK_1439
        {
            default DebugId = int64(0xb34976ba7d2924d0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34976ba7d2924d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb34976ba7d2924d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornadrakGreet : UTopic_Hero__SC_TPL_GORNADRAK_1439
        {
            default DebugId = int64(0xb34976ba7d2924d2);
            default Caption = LocText("DIA_GORNADRAK_GREET_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGornadrakGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34976ba7d2924d3), EConversationDebugInfo::Executing);
                // Hey. Where are you off to?
                Hero.AI.Say(LocText("DIA_GORNADRAK_GREET_15_00"));
                DC(int64(0xb34976ba7d2924d3), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924d4), EConversationDebugInfo::Executing);
                
                // Us? We're bringin' the crawler ichor we got at the mine ...
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_GREET_09_01"));
                DC(int64(0xb34976ba7d2924d4), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924d5), EConversationDebugInfo::Executing);
                // It's what we do every day. We need it for the ...
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_GREET_09_02"));
                DC(int64(0xb34976ba7d2924d5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNADRAK, Document::UDocumentSegment_Glossary_SC_TPL_GORNADRAK_Introduction);
            }
        }
        
        
        class UChoiceGornadrakPermanent : UTopic_Hero__SC_TPL_GORNADRAK_1439
        {
            default DebugId = int64(0xb34976ba7d2924e3);
            default Caption = LocText("DIA_GORNADRAK_PERMANENT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornadrakWhatfor);
            default Rules.HideIfKnows(UChoiceGornadrakPermanent);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb34976ba7d2924e4), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34976ba7d2924e5), EConversationDebugInfo::Executing);
                // How much more ichor do you need for the ritual?
                Hero.AI.Say(LocText("DIA_GORNADRAK_PERMANENT_15_00"));
                DC(int64(0xb34976ba7d2924e5), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924e6), EConversationDebugInfo::Executing);
                
                // A lot. We hunt day and night. 
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_PERMANENT_09_01"));
                DC(int64(0xb34976ba7d2924e6), EConversationDebugInfo::Done);
                DC(int64(0x4b95c7755cad7d58), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4b95c7755cad7d58), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGornadrakWassekret : UTopic_Hero__SC_TPL_GORNADRAK_1439
        {
            default DebugId = int64(0xb34976ba7d2924d6);
            default Caption = LocText("DIA_GORNADRAK_WASSEKRET_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornadrakGreet);
            default Rules.HideIfKnows(UChoiceGornadrakWassekret);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("GUR_1201_CORKALOM_VISION_INFO_10_02"), int64(0xb34976ba7d2924d6));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34976ba7d2924d7), EConversationDebugInfo::Executing);
                // "Crawler ichor?"
                Hero.AI.Say(LocText("DIA_GORNADRAK_WASSEKRET_15_00"));
                DC(int64(0xb34976ba7d2924d7), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924d8), EConversationDebugInfo::Executing);
                
                // Yes. The minecrawlers ooze it from their mandibles. If ...
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_WASSEKRET_09_01"));
                DC(int64(0xb34976ba7d2924d8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGornadrakWhatfor : UTopic_Hero__SC_TPL_GORNADRAK_1439
        {
            default DebugId = int64(0xb34976ba7d2924de);
            default Caption = LocText("DIA_GORNADRAK_WHATFOR_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGornadrakWassekret);
            default Rules.HideIfKnows(UChoiceGornadrakWhatfor);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34976ba7d2924df), EConversationDebugInfo::Executing);
                
                // What does Cor Kalom need the ichor for?
                Hero.AI.Say(LocText("DIA_GORNADRAK_WHATFOR_15_00"));
                DC(int64(0xb34976ba7d2924df), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924e0), EConversationDebugInfo::Executing);
                
                // Like I said - the dreamjuice. We need it for the Great ...
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_WHATFOR_09_01"));
                DC(int64(0xb34976ba7d2924e0), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924e1), EConversationDebugInfo::Executing);
                // It steels our minds so we can withstand the Sleeper's ...
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_WHATFOR_09_02"));
                DC(int64(0xb34976ba7d2924e1), EConversationDebugInfo::Done);
                DC(int64(0xb34976ba7d2924e2), EConversationDebugInfo::Executing);
                // But there's still so much to gather ... 
                GorNaDrak.AI.Say(LocText("DIA_GORNADRAK_WHATFOR_09_03"));
                DC(int64(0xb34976ba7d2924e2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */