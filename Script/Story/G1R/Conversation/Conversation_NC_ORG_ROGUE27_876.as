#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_ROGUE27_876 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_ROGUE27_876";
        }
        
        
        class UTopic_Hero__NC_ORG_ROGUE27_876 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_ROGUE27_876";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBouncer() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetSilas() const property
            {
                return GetCharacter(n"NC_ORG_SILAS_841");
            }
        }
        
        
        class UChoiceOrg876Amsfb : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bbf);
            default Caption = LocText("DIA_ORG_876_AMSFB_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1bc0), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1bc1), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                }
                
                if (G1R.Tavern_Permission != 0)
                    return false;
                
                if (Bouncer != nullptr && Bouncer.IsFriendlyTowards(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bc2), EConversationDebugInfo::Executing);
                // I AM a scraper. And I need a drink.
                Hero.AI.Say(LocText("DIA_ORG_876_AMSFB_15_00"));
                DC(int64(0xf0330882588d1bc2), EConversationDebugInfo::Done);
                DB(int64(0x815523921e3daae7), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper));
                DB(int64(0xf0330882588d1bc5), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger));
                
                if ((Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Scraper)) || (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Digger)))
                {
                    DC(int64(0xf0330882588d1bc6), EConversationDebugInfo::Executing);
                    // Hmm ... you sure look the part. All right then, go on ...
                    Bouncer.AI.Say(LocText("DIA_ORG_876_AMSFB_06_01"));
                    DC(int64(0xf0330882588d1bc6), EConversationDebugInfo::Done);
                    DC(int64(0xf83837cb3c788ab1), EConversationDebugInfo::Executing);
                    G1R.Tavern_Permission = 1;
                    DC(int64(0xf83837cb3c788ab1), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf0330882588d1bc8), EConversationDebugInfo::Executing);
                    // If you're a scraper, then I'm King Rhobar. Piss off. 
                    Bouncer.AI.Say(LocText("DIA_ORG_876_AMSFB_NOSFB_06_00"));
                    DC(int64(0xf0330882588d1bc8), EConversationDebugInfo::Done);
                }
                DC(int64(0xf0330882588d1bc7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1bc7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Bribe : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bc9);
            default Caption = LocText("DIA_ORG_876_BRIBE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1bca), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1bcb), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                }
                
                if (G1R.Tavern_Permission != 0)
                    return false;
                
                if (Bouncer != nullptr && Bouncer.IsFriendlyTowards(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bcc), EConversationDebugInfo::Executing);
                // How about some ore to get in?
                Hero.AI.Say(LocText("DIA_ORG_876_BRIBE_15_00"));
                DC(int64(0xf0330882588d1bcc), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1bcd), EConversationDebugInfo::Executing);
                
                // How much "some" are we talkin'?
                Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_06_01"));
                DC(int64(0xf0330882588d1bcd), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceOrg876Bribe100erz,
                    UChoiceOrg876Bribe50erz,
                    UChoiceOrg876Bribe10erz
                );
            }
        }
        
        
        class UChoiceOrg876Bribe100erz : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xe8603e87342bc7d9);
            default Caption = LocText("DIA_ORG_876_BRIBE_100ERZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bd0), EConversationDebugInfo::Executing);
                // A hundred?
                Hero.AI.Say(LocText("DIA_ORG_876_BRIBE_100ERZ_15_00"));
                DC(int64(0xf0330882588d1bd0), EConversationDebugInfo::Done);
                DB(int64(0xf0330882588d1bd2), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 100, 0))
                {
                    DC(int64(0xf0330882588d1bd3), EConversationDebugInfo::Executing);
                    // All right then. Go on in. 
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_100ERZ_06_01"));
                    DC(int64(0xf0330882588d1bd3), EConversationDebugInfo::Done);
                    DC(int64(0x4bd264e8b9cc5f77), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Bouncer, UItMi_Orenugget, 100);
                    DC(int64(0x4bd264e8b9cc5f77), EConversationDebugInfo::Done);
                    DC(int64(0x4bd264e8b9cc5f79), EConversationDebugInfo::Executing);
                    G1R.Tavern_Permission = 1;
                    DC(int64(0x4bd264e8b9cc5f79), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf0330882588d1bd5), EConversationDebugInfo::Executing);
                    // That might just do. But you ain't got that much. 
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_100ERZ_06_02"));
                    DC(int64(0xf0330882588d1bd5), EConversationDebugInfo::Done);
                }
                DC(int64(0xf0330882588d1bd6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1bd6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Bribe50erz : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xe8603e87342bc7e4);
            default Caption = LocText("DIA_ORG_876_BRIBE_50ERZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bd8), EConversationDebugInfo::Executing);
                // How about fifty?
                Hero.AI.Say(LocText("DIA_ORG_876_BRIBE_50ERZ_15_00"));
                DC(int64(0xf0330882588d1bd8), EConversationDebugInfo::Done);
                DB(int64(0xf0330882588d1bda), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 50, 0))
                {
                    DC(int64(0xf0330882588d1bdb), EConversationDebugInfo::Executing);
                    // Halfway there. 
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_50ERZ_06_01"));
                    DC(int64(0xf0330882588d1bdb), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf0330882588d1bdc), EConversationDebugInfo::Executing);
                    // Where? You ain't got that much.
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_50ERZ_06_02"));
                    DC(int64(0xf0330882588d1bdc), EConversationDebugInfo::Done);
                }
                DC(int64(0xf0330882588d1bdd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1bdd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Bribe10erz : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xe8603e87342bc7ee);
            default Caption = LocText("DIA_ORG_876_BRIBE_10ERZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bdf), EConversationDebugInfo::Executing);
                // I got ten. Here.
                Hero.AI.Say(LocText("DIA_ORG_876_BRIBE_10ERZ_15_00"));
                DC(int64(0xf0330882588d1bdf), EConversationDebugInfo::Done);
                DB(int64(0xf0330882588d1be1), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xf0330882588d1be2), EConversationDebugInfo::Executing);
                    // Ten? All that's gonna buy you is another try. 
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_10ERZ_06_01"));
                    DC(int64(0xf0330882588d1be2), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf0330882588d1be3), EConversationDebugInfo::Executing);
                    // Where? You ain't got nothin'.
                    Bouncer.AI.Say(LocText("DIA_ORG_876_BRIBE_10ERZ_06_02"));
                    DC(int64(0xf0330882588d1be3), EConversationDebugInfo::Done);
                }
                DC(int64(0xf0330882588d1be4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1be4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Exit : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bbd);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bbe), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1bbe), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Firstwarn : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1c05);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1c06), G1R.GuardPassageTavernWarning_NC == 0);
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c08), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0xf0330882588d1c06), G1R.GuardPassageTavernWarning_NC == 0);
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c08), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xf0330882588d1c06), G1R.GuardPassageTavernWarning_NC == 0);
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c08), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                }
                
                if (G1R.GuardPassageTavernWarning_NC == 0 && G1R.Tavern_Permission == 0 && Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero) && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return true;
                
                if (G1R.GuardPassageTavernWarning_NC == 0 && G1R.Tavern_Permission == 0 && Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero) && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return true;
                
                if (G1R.GuardPassageTavernWarning_NC == 0 && G1R.Tavern_Permission == 0 && Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero) && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1c0a), EConversationDebugInfo::Executing);
                // Now where do you think you're goin'?
                Bouncer.AI.Say(LocText("INFO_ORG_876_FIRSTWARN_INFO_06_00"));
                DC(int64(0xf0330882588d1c0a), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1c0b), EConversationDebugInfo::Executing);
                
                // In there.
                Hero.AI.Say(LocText("INFO_ORG_876_FIRSTWARN_INFO_15_01"));
                DC(int64(0xf0330882588d1c0b), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1c0c), EConversationDebugInfo::Executing);
                
                // Forget about it. This place is for diggers, farmers, and ...
                Bouncer.AI.Say(LocText("INFO_ORG_876_FIRSTWARN_INFO_06_02"));
                DC(int64(0xf0330882588d1c0c), EConversationDebugInfo::Done);
                DB(int64(0xd1ab8ffeb3cf1a37), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning())
                {
                    Subdialog(
                        UTopic_Bouncer_111068,
                        UTopic_Bouncer_111088
                    );
                }
                else
                {
                    DC(int64(0xd1ab8ffeb3cf1a3e), EConversationDebugInfo::Executing);
                    // All right. 
                    Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_161245_1769"));
                    DC(int64(0xd1ab8ffeb3cf1a3e), EConversationDebugInfo::Done);
                }
                DC(int64(0x4bd264e8b9cc5f9c), EConversationDebugInfo::Executing);
                G1R.GuardPassageTavernWarning_NC = 1;
                DC(int64(0x4bd264e8b9cc5f9c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Bouncer_111068 : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf13de99deb210c41);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_161245_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bouncer_111068);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210c42), EConversationDebugInfo::Executing);
                // But the Rice Lord sent me. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_161245_2801"));
                DC(int64(0xf13de99deb210c42), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210c5b), EConversationDebugInfo::Executing);
                
                // That don't mean the rules don't count for you. 
                Bouncer.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_161641"));
                DC(int64(0xf13de99deb210c5b), EConversationDebugInfo::Done);
                DC(int64(0xf13de99deb210c5c), EConversationDebugInfo::Executing);
                // Don't make me repeat myself.
                Bouncer.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_161703"));
                DC(int64(0xf13de99deb210c5c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Bouncer_111088 : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf13de99deb210c45);
            default Caption = LocText("TEXT_WIP_UGKWYUI_20240719_161245_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bouncer_111088);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf13de99deb210c46), EConversationDebugInfo::Executing);
                
                // All right. 
                Hero.AI.Say(LocText("TEXT_WIP_UGKWYUI_20240719_161245_1769"));
                DC(int64(0xf13de99deb210c46), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg876Gibkraut : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bf6);
            default Caption = LocText("DIA_ORG_876_GIBKRAUT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceOrg876Scsekte);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bf7), EConversationDebugInfo::Executing);
                // I have some rolls with me. Here, take one.
                Hero.AI.Say(LocText("DIA_ORG_876_GIBKRAUT_15_00"));
                DC(int64(0xf0330882588d1bf7), EConversationDebugInfo::Done);
                DB(int64(0xce0e0ddf46e4868f), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                DB(int64(0xce0e0ddf46e4868e), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                DB(int64(0xce0e0ddf46e48690), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                
                if ((Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0)))
                {
                    DB(int64(0xf0330882588d1bfb), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                    DB(int64(0xf0330882588d1bfd), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                    DB(int64(0xf0330882588d1bff), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                    {
                        DC(int64(0x4bd264e8b9cc5fb0), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Bouncer, UItMi_Joint_01, 1);
                        DC(int64(0x4bd264e8b9cc5fb0), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0))
                    {
                        DC(int64(0x4bd264e8b9cc5fb3), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Bouncer, UItMi_Joint_02, 1);
                        DC(int64(0x4bd264e8b9cc5fb3), EConversationDebugInfo::Done);
                    }
                    else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0))
                    {
                        DC(int64(0x4bd264e8b9cc5fb6), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Bouncer, UItMi_Joint_03, 1);
                        DC(int64(0x4bd264e8b9cc5fb6), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xf0330882588d1c01), EConversationDebugInfo::Executing);
                    // I like you already. Go on in, mate.
                    Bouncer.AI.Say(LocText("DIA_ORG_876_GIBKRAUT_06_01"));
                    DC(int64(0xf0330882588d1c01), EConversationDebugInfo::Done);
                    DC(int64(0x4bd264e8b9cc5fab), EConversationDebugInfo::Executing);
                    G1R.Bouncer876_GotJoint = 1;
                    DC(int64(0x4bd264e8b9cc5fab), EConversationDebugInfo::Done);
                    DC(int64(0x68881fdf53eebd7b), EConversationDebugInfo::Executing);
                    G1R.Tavern_Permission = 1;
                    DC(int64(0x68881fdf53eebd7b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_876_gibkraut_exit_1");
                    DC(int64(0x3697d55a33556cd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3697d55a33556cd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xf0330882588d1c03), EConversationDebugInfo::Executing);
                    // Oh. Wait. They're gone.
                    Hero.AI.Say(LocText("DIA_ORG_876_GIBKRAUT_KEIN_15_00"));
                    DC(int64(0xf0330882588d1c03), EConversationDebugInfo::Done);
                    DC(int64(0xf0330882588d1c04), EConversationDebugInfo::Executing);
                    
                    // Great. Save me one next time, will you?
                    Bouncer.AI.Say(LocText("DIA_ORG_876_GIBKRAUT_KEIN_06_00"));
                    DC(int64(0xf0330882588d1c04), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_org_876_gibkraut_exit_2");
                }
            }
        }
        
        
        class UChoiceOrg876Lastwarn : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1c0d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"HERO", n"WP_NC_Tavern", 200.0f, int64(0xf0330882588d1c0d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1c0e), G1R.GuardPassageTavernWarning_NC == 1);
                    DB(int64(0xf0330882588d1c0f), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c10), Bouncer != nullptr && !Bouncer.IsFriendlyTowards(Hero));
                    DB(int64(0xf0330882588d1c12), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                }
                
                if (G1R.GuardPassageTavernWarning_NC != 1)
                    return false;
                
                if (G1R.Tavern_Permission != 0)
                    return false;
                
                if (Bouncer != nullptr && Bouncer.IsFriendlyTowards(Hero))
                    return false;
                
                if (Bouncer != nullptr && !Bouncer.IsAtPreferredLocation(0.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1c13), EConversationDebugInfo::Executing);
                // Are you deaf or what?
                Bouncer.AI.Say(LocText("INFO_ORG_876_LASTWARN_06_00"));
                DC(int64(0xf0330882588d1c13), EConversationDebugInfo::Done);
                DC(int64(0x4bd264e8b9cc5fc4), EConversationDebugInfo::Executing);
                G1R.GuardPassageTavernWarning_NC = 2;
                DC(int64(0x4bd264e8b9cc5fc4), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1c14), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf0330882588d1c14), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg876Perm : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1be5);
            default Caption = LocText("DIA_ORG_876_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1be6), Bouncer != nullptr && Bouncer.IsFriendlyTowards(Hero));
                    DB(int64(0x8bb8e7be117f5fe9), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_LIWVLHC_20240312_172712")));
                    DB(int64(0xe87603958191bf37), Silas != nullptr && !Silas.IsEveryoneOfThisKindDead());
                    DB(int64(0xf0330882588d1be7), G1R.self_aivar_AIV_PASSGATE != 0);
                    DB(int64(0x8bb8e7be117f5fe8), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_LIWVLHC_20240312_172712")));
                    DB(int64(0xe87603958191bf36), Silas != nullptr && !Silas.IsEveryoneOfThisKindDead());
                }
                
                if (Bouncer != nullptr && Bouncer.IsFriendlyTowards(Hero) && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_LIWVLHC_20240312_172712")) && Silas != nullptr && !Silas.IsEveryoneOfThisKindDead())
                    return true;
                
                if (G1R.self_aivar_AIV_PASSGATE != 0 && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_LIWVLHC_20240312_172712")) && Silas != nullptr && !Silas.IsEveryoneOfThisKindDead())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1be8), EConversationDebugInfo::Executing);
                // How's business?
                Hero.AI.Say(LocText("DIA_ORG_876_PERM_15_00"));
                DC(int64(0xf0330882588d1be8), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1be9), EConversationDebugInfo::Executing);
                
                // Go in and ask Silas. We can't complain.
                Bouncer.AI.Say(LocText("DIA_ORG_876_PERM_06_01"));
                DC(int64(0xf0330882588d1be9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg876Scsekte : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bf1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceOrg876Scsekte);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1bf2), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice));
                    DB(int64(0xf0330882588d1bf3), Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar));
                }
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Novice))
                    return true;
                
                if (Hero != nullptr && Hero.IsApparentlyPartOfGuild(GameplayTag::Guild_Human_SwampCamp_Templar))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bf4), EConversationDebugInfo::Executing);
                // A Loon, eh? This place is usually just for our boys, but ...
                Bouncer.AI.Say(LocText("DIA_ORG_876_SCSEKTE_06_00"));
                DC(int64(0xf0330882588d1bf4), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1bf5), EConversationDebugInfo::Executing);
                // 'Specially if they got smokes on 'em. 
                Bouncer.AI.Say(LocText("DIA_ORG_876_SCSEKTE_06_01"));
                DC(int64(0xf0330882588d1bf5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceOrg876Scsld : UTopic_Hero__NC_ORG_ROGUE27_876
        {
            default DebugId = int64(0xf0330882588d1bea);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg876Scsld);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary));
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0xf0330882588d1c07), G1R.Tavern_Permission == 0);
                    DB(int64(0xf0330882588d1c09), Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f));
                    DB(int64(0x7b71f519e0086c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                }
                
                if (G1R.Tavern_Permission == 0 && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Mercenary))
                    return true;
                
                if (G1R.Tavern_Permission == 0 && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return true;
                
                if (G1R.Tavern_Permission == 0 && Bouncer != nullptr && Bouncer.IsAtPreferredLocation(0.0f) && Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf0330882588d1bee), EConversationDebugInfo::Executing);
                // Stop. You know the rules: only diggers, farmers, and ...
                Bouncer.AI.Say(LocText("DIA_ORG_876_SCSLD_06_00"));
                DC(int64(0xf0330882588d1bee), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1bef), EConversationDebugInfo::Executing);
                
                // Who's going to stop me? 
                Hero.AI.Say(LocText("DIA_ORG_876_SCSLD_15_01"));
                DC(int64(0xf0330882588d1bef), EConversationDebugInfo::Done);
                DC(int64(0xf0330882588d1bf0), EConversationDebugInfo::Executing);
                
                // Um ... go on in.
                Bouncer.AI.Say(LocText("DIA_ORG_876_SCSLD_06_02"));
                DC(int64(0xf0330882588d1bf0), EConversationDebugInfo::Done);
                DC(int64(0x7b71f519e0086c4), EConversationDebugInfo::Executing);
                G1R.Tavern_Permission = 1;
                DC(int64(0x7b71f519e0086c4), EConversationDebugInfo::Done);
                DC(int64(0xe34ab777ff88cde), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe34ab777ff88cde), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */