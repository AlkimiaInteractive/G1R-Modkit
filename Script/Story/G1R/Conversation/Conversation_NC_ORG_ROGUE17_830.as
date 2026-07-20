#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE17_830 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE17_830";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE17_830 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE17_830";
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
        
        
        class UChoiceOrg830Aufhalten : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xdd5fafd1aa6ceb04);
            default Caption = LocText("INFO_ORG_830_AUFHALTEN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg830Hello);
            default Rules.HideIfKnows(UChoiceOrg830Aufhalten);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd5fafd1aa6ceb05), EConversationDebugInfo::Executing);
                // That's it? Aren't you gonna frisk me, or ask me what I ...
                Hero.AI.Say(LocText("INFO_ORG_830_AUFHALTEN_15_00"));
                DC(int64(0xdd5fafd1aa6ceb05), EConversationDebugInfo::Done);
                DC(int64(0xdd5fafd1aa6ceb06), EConversationDebugInfo::Executing);
                
                // Nah, can't be bothered. Also, what's a freshie like you ...
                Rogue.AI.Say(LocText("INFO_ORG_830_AUFHALTEN_13_01"));
                DC(int64(0xdd5fafd1aa6ceb06), EConversationDebugInfo::Done);
                DC(int64(0x16c8bb8d767ee46c), EConversationDebugInfo::Executing);
                // You can count on.
                Rogue.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_183324"));
                DC(int64(0x16c8bb8d767ee46c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg830Exit : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xdd5fafd1aa6ceafb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd5fafd1aa6ceafc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdd5fafd1aa6ceafc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg830Hello : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xdd5fafd1aa6ceafd);
            default Caption = LocText("INFO_ORG_830_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceOrg830Hello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd5fafd1aa6ceafe), EConversationDebugInfo::Executing);
                // Hi. I'm new here.
                Hero.AI.Say(LocText("INFO_ORG_830_HELLO_15_00"));
                DC(int64(0xdd5fafd1aa6ceafe), EConversationDebugInfo::Done);
                DC(int64(0xdd5fafd1aa6ceaff), EConversationDebugInfo::Executing);
                
                // And?
                Rogue.AI.Say(LocText("INFO_ORG_830_HELLO_13_01"));
                DC(int64(0xdd5fafd1aa6ceaff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg830Perm : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xdd5fafd1aa6ceb07);
            default Caption = LocText("INFO_ORG_830_PERM_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg830Hello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd5fafd1aa6ceb08), EConversationDebugInfo::Executing);
                
                // What's the situation in the camp?
                Hero.AI.Say(LocText("INFO_ORG_830_PERM_15_00"));
                DC(int64(0xdd5fafd1aa6ceb08), EConversationDebugInfo::Done);
                DB(int64(0xc737f845657a815c), G1R != nullptr && G1R.IsInChapter(1));
                DB(int64(0xc737f845657a815d), G1R != nullptr && G1R.IsInChapter(2));
                DB(int64(0xc737f845657a815e), G1R != nullptr && G1R.IsInChapter(3));
                DB(int64(0xc737f845657a819f), G1R != nullptr && G1R.IsInChapter(4));
                
                if (G1R != nullptr && G1R.IsInChapter(1))
                {
                    DC(int64(0xdd5fafd1aa6ceb09), EConversationDebugInfo::Executing);
                    // The usual. A few scraps here and there, but otherwise ...
                    Rogue.AI.Say(LocText("INFO_ORG_830_PERM_13_01"));
                    DC(int64(0xdd5fafd1aa6ceb09), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_830_perm_exit_1");
                }
                else if (G1R != nullptr && G1R.IsInChapter(2))
                {
                    DC(int64(0xc737f845657a815f), EConversationDebugInfo::Executing);
                    // Nothin' new really. Heard some folk talk about that big ...
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164109"));
                    DC(int64(0xc737f845657a815f), EConversationDebugInfo::Done);
                    DB(int64(0xc737f845657a816c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0xc737f845657a8172), EConversationDebugInfo::Executing);
                        // You're one of 'em, ain't you?
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164320_2238"));
                        DC(int64(0xc737f845657a8172), EConversationDebugInfo::Done);
                        DC(int64(0xc737f845657a817c), EConversationDebugInfo::Executing);
                        // Do you really believe that stuff? That this big ol' good ...
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164405"));
                        DC(int64(0xc737f845657a817c), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xc737f845657a8177), EConversationDebugInfo::Executing);
                        // What's your take on it? You think the "Sleeper" is gonna ...
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164324_1924"));
                        DC(int64(0xc737f845657a8177), EConversationDebugInfo::Done);
                    }
                    Subdialog(
                        UTopic_Rogue_113213,
                        UTopic_Rogue_113233,
                        UTopic_Rogue_113257
                    );
                }
                else if (G1R != nullptr && G1R.IsInChapter(3))
                {
                    DC(int64(0xc737f845657a8163), EConversationDebugInfo::Executing);
                    // Stable for now. Heard the mages are rampin' up their ...
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164116"));
                    DC(int64(0xc737f845657a8163), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a819b), EConversationDebugInfo::Executing);
                    // Wouldn't that be somethin' ... 
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164831"));
                    DC(int64(0xc737f845657a819b), EConversationDebugInfo::Done);
                }
                else if (G1R != nullptr && G1R.IsInChapter(4))
                {
                    DC(int64(0xc737f845657a81a0), EConversationDebugInfo::Executing);
                    // Bleedin' chaos, that's what it is! Can't believe those ...
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164917"));
                    DC(int64(0xc737f845657a81a0), EConversationDebugInfo::Done);
                    DB(int64(0xc737f845657a81a4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    {
                        DC(int64(0xc737f845657a81aa), EConversationDebugInfo::Executing);
                        // Honestly, be grateful I know you're one of the good ones ...
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_165039_1609"));
                        DC(int64(0xc737f845657a81aa), EConversationDebugInfo::Done);
                        DC(int64(0xc737f845657a81af), EConversationDebugInfo::Executing);
                        // Otherwise I'd have riddled you with so many arrows every ...
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_165143"));
                        DC(int64(0xc737f845657a81af), EConversationDebugInfo::Done);
                        DC(int64(0xc737f845657a81b0), EConversationDebugInfo::Executing);
                        
                        // Appreciate it ... 
                        Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_165317"));
                        DC(int64(0xc737f845657a81b0), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xc737f845657a81ad), EConversationDebugInfo::Executing);
                        
                        // But they'll pay for this. Believe me, they will. 
                        Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_165042_3569"));
                        DC(int64(0xc737f845657a81ad), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0xc737f845657a819c), EConversationDebugInfo::Executing);
                    // Ah, don't even ask. Some fucker sucked the magic out of ...
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164911"));
                    DC(int64(0xc737f845657a819c), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a81b2), EConversationDebugInfo::Executing);
                    // I swear, if that man ever ends up in front of me bow ... 
                    Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_165523"));
                    DC(int64(0xc737f845657a81b2), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a819d), EConversationDebugInfo::Executing);
                    
                    // I hope you catch him. 
                    Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164911_2386"));
                    DC(int64(0xc737f845657a819d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Rogue_113213 : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xc737f845657a817e);
            default Caption = LocText("TEXT_WIP_WUKFIKD_20241022_164428_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rogue_113213);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc737f845657a817f), EConversationDebugInfo::Executing);
                // Guess we'll find out.
                Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164428_2785"));
                DC(int64(0xc737f845657a817f), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8191), EConversationDebugInfo::Executing);
                
                // That, we will. 
                Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164521"));
                DC(int64(0xc737f845657a8191), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8192), EConversationDebugInfo::Executing);
                // Here's hopin' they don't all lose the plot and bash ...
                Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164547"));
                DC(int64(0xc737f845657a8192), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue_113233 : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xc737f845657a8182);
            default Caption = LocText("TEXT_WIP_WUKFIKD_20241022_164428_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rogue_113233);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc737f845657a8183), EConversationDebugInfo::Executing);
                
                // It's nonsense. 
                Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164428_3286"));
                DC(int64(0xc737f845657a8183), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8193), EConversationDebugInfo::Executing);
                
                // Yeah, I think so too. 
                Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164700"));
                DC(int64(0xc737f845657a8193), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8194), EConversationDebugInfo::Executing);
                // Here's hopin' they don't all lose the plot and bash ...
                Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164547"));
                DC(int64(0xc737f845657a8194), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue_113257 : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xc737f845657a818b);
            default Caption = LocText("TEXT_WIP_WUKFIKD_20241022_164446_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rogue_113257);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc737f845657a818c), EConversationDebugInfo::Executing);
                
                // I think the Sleeper is real, yes. 
                Hero.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164446_686"));
                DC(int64(0xc737f845657a818c), EConversationDebugInfo::Done);
                DC(int64(0xc737f845657a8196), EConversationDebugInfo::Executing);
                
                // (chuckles) Let's hope he believes in you. 
                Rogue.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_164730"));
                DC(int64(0xc737f845657a8196), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg830What : UTopic_Hero__NC_ORG_ROGUE17_830
        {
            default DebugId = int64(0xdd5fafd1aa6ceb00);
            default Caption = LocText("INFO_ORG_830_WHAT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg830Hello);
            default Rules.HideIfKnows(UChoiceOrg830What);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdd5fafd1aa6ceb01), EConversationDebugInfo::Executing);
                
                // What are you doing here?
                Hero.AI.Say(LocText("INFO_ORG_830_WHAT_15_00"));
                DC(int64(0xdd5fafd1aa6ceb01), EConversationDebugInfo::Done);
                DC(int64(0xdd5fafd1aa6ceb02), EConversationDebugInfo::Executing);
                
                // What's it look like? I'm smokin'. 
                Rogue.AI.Say(LocText("INFO_ORG_830_WHAT_13_01"));
                DC(int64(0xdd5fafd1aa6ceb02), EConversationDebugInfo::Done);
                DC(int64(0xdd5fafd1aa6ceb03), EConversationDebugInfo::Executing);
                // And no, you can't have one. 
                Rogue.AI.Say(LocText("INFO_ORG_830_WHAT_13_02"));
                DC(int64(0xdd5fafd1aa6ceb03), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */