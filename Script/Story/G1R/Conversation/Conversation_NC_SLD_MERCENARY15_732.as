#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_MERCENARY15_732 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_MERCENARY15_732";
        }
        
        
        class UTopic_Hero__NC_SLD_MERCENARY15_732 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_MERCENARY15_732";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMercenary93144 : UTopic_Hero__NC_SLD_MERCENARY15_732
        {
            default DebugId = int64(0xa18ab109399530c1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld732Firstwarn);
            default Rules.HideIfKnows(UChoiceMercenary93144);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa18ab109399530c4), G1R.Friends_SendToNC != 0);
                }
                
                return G1R.Friends_SendToNC != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa18ab109399530be), EConversationDebugInfo::Executing);
                // The Water Mages called me here. 
                Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_121329"));
                DC(int64(0xa18ab109399530be), EConversationDebugInfo::Done);
                DB(int64(0xa18ab109399530c9), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xa18ab109399530cb), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xa18ab109399530cc), EConversationDebugInfo::Executing);
                    // Oh, right. That Swamp Guy. Fine, go on in. 
                    Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_121436"));
                    DC(int64(0xa18ab109399530cc), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                {
                    DC(int64(0xa18ab109399530cf), EConversationDebugInfo::Executing);
                    // Right - you're that Red they were talking about. Fine, ...
                    Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_121439"));
                    DC(int64(0xa18ab109399530cf), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xa18ab109399530d4), EConversationDebugInfo::Executing);
                    // Oh, right - you're THAT guy. Go on in. 
                    Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_121441"));
                    DC(int64(0xa18ab109399530d4), EConversationDebugInfo::Done);
                }
                DC(int64(0xa18ab109399530ea), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0xa18ab109399530ea), EConversationDebugInfo::Done);
                DC(int64(0xa18ab109399530f7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa18ab109399530f7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld732Attack : UTopic_Hero__NC_SLD_MERCENARY15_732
        {
            default DebugId = int64(0x7be104f9f0c6c6be);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_WaterMagesPassage", 150.0f, int64(0x7be104f9f0c6c6be));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7be104f9f0c6c6bf), G1R.GuardPassageWaterMagesWarning_NC == 2);
                    DB(int64(0x7be104f9f0c6c6c0), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x7be104f9f0c6c6c2), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
                    DB(int64(0x54c7f07001cf826c), G1R.Friends_SendToNC == 0);
                }
                
                if (G1R.GuardPassageWaterMagesWarning_NC != 2)
                    return false;
                
                if (G1R.WaterMaguesPermission != 0)
                    return false;
                
                if (Mercenary != nullptr && !Mercenary.IsAtPreferredLocation(200.0f))
                    return false;
                
                if (G1R.Friends_SendToNC != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1a121e2487d0528e), EConversationDebugInfo::Executing);
                Mercenary.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x1a121e2487d0528e), EConversationDebugInfo::Done);
                DC(int64(0x7be104f9f0c6c6c8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7be104f9f0c6c6c8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld732Firstwarn : UTopic_Hero__NC_SLD_MERCENARY15_732
        {
            default DebugId = int64(0x7be104f9f0c6c698);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7be104f9f0c6c699), G1R.GuardPassageWaterMagesWarning_NC == 0);
                    DB(int64(0x7be104f9f0c6c69a), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x7be104f9f0c6c69b), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
                    DB(int64(0x54c7f07001cf826e), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x54c7f07001cf826f), G1R.Friends_SendToNC != 0);
                }
                
                if (G1R.GuardPassageWaterMagesWarning_NC == 0 && G1R.WaterMaguesPermission == 0 && Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f))
                    return true;
                
                if (G1R.WaterMaguesPermission == 0 && G1R.Friends_SendToNC != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be104f9f0c6c69c), EConversationDebugInfo::Executing);
                // Hold it. No one gets past here without an invitation ...
                Mercenary.AI.Say(LocText("INFO_SLD_732_FIRSTWARN_08_01"));
                DC(int64(0x7be104f9f0c6c69c), EConversationDebugInfo::Done);
                DC(int64(0x1a121e2487d08acc), EConversationDebugInfo::Executing);
                G1R.GuardPassageWaterMagesWarning_NC = 1;
                DC(int64(0x1a121e2487d08acc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld732Lastwarn : UTopic_Hero__NC_SLD_MERCENARY15_732
        {
            default DebugId = int64(0x7be104f9f0c6c6b7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_WaterMagesPassage", 250.0f, int64(0x7be104f9f0c6c6b7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7be104f9f0c6c6b8), G1R.GuardPassageWaterMagesWarning_NC == 1);
                    DB(int64(0x7be104f9f0c6c6b9), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x7be104f9f0c6c6bb), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
                }
                
                if (G1R.GuardPassageWaterMagesWarning_NC != 1)
                    return false;
                
                if (G1R.WaterMaguesPermission != 0)
                    return false;
                
                if (Mercenary != nullptr && !Mercenary.IsAtPreferredLocation(200.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7be104f9f0c6c6bc), EConversationDebugInfo::Executing);
                // Are you deaf? Piss off!
                Mercenary.AI.Say(LocText("INFO_SLD_732_LASTWARN_08_01"));
                DC(int64(0x7be104f9f0c6c6bc), EConversationDebugInfo::Done);
                DC(int64(0x1a121e2487d08ace), EConversationDebugInfo::Executing);
                G1R.GuardPassageWaterMagesWarning_NC = 2;
                DC(int64(0x1a121e2487d08ace), EConversationDebugInfo::Done);
                DC(int64(0x7be104f9f0c6c6bd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7be104f9f0c6c6bd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */