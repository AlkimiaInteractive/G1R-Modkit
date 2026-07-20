#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_ROGUE01_1501 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_ROGUE01_1501";
        }
        
        
        class UTopic_Hero__UL_ORG_ROGUE01_1501 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_ROGUE01_1501";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRogue01() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetUL_ORG_ROGUE02_1502() const property
            {
                return GetCharacter(n"UL_ORG_ROGUE02_1502");
            }
        }
        
        
        class UChoiceRogue01118244 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x9c3ddd4d955be939);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 3;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceRogue01118244);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ddd4d955be938), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9c3ddd4d955be938), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue01118260 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x9c3ddd4d955be93d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceRogue01118260);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc068), G1R.Rogue01_Warning == 0);
                    DB(int64(0xcd3b8403a7fdc06a), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 700.0f));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue01));
                    DB(int64(0xb9cddcabed28977e), G1R.Rogue01_Permission != 1);
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc068), G1R.Rogue01_Warning == 0);
                    DB(int64(0xcd3b8403a7fdc06a), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 700.0f));
                    DB(int64(0xb9cddcabed28977e), G1R.Rogue01_Permission != 1);
                    DB(int64(0x75862b9098d7919b), Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.Rogue01_Warning == 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 700.0f) && Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue01) && G1R.Rogue01_Permission != 1)
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && G1R.Rogue01_Warning == 0 && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 700.0f) && G1R.Rogue01_Permission != 1 && Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ddd4d955be93c), EConversationDebugInfo::Executing);
                // Well, who have we here? Don't you know it's dangerous ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_144749_2083"));
                DC(int64(0x9c3ddd4d955be93c), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be93f), EConversationDebugInfo::Executing);
                
                // What do you want?
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_144953"));
                DC(int64(0x9c3ddd4d955be93f), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be940), EConversationDebugInfo::Executing);
                
                // Simple. Your ore. All of it. Hand it over, or I'll take ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_144954"));
                DC(int64(0x9c3ddd4d955be940), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rogue01_118288,
                    UTopic_Rogue01_118308,
                    UTopic_Rogue01_118347
                );
            }
        }
        
        
        class UTopic_Rogue01_118288 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x9c3ddd4d955be944);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_145546_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ddd4d955be945), EConversationDebugInfo::Executing);
                // You're not getting a single nugget from me.
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_145546_1924"));
                DC(int64(0x9c3ddd4d955be945), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be954), EConversationDebugInfo::Executing);
                
                // (sighs) This could have been easy. But as you want. 
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_152159"));
                DC(int64(0x9c3ddd4d955be954), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be956), EConversationDebugInfo::Executing);
                Rogue01.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x9c3ddd4d955be956), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be958), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE02_1502)) && ensure(IsValid(UL_ORG_ROGUE02_1502.AI))) { UL_ORG_ROGUE02_1502.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0x9c3ddd4d955be958), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc088), EConversationDebugInfo::Executing);
                G1R.Rogue01_Robbed = FInGameTime::Now();
                DC(int64(0xcd3b8403a7fdc088), EConversationDebugInfo::Done);
                DC(int64(0xc650c95da6d348df), EConversationDebugInfo::Executing);
                G1R.Rogue01_Permission = 2;
                DC(int64(0xc650c95da6d348df), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a43a), EConversationDebugInfo::Executing);
                Rogue01.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x6fb7a2362f4a43a), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a43c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE02_1502))) { UL_ORG_ROGUE02_1502.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x6fb7a2362f4a43c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue01_118308 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x9c3ddd4d955be948);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_145546_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c3ddd4d955be95e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ddd4d955be949), EConversationDebugInfo::Executing);
                // Fine. Take it. 
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_145546_3436"));
                DC(int64(0x9c3ddd4d955be949), EConversationDebugInfo::Done);
                DB(int64(0xcd3b8403a7fdc04f), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 25, 0));
                DB(int64(0xcd3b8403a7fdc053), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 25, 0))
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc052), EConversationDebugInfo::Executing);
                    // That's it? I've seen diggers with bigger pouches. You ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_154336"));
                    DC(int64(0xcd3b8403a7fdc052), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc058), EConversationDebugInfo::Executing);
                    // Sod off. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_154655"));
                    DC(int64(0xcd3b8403a7fdc058), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0a9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0a9), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05a), EConversationDebugInfo::Executing);
                    // Look at that! Me and me lads are gonna have a grand time ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_154713_2083"));
                    DC(int64(0xcd3b8403a7fdc05a), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05b), EConversationDebugInfo::Executing);
                    // That was all then. Go on. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_154723"));
                    DC(int64(0xcd3b8403a7fdc05b), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0a8), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0a8), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc057), EConversationDebugInfo::Executing);
                    // I'm feelin' peachy today, so I'll let you off. Bit of ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_154638_41"));
                    DC(int64(0xcd3b8403a7fdc057), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0a7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0a7), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Rogue01_118347 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x9c3ddd4d955be959);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_152341_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c3ddd4d955be95e), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9c3ddd4d955be95a), EConversationDebugInfo::Executing);
                // I don't have anything. Feel free to look.
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_152341_3286"));
                DC(int64(0x9c3ddd4d955be95a), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be96d), EConversationDebugInfo::Executing);
                
                // Bullshit. They all got somethin' tucked away somewhere. ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_152608"), ForceCameraPreset = n"TWO SHOT FULL");
                DC(int64(0x9c3ddd4d955be96d), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Executing);
                Rogue01.AI.GotoCharacter(Hero, 100.0f);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be981), EConversationDebugInfo::Executing);
                // Blimey, you poor bastard. Go on then, I'll let you off - ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_152825_686"));
                DC(int64(0x9c3ddd4d955be981), EConversationDebugInfo::Done);
                DC(int64(0x2b6e42b39216d292), EConversationDebugInfo::Executing);
                G1R.Rogue01_Warning = 1;
                DC(int64(0x2b6e42b39216d292), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc04a), EConversationDebugInfo::Executing);
                G1R.Rogue01_Robbed = FInGameTime::Now();
                DC(int64(0xcd3b8403a7fdc04a), EConversationDebugInfo::Done);
                DC(int64(0x2b6e42b39216d293), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x2b6e42b39216d293), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue01118583 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xcd3b8403a7fdc064);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06a), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 200.0f));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue01));
                    DB(int64(0xcd3b8403a7fdc06d), G1R.Rogue01_Robbed.IsValid() && G1R.Rogue01_Robbed.IsAtLeastXDaysAgo(1));
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06a), Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 200.0f));
                    DB(int64(0xcd3b8403a7fdc06d), G1R.Rogue01_Robbed.IsValid() && G1R.Rogue01_Robbed.IsAtLeastXDaysAgo(1));
                    DB(int64(0x75862b9098d7919c), Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 200.0f) && Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue01) && G1R.Rogue01_Robbed.IsValid() && G1R.Rogue01_Robbed.IsAtLeastXDaysAgo(1))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.IsCloseToWaypoint(n"ASSAULT_ROGUE_01", 200.0f) && G1R.Rogue01_Robbed.IsValid() && G1R.Rogue01_Robbed.IsAtLeastXDaysAgo(1) && Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcd3b8403a7fdc063), EConversationDebugInfo::Executing);
                // Well, look who's back. We've had the pleasure before, ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_155022_2238"));
                DC(int64(0xcd3b8403a7fdc063), EConversationDebugInfo::Done);
                DC(int64(0xa4360efa2aab4196), EConversationDebugInfo::Executing);
                // Your ore. Now. 
                Rogue01.AI.Say(LocText("TEXT_WIP_LPMSWZD_20241212_134919"));
                DC(int64(0xa4360efa2aab4196), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rogue01_118620,
                    UTopic_Rogue01_118640,
                    UTopic_Rogue01_118662
                );
            }
        }
        
        
        class UTopic_Rogue01_118620 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xcd3b8403a7fdc072);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_160226_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcd3b8403a7fdc073), EConversationDebugInfo::Executing);
                // You can have a fist to the face if you like.
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_160226_3436"));
                DC(int64(0xcd3b8403a7fdc073), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc082), EConversationDebugInfo::Executing);
                
                // Seems we got a dumb one. I hate punchin' fools, y'know? ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_160409"));
                DC(int64(0xcd3b8403a7fdc082), EConversationDebugInfo::Done);
                DC(int64(0xc1da39848c6b2a0c), EConversationDebugInfo::Executing);
                // I'll make an exception for you. 
                Rogue01.AI.Say(LocText("TEXT_WIP_MBJDHIL_20241211_112818"));
                DC(int64(0xc1da39848c6b2a0c), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc088), EConversationDebugInfo::Executing);
                G1R.Rogue01_Robbed = FInGameTime::Now();
                DC(int64(0xcd3b8403a7fdc088), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc08c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE02_1502)) && ensure(IsValid(UL_ORG_ROGUE02_1502.AI))) { UL_ORG_ROGUE02_1502.AI.StartAttackingImmediatelyLootOnly(Hero); }
                DC(int64(0xcd3b8403a7fdc08c), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc08e), EConversationDebugInfo::Executing);
                Rogue01.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0xcd3b8403a7fdc08e), EConversationDebugInfo::Done);
                DC(int64(0xc650c95da6d348dd), EConversationDebugInfo::Executing);
                G1R.Rogue01_Permission = 2;
                DC(int64(0xc650c95da6d348dd), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a43e), EConversationDebugInfo::Executing);
                Rogue01.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                DC(int64(0x6fb7a2362f4a43e), EConversationDebugInfo::Done);
                DC(int64(0x6fb7a2362f4a440), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE02_1502))) { UL_ORG_ROGUE02_1502.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                DC(int64(0x6fb7a2362f4a440), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rogue01_118640 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xcd3b8403a7fdc076);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_160226_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c3ddd4d955be95e), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcd3b8403a7fdc077), EConversationDebugInfo::Executing);
                // Fine. Here you have it. 
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_160226_686"));
                DC(int64(0xcd3b8403a7fdc077), EConversationDebugInfo::Done);
                DB(int64(0xcd3b8403a7fdc090), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 15, 0));
                DB(int64(0xcd3b8403a7fdc091), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 15, 0))
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc099), EConversationDebugInfo::Executing);
                    // Here I have what? A sad hand full o' nothin'? Can't ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161120_1609"));
                    DC(int64(0xcd3b8403a7fdc099), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc09a), EConversationDebugInfo::Executing);
                    // It ain't fun like that, mate! Get yourself some ore, for ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161201"));
                    DC(int64(0xcd3b8403a7fdc09a), EConversationDebugInfo::Done);
                    DC(int64(0xc1da39848c6b2a0d), EConversationDebugInfo::Executing);
                    // Now piss off. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_MBJDHIL_20241211_113110"));
                    DC(int64(0xc1da39848c6b2a0d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0c0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0c0), EConversationDebugInfo::Done);
                    return;
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc09c), EConversationDebugInfo::Executing);
                    // Now you're gettin' it. Keep the top dogs sweet. You're a ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161221_3569"));
                    DC(int64(0xcd3b8403a7fdc09c), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc09d), EConversationDebugInfo::Executing);
                    // Road's free. Move along. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161230"));
                    DC(int64(0xcd3b8403a7fdc09d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0bf), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0bf), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Executing);
                    Hero.AI.GiveAllOfItemTo(Rogue01, UItMi_Orenugget);
                    DC(int64(0x2b6e42b39216d286), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc09f), EConversationDebugInfo::Executing);
                    // Now you're gettin' it. Keep the top dogs sweet. You're a ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161221_3569"));
                    DC(int64(0xcd3b8403a7fdc09f), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0a0), EConversationDebugInfo::Executing);
                    // Road's free. Move along. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161230"));
                    DC(int64(0xcd3b8403a7fdc0a0), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc05d), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0be), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0be), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Rogue01_118662 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xcd3b8403a7fdc07a);
            default Caption = LocText("TEXT_WIP_EFAWSM_20241205_160230_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9c3ddd4d955be95e), Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItMi_Orenugget, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcd3b8403a7fdc07b), EConversationDebugInfo::Executing);
                // Take a look if you want. I got nothing on me
                Hero.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_160230_2386"));
                DC(int64(0xcd3b8403a7fdc07b), EConversationDebugInfo::Done);
                DC(int64(0xcd3b8403a7fdc0aa), EConversationDebugInfo::Executing);
                
                // I don't believe you...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161537"), ForceCameraPreset = n"TWO SHOT FULL");
                DC(int64(0xcd3b8403a7fdc0aa), EConversationDebugInfo::Done);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Executing);
                Rogue01.AI.GotoCharacter(Hero, 100.0f);
                DC(int64(0x9c3ddd4d955be96c), EConversationDebugInfo::Done);
                DB(int64(0x2b6e42b39216d28f), G1R.Rogue01_Warning == 1);
                
                if (G1R.Rogue01_Warning == 1)
                {
                    DC(int64(0x2b6e42b39216d295), EConversationDebugInfo::Executing);
                    // What, still nothin'? I warned you, didn't I?
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_153400_2083"));
                    DC(int64(0x2b6e42b39216d295), EConversationDebugInfo::Done);
                    DC(int64(0x2b6e42b39216d296), EConversationDebugInfo::Executing);
                    // It's either ore or a face full o' knuckles. Enjoy. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_153408"));
                    DC(int64(0x2b6e42b39216d296), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc08e), EConversationDebugInfo::Executing);
                    Rogue01.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0xcd3b8403a7fdc08e), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0b0), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_ROGUE02_1502)) && ensure(IsValid(UL_ORG_ROGUE02_1502.AI))) { UL_ORG_ROGUE02_1502.AI.StartAttackingImmediatelyLootOnly(Hero); }
                    DC(int64(0xcd3b8403a7fdc0b0), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0b2), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc0b2), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0b7), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Warning = 0;
                    DC(int64(0xcd3b8403a7fdc0b7), EConversationDebugInfo::Done);
                    DC(int64(0xc650c95da6d348f1), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Permission = 2;
                    DC(int64(0xc650c95da6d348f1), EConversationDebugInfo::Done);
                    DC(int64(0x6fb7a2362f4a442), EConversationDebugInfo::Executing);
                    Rogue01.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy);
                    DC(int64(0x6fb7a2362f4a442), EConversationDebugInfo::Done);
                    DC(int64(0x6fb7a2362f4a444), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(UL_ORG_ROGUE02_1502))) { UL_ORG_ROGUE02_1502.SetRelationshipUntilDefeat(Hero, ERelationship::Enemy); }
                    DC(int64(0x6fb7a2362f4a444), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0bd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0bd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xcd3b8403a7fdc0b4), EConversationDebugInfo::Executing);
                    // Godsdammit, you're really skint. Useless as a bag full ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161655_443"));
                    DC(int64(0xcd3b8403a7fdc0b4), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0b5), EConversationDebugInfo::Executing);
                    // Better bring somethin' next time. Or you'll regret it. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_161736"));
                    DC(int64(0xcd3b8403a7fdc0b5), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc04a), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Robbed = FInGameTime::Now();
                    DC(int64(0xcd3b8403a7fdc04a), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0bb), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Warning = 1;
                    DC(int64(0xcd3b8403a7fdc0bb), EConversationDebugInfo::Done);
                    DC(int64(0xcd3b8403a7fdc0bc), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xcd3b8403a7fdc0bc), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceRogue01119011 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xb9cddcabed28976f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_ROGUE02_1502));
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.WasDefeatedBy(Rogue01));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(UL_ORG_ROGUE02_1502))
                    return true;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp) && Hero != nullptr && Hero.WasDefeatedBy(Rogue01))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9cddcabed28976e), EConversationDebugInfo::Executing);
                // That's what happens when you mess with me. Bring some ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_170358_41"));
                DC(int64(0xb9cddcabed28976e), EConversationDebugInfo::Done);
                DC(int64(0xc650c95da6d348db), EConversationDebugInfo::Executing);
                G1R.Rogue01_Permission = 0;
                DC(int64(0xc650c95da6d348db), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289772), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb9cddcabed289772), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue01119044 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xb9cddcabed289775);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRogue01119044);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                    DB(int64(0xcd3b8403a7fdc06b), Hero != nullptr && Hero.HasRecentlyDefeated(Rogue01));
                    DB(int64(0x75862b9098d7919e), Hero != nullptr && Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Rogue01))
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(UL_ORG_ROGUE02_1502))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb9cddcabed289774), EConversationDebugInfo::Executing);
                // Alright, alright! You win! Just leave me alone, ...
                Rogue01.AI.Say(LocText("TEXT_WIP_EFAWSM_20241205_170816_2238"));
                DC(int64(0xb9cddcabed289774), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289780), EConversationDebugInfo::Executing);
                G1R.Rogue01_Permission = 1;
                DC(int64(0xb9cddcabed289780), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289782), EConversationDebugInfo::Executing);
                if (ensure(IsValid(UL_ORG_ROGUE02_1502))) { UL_ORG_ROGUE02_1502.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Rogue02_1502_Beaten); }
                DC(int64(0xb9cddcabed289782), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289784), EConversationDebugInfo::Executing);
                Rogue01.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Rogue01_1501_Beaten);
                DC(int64(0xb9cddcabed289784), EConversationDebugInfo::Done);
                DC(int64(0xb9cddcabed289785), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb9cddcabed289785), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRogue01119276 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0xc4c69c58c3da17ea);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"ASSAULT_ROGUE_01", 700.0f, int64(0xc4c69c58c3da17ea));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_EFAWSM_20241205_170816_2238"), int64(0xc4c69c58c3da17ea));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc650c95da6d34826), G1R.Rogue01_ScaredPool.IsValid() && G1R.Rogue01_ScaredPool.IsAtLeastXMinutesAgo(700));
                }
                
                return G1R.Rogue01_ScaredPool.IsValid() && G1R.Rogue01_ScaredPool.IsAtLeastXMinutesAgo(700);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xc650c95da6d34834), G1R.Rogue01_Afraid == 0);
                DB(int64(0xc650c95da6d34835), G1R.Rogue01_Afraid == 1);
                DB(int64(0xc650c95da6d34836), G1R.Rogue01_Afraid == 2);
                
                if (G1R.Rogue01_Afraid == 0)
                {
                    DC(int64(0xc650c95da6d3483e), EConversationDebugInfo::Executing);
                    // Alright, alright, I got the message, heh. Go on through.
                    Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_111330_41"));
                    DC(int64(0xc650c95da6d3483e), EConversationDebugInfo::Done);
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Afraid += 1;
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Done);
                }
                else if (G1R.Rogue01_Afraid == 1)
                {
                    DC(int64(0xc650c95da6d34840), EConversationDebugInfo::Executing);
                    // You again. Go on through. I'm not in the mood. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_111332_2083"));
                    DC(int64(0xc650c95da6d34840), EConversationDebugInfo::Done);
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Afraid += 1;
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Done);
                }
                else if (G1R.Rogue01_Afraid == 2)
                {
                    DC(int64(0xc650c95da6d34844), EConversationDebugInfo::Executing);
                    // Oy, easy there. I don't want no trouble. Go on through. 
                    Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_111334_2238"));
                    DC(int64(0xc650c95da6d34844), EConversationDebugInfo::Done);
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Afraid += 1;
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xc650c95da6d34849), EConversationDebugInfo::Executing);
                    // Oy, how you been? Go on through, ha. We're just muckin' ...
                    Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_111336_1924"));
                    DC(int64(0xc650c95da6d34849), EConversationDebugInfo::Done);
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Executing);
                    G1R.Rogue01_Afraid = 0;
                    DC(int64(0xc650c95da6d3486d), EConversationDebugInfo::Done);
                }
                DC(int64(0xc650c95da6d348b9), EConversationDebugInfo::Executing);
                G1R.Rogue01_ScaredPool = FInGameTime::Now();
                DC(int64(0xc650c95da6d348b9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue01119281 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x1e53924048a86ff2);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceRogue01119281);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_EFAWSM_20241205_170816_2238"), int64(0x1e53924048a86ff2));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e53924048a86ff7), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x1e53924048a86ff8), G1R.Rogue01_Permission != 1);
                    DB(int64(0x1e53924048a86ff9), G1R.Rogue01_Robbed.IsValid() && G1R.Rogue01_Robbed.IsTimeInThePast());
                    DB(int64(0x1e53924048a86fff), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Rogue01_Permission == 1)
                    return false;
                
                if (G1R.Rogue01_Robbed.IsValid() && !G1R.Rogue01_Robbed.IsTimeInThePast())
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e53924048a86ff1), EConversationDebugInfo::Executing);
                // What are you standin' around here for? Wanna lose some ...
                Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_103149_3286"));
                DC(int64(0x1e53924048a86ff1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRogue01119397 : UTopic_Hero__UL_ORG_ROGUE01_1501
        {
            default DebugId = int64(0x1e53924048a87002);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceRogue01119397);
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"ASSAULT_ROGUE_01", 700.0f, int64(0x1e53924048a87002));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd3b8403a7fdc067), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e53924048a87001), EConversationDebugInfo::Executing);
                // Who have we here? One of ours? Go on , through you go. 
                Rogue01.AI.Say(LocText("TEXT_WIP_CIHWUEL_20241209_104736_1609"));
                DC(int64(0x1e53924048a87001), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */