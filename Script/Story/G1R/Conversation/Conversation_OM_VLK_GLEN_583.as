#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_VLK_GLEN_583 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_VLK_GLEN_583";
        }
        
        
        class UTopic_Hero__OM_VLK_GLEN_583 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_VLK_GLEN_583";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGlen() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceVlk583GlenBuy : UTopic_Hero__OM_VLK_GLEN_583
        {
            default DebugId = int64(0x93bb7ce28f1389cf);
            default Caption = LocText("VLK_583_GLEN_BUY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceVlk583GlenLockpick);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x93bb7ce28f1389d0), EConversationDebugInfo::Executing);
                // I need lockpicks. 
                Hero.AI.Say(LocText("VLK_583_GLEN_BUY_INFO_15_01"));
                DC(int64(0x93bb7ce28f1389d0), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168c99), Glen != nullptr && Glen.IsAngryTowards(Hero));
                
                if (Glen != nullptr && Glen.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168c9a), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Glen.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_115342"));
                    DC(int64(0x7ec56dc721168c9a), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_vlk_583_glen_buy_exit_1");
                    DC(int64(0x7ec56dc721168c9c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168c9c), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xa4610215cd29ca28), EConversationDebugInfo::Executing);
                    Glen.AI.StartTradingWith(Hero);
                    DC(int64(0xa4610215cd29ca28), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_vlk_583_glen_buy_exit_2");
                }
            }
        }
        
        
        class UChoiceVlk583GlenExit : UTopic_Hero__OM_VLK_GLEN_583
        {
            default DebugId = int64(0x93bb7ce28f1389c4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x93bb7ce28f1389c5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x93bb7ce28f1389c5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceVlk583GlenInfo : UTopic_Hero__OM_VLK_GLEN_583
        {
            default DebugId = int64(0x93bb7ce28f1389c6);
            default Caption = LocText("VLK_583_GLEN_INFO_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef929), Glen != nullptr && !Glen.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Glen_583_Collapsed));
                }
                
                return Glen != nullptr && !Glen.HasAssignedDailyRoutine(UDailyRoutine_OM_VLK_Glen_583_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x93bb7ce28f1389c7), EConversationDebugInfo::Executing);
                // Is there anything I should look out for down here?
                Hero.AI.Say(LocText("VLK_583_GLEN_INFO_INFO_15_01"));
                DC(int64(0x93bb7ce28f1389c7), EConversationDebugInfo::Done);
                DC(int64(0x93bb7ce28f1389c8), EConversationDebugInfo::Executing);
                
                // You could say that. The crawlers.
                Glen.AI.Say(LocText("VLK_583_GLEN_INFO_INFO_02_02"));
                DC(int64(0x93bb7ce28f1389c8), EConversationDebugInfo::Done);
                DC(int64(0x93bb7ce28f1389c9), EConversationDebugInfo::Executing);
                // The farther down you go, the closer you are to those ...
                Glen.AI.Say(LocText("VLK_583_GLEN_INFO_INFO_02_03"));
                DC(int64(0x93bb7ce28f1389c9), EConversationDebugInfo::Done);
                DC(int64(0x93bb7ce28f1389ca), EConversationDebugInfo::Executing);
                // If you listen closely, you can hear them scrape and ...
                Glen.AI.Say(LocText("VLK_583_GLEN_INFO_INFO_02_04"));
                DC(int64(0x93bb7ce28f1389ca), EConversationDebugInfo::Done);
                DC(int64(0x93bb7ce28f1389cb), EConversationDebugInfo::Executing);
                // I saw them kill once ... they just bite your head off. ...
                Glen.AI.Say(LocText("VLK_583_GLEN_INFO_INFO_02_05"));
                DC(int64(0x93bb7ce28f1389cb), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_GLEN, Document::UDocumentSegment_Glossary_OM_VLK_GLEN_Introduction);
            }
        }
        
        
        class UChoiceVlk583GlenLockpick : UTopic_Hero__OM_VLK_GLEN_583
        {
            default DebugId = int64(0x93bb7ce28f1389cc);
            default Caption = LocText("VLK_583_GLEN_LOCKPICK_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceVlk583GlenLockpick);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("VLK_585_ALEPH_GLEN_INFO_05_02"), int64(0x93bb7ce28f1389cc));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x93bb7ce28f1389cd), EConversationDebugInfo::Executing);
                // I heard you sell lockpicks.
                Hero.AI.Say(LocText("VLK_583_GLEN_LOCKPICK_15_01"));
                DC(int64(0x93bb7ce28f1389cd), EConversationDebugInfo::Done);
                DC(int64(0x93bb7ce28f1389ce), EConversationDebugInfo::Executing);
                
                // Well ...
                Glen.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184124"));
                DC(int64(0x93bb7ce28f1389ce), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_VLK_GLEN, Document::UDocumentSegment_Glossary_OM_VLK_GLEN_Dealer);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */