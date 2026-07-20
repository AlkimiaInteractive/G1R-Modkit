#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_SHRIKE_842 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_SHRIKE_842";
        }
        
        
        class UTopic_Hero__NC_ORG_SHRIKE_842 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_SHRIKE_842";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetShrike() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceShrike88518 : UTopic_Hero__NC_ORG_SHRIKE_842
        {
            default DebugId = int64(0x72b4a4fbf2b74bbc);
            default Caption = LocText("TEXT_WIP_QIWVLHC_20240315_184123");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceShrike88518);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72b4a4fbf2b74bba), EConversationDebugInfo::Executing);
                // Mind if I sleep in here?
                Hero.AI.Say(LocText("TEXT_WIP_QIWVLHC_20240315_184123"));
                DC(int64(0x72b4a4fbf2b74bba), EConversationDebugInfo::Done);
                DC(int64(0x72b4a4fbf2b74bbb), EConversationDebugInfo::Executing);
                
                // Yeah, I do. Get lost. 
                Shrike.AI.Say(LocText("TEXT_WIP_QIWVLHC_20240315_184123_41"));
                DC(int64(0x72b4a4fbf2b74bbb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SHRIKE, Document::UDocumentSegment_Glossary_NC_ORG_SHRIKE_Introduction);
                DC(int64(0xd56b128c2225e435), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xd56b128c2225e435), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceShrikeExit : UTopic_Hero__NC_ORG_SHRIKE_842
        {
            default DebugId = int64(0xe46f3b9a2c0b9e9c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe46f3b9a2c0b9e9d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe46f3b9a2c0b9e9d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceShrikeGetlost : UTopic_Hero__NC_ORG_SHRIKE_842
        {
            default DebugId = int64(0xe46f3b9a2c0b9ea2);
            default Caption = LocText("DIA_SHRIKE_GETLOST_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceShrikeGetlost);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe46f3b9a2c0b9ea3), Shrike != nullptr && Shrike.WasDefeatedBy(Hero));
                    DB(int64(0xe46f3b9a2c0b9ea4), Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE != nullptr && Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE.IsRunning());
                }
                
                if (Shrike != nullptr && !Shrike.WasDefeatedBy(Hero))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE != nullptr && !Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe46f3b9a2c0b9ea5), EConversationDebugInfo::Executing);
                // Had enough yet?
                Hero.AI.Say(LocText("DIA_SHRIKE_GETLOST_15_00"));
                DC(int64(0xe46f3b9a2c0b9ea5), EConversationDebugInfo::Done);
                DC(int64(0x6ccca6f0111f8167), EConversationDebugInfo::Executing);
                
                // You fucking- Why did you do that? 
                Shrike.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_144305"));
                DC(int64(0x6ccca6f0111f8167), EConversationDebugInfo::Done);
                DC(int64(0x6ccca6f0111f8168), EConversationDebugInfo::Executing);
                
                // What do you think? I want this hut. 
                Hero.AI.Say(LocText("TEXT_WIP_XUKFIKD_20241023_144316"));
                DC(int64(0x6ccca6f0111f8168), EConversationDebugInfo::Done);
                DC(int64(0x78d49fc8aa92c991), EConversationDebugInfo::Executing);
                
                // This ... this isn't over. This isn't over!
                Shrike.AI.Say(LocText("TEXT_WIP_ZBIFMIG_20241023_095059"));
                DC(int64(0x78d49fc8aa92c991), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SHRIKE, Document::UDocumentSegment_Glossary_NC_ORG_SHRIKE_AfterFight);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SHRIKESHUT, Document::UDocumentSegment_CH1_SHRIKESHUT_ReportGorn);
                DC(int64(0x613ad0295e72b793), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_TAKE.SucceedQuest();
                DC(int64(0x613ad0295e72b793), EConversationDebugInfo::Done);
                DC(int64(0x613ad0295e72b797), EConversationDebugInfo::Executing);
                Shrike.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Shrike_842_AfterFight);
                DC(int64(0x613ad0295e72b797), EConversationDebugInfo::Done);
                DC(int64(0xdb653d5a3e4834a2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SHRIKESHUT_SHRIKESHUT_OBJ_REPORT.StartQuest();
                DC(int64(0xdb653d5a3e4834a2), EConversationDebugInfo::Done);
                DC(int64(0xe46f3b9a2c0b9eaa), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe46f3b9a2c0b9eaa), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceShrikeHello : UTopic_Hero__NC_ORG_SHRIKE_842
        {
            default DebugId = int64(0xe46f3b9a2c0b9e9e);
            default Caption = LocText("DIA_SHRIKE_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceShrikeHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe46f3b9a2c0b9e9f), EConversationDebugInfo::Executing);
                // How's it going?
                Hero.AI.Say(LocText("DIA_SHRIKE_HELLO_15_00"));
                DC(int64(0xe46f3b9a2c0b9e9f), EConversationDebugInfo::Done);
                DC(int64(0xe46f3b9a2c0b9ea0), EConversationDebugInfo::Executing);
                
                // Piss off.
                Shrike.AI.Say(LocText("DIA_SHRIKE_HELLO_07_01"));
                DC(int64(0xe46f3b9a2c0b9ea0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SHRIKE, Document::UDocumentSegment_Glossary_NC_ORG_SHRIKE_Introduction);
                DC(int64(0xe46f3b9a2c0b9ea1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe46f3b9a2c0b9ea1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */