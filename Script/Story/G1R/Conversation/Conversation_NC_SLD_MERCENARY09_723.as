#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_SLD_MERCENARY09_723 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_SLD_MERCENARY09_723";
        }
        
        
        class UTopic_Hero__NC_SLD_MERCENARY09_723 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_SLD_MERCENARY09_723";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMercenary() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetNC_SLD_MERCENARY15_732() const property
            {
                return GetCharacter(n"NC_SLD_MERCENARY15_732");
            }
        }
        
        
        class UChoiceSld723Attack : UTopic_Hero__NC_SLD_MERCENARY09_723
        {
            default DebugId = int64(0x2798667ea9360d3d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_WaterMagesPassage", 150.0f, int64(0x2798667ea9360d3d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2798667ea9360d3e), G1R.GuardPassageWaterMagesWarning_NC == 2);
                    DB(int64(0x2798667ea9360d3f), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x2798667ea9360d41), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
                    DB(int64(0x54c7f07001cf826b), G1R.Friends_SendToNC == 0);
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
                DC(int64(0x1a121e2487d05228), EConversationDebugInfo::Executing);
                Mercenary.AI.StartPettyFightWeaponToDeath(Hero);
                DC(int64(0x1a121e2487d05228), EConversationDebugInfo::Done);
                DC(int64(0x1a5f41d89bd067d2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(NC_SLD_MERCENARY15_732)) && ensure(IsValid(NC_SLD_MERCENARY15_732.AI))) { NC_SLD_MERCENARY15_732.AI.StartPettyFightWeaponToDeath(Hero); }
                DC(int64(0x1a5f41d89bd067d2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld723Firstwarn : UTopic_Hero__NC_SLD_MERCENARY09_723
        {
            default DebugId = int64(0x2798667ea9360d17);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2798667ea9360d18), G1R.GuardPassageWaterMagesWarning_NC == 0);
                    DB(int64(0x2798667ea9360d19), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x2798667ea9360d1a), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
                    DB(int64(0x54c7f07001cf8271), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x54c7f07001cf8272), G1R.Friends_SendToNC != 0);
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
                DC(int64(0x2798667ea9360d1b), EConversationDebugInfo::Executing);
                // Stop! No one goes through here unless the Water Mages ...
                Mercenary.AI.Say(LocText("INFO_SLD_723_FIRSTWARN_11_01"));
                DC(int64(0x2798667ea9360d1b), EConversationDebugInfo::Done);
                DC(int64(0x1a121e2487d08ac6), EConversationDebugInfo::Executing);
                G1R.GuardPassageWaterMagesWarning_NC = 1;
                DC(int64(0x1a121e2487d08ac6), EConversationDebugInfo::Done);
                DB(int64(0x97703116c7c7add9), G1R.Friends_SendToNC == 1);
                
                if (G1R.Friends_SendToNC == 1)
                {
                    DC(int64(0xf9e12d6f73578db7), EConversationDebugInfo::Executing);
                    // The Watermages are expecting me.
                    Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_114802"));
                    DC(int64(0xf9e12d6f73578db7), EConversationDebugInfo::Done);
                    DB(int64(0xa18ab10939953095), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xa18ab10939953097), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0xa18ab10939953099), EConversationDebugInfo::Executing);
                        // Oh. You're that Loon, ain't you? 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115844"));
                        DC(int64(0xa18ab10939953099), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee0110), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee0110), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    {
                        DC(int64(0xa18ab1093995309c), EConversationDebugInfo::Executing);
                        // Oh ... you're THAT Red, ain't you? 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115847"));
                        DC(int64(0xa18ab1093995309c), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee010f), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee010f), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa18ab109399530a1), EConversationDebugInfo::Executing);
                        // Oh, right - you're the new guy. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115849"));
                        DC(int64(0xa18ab109399530a1), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee0111), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee0111), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xa18ab109399530a8), EConversationDebugInfo::Executing);
                    G1R.WaterMaguesPermission = 1;
                    DC(int64(0xa18ab109399530a8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_723_firstwarn_exit_1");
                    DC(int64(0xa18ab109399530b1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa18ab109399530b1), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_sld_723_firstwarn_exit_2");
                    DC(int64(0x97703116c7c7adda), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x97703116c7c7adda), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceSld723Lastwarn : UTopic_Hero__NC_SLD_MERCENARY09_723
        {
            default DebugId = int64(0x2798667ea9360d36);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_WaterMagesPassage", 250.0f, int64(0x2798667ea9360d36));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2798667ea9360d37), G1R.GuardPassageWaterMagesWarning_NC == 1);
                    DB(int64(0x2798667ea9360d38), G1R.WaterMaguesPermission == 0);
                    DB(int64(0x2798667ea9360d3a), Mercenary != nullptr && Mercenary.IsAtPreferredLocation(200.0f));
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
                DC(int64(0x2798667ea9360d3b), EConversationDebugInfo::Executing);
                // I'm not gonna repeat myself. One more step and you're ...
                Mercenary.AI.Say(LocText("INFO_SLD_723_LASTWARN_11_01"));
                DC(int64(0x2798667ea9360d3b), EConversationDebugInfo::Done);
                DC(int64(0x1a121e2487d08ac8), EConversationDebugInfo::Executing);
                G1R.GuardPassageWaterMagesWarning_NC = 2;
                DC(int64(0x1a121e2487d08ac8), EConversationDebugInfo::Done);
                DB(int64(0x97703116c7c7add9), G1R.Friends_SendToNC == 1);
                
                if (G1R.Friends_SendToNC == 1)
                {
                    DC(int64(0xf9e12d6f73578db7), EConversationDebugInfo::Executing);
                    // The Watermages are expecting me.
                    Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_114802"));
                    DC(int64(0xf9e12d6f73578db7), EConversationDebugInfo::Done);
                    DB(int64(0xa18ab10939953095), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xa18ab10939953097), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DC(int64(0xa18ab10939953099), EConversationDebugInfo::Executing);
                        // Oh. You're that Loon, ain't you? 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115844"));
                        DC(int64(0xa18ab10939953099), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee0110), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee0110), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp))
                    {
                        DC(int64(0xa18ab1093995309c), EConversationDebugInfo::Executing);
                        // Oh ... you're THAT Red, ain't you? 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115847"));
                        DC(int64(0xa18ab1093995309c), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee010f), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee010f), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xa18ab109399530a1), EConversationDebugInfo::Executing);
                        // Oh, right - you're the new guy. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_115849"));
                        DC(int64(0xa18ab109399530a1), EConversationDebugInfo::Done);
                        DC(int64(0x45f83621a0ee0111), EConversationDebugInfo::Executing);
                        // Been waiting for you. Go on in. 
                        Mercenary.AI.Say(LocText("TEXT_WIP_QUKFIKD_20241028_151922"));
                        DC(int64(0x45f83621a0ee0111), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xa18ab109399530a8), EConversationDebugInfo::Executing);
                    G1R.WaterMaguesPermission = 1;
                    DC(int64(0xa18ab109399530a8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_sld_723_firstwarn_exit_1");
                    DC(int64(0xa18ab109399530b1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa18ab109399530b1), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    
                    Other.Remember(n"choice_sld_723_firstwarn_exit_2");
                    DC(int64(0x97703116c7c7adda), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x97703116c7c7adda), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */