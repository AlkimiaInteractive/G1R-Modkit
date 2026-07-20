#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_BLACKMAILER_888 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_BLACKMAILER_888";
        }
        
        
        class UTopic_Hero__UL_ORG_BLACKMAILER_888 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_BLACKMAILER_888";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBlackmailer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetUL_ORG_COBLACKMAILER_889() const property
            {
                return GetCharacter(n"UL_ORG_COBLACKMAILER_889");
            }
        }
        
        
        class UTopic_OC_ORG_MORDRAG_826__UL_ORG_BLACKMAILER_888 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_BLACKMAILER_888";
            default WithCharacter = n"OC_ORG_MORDRAG_826";
            
            AGothicCharacterState GetBlackmailer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMordrag() const property
            {
                return GetCharacter(n"OC_ORG_MORDRAG_826");
            }
            
            AGothicCharacterState GetUL_ORG_COBLACKMAILER_889() const property
            {
                return GetCharacter(n"UL_ORG_COBLACKMAILER_889");
            }
        }
        
        
        class UChoiceBlackmailer116639 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x89a833cdc0b1431f);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceBlackmailer116639);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89a833cdc0b1431e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89a833cdc0b1431e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer116655 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x89a833cdc0b14323);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBlackmailer116655);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0x89a833cdc0b14329), G1R.Blackmailer_Permission == 0);
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter == 0);
                    DB(int64(0x4c8ae56e77519bbd), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero));
                    DB(int64(0x89a833cdc0b14329), G1R.Blackmailer_Permission == 0);
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter == 0);
                    DB(int64(0x4c8ae56e77519bbd), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero) && G1R.Blackmailer_Permission == 0 && G1R.Blackmailer_Encounter == 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero) && G1R.Blackmailer_Permission == 0 && G1R.Blackmailer_Encounter == 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89a833cdc0b14322), EConversationDebugInfo::Executing);
                // Hey, boy, if you want to pass, you have to pay 10 ore or ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_150914_2083"));
                DC(int64(0x89a833cdc0b14322), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Blackmailer_116696,
                    UTopic_Blackmailer_116716
                );
            }
        }
        
        
        class UTopic_Blackmailer_116696 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x5f7678e402523525);
            default Caption = LocText("TEXT_WIP_RHHWUEL_20241204_151615_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f7678e402523526), EConversationDebugInfo::Executing);
                // Then why don't you come here and get your ore!
                Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_151615_2785"));
                DC(int64(0x5f7678e402523526), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e40252352e), EConversationDebugInfo::Executing);
                
                // Thanks, man. You just made my day.
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_151737"));
                DC(int64(0x5f7678e40252352e), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e402523530), EConversationDebugInfo::Executing);
                Blackmailer.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x5f7678e402523530), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e40252354e), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Permission = 2;
                DC(int64(0x5f7678e40252354e), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e83d1), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Encounter += 1;
                DC(int64(0xeb38ecabea6e83d1), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be94d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889)) && ensure(IsValid(UL_ORG_COBLACKMAILER_889.AI))) { UL_ORG_COBLACKMAILER_889.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0x9c3ddd4d955be94d), EConversationDebugInfo::Done);
                DC(int64(0x3c02b0fb5d207404), EConversationDebugInfo::Executing);
                Blackmailer.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x3c02b0fb5d207404), EConversationDebugInfo::Done);
                DC(int64(0x3c02b0fb5d207406), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889))) { UL_ORG_COBLACKMAILER_889.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x3c02b0fb5d207406), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e40252353f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5f7678e40252353f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Blackmailer_116716 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x5f7678e402523529);
            default Caption = LocText("TEXT_WIP_RHHWUEL_20241204_151615_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f7678e40252352a), EConversationDebugInfo::Executing);
                // 10 ore? That's not much. Here you go ...
                Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_151615_3286"));
                DC(int64(0x5f7678e40252352a), EConversationDebugInfo::Done);
                DB(int64(0x5f7678e402523534), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0x5f7678e402523536), EConversationDebugInfo::Executing);
                    // Here, 10 ore.
                    Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152020_686"));
                    DC(int64(0x5f7678e402523536), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523537), EConversationDebugInfo::Executing);
                    
                    // A shame.
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152026"));
                    DC(int64(0x5f7678e402523537), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Blackmailer, UItMi_Orenugget, 10);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523542), EConversationDebugInfo::Executing);
                    // You've paid. You may pass. Now go before I change my ...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152327_3984"));
                    DC(int64(0x5f7678e402523542), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523544), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Permission = 1;
                    DC(int64(0x5f7678e402523544), EConversationDebugInfo::Done);
                    DC(int64(0xf74b74798a7796a7), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Daily = FInGameTime::Now();
                    DC(int64(0xf74b74798a7796a7), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e8407), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xeb38ecabea6e8407), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x5f7678e402523539), EConversationDebugInfo::Executing);
                    // Umm... I just don't have 10 ore right now...
                    Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152037_2386"));
                    DC(int64(0x5f7678e402523539), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e40252353a), EConversationDebugInfo::Executing);
                    
                    // That's a shame...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152044"));
                    DC(int64(0x5f7678e40252353a), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523530), EConversationDebugInfo::Executing);
                    Blackmailer.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0x5f7678e402523530), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523550), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Permission = 2;
                    DC(int64(0x5f7678e402523550), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e83d3), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Encounter += 1;
                    DC(int64(0xeb38ecabea6e83d3), EConversationDebugInfo::Done);
                    DC(int64(0x9c3ddd4d955be94f), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_COBLACKMAILER_889)) && ensure(IsValid(UL_ORG_COBLACKMAILER_889.AI))) { UL_ORG_COBLACKMAILER_889.AI.StartAttackingImmediatelyLootOnly(Hero); }
                    DC(int64(0x9c3ddd4d955be94f), EConversationDebugInfo::Done);
                    DC(int64(0x3c02b0fb5d207408), EConversationDebugInfo::Executing);
                    Blackmailer.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                    DC(int64(0x3c02b0fb5d207408), EConversationDebugInfo::Done);
                    DC(int64(0x3c02b0fb5d20740a), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_COBLACKMAILER_889))) { UL_ORG_COBLACKMAILER_889.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                    DC(int64(0x3c02b0fb5d20740a), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e402523540), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x5f7678e402523540), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBlackmailer116832 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e83d6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter != 0);
                    DB(int64(0x4c8ae56e77519bc2), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0x710369c3d4cd3cf3), G1R.Blackmailer_Mad.IsValid() && G1R.Blackmailer_Mad.IsAtLeastXDaysAgo(1));
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero));
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter != 0);
                    DB(int64(0x4c8ae56e77519bc2), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0x710369c3d4cd3cf3), G1R.Blackmailer_Mad.IsValid() && G1R.Blackmailer_Mad.IsAtLeastXDaysAgo(1));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero) && G1R.Blackmailer_Encounter != 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag) && G1R.Blackmailer_Mad.IsValid() && G1R.Blackmailer_Mad.IsAtLeastXDaysAgo(1))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero) && G1R.Blackmailer_Encounter != 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag) && G1R.Blackmailer_Mad.IsValid() && G1R.Blackmailer_Mad.IsAtLeastXDaysAgo(1))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e83d5), EConversationDebugInfo::Executing);
                // Back again, are we? You know what happens if you're ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_153321_41"));
                DC(int64(0xeb38ecabea6e83d5), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Blackmailer_117071,
                    UTopic_Blackmailer_117091
                );
            }
        }
        
        
        class UTopic_Blackmailer_117071 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e83e8);
            default Caption = LocText("TEXT_WIP_RHHWUEL_20241204_154147_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e83e9), EConversationDebugInfo::Executing);
                // What if I beat the two of you into the ground instead?
                Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154147_2785"));
                DC(int64(0xeb38ecabea6e83e9), EConversationDebugInfo::Done);
                DC(int64(0x6bc0cc03367207c6), EConversationDebugInfo::Executing);
                
                // Big words, wretch. Let's see if you can back them up!
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_104512"));
                DC(int64(0x6bc0cc03367207c6), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e83d1), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Encounter += 1;
                DC(int64(0xeb38ecabea6e83d1), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b12f), EConversationDebugInfo::Executing);
                Blackmailer.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a391d8cd16b12f), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b136), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Permission = 2;
                DC(int64(0x61a391d8cd16b136), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e83f6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb38ecabea6e83f6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Blackmailer_117091 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e83ec);
            default Caption = LocText("TEXT_WIP_RHHWUEL_20241204_154147_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e83ed), EConversationDebugInfo::Executing);
                // Alright, fine.
                Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154147_3286"));
                DC(int64(0xeb38ecabea6e83ed), EConversationDebugInfo::Done);
                DB(int64(0xeb38ecabea6e83f8), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xeb38ecabea6e83fd), EConversationDebugInfo::Executing);
                    // Here, take your 10 ore and be done with it.
                    Hero.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154440_2386"));
                    DC(int64(0xeb38ecabea6e83fd), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e83fe), EConversationDebugInfo::Executing);
                    
                    // Hah, what a pity. I was hoping you'd resist.
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154450"));
                    DC(int64(0xeb38ecabea6e83fe), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Blackmailer, UItMi_Orenugget, 10);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e8402), EConversationDebugInfo::Executing);
                    // Go on, then. But don't let me catch you without payment ...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154512_3984"));
                    DC(int64(0xeb38ecabea6e8402), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b146), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Daily = FInGameTime::Now();
                    DC(int64(0x61a391d8cd16b146), EConversationDebugInfo::Done);
                    DC(int64(0xff1e13dcfe8a970a), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Permission = 1;
                    DC(int64(0xff1e13dcfe8a970a), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e8408), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xeb38ecabea6e8408), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xeb38ecabea6e83f9), EConversationDebugInfo::Executing);
                    // You're a funny one, aren't you? Come back when you've ...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154408"));
                    DC(int64(0xeb38ecabea6e83f9), EConversationDebugInfo::Done);
                    DC(int64(0xeb38ecabea6e83fb), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xeb38ecabea6e83fb), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBlackmailer116858 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x5f7678e402523548);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14328), Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_COBLACKMAILER_889));
                    DB(int64(0xc650c95da6d348d9), G1R.Blackmailer_Permission != 0);
                    DB(int64(0x4c8ae56e77519bc3), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14328), Hero != nullptr && Hero.WasDefeatedBy(Blackmailer));
                    DB(int64(0xc650c95da6d348d9), G1R.Blackmailer_Permission != 0);
                    DB(int64(0x4c8ae56e77519bc3), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_COBLACKMAILER_889) && G1R.Blackmailer_Permission != 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(Blackmailer) && G1R.Blackmailer_Permission != 0 && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5f7678e402523547), EConversationDebugInfo::Executing);
                // Get lost, before I wipe that dumb look off your face for ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_152658_1609"));
                DC(int64(0x5f7678e402523547), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e402523552), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Permission = 0;
                DC(int64(0x5f7678e402523552), EConversationDebugInfo::Done);
                DC(int64(0x710369c3d4cd3cf2), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Mad = FInGameTime::Now();
                DC(int64(0x710369c3d4cd3cf2), EConversationDebugInfo::Done);
                DC(int64(0x5f7678e402523553), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5f7678e402523553), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer117010 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e83dd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceBlackmailer117010);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0x4c8ae56e77519bc4), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0xa1faaece4bc7283b), UL_ORG_COBLACKMAILER_889 != nullptr && UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero))
                    return false;
                
                if (Hero != nullptr && Hero.IsInPartyWith(Mordrag))
                    return false;
                
                if (UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e83dc), EConversationDebugInfo::Executing);
                // Alright, alright, you win... You've made your point. We ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_153723_2238"));
                DC(int64(0xeb38ecabea6e83dc), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e83e1), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Permission = 3;
                DC(int64(0xeb38ecabea6e83e1), EConversationDebugInfo::Done);
                DC(int64(0xf74b74798a7796a1), EConversationDebugInfo::Executing);
                Blackmailer.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Blackmailer_888_Payed);
                DC(int64(0xf74b74798a7796a1), EConversationDebugInfo::Done);
                DC(int64(0xf74b74798a7796a3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889))) { UL_ORG_COBLACKMAILER_889.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_CoBlackmailer_889_Payed); }
                DC(int64(0xf74b74798a7796a3), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e83e2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb38ecabea6e83e2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer117462 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e840b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x710369c3d4cd3d0e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_WomanSlave));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e840a), EConversationDebugInfo::Executing);
                // Where do you think you're going, eh? Don't even think ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_154945_1609"));
                DC(int64(0xeb38ecabea6e840a), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8410), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Warning += 1;
                DC(int64(0xeb38ecabea6e8410), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8416), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb38ecabea6e8416), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer117520 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e8413);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBlackmailer117462);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BLACKMAILER_ENTRANCE", 300.0f, int64(0xeb38ecabea6e8413));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter != 0);
                    DB(int64(0xeb38ecabea6e840e), G1R.Blackmailer_Warning == 1);
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Blackmailer != nullptr && Blackmailer.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Blackmailer_Encounter == 0)
                    return false;
                
                if (G1R.Blackmailer_Warning != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e8412), EConversationDebugInfo::Executing);
                // One more step, and I'll make sure you regret it. ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_155119_2801"));
                DC(int64(0xeb38ecabea6e8412), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8418), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Warning += 1;
                DC(int64(0xeb38ecabea6e8418), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8419), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb38ecabea6e8419), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer117602 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xeb38ecabea6e841c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBlackmailer117520);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BLACKMAILER_ENTRANCE", 150.0f, int64(0xeb38ecabea6e841c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0xeb38ecabea6e83cf), G1R.Blackmailer_Encounter != 0);
                    DB(int64(0xeb38ecabea6e840e), G1R.Blackmailer_Warning == 2);
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Blackmailer != nullptr && Blackmailer.WasDefeatedBy(Hero))
                    return false;
                
                if (G1R.Blackmailer_Encounter == 0)
                    return false;
                
                if (G1R.Blackmailer_Warning != 2)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb38ecabea6e841b), EConversationDebugInfo::Executing);
                // Enough talk! I warned you three times. Now you're dead!
                Blackmailer.AI.Say(LocText("TEXT_WIP_RHHWUEL_20241204_155414_1769"));
                DC(int64(0xeb38ecabea6e841b), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8420), EConversationDebugInfo::Executing);
                Blackmailer.AI.StartAttackingImmediately(Hero);
                DC(int64(0xeb38ecabea6e8420), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8422), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Warning = 0;
                DC(int64(0xeb38ecabea6e8422), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be953), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889)) && ensure(IsValid(UL_ORG_COBLACKMAILER_889.AI))) { UL_ORG_COBLACKMAILER_889.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x9c3ddd4d955be953), EConversationDebugInfo::Done);
                DC(int64(0xeb38ecabea6e8423), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb38ecabea6e8423), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer118084 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xf74b74798a77969c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero));
                    DB(int64(0x89a833cdc0b14329), G1R.Blackmailer_Permission == 1);
                    DB(int64(0xf74b74798a7796a5), G1R.Blackmailer_Daily.IsValid() && G1R.Blackmailer_Daily.IsAtLeastXDaysAgo(1));
                    DB(int64(0x4c8ae56e77519bc5), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0x89a833cdc0b14327), Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f));
                    DB(int64(0x89a833cdc0b14328), UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero));
                    DB(int64(0x89a833cdc0b14329), G1R.Blackmailer_Permission == 1);
                    DB(int64(0xf74b74798a7796a5), G1R.Blackmailer_Daily.IsValid() && G1R.Blackmailer_Daily.IsAtLeastXDaysAgo(1));
                    DB(int64(0x4c8ae56e77519bc5), Hero != nullptr && !Hero.IsInPartyWith(Mordrag));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && Blackmailer != nullptr && !Blackmailer.WasDefeatedBy(Hero) && G1R.Blackmailer_Permission == 1 && G1R.Blackmailer_Daily.IsValid() && G1R.Blackmailer_Daily.IsAtLeastXDaysAgo(1) && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"WP_BLACKMAILER_ENTRANCE", 500.0f) && UL_ORG_COBLACKMAILER_889 != nullptr && !UL_ORG_COBLACKMAILER_889.WasDefeatedBy(Hero) && G1R.Blackmailer_Permission == 1 && G1R.Blackmailer_Daily.IsValid() && G1R.Blackmailer_Daily.IsAtLeastXDaysAgo(1) && Hero != nullptr && !Hero.IsInPartyWith(Mordrag))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf74b74798a77969b), EConversationDebugInfo::Executing);
                // Well, well, look who's back... If you want to pass, ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_094551_41"));
                DC(int64(0xf74b74798a77969b), EConversationDebugInfo::Done);
                DC(int64(0xf74b74798a77969e), EConversationDebugInfo::Executing);
                
                // But I already paid you...
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_094648"));
                DC(int64(0xf74b74798a77969e), EConversationDebugInfo::Done);
                DC(int64(0xf74b74798a77969f), EConversationDebugInfo::Executing);
                
                // So? Sounds like your problem. No ore, no pass.
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_094658"));
                DC(int64(0xf74b74798a77969f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Blackmailer_118087,
                    UTopic_Blackmailer_118107
                );
            }
        }
        
        
        class UTopic_Blackmailer_118087 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x61a391d8cd16b126);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_095406_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61a391d8cd16b127), EConversationDebugInfo::Executing);
                // I'm not paying
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_095406_41"));
                DC(int64(0x61a391d8cd16b127), EConversationDebugInfo::Done);
                DC(int64(0x6bc0cc03367207c7), EConversationDebugInfo::Executing);
                
                // Music to my ears. You're gonna regret this.
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_105956"));
                DC(int64(0x6bc0cc03367207c7), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b12f), EConversationDebugInfo::Executing);
                Blackmailer.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a391d8cd16b12f), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b133), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Encounter += 1;
                DC(int64(0x61a391d8cd16b133), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b138), EConversationDebugInfo::Executing);
                G1R.Blackmailer_Permission = 2;
                DC(int64(0x61a391d8cd16b138), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be951), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889)) && ensure(IsValid(UL_ORG_COBLACKMAILER_889.AI))) { UL_ORG_COBLACKMAILER_889.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0x9c3ddd4d955be951), EConversationDebugInfo::Done);
                DC(int64(0x3c02b0fb5d20740c), EConversationDebugInfo::Executing);
                Blackmailer.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x3c02b0fb5d20740c), EConversationDebugInfo::Done);
                DC(int64(0x3c02b0fb5d20740e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_COBLACKMAILER_889))) { UL_ORG_COBLACKMAILER_889.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x3c02b0fb5d20740e), EConversationDebugInfo::Done);
                DC(int64(0x61a391d8cd16b134), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x61a391d8cd16b134), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Blackmailer_118107 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x61a391d8cd16b12a);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_095406_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x61a391d8cd16b12b), EConversationDebugInfo::Executing);
                // Fine
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_095406_2238"));
                DC(int64(0x61a391d8cd16b12b), EConversationDebugInfo::Done);
                DB(int64(0x61a391d8cd16b13a), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0x61a391d8cd16b13c), EConversationDebugInfo::Executing);
                    // Here's your ore
                    Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_095921_1924"));
                    DC(int64(0x61a391d8cd16b13c), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b13d), EConversationDebugInfo::Executing);
                    
                    // Good man. See you tomorrow then...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_095928"));
                    DC(int64(0x61a391d8cd16b13d), EConversationDebugInfo::Done);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Blackmailer, UItMi_Orenugget, 10);
                    DC(int64(0x5f7678e40252353e), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b144), EConversationDebugInfo::Executing);
                    // Move along, and don't show your face again unless you've ...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_100251_3436"));
                    DC(int64(0x61a391d8cd16b144), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b146), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Daily = FInGameTime::Now();
                    DC(int64(0x61a391d8cd16b146), EConversationDebugInfo::Done);
                    DC(int64(0xff1e13dcfe8a96f6), EConversationDebugInfo::Executing);
                    G1R.Blackmailer_Permission = 1;
                    DC(int64(0xff1e13dcfe8a96f6), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b14d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x61a391d8cd16b14d), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x61a391d8cd16b13e), EConversationDebugInfo::Executing);
                    // Are you messing with me? Get outta here and come back ...
                    Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_095943"));
                    DC(int64(0x61a391d8cd16b13e), EConversationDebugInfo::Done);
                    DC(int64(0x61a391d8cd16b140), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x61a391d8cd16b140), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBlackmailer118280_0 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0xff1e13dcfe8a9713);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBlackmailer118280);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BLACKMAILER_ENTRANCE", 1000.0f, int64(0xff1e13dcfe8a9713));
            default Rules.HideIfKnows(UChoiceBlackmailer118280_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x89a833cdc0b14326), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xff1e13dcfe8a9712), EConversationDebugInfo::Executing);
                // Ah, a fellow from the New Camp, eh? Well, in that case, ...
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_125143_2785"));
                DC(int64(0xff1e13dcfe8a9712), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBlackmailer118280 : UTopic_Hero__UL_ORG_BLACKMAILER_888
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBlackmailer118280_0);
            default Rules.HideIfKnows(UChoiceBlackmailer118280);
            default DebugId = int64(0xff1e13dcfe8a9713);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xff1e13dcfe8a9715), EConversationDebugInfo::Executing);
                // Travel safe!
                Blackmailer.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_125444"));
                DC(int64(0xff1e13dcfe8a9715), EConversationDebugInfo::Done);
                DC(int64(0x1e53924048a86fe6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1e53924048a86fe6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBlackmailer119206_0 : UTopic_OC_ORG_MORDRAG_826__UL_ORG_BLACKMAILER_888
        {
            default DebugId = int64(0x1e53924048a86fe0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBlackmailer119206);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_BLACKMAILER_ENTRANCE", 1000.0f, int64(0x1e53924048a86fe0));
            default Rules.HideIfKnows(UChoiceBlackmailer119206_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4c8ae56e77519bc6), Hero != nullptr && Hero.IsInPartyWith(Mordrag));
                }
                
                return Hero != nullptr && Hero.IsInPartyWith(Mordrag);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e53924048a86fdf), EConversationDebugInfo::Executing);
                // Ah, Mordrag. Got company, I see? Go on through.
                Blackmailer.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_085830_41"));
                DC(int64(0x1e53924048a86fdf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBlackmailer119206 : UTopic_OC_ORG_MORDRAG_826__UL_ORG_BLACKMAILER_888
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBlackmailer119206_0);
            default Rules.HideIfKnows(UChoiceBlackmailer119206);
            default DebugId = int64(0x1e53924048a86fe0);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e53924048a86fe4), EConversationDebugInfo::Executing);
                
                // Good to see you know who's in charge. Stay sharp.
                Mordrag.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_090624"));
                DC(int64(0x1e53924048a86fe4), EConversationDebugInfo::Done);
                DC(int64(0x1e53924048a86fe5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1e53924048a86fe5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */