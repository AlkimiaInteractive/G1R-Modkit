#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_GUARD25_245 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_GUARD25_245";
        }
        
        
        class UTopic_Hero__OC_GRD_GUARD25_245 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_GUARD25_245";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd245Exit : UTopic_Hero__OC_GRD_GUARD25_245
        {
            default DebugId = int64(0xe33e391321f9cee3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe33e391321f9cee4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe33e391321f9cee4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd245Hello : UTopic_Hero__OC_GRD_GUARD25_245
        {
            default DebugId = int64(0xe33e391321f9cee5);
            default Caption = LocText("DIA_GRD_245_HELLO_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe33e391321f9cee6), EConversationDebugInfo::Executing);
                // What's in there? 
                Hero.AI.Say(LocText("DIA_GRD_245_HELLO_15_00"));
                DC(int64(0xe33e391321f9cee6), EConversationDebugInfo::Done);
                DC(int64(0xe33e391321f9cee7), EConversationDebugInfo::Executing);
                
                // That's the house of the ore barons. Don't try anything ...
                Guard.AI.Say(LocText("DIA_GRD_245_HELLO_13_01"));
                DC(int64(0xe33e391321f9cee7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */