#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_GRD_PACHO_224 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_GRD_PACHO_224";
        }
        
        
        class UTopic_Hero__OC_GRD_PACHO_224 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_GRD_PACHO_224";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetPacho() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoicePachoExit : UTopic_Hero__OC_GRD_PACHO_224
        {
            default DebugId = int64(0x50a480851b9a3e9f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50a480851b9a3ea0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x50a480851b9a3ea0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePachoStop : UTopic_Hero__OC_GRD_PACHO_224
        {
            default DebugId = int64(0x50a480851b9a3ea1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePachoStop);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x50a480851b9a3ea2), EConversationDebugInfo::Executing);
                // Hey, you!
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_01"));
                DC(int64(0x50a480851b9a3ea2), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea3), EConversationDebugInfo::Executing);
                
                // Me?
                Hero.AI.Say(LocText("INFO_PACHO_STOP_15_02"));
                DC(int64(0x50a480851b9a3ea3), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea4), EConversationDebugInfo::Executing);
                
                // No, your grandma. Of course I'm talking to you.
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_03"));
                DC(int64(0x50a480851b9a3ea4), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea5), EConversationDebugInfo::Executing);
                // I wouldn't go down there if I were you.
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_04"));
                DC(int64(0x50a480851b9a3ea5), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea6), EConversationDebugInfo::Executing);
                
                // Why?
                Hero.AI.Say(LocText("INFO_PACHO_STOP_15_05"));
                DC(int64(0x50a480851b9a3ea6), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea7), EConversationDebugInfo::Executing);
                
                // Man, can you get any more green-blood than that?
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_06"));
                DC(int64(0x50a480851b9a3ea7), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea8), EConversationDebugInfo::Executing);
                // That's orc territory down 'ere!
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_07"));
                DC(int64(0x50a480851b9a3ea8), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3ea9), EConversationDebugInfo::Executing);
                // They'll fucking tear you to shreds.
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_08"));
                DC(int64(0x50a480851b9a3ea9), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3eaa), EConversationDebugInfo::Executing);
                
                // Oh.
                Hero.AI.Say(LocText("INFO_PACHO_STOP_15_09"));
                DC(int64(0x50a480851b9a3eaa), EConversationDebugInfo::Done);
                DC(int64(0x50a480851b9a3eab), EConversationDebugInfo::Executing);
                
                // My pleasure.
                Pacho.AI.Say(LocText("INFO_PACHO_STOP_13_10"));
                DC(int64(0x50a480851b9a3eab), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_PACHO, Document::UDocumentSegment_Glossary_OC_GRD_PACHO_Introduction);
                DC(int64(0x50a480851b9a3eac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x50a480851b9a3eac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */