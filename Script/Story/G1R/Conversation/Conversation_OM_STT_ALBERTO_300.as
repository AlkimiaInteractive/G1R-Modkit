#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_STT_ALBERTO_300 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_STT_ALBERTO_300";
        }
        
        
        class UTopic_Hero__OM_STT_ALBERTO_300 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_STT_ALBERTO_300";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetAlberto() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceStt300AlbertoBuy : UTopic_Hero__OM_STT_ALBERTO_300
        {
            default DebugId = int64(0xa1560cec67876ab);
            default Caption = LocText("STT_300_ALBERTO_BUY_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa1560cec67876ac), EConversationDebugInfo::Executing);
                // Do you trade?
                Hero.AI.Say(LocText("STT_300_ALBERTO_BUY_INFO_15_01"));
                DC(int64(0xa1560cec67876ac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_ALBERTO, Document::UDocumentSegment_Glossary_OM_STT_ALBERTO_Introduction_Trader);
                DB(int64(0x7ec56dc721168c8c), Alberto != nullptr && Alberto.IsAngryTowards(Hero));
                
                if (Alberto != nullptr && Alberto.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168c8e), EConversationDebugInfo::Executing);
                    // I've heard whispers of your deeds. Selling to you feels ...
                    Alberto.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_115145_3334"));
                    DC(int64(0x7ec56dc721168c8e), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231631f0e), EConversationDebugInfo::Executing);
                    // Expect the prices to reflect the danger.
                    Alberto.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_150310"));
                    DC(int64(0x81b634f231631f0e), EConversationDebugInfo::Done);
                    DC(int64(0xa1560cec67876ae), EConversationDebugInfo::Executing);
                    Alberto.AI.StartTradingWith(Hero);
                    DC(int64(0xa1560cec67876ae), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_300_alberto_buy_exit_1");
                }
                else
                {
                    DC(int64(0x7ec56dc721168c91), EConversationDebugInfo::Executing);
                    // I do. I can get you anything ... IF the ore's right. 
                    Alberto.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_115206_3511"));
                    DC(int64(0x7ec56dc721168c91), EConversationDebugInfo::Done);
                    DC(int64(0xa1560cec67876ae), EConversationDebugInfo::Executing);
                    Alberto.AI.StartTradingWith(Hero);
                    DC(int64(0xa1560cec67876ae), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_300_alberto_buy_exit_2");
                }
            }
        }
        
        
        class UChoiceStt300AlbertoExit : UTopic_Hero__OM_STT_ALBERTO_300
        {
            default DebugId = int64(0xa1560cec67876a9);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa1560cec67876aa), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa1560cec67876aa), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */