#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE02_804 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE02_804";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE02_804 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE02_804";
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
        
        
        class UChoiceOrg804Attack : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a5934be);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeb9fc42c543955c), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xfeb9fc42c543955d), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c543955e), G1R.GuardPassageWarning_NC == 2);
                    DB(int64(0xfeb9fc42c543955f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x8422e3871f690dce), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 50.0f));
                    DB(int64(0xa8e66204e1e22017), G1R.Lares_Permission == 0);
                    DB(int64(0xfeb9fc42c5439560), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xfeb9fc42c5439561), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c5439562), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xfeb9fc42c5439563), G1R.GuardPassageWarning_NC == 2);
                    DB(int64(0x8422e3871f690dcd), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 50.0f));
                    DB(int64(0xa8e66204e1e22018), G1R.Lares_Permission == 0);
                }
                
                if (Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && G1R.GuardPassageWarning_NC == 2 && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 50.0f) && G1R.Lares_Permission == 0)
                    return true;
                
                if (Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && G1R.GuardPassageWarning_NC == 2 && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 50.0f) && G1R.Lares_Permission == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Print("Skipped Rogue.AI.FullStop()");
                Print("Skipped Rogue.AI.SignalIntruderAlert(Hero)");
                DC(int64(0xc78f7548a083e4ca), EConversationDebugInfo::Executing);
                Rogue.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xc78f7548a083e4ca), EConversationDebugInfo::Done);
                DC(int64(0xe037ebdb1a5934c9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe037ebdb1a5934c9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg804Firstwarn : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a5934b0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeb9fc42c5439548), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c5439549), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0xfeb9fc42c543954a), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xc78f7548a08424b0), G1R.GuardPassageWarning_NC == 0);
                    DB(int64(0xc78f7548a08424c9), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xa8e66204e1e22013), G1R.Lares_Permission == 0);
                    DB(int64(0xfeb9fc42c543954b), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c543954c), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xfeb9fc42c543954d), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0xc78f7548a08424b1), G1R.GuardPassageWarning_NC == 0);
                    DB(int64(0xc78f7548a08424ca), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xa8e66204e1e22014), G1R.Lares_Permission == 0);
                }
                
                if (Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && G1R.GuardPassageWarning_NC == 0 && Hero != nullptr && Hero.IsInConversation() && G1R.Lares_Permission == 0)
                    return true;
                
                if (Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && G1R.GuardPassageWarning_NC == 0 && Hero != nullptr && Hero.IsInConversation() && G1R.Lares_Permission == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe037ebdb1a5934b4), EConversationDebugInfo::Executing);
                // Reds ain't welcome here. Piss off. 
                Rogue.AI.Say(LocText("INFO_ORG_804_FIRSTWARN_INFO_06_00"));
                DC(int64(0xe037ebdb1a5934b4), EConversationDebugInfo::Done);
                DC(int64(0xc78f7548a083e4cf), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_NC = 1;
                DC(int64(0xc78f7548a083e4cf), EConversationDebugInfo::Done);
                DC(int64(0x79929a2cd96a0485), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x79929a2cd96a0485), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg804Lastwarn : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a5934b6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xfeb9fc42c5439551), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xfeb9fc42c5439552), G1R.GuardPassageWarning_NC == 1);
                    DB(int64(0xfeb9fc42c5439553), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c5439554), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x8422e3871f690dd0), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 200.0f));
                    DB(int64(0xa8e66204e1e22016), G1R.Lares_Permission == 0);
                    DB(int64(0xfeb9fc42c5439555), Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f));
                    DB(int64(0xfeb9fc42c5439556), G1R.GuardPassageWarning_NC == 1);
                    DB(int64(0xfeb9fc42c5439557), Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero));
                    DB(int64(0xfeb9fc42c5439558), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x8422e3871f690dcf), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 200.0f));
                    DB(int64(0xa8e66204e1e22015), G1R.Lares_Permission == 0);
                }
                
                if (Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && G1R.GuardPassageWarning_NC == 1 && Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 200.0f) && G1R.Lares_Permission == 0)
                    return true;
                
                if (Rogue != nullptr && Rogue.IsAtPreferredLocation(0.0f) && G1R.GuardPassageWarning_NC == 1 && Rogue != nullptr && !Rogue.IsFriendlyTowards(Hero) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_NC_LaresPassage", 200.0f) && G1R.Lares_Permission == 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe037ebdb1a5934bc), EConversationDebugInfo::Executing);
                // Piss off while you still can.
                Rogue.AI.Say(LocText("INFO_ORG_804_LASTWARN_06_00"));
                DC(int64(0xe037ebdb1a5934bc), EConversationDebugInfo::Done);
                DC(int64(0xc78f7548a083e4d5), EConversationDebugInfo::Executing);
                G1R.GuardPassageWarning_NC = 2;
                DC(int64(0xc78f7548a083e4d5), EConversationDebugInfo::Done);
                DC(int64(0xe037ebdb1a5934bd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe037ebdb1a5934bd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg804OrganisatorExit : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a59349e);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe037ebdb1a59349f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe037ebdb1a59349f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg804OrganisatorGreet : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a5934a0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg804OrganisatorGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe037ebdb1a5934a1), Rogue != nullptr && Rogue.IsCloseToCharacter(Hero, 300.0f));
                    DB(int64(0x2fe5c2252c5d782f), G1R.GuardPassageWarning_NC == 0);
                }
                
                if (Rogue != nullptr && !Rogue.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                if (G1R.GuardPassageWarning_NC != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe037ebdb1a5934a2), EConversationDebugInfo::Executing);
                // Oy! Where d'you think you're goin'?
                Rogue.AI.Say(LocText("ORG_804_ORGANISATOR_GREET_06_00"));
                DC(int64(0xe037ebdb1a5934a2), EConversationDebugInfo::Done);
                DB(int64(0xa0814aa1cdfdbb8f), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xe037ebdb1a5934a4), EConversationDebugInfo::Executing);
                    // What are you guarding?
                    Hero.AI.Say(LocText("ORG_804_ORGANISATOR_WAYTO_15_00"));
                    DC(int64(0xe037ebdb1a5934a4), EConversationDebugInfo::Done);
                    DC(int64(0xe037ebdb1a5934a5), EConversationDebugInfo::Executing);
                    
                    // Lares. The boss of our gang.
                    Rogue.AI.Say(LocText("ORG_804_ORGANISATOR_WAYTO_06_01"));
                    DC(int64(0xe037ebdb1a5934a5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_804_organisator_greet_exit_1");
                }
                else
                {
                    DC(int64(0xe037ebdb1a5934a7), EConversationDebugInfo::Executing);
                    // I want to see Lares.
                    Hero.AI.Say(LocText("ORG_804_ORGANISATOR_TOLARES_15_00"));
                    DC(int64(0xe037ebdb1a5934a7), EConversationDebugInfo::Done);
                    DC(int64(0xe037ebdb1a5934a8), EConversationDebugInfo::Executing);
                    
                    // Don't think he wants to waste his time with a ...
                    Rogue.AI.Say(LocText("ORG_804_ORGANISATOR_TOLARES_06_01"));
                    DC(int64(0xe037ebdb1a5934a8), EConversationDebugInfo::Done);
                    DC(int64(0xe037ebdb1a5934a9), EConversationDebugInfo::Executing);
                    
                    // I'll make him interested. 
                    Hero.AI.Say(LocText("ORG_804_ORGANISATOR_TOLARES_15_02"));
                    DC(int64(0xe037ebdb1a5934a9), EConversationDebugInfo::Done);
                    DC(int64(0xe037ebdb1a5934aa), EConversationDebugInfo::Executing);
                    
                    // Ha - you got balls, I'll give you that. Well, try your ...
                    Rogue.AI.Say(LocText("ORG_804_ORGANISATOR_TOLARES_06_03"));
                    DC(int64(0xe037ebdb1a5934aa), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_804_organisator_greet_exit_2");
                    DC(int64(0xe037ebdb1a5934ab), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xe037ebdb1a5934ab), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceOrg804OrganisatorPerm : UTopic_Hero__NC_ORG_ROGUE02_804
        {
            default DebugId = int64(0xe037ebdb1a5934ac);
            default Caption = LocText("ORG_804_ORGANISATOR_PERM_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_org_804_organisator_greet_exit_2");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe037ebdb1a5934ad), EConversationDebugInfo::Executing);
                // Can I see Lares?
                Hero.AI.Say(LocText("ORG_804_ORGANISATOR_PERM_15_00"));
                DC(int64(0xe037ebdb1a5934ad), EConversationDebugInfo::Done);
                DC(int64(0xe037ebdb1a5934ae), EConversationDebugInfo::Executing);
                
                // Ask Roscoe.
                Rogue.AI.Say(LocText("ORG_804_ORGANISATOR_PERM_06_01"));
                DC(int64(0xe037ebdb1a5934ae), EConversationDebugInfo::Done);
                DC(int64(0xe037ebdb1a5934af), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe037ebdb1a5934af), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */