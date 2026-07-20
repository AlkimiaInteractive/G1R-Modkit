#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE04_807 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE04_807";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE04_807 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE04_807";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue04() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceRogue0497804 : UTopic_Hero__NC_ORG_ROGUE04_807
        {
            default DebugId = int64(0xb35d15d7a238dc17);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceRogue0497804);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb35d15d7a238dc16), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb35d15d7a238dc16), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue0497820 : UTopic_Hero__NC_ORG_ROGUE04_807
        {
            default DebugId = int64(0xb35d15d7a238dc1b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceRogue0497820);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_SATURAS_AMBUSH_14_01"), int64(0xb35d15d7a238dc1b));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_ZWKHAXF_20240527_154504_3719"), int64(0xb35d15d7a238dc1b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x222dae20f194be38), G1R.FireMagesDead != 0);
                }
                
                return G1R.FireMagesDead != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xbb92f428907887ff), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                DB(int64(0x19f1d0df4e41e8bc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xbb92f42890788801), EConversationDebugInfo::Executing);
                    // Another one ... and all by himself. Any last words? 
                    Rogue04.AI.Say(LocText("TEXT_WIP_IXKHAXF_20240528_110358_41"));
                    DC(int64(0xbb92f42890788801), EConversationDebugInfo::Done);
                    DC(int64(0xd20c82822dede47f), EConversationDebugInfo::Executing);
                    Rogue04.AI.DrawCombatWeapon();
                    DC(int64(0xd20c82822dede47f), EConversationDebugInfo::Done);
                    DC(int64(0xd20c82822dede482), EConversationDebugInfo::Executing);
                    // What are you on about? 
                    Hero.AI.Say(LocText("TEXT_WIP_FEGJUJG_20250312_114557"));
                    DC(int64(0xd20c82822dede482), EConversationDebugInfo::Done);
                    DC(int64(0xd20c82822dede483), EConversationDebugInfo::Executing);
                    
                    // You're ... not with them? But- 
                    Rogue04.AI.Say(LocText("TEXT_WIP_FEGJUJG_20250312_114557_41"));
                    DC(int64(0xd20c82822dede483), EConversationDebugInfo::Done);
                    DC(int64(0xd20c82822dede486), EConversationDebugInfo::Executing);
                    // Wait. I know you! You're that guy who found the focus ...
                    Rogue04.AI.Say(LocText("TEXT_WIP_FEGJUJG_20250312_114618"));
                    DC(int64(0xd20c82822dede486), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x19f1d0df4e41e8be), EConversationDebugInfo::Executing);
                    // Hold up, this is - wait.
                    Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192438_2995"));
                    DC(int64(0x19f1d0df4e41e8be), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a8152), EConversationDebugInfo::Executing);
                    // You're that Lo-
                    Rogue04.AI.Say(LocText("TEXT_WIP_WUKFIKD_20241022_163230"));
                    DC(int64(0xc737f845657a8152), EConversationDebugInfo::Done);
                    DC(int64(0x199a71fa1b22a4af), EConversationDebugInfo::Executing);
                    // I mean, the templar, who helped the mages with the focus ...
                    Rogue04.AI.Say(LocText("TEXT_WIP_WPTXGMK_20241023_110717"));
                    DC(int64(0x199a71fa1b22a4af), EConversationDebugInfo::Done);
                    DC(int64(0x19f1d0df4e41e8c1), EConversationDebugInfo::Executing);
                    
                    // I am. What's going on here? 
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192544"));
                    DC(int64(0x19f1d0df4e41e8c1), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xbb92f42890788803), EConversationDebugInfo::Executing);
                    
                    // Hold up, this is - wait.
                    Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192438_2995"));
                    DC(int64(0xbb92f42890788803), EConversationDebugInfo::Done);
                    DC(int64(0xc737f845657a8153), EConversationDebugInfo::Executing);
                    // Wait. I know you! You're that guy who found the focus ...
                    Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192222"));
                    DC(int64(0xc737f845657a8153), EConversationDebugInfo::Done);
                    DC(int64(0xbb92f4289078880e), EConversationDebugInfo::Executing);
                    
                    // I am. What's going on here? 
                    Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192544"));
                    DC(int64(0xbb92f4289078880e), EConversationDebugInfo::Done);
                }
                DC(int64(0x19f1d0df4e41e8c2), EConversationDebugInfo::Executing);
                // (deep sigh) Gomez. He raided the Free Mine. 
                Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192555"));
                DC(int64(0x19f1d0df4e41e8c2), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8c3), EConversationDebugInfo::Executing);
                
                // You're joking. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192624"));
                DC(int64(0x19f1d0df4e41e8c3), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8c4), EConversationDebugInfo::Executing);
                
                // No. I was there when they attacked, but I got away. Word ...
                Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192628"));
                DC(int64(0x19f1d0df4e41e8c4), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8c6), EConversationDebugInfo::Executing);
                // I'm sure Lee and his mercs are already preparing ...
                Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192706"));
                DC(int64(0x19f1d0df4e41e8c6), EConversationDebugInfo::Done);
                DC(int64(0xbb92f42890788811), EConversationDebugInfo::Executing);
                
                // All right - I'll go see Saturas. I have some news for ...
                Hero.AI.Say(LocText("TEXT_WIP_IXKHAXF_20240528_110737"));
                DC(int64(0xbb92f42890788811), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8c7), EConversationDebugInfo::Executing);
                
                // Good news, I hope? 
                Rogue04.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192803"));
                DC(int64(0x19f1d0df4e41e8c7), EConversationDebugInfo::Done);
                DC(int64(0x19f1d0df4e41e8c8), EConversationDebugInfo::Executing);
                
                // Don't ask. 
                Hero.AI.Say(LocText("TEXT_WIP_SRQTACJ_20240607_192807"));
                DC(int64(0x19f1d0df4e41e8c8), EConversationDebugInfo::Done);
                DC(int64(0x340f78eff0ad22af), EConversationDebugInfo::Executing);
                Rogue04.ExchangeDailyRoutineToClass(UDailyRoutine_NC_ORG_Rogue04_807_WaitFM);
                DC(int64(0x340f78eff0ad22af), EConversationDebugInfo::Done);
                DC(int64(0x340f78eff0ad22b2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x340f78eff0ad22b2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */