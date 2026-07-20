#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_KILLIAN_861 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_KILLIAN_861";
        }
        
        
        class UTopic_Hero__UL_ORG_KILLIAN_861 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_KILLIAN_861";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKillian() const property
            {
                return Self;
            }
        }
        
        
        class UChoiceOrg861KillianExit : UTopic_Hero__UL_ORG_KILLIAN_861
        {
            default DebugId = int64(0xb4f24199b6a079);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdb049dcf9902cc3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbdb049dcf9902cc3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg861KillianGetlost : UTopic_Hero__UL_ORG_KILLIAN_861
        {
            default DebugId = int64(0xb4f24199b6a07b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb4f24199b6a07c), Killian != nullptr && Killian.IsInConversation());
                }
                
                return Killian != nullptr && Killian.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbdb049dcf9902cc4), EConversationDebugInfo::Executing);
                // Oh, piss off.
                Killian.AI.Say(LocText("ORG_861_KILLIAN_GETLOST_INFO_13_00"));
                DC(int64(0xbdb049dcf9902cc4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_KILLIAN, Document::UDocumentSegment_Glossary_UL_ORG_KILLIAN_Introduction);
                DC(int64(0xbdb049dcf9902cc5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbdb049dcf9902cc5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */