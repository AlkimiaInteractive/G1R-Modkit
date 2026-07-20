#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_SHARKY_843 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_SHARKY_843";
        }
        
        
        class UTopic_Hero__NC_ORG_SHARKY_843 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_SHARKY_843";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSharky() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
        }
        
        
        class UChoiceOrg843SharkyExit : UTopic_Hero__NC_ORG_SHARKY_843
        {
            default DebugId = int64(0x72be3ae0b6d0ea81);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72be3ae0b6d0ea82), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x72be3ae0b6d0ea82), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg843SharkyFisk : UTopic_Hero__NC_ORG_SHARKY_843
        {
            default DebugId = int64(0x72be3ae0b6d0ea83);
            default Caption = LocText("ORG_843_SHARKY_FISK_INFO_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceOrg843SharkyFisk);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x72be3ae0b6d0ea84), Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72be3ae0b6d0ea85), EConversationDebugInfo::Executing);
                // Fisk, from the Old Camp, is looking for a new fence.
                Hero.AI.Say(LocText("ORG_843_SHARKY_FISK_INFO_15_00"));
                DC(int64(0x72be3ae0b6d0ea85), EConversationDebugInfo::Done);
                DC(int64(0x72be3ae0b6d0ea86), EConversationDebugInfo::Executing);
                
                // Why are you telling me this?
                Sharky.AI.Say(LocText("ORG_843_SHARKY_FISK_INFO_10_01"));
                DC(int64(0x72be3ae0b6d0ea86), EConversationDebugInfo::Done);
                DC(int64(0x72be3ae0b6d0ea87), EConversationDebugInfo::Executing);
                
                // I figured you wouldn't mind making some nuggets on the ...
                Hero.AI.Say(LocText("ORG_843_SHARKY_FISK_INFO_15_02"));
                DC(int64(0x72be3ae0b6d0ea87), EConversationDebugInfo::Done);
                DC(int64(0x72be3ae0b6d0ea88), EConversationDebugInfo::Executing);
                
                // You know what, I think I don't. All right, then, tell ...
                Sharky.AI.Say(LocText("ORG_843_SHARKY_FISK_INFO_10_03"));
                DC(int64(0x72be3ae0b6d0ea88), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_FISKNEWDEALER, Document::UDocumentSegment_CH1_FISKNEWDEALER_Sharky);
                DC(int64(0x391214a72fa7024d), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE.SucceedQuest();
                DC(int64(0x391214a72fa7024d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg843SharkyGreet : UTopic_Hero__NC_ORG_SHARKY_843
        {
            default DebugId = int64(0x72be3ae0b6d0ea8d);
            default Caption = LocText("ORG_843_SHARKY_GREET_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg843SharkyGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72be3ae0b6d0ea8f), EConversationDebugInfo::Executing);
                // Hey, how's it going?
                Hero.AI.Say(LocText("ORG_843_SHARKY_GREET_INFO_15_01"));
                DC(int64(0x72be3ae0b6d0ea8f), EConversationDebugInfo::Done);
                DC(int64(0x72be3ae0b6d0ea90), EConversationDebugInfo::Executing);
                
                // Depends. You're looking to buy something?
                Sharky.AI.Say(LocText("ORG_843_SHARKY_GREET_INFO_10_02"));
                DC(int64(0x72be3ae0b6d0ea90), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SHARKY, Document::UDocumentSegment_Glossary_NC_ORG_SHARKY_Introduction_Trader);
            }
        }
        
        
        class UChoiceOrg843SharkyTrade : UTopic_Hero__NC_ORG_SHARKY_843
        {
            default DebugId = int64(0x72be3ae0b6d0ea8a);
            default Caption = LocText("ORG_843_SHARKY_TRADE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg843SharkyGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x72be3ae0b6d0ea8b), EConversationDebugInfo::Executing);
                // I'm looking for new gear.
                Hero.AI.Say(LocText("ORG_843_SHARKY_TRADE_INFO_15_01"));
                DC(int64(0x72be3ae0b6d0ea8b), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc7211689a8), Sharky != nullptr && Sharky.IsAngryTowards(Hero));
                
                if (Sharky != nullptr && Sharky.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc7211689f0), EConversationDebugInfo::Executing);
                    // Word is, you've made some dangerous enemies. If I value ...
                    Sharky.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_104449"));
                    DC(int64(0x7ec56dc7211689f0), EConversationDebugInfo::Done);
                    DC(int64(0x3324a0310d74eb4e), EConversationDebugInfo::Executing);
                    Sharky.AI.StartTradingWith(Hero);
                    DC(int64(0x3324a0310d74eb4e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_843_sharky_trade_exit_1");
                    DC(int64(0x7ec56dc721168a01), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168a01), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x3324a0310d74eb4e), EConversationDebugInfo::Executing);
                    Sharky.AI.StartTradingWith(Hero);
                    DC(int64(0x3324a0310d74eb4e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_843_sharky_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */