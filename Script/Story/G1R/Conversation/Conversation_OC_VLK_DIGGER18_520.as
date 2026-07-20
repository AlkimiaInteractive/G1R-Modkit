#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_DIGGER18_520 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_DIGGER18_520";
        }
        
        
        class UTopic_Hero__OC_VLK_DIGGER18_520 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_DIGGER18_520";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDigger() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceVlk520Exit : UTopic_Hero__OC_VLK_DIGGER18_520
        {
            default DebugId = int64(0x74331bad1d3780db);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x74331bad1d3780dc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x74331bad1d3780dc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk520Leaveme : UTopic_Hero__OC_VLK_DIGGER18_520
        {
            default DebugId = int64(0x74331bad1d3780dd);
            default Caption = LocText("DIA_VLK_520_LEAVEME_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x74331bad1d3780de), EConversationDebugInfo::Executing);
                // What are you doing out here?
                Hero.AI.Say(LocText("DIA_VLK_520_LEAVEME_15_00"));
                DC(int64(0x74331bad1d3780de), EConversationDebugInfo::Done);
                DC(int64(0x74331bad1d3780df), EConversationDebugInfo::Executing);
                
                // I want to be left in peace - so get lost!
                Digger.AI.Say(LocText("DIA_VLK_520_LEAVEME_01_01"));
                DC(int64(0x74331bad1d3780df), EConversationDebugInfo::Done);
                DC(int64(0x74331bad1d3780e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x74331bad1d3780e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */