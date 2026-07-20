#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_BRIDGEGUARD01_275 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_BRIDGEGUARD01_275";
        }
        
        
        class UTopic_Hero__OC_GRD_BRIDGEGUARD01_275 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_BRIDGEGUARD01_275";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBridgeGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd275Exit : UTopic_Hero__OC_GRD_BRIDGEGUARD01_275
        {
            default DebugId = int64(0x39f0763ca3626f3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            
            default JustOne.Add(n"End");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd275Preexit);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39f0763ca3626f4), G1R != nullptr && G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39f0763ca3626f5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x39f0763ca3626f5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd275Preexit : UTopic_Hero__OC_GRD_BRIDGEGUARD01_275
        {
            default DebugId = int64(0x39f0763ca3626ef);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 4;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceGrd275Preexit);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x39f0763ca3626f0), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39f0763ca3626f1), EConversationDebugInfo::Executing);
                // Go on and get your arse into the camp. I'm sure they ...
                BridgeGuard.AI.Say(LocText("INFO_GRD_275_PREEXIT_06_01"));
                DC(int64(0x39f0763ca3626f1), EConversationDebugInfo::Done);
                DC(int64(0x39f0763ca3626f2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x39f0763ca3626f2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd275Tips : UTopic_Hero__OC_GRD_BRIDGEGUARD01_275
        {
            default DebugId = int64(0x39f0763ca3626fa);
            default Caption = LocText("INFO_GRD_275_TIPS_15_00");
            default PriorityRank = 2;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39f0763ca3626fb), EConversationDebugInfo::Executing);
                // Do you have any advice for me?
                Hero.AI.Say(LocText("INFO_GRD_275_TIPS_15_00"));
                DC(int64(0x39f0763ca3626fb), EConversationDebugInfo::Done);
                DC(int64(0x39f0763ca3626fc), EConversationDebugInfo::Executing);
                
                // Advice? Yeah. Stay outta the forest. 
                BridgeGuard.AI.Say(LocText("INFO_GRD_275_TIPS_06_01"));
                DC(int64(0x39f0763ca3626fc), EConversationDebugInfo::Done);
                DC(int64(0x39f0763ca3626fd), EConversationDebugInfo::Executing);
                // Unless, of course, you're strong enough to take on the ...
                BridgeGuard.AI.Say(LocText("INFO_GRD_275_TIPS_06_02"));
                DC(int64(0x39f0763ca3626fd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGrd275Wasmachtihrhier : UTopic_Hero__OC_GRD_BRIDGEGUARD01_275
        {
            default DebugId = int64(0x39f0763ca3626f6);
            default Caption = LocText("INFO_GRD_275_WASMACHTIHRHIER_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x39f0763ca3626f7), EConversationDebugInfo::Executing);
                
                // What are you doing here?
                Hero.AI.Say(LocText("INFO_GRD_275_WASMACHTIHRHIER_15_00"));
                DC(int64(0x39f0763ca3626f7), EConversationDebugInfo::Done);
                DC(int64(0x39f0763ca3626f8), EConversationDebugInfo::Executing);
                
                // What's it look like? We're guardin' the bridge.
                BridgeGuard.AI.Say(LocText("INFO_GRD_275_WASMACHTIHRHIER_06_01"));
                DC(int64(0x39f0763ca3626f8), EConversationDebugInfo::Done);
                DC(int64(0x39f0763ca3626f9), EConversationDebugInfo::Executing);
                // Without us, all them wild animals would be strollin' ...
                BridgeGuard.AI.Say(LocText("INFO_GRD_275_WASMACHTIHRHIER_06_02"));
                DC(int64(0x39f0763ca3626f9), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */