#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_EBR_ARTO_102 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_EBR_ARTO_102";
        }
        
        
        class UTopic_Hero__OC_EBR_ARTO_102 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_EBR_ARTO_102";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetArto() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceArtoExit : UTopic_Hero__OC_EBR_ARTO_102
        {
            default DebugId = int64(0x3c34d87737641e9e);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c34d87737641e9f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3c34d87737641e9f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceArtoHello : UTopic_Hero__OC_EBR_ARTO_102
        {
            default DebugId = int64(0x3c34d87737641ea0);
            default Caption = LocText("DIA_ARTO_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceArtoHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c34d87737641ea1), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("DIA_ARTO_HELLO_15_00"));
                DC(int64(0x3c34d87737641ea1), EConversationDebugInfo::Done);
                DC(int64(0x3c34d87737641ea2), EConversationDebugInfo::Executing);
                
                // Arto.
                Arto.AI.Say(LocText("DIA_ARTO_HELLO_13_01"));
                DC(int64(0x3c34d87737641ea2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_EBR_ARTO, Document::UDocumentSegment_Glossary_OC_EBR_ARTO_Introduction);
            }
        }
        
        
        class UChoiceArtoPerm : UTopic_Hero__OC_EBR_ARTO_102
        {
            default DebugId = int64(0x3c34d87737641ea6);
            default Caption = LocText("DIA_ARTO_PERM_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceArtoWhat);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c34d87737641ea7), EConversationDebugInfo::Executing);
                // Not the talkative type, are you? 
                Hero.AI.Say(LocText("DIA_ARTO_PERM_15_00"));
                DC(int64(0x3c34d87737641ea7), EConversationDebugInfo::Done);
                DC(int64(0x3c34d87737641ea8), EConversationDebugInfo::Executing);
                
                // No.
                Arto.AI.Say(LocText("DIA_ARTO_PERM_13_01"));
                DC(int64(0x3c34d87737641ea8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceArtoWhat : UTopic_Hero__OC_EBR_ARTO_102
        {
            default DebugId = int64(0x3c34d87737641ea3);
            default Caption = LocText("DIA_ARTO_WHAT_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceArtoHello);
            default Rules.HideIfKnows(UChoiceArtoWhat);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3c34d87737641ea4), EConversationDebugInfo::Executing);
                
                // And ... what do you do?
                Hero.AI.Say(LocText("DIA_ARTO_WHAT_15_00"));
                DC(int64(0x3c34d87737641ea4), EConversationDebugInfo::Done);
                DC(int64(0x3c34d87737641ea5), EConversationDebugInfo::Executing);
                
                // I'm Gomez's bodyguard.
                Arto.AI.Say(LocText("DIA_ARTO_WHAT_13_01"));
                DC(int64(0x3c34d87737641ea5), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */