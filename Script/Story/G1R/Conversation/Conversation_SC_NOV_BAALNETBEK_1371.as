#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_BAALNETBEK_1371 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_BAALNETBEK_1371";
        }
        
        
        class UTopic_Hero__SC_NOV_BAALNETBEK_1371 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_BAALNETBEK_1371";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalNetbek() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNov1371BaalnetbekAgain : UTopic_Hero__SC_NOV_BAALNETBEK_1371
        {
            default DebugId = int64(0xaf964152b8921621);
            default Caption = LocText("NOV_1371_BAALNETBEK_AGAIN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNov1371BaalnetbekCrazy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf964152b8921622), EConversationDebugInfo::Executing);
                // Hey, how's it going?
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_AGAIN_INFO_15_01"));
                DC(int64(0xaf964152b8921622), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b8921623), EConversationDebugInfo::Executing);
                
                // Oh, watch your step! Don't you step on my flowers!
                BaalNetbek.AI.Say(LocText("NOV_1371_BAALNETBEK_AGAIN_INFO_03_02"));
                DC(int64(0xaf964152b8921623), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNov1371BaalnetbekCrazy : UTopic_Hero__SC_NOV_BAALNETBEK_1371
        {
            default DebugId = int64(0xaf964152b8921616);
            default Caption = LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceNov1371BaalnetbekCrazy);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf964152b8921617), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_01"));
                DC(int64(0xaf964152b8921617), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b8921618), EConversationDebugInfo::Executing);
                
                // Me? I'm a guru. THE guru of the swamp. Baal Netbek, ...
                BaalNetbek.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_03_02"));
                DC(int64(0xaf964152b8921618), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b8921619), EConversationDebugInfo::Executing);
                
                // I'm not seeing any servants.
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_03"));
                DC(int64(0xaf964152b8921619), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b892161a), EConversationDebugInfo::Executing);
                
                // Then you, my friend, are blind! My servants are ...
                BaalNetbek.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_03_04"));
                DC(int64(0xaf964152b892161a), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b892161b), EConversationDebugInfo::Executing);
                
                // ... I better get going. 
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_05"));
                DC(int64(0xaf964152b892161b), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b892161c), EConversationDebugInfo::Executing);
                
                // No, no, wait! You could help me, you know? You could ...
                BaalNetbek.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_03_06"));
                DC(int64(0xaf964152b892161c), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b892161d), EConversationDebugInfo::Executing);
                
                // Sounds great - how about you get started already? I'll ...
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_07"));
                DC(int64(0xaf964152b892161d), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f545), EConversationDebugInfo::Executing);
                
                // Yes! We will be the masters of the flowers!
                BaalNetbek.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_140121"));
                DC(int64(0x5dcd7126285f545), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_BAALNETBEK, Document::UDocumentSegment_Glossary_SC_NOV_BAALNETBEK_Introduction);
                DC(int64(0xaf964152b892161e), EConversationDebugInfo::Executing);
                Hero.AI.TurnAwayFrom(BaalNetbek);
                DC(int64(0xaf964152b892161e), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b892161f), EConversationDebugInfo::Executing);
                // Don't think that guy will be any help to me. 
                Hero.AI.Say(LocText("NOV_1371_BAALNETBEK_CRAZY_INFO_15_08"));
                DC(int64(0xaf964152b892161f), EConversationDebugInfo::Done);
                DC(int64(0xaf964152b8921620), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaf964152b8921620), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNov1371BaalnetbekExit : UTopic_Hero__SC_NOV_BAALNETBEK_1371
        {
            default DebugId = int64(0xaf964152b8921614);
            default Caption = LocText("TEXT_CHOICE_NOV_1371_BAALNETBEK_EXIT");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaf964152b8921615), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaf964152b8921615), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */