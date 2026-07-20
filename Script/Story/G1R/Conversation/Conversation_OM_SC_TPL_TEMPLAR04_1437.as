#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_SC_TPL_TEMPLAR04_1437 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR04_1437";
        }
        
        
        class UTopic_Hero__OM_SC_TPL_TEMPLAR04_1437 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_SC_TPL_TEMPLAR04_1437";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTemplar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceTpl1437TemplerExit : UTopic_Hero__OM_SC_TPL_TEMPLAR04_1437
        {
            default DebugId = int64(0xfed365cd518fb7a1);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfed365cd518fb7a2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfed365cd518fb7a2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1437TemplerLeave : UTopic_Hero__OM_SC_TPL_TEMPLAR04_1437
        {
            default DebugId = int64(0xfed365cd518fb7a7);
            default Caption = LocText("TPL_1437_TEMPLER_LEAVE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1437TemplerNerv);
            default Rules.HideIfKnows(UChoiceTpl1437TemplerLeave);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfed365cd518fb7a8), EConversationDebugInfo::Executing);
                // Hey, what's new with you?
                Hero.AI.Say(LocText("TPL_1437_TEMPLER_LEAVE_INFO_15_01"));
                DC(int64(0xfed365cd518fb7a8), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7a9), EConversationDebugInfo::Executing);
                
                // Bloody- Do you need me to spell it out for you? I don't ...
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVE_INFO_13_02"));
                DC(int64(0xfed365cd518fb7a9), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7aa), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfed365cd518fb7aa), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1437TemplerLeavenow : UTopic_Hero__OM_SC_TPL_TEMPLAR04_1437
        {
            default DebugId = int64(0xfed365cd518fb7ab);
            default Caption = LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1437TemplerLeave);
            default Rules.HideIfKnows(UChoiceTpl1437TemplerLeavenow);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfed365cd518fb7ac), EConversationDebugInfo::Executing);
                // I just can't make out what you're saying ... 
                Hero.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_15_01"));
                DC(int64(0xfed365cd518fb7ac), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7ad), EConversationDebugInfo::Executing);
                
                // Okay, one more time for the dimwits. 
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_13_02"));
                DC(int64(0xfed365cd518fb7ad), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7ae), EConversationDebugInfo::Executing);
                // Leave. Me. Alone.
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_13_03"));
                DC(int64(0xfed365cd518fb7ae), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7af), EConversationDebugInfo::Executing);
                // Go away, get out of this mine!
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_13_04"));
                DC(int64(0xfed365cd518fb7af), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7b0), EConversationDebugInfo::Executing);
                // NEVER talk to me again. 
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_13_05"));
                DC(int64(0xfed365cd518fb7b0), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7b2), EConversationDebugInfo::Executing);
                // PISS. OFF!
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_LEAVENOW_INFO_13_07"));
                DC(int64(0xfed365cd518fb7b2), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7b3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfed365cd518fb7b3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1437TemplerNerv : UTopic_Hero__OM_SC_TPL_TEMPLAR04_1437
        {
            default DebugId = int64(0xfed365cd518fb7a3);
            default Caption = LocText("TPL_1437_TEMPLER_NERV_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfed365cd518fb7a4), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("TPL_1437_TEMPLER_NERV_INFO_15_01"));
                DC(int64(0xfed365cd518fb7a4), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7a5), EConversationDebugInfo::Executing);
                
                // Sleeper's Will, you really have to pester everyone down ...
                Templar.AI.Say(LocText("TPL_1437_TEMPLER_NERV_INFO_13_02"));
                DC(int64(0xfed365cd518fb7a5), EConversationDebugInfo::Done);
                DC(int64(0xfed365cd518fb7a6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfed365cd518fb7a6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */