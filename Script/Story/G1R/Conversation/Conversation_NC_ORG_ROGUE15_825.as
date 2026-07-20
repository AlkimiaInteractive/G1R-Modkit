#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE15_825 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE15_825";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE15_825 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE15_825";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceOrg825OrganisatorExit : UTopic_Hero__NC_ORG_ROGUE15_825
        {
            default DebugId = int64(0x5ad3aa2b5e849b1d);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ad3aa2b5e849b1e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5ad3aa2b5e849b1e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg825OrganisatorPerm : UTopic_Hero__NC_ORG_ROGUE15_825
        {
            default DebugId = int64(0x5ad3aa2b5e849b1f);
            default Caption = LocText("ORG_825_ORGANISATOR_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5ad3aa2b5e849b20), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("ORG_825_ORGANISATOR_PERM_15_00"));
                DC(int64(0x5ad3aa2b5e849b20), EConversationDebugInfo::Done);
                DC(int64(0x5ad3aa2b5e849b21), EConversationDebugInfo::Executing);
                
                // Makin' sure none of Lee or Gomez's goons get too close ...
                Rogue.AI.Say(LocText("ORG_825_ORGANISATOR_PERM_07_01"));
                DC(int64(0x5ad3aa2b5e849b21), EConversationDebugInfo::Done);
                DC(int64(0x5ad3aa2b5e849b22), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5ad3aa2b5e849b22), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */