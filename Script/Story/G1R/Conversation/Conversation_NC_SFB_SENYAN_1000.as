#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SFB_SENYAN_1000 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SFB_SENYAN_1000";
        }
        
        
        class UTopic_Hero__NC_SFB_SENYAN_1000 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SFB_SENYAN_1000";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSenyan() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSenyanExit : UTopic_Hero__NC_SFB_SENYAN_1000
        {
            default DebugId = int64(0xcff93e2d3b7c5d79);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcff93e2d3b7c5d7a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xcff93e2d3b7c5d7a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSenyanHello : UTopic_Hero__NC_SFB_SENYAN_1000
        {
            default DebugId = int64(0xcff93e2d3b7c5d7b);
            default Caption = LocText("DIA_SENYAN_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSenyanHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcff93e2d3b7c5d7c), EConversationDebugInfo::Executing);
                // You work in that mine?
                Hero.AI.Say(LocText("DIA_SENYAN_HELLO_15_00"));
                DC(int64(0xcff93e2d3b7c5d7c), EConversationDebugInfo::Done);
                DC(int64(0xcff93e2d3b7c5d7d), EConversationDebugInfo::Executing);
                
                // The Free Mine, yeah. Wonder what gave me away ...
                Senyan.AI.Say(LocText("DIA_SENYAN_HELLO_01_01"));
                DC(int64(0xcff93e2d3b7c5d7d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SFB_SENYAN, Document::UDocumentSegment_Glossary_NC_SFB_SENYAN_Introduction);
                DC(int64(0xcff93e2d3b7c5d7e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xcff93e2d3b7c5d7e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSenyanJusttalk : UTopic_Hero__NC_SFB_SENYAN_1000
        {
            default DebugId = int64(0xcff93e2d3b7c5d7f);
            default Caption = LocText("DIA_SENYAN_JUSTTALK_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSenyanHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcff93e2d3b7c5d80), EConversationDebugInfo::Executing);
                // I just want to talk to you.
                Hero.AI.Say(LocText("DIA_SENYAN_JUSTTALK_15_00"));
                DC(int64(0xcff93e2d3b7c5d80), EConversationDebugInfo::Done);
                DC(int64(0xcff93e2d3b7c5d81), EConversationDebugInfo::Executing);
                
                // I ain't getting paid to chat. 
                Senyan.AI.Say(LocText("DIA_SENYAN_JUSTTALK_01_01"));
                DC(int64(0xcff93e2d3b7c5d81), EConversationDebugInfo::Done);
                DC(int64(0xcff93e2d3b7c5d82), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xcff93e2d3b7c5d82), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */