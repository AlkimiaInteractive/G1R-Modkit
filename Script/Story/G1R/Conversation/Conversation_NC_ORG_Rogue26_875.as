#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE26_875 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE26_875";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE26_875 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE26_875";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBouncer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg875Exit : UTopic_Hero__NC_ORG_ROGUE26_875
        {
            default DebugId = int64(0x85fd62ae145032a2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x85fd62ae145032a3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x85fd62ae145032a3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg875Perm : UTopic_Hero__NC_ORG_ROGUE26_875
        {
            default DebugId = int64(0x85fd62ae145032a4);
            default Caption = LocText("DIA_ORG_875_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x85fd62ae145032a5), EConversationDebugInfo::Executing);
                // Why aren't you letting in more people? 
                Hero.AI.Say(LocText("DIA_ORG_875_PERM_15_00"));
                DC(int64(0x85fd62ae145032a5), EConversationDebugInfo::Done);
                DC(int64(0x85fd62ae145032a6), EConversationDebugInfo::Executing);
                
                // Cause they keep asking stupid questions. 
                Bouncer.AI.Say(LocText("DIA_ORG_875_PERM_13_01"));
                DC(int64(0x85fd62ae145032a6), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */