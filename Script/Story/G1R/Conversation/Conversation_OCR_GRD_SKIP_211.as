#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_SKIP_211 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_SKIP_211";
        }
        
        
        class UTopic_Hero__OCR_GRD_SKIP_211 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_SKIP_211";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSkip() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGrd211SkipTrade : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16daf3);
            default Caption = LocText("GRD_211_SKIP_TRADE_INFO_15_01");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7156bafbfe16daf7), G1R.Skip_TradeFree != 0);
                    DB(int64(0x7156bafbfe16daf4), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x7156bafbfe16daf5), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x7156bafbfe16daf6), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                }
                
                if (G1R.Skip_TradeFree != 0)
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16daf8), EConversationDebugInfo::Executing);
                // I could use a few things.
                Hero.AI.Say(LocText("GRD_211_SKIP_TRADE_INFO_15_01"));
                DC(int64(0x7156bafbfe16daf8), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168b70), Skip != nullptr && Skip.IsAngryTowards(Hero));
                
                if (Skip != nullptr && Skip.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168b72), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Skip.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_113351_153"));
                    DC(int64(0x7ec56dc721168b72), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_211_skip_trade_exit_1");
                    DC(int64(0x7ec56dc721168b75), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168b75), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168b6c), EConversationDebugInfo::Executing);
                    // And I could sell you some.
                    Skip.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_113301_3902"));
                    DC(int64(0x7ec56dc721168b6c), EConversationDebugInfo::Done);
                    DC(int64(0x7156bafbfe16dafa), EConversationDebugInfo::Executing);
                    Skip.AI.StartTradingWith(Hero);
                    DC(int64(0x7156bafbfe16dafa), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_grd_211_skip_trade_exit_2");
                }
            }
        }
        
        
        class UChoiceGrd211SkipWelcome : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dafb);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd211SkipWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7156bafbfe16dafc), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dafd), EConversationDebugInfo::Executing);
                // Hey, you've come a long way, haven't you? Especially as ...
                Skip.AI.Say(LocText("GRD_211_SKIP_WELCOME_INFO_12_01"));
                DC(int64(0x7156bafbfe16dafd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SKIP, Document::UDocumentSegment_Glossary_OCR_GRD_SKIP_Introduction);
            }
        }
        
        
        class UChoiceSkipExit : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dac4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dac5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7156bafbfe16dac5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSkipFirst : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dac6);
            default Caption = LocText("DIA_SKIP_FIRST_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSkipFirst);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16daca), EConversationDebugInfo::Executing);
                // What are you doing here?
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_15_00"));
                DC(int64(0x7156bafbfe16daca), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dacb), EConversationDebugInfo::Executing);
                
                // I'm in charge of the armory. 
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_12_01"));
                DC(int64(0x7156bafbfe16dacb), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dacc), EConversationDebugInfo::Executing);
                
                // Do you sell those weapons? 
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_15_02"));
                DC(int64(0x7156bafbfe16dacc), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dacd), EConversationDebugInfo::Executing);
                
                // Only to our men. 
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_12_03"));
                DC(int64(0x7156bafbfe16dacd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SKIP, Document::UDocumentSegment_Glossary_OCR_GRD_SKIP_Dealer);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OCR_GRD_SKIP, Document::UDocumentSegment_Glossary_OCR_GRD_SKIP_Introduction);
                Subdialog(
                    UChoiceSkipFirstBack,
                    UChoiceSkipFirstThorus
                );
            }
        }
        
        
        class UChoiceSkipFirstBack : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dacf);
            default Caption = LocText("DIA_SKIP_FIRST_BACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dad0), EConversationDebugInfo::Executing);
                // Got it. See you around. 
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_BACK_15_00"));
                DC(int64(0x7156bafbfe16dad0), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c343234bd), EConversationDebugInfo::Executing);
                
                // Stay alive. 
                Skip.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_151105"));
                DC(int64(0x9d1cf82c343234bd), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dad1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7156bafbfe16dad1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSkipFirstThorus : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dad2);
            default Caption = LocText("DIA_SKIP_FIRST_THORUS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x2142984dcaac1034), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x2142984dcaac1038), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x2142984dcaac103b), G1R.FireMagesDead == 0);
                    DB(int64(0x7156bafbfe16dac7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage) && G1R.FireMagesDead == 0)
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dad3), EConversationDebugInfo::Executing);
                // Thorus sent me. He said you'd give me a weapon? 
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_15_00"));
                DC(int64(0x7156bafbfe16dad3), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dad4), EConversationDebugInfo::Executing);
                
                // Did he?
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_12_01"));
                DC(int64(0x7156bafbfe16dad4), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceSkipFirstThorusAskhim,
                    UChoiceSkipFirstThorusKickass,
                    UChoiceSkipFirstThorusStranger
                );
            }
        }
        
        
        class UChoiceSkipFirstThorusAskhim : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dad6);
            default Caption = LocText("DIA_SKIP_FIRST_THORUS_ASKHIM_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dad7), EConversationDebugInfo::Executing);
                // Go ask him.
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_ASKHIM_15_00"));
                DC(int64(0x7156bafbfe16dad7), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dad8), EConversationDebugInfo::Executing);
                
                // You know what, I might just do that. I'm sure he'd love ...
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_ASKHIM_12_01"));
                DC(int64(0x7156bafbfe16dad8), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dad9), EConversationDebugInfo::Executing);
                // I have no idea how you got in here, but if I were you, ...
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_ASKHIM_12_02"));
                DC(int64(0x7156bafbfe16dad9), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dada), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7156bafbfe16dada), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSkipFirstThorusKickass : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dadb);
            default Caption = LocText("DIA_SKIP_FIRST_THORUS_KICKASS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dadc), EConversationDebugInfo::Executing);
                // He also told me to kick your ass if you act stubborn. 
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_KICKASS_15_00"));
                DC(int64(0x7156bafbfe16dadc), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dadd), EConversationDebugInfo::Executing);
                
                // Oh, did he now? I have a feeling I'll be the one doing ...
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_KICKASS_12_01"));
                DC(int64(0x7156bafbfe16dadd), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dade), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7156bafbfe16dade), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSkipFirstThorusStranger : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dadf);
            default Caption = LocText("DIA_SKIP_FIRST_THORUS_STRANGER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dae0), EConversationDebugInfo::Executing);
                // He wants me to take care of something that only I can ...
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_STRANGER_15_00"));
                DC(int64(0x7156bafbfe16dae0), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dae1), EConversationDebugInfo::Executing);
                
                // And so he sent you to see me? 
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_STRANGER_12_01"));
                DC(int64(0x7156bafbfe16dae1), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceSkipFirstThorusKickassagain,
                    UChoiceSkipFirstGomez
                );
            }
        }
        
        
        class UChoiceSkipFirstThorusKickassagain : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dae3);
            default Caption = LocText("DIA_SKIP_FIRST_THORUS_KICKASSAGAIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dae4), EConversationDebugInfo::Executing);
                // He did. And he also told me to kick your ass if you keep ...
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_KICKASSAGAIN_15_00"));
                DC(int64(0x7156bafbfe16dae4), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dae5), EConversationDebugInfo::Executing);
                
                // All right, all right - calm down. What do you want? 
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_THORUS_KICKASSAGAIN_12_01"));
                DC(int64(0x7156bafbfe16dae5), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16dae6), EConversationDebugInfo::Executing);
                G1R.Skip_TradeFree = 1;
                DC(int64(0x7156bafbfe16dae6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSkipFirstGomez : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16dae7);
            default Caption = LocText("DIA_SKIP_FIRST_GOMEZ_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16dae8), EConversationDebugInfo::Executing);
                // Gomez's orders. 
                Hero.AI.Say(LocText("DIA_SKIP_FIRST_GOMEZ_15_00"));
                DC(int64(0x7156bafbfe16dae8), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16daea), EConversationDebugInfo::Executing);
                
                // ... No, I don't buy it. Now piss off before I lose my ...
                Skip.AI.Say(LocText("DIA_SKIP_FIRST_GOMEZ_12_02"));
                DC(int64(0x7156bafbfe16daea), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16daeb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7156bafbfe16daeb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSkipVerpatzt : UTopic_Hero__OCR_GRD_SKIP_211
        {
            default DebugId = int64(0x7156bafbfe16daec);
            default Caption = LocText("DIA_SKIP_VERPATZT_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSkipFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7156bafbfe16daed), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                    DB(int64(0x7156bafbfe16daee), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                    DB(int64(0x7156bafbfe16daef), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage));
                    DB(int64(0x7156bafbfe16daf0), G1R.Skip_TradeFree == 0);
                }
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_FireMage))
                    return false;
                
                if (G1R.Skip_TradeFree != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7156bafbfe16daf1), EConversationDebugInfo::Executing);
                // About that gear ... 
                Hero.AI.Say(LocText("DIA_SKIP_VERPATZT_15_00"));
                DC(int64(0x7156bafbfe16daf1), EConversationDebugInfo::Done);
                DC(int64(0x7156bafbfe16daf2), EConversationDebugInfo::Executing);
                
                // Get lost!
                Skip.AI.Say(LocText("DIA_SKIP_VERPATZT_12_01"));
                DC(int64(0x7156bafbfe16daf2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */