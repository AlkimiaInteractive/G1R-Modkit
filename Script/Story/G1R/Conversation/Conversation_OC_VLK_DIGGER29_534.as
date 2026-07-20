#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_DIGGER29_534 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_DIGGER29_534";
        }
        
        
        class UTopic_Hero__OC_VLK_DIGGER29_534 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_DIGGER29_534";
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
        
        
        class UChoiceVlk534Exit : UTopic_Hero__OC_VLK_DIGGER29_534
        {
            default DebugId = int64(0xf68d490aa466b215);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf68d490aa466b216), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf68d490aa466b216), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk534Leaveme : UTopic_Hero__OC_VLK_DIGGER29_534
        {
            default DebugId = int64(0xf68d490aa466b217);
            default Caption = LocText("DIA_VLK_534_LEAVEME_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf68d490aa466b218), EConversationDebugInfo::Executing);
                // Why aren't you in the camp?
                Hero.AI.Say(LocText("DIA_VLK_534_LEAVEME_15_00"));
                DC(int64(0xf68d490aa466b218), EConversationDebugInfo::Done);
                DC(int64(0xf68d490aa466b219), EConversationDebugInfo::Executing);
                
                // What? Oh, I'm just waiting for a friend to get back from ...
                Digger.AI.Say(LocText("DIA_VLK_534_LEAVEME_02_01"));
                DC(int64(0xf68d490aa466b219), EConversationDebugInfo::Done);
                DC(int64(0xf68d490aa466b21a), EConversationDebugInfo::Executing);
                // You know how it is ... no nuggets means no protection ...
                Digger.AI.Say(LocText("DIA_VLK_534_LEAVEME_02_02"));
                DC(int64(0xf68d490aa466b21a), EConversationDebugInfo::Done);
                DC(int64(0xf68d490aa466b21b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf68d490aa466b21b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */