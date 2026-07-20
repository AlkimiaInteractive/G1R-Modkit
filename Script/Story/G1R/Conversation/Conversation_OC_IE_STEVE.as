#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_IE_STEVE : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_IE_STEVE";
        }
        
        
        class UTopic_Hero__OC_IE_STEVE : UG1RDialogTopic
        {
            default ForCharacter = n"OC_IE_STEVE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSteve() const property
            {
                return Self;
            }
        }
        
        
        class UChoiceIe397AnnouncerAnnounce : UTopic_Hero__OC_IE_STEVE
        {
            default DebugId = int64(0x7490cb3d873e6465);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceIe397AnnouncerAnnounce);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7490cb3d873e6466), G1R != nullptr && G1R.IsInChapter(2));
                    DB(int64(0x23c4ec2a565ef173), G1R.PlaceholderCondition == 8);
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(2))
                    return false;
                
                if (G1R.PlaceholderCondition != 8)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7490cb3d873e6467), EConversationDebugInfo::Executing);
                // Revered ore barons, revered warders, shadows, and ...
                Steve.AI.Say(LocText("INFO_ANNOUNCER_ANNOUNCE_11_01"));
                DC(int64(0x7490cb3d873e6467), EConversationDebugInfo::Done);
                DC(int64(0x7490cb3d873e6468), EConversationDebugInfo::Executing);
                // I present you ...
                Steve.AI.Say(LocText("INFO_ANNOUNCER_ANNOUNCE_11_02"));
                DC(int64(0x7490cb3d873e6468), EConversationDebugInfo::Done);
                DC(int64(0x7490cb3d873e6469), EConversationDebugInfo::Executing);
                // IN EXTREMO!
                Steve.AI.Say(LocText("INFO_ANNOUNCER_ANNOUNCE_11_03"));
                DC(int64(0x7490cb3d873e6469), EConversationDebugInfo::Done);
                DC(int64(0x7490cb3d873e646c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7490cb3d873e646c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceIe397AnnouncerExit : UTopic_Hero__OC_IE_STEVE
        {
            default DebugId = int64(0x7490cb3d873e6463);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7490cb3d873e6464), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7490cb3d873e6464), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */