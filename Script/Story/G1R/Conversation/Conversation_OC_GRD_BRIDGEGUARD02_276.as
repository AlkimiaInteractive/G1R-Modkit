#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_BRIDGEGUARD02_276 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_BRIDGEGUARD02_276";
        }
        
        
        class UTopic_Hero__OC_GRD_BRIDGEGUARD02_276 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_BRIDGEGUARD02_276";
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
        
        
        class UChoiceGrd276Bla : UTopic_Hero__OC_GRD_BRIDGEGUARD02_276
        {
            default DebugId = int64(0xbc31fcfc6b964388);
            default Caption = LocText("INFO_GRD_276_BLA_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGrd276Tips);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbc31fcfc6b964389), EConversationDebugInfo::Executing);
                // Is that the Old Camp over there?
                Hero.AI.Say(LocText("INFO_GRD_276_BLA_15_00"));
                DC(int64(0xbc31fcfc6b964389), EConversationDebugInfo::Done);
                DC(int64(0xbc31fcfc6b96438a), EConversationDebugInfo::Executing);
                
                // No, King Rhobar's cathouse. The Old Camp's right under ...
                BridgeGuard.AI.Say(LocText("INFO_GRD_276_BLA_07_01"));
                DC(int64(0xbc31fcfc6b96438a), EConversationDebugInfo::Done);
                DC(int64(0xbc31fcfc6b96438b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbc31fcfc6b96438b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd276Exit : UTopic_Hero__OC_GRD_BRIDGEGUARD02_276
        {
            default DebugId = int64(0xbc31fcfc6b964382);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbc31fcfc6b964383), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbc31fcfc6b964383), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd276Tips : UTopic_Hero__OC_GRD_BRIDGEGUARD02_276
        {
            default DebugId = int64(0xbc31fcfc6b964384);
            default Caption = LocText("INFO_GRD_276_TIPS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd276Tips);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbc31fcfc6b964385), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbc31fcfc6b964386), EConversationDebugInfo::Executing);
                // Hey. I'm new here.
                Hero.AI.Say(LocText("INFO_GRD_276_TIPS_15_00"));
                DC(int64(0xbc31fcfc6b964386), EConversationDebugInfo::Done);
                DC(int64(0xbc31fcfc6b964387), EConversationDebugInfo::Executing);
                
                // Good for you.
                BridgeGuard.AI.Say(LocText("INFO_GRD_276_TIPS_07_01"));
                DC(int64(0xbc31fcfc6b964387), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */