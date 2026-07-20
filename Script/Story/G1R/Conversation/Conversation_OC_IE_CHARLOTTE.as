#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_CHARLOTTE : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_CHARLOTTE";
        }
        
        
        class UTopic_Hero__OC_IE_CHARLOTTE : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_CHARLOTTE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCharlotte() const property
            {
                return Self;
            }
        }
        
        
        class UChoiceCharlotte431622 : UTopic_Hero__OC_IE_CHARLOTTE
        {
            default DebugId = int64(0xc4b408d4de6d072f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4b408d4de6d0732), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc4b408d4de6d0732), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */