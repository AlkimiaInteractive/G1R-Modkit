#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_STT_VIPER_302 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_STT_VIPER_302";
        }
        
        
        class UTopic_Hero__OM_STT_VIPER_302 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_STT_VIPER_302";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetViper() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceStt302ViperBuy : UTopic_Hero__OM_STT_VIPER_302
        {
            default DebugId = int64(0xfdd92f12cbcaa31d);
            default Caption = LocText("STT_302_VIPER_BUY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt302ViperGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfdd92f12cbcaa31e), EConversationDebugInfo::Executing);
                // Can I get some nuggets from you?
                Hero.AI.Say(LocText("STT_302_VIPER_BUY_INFO_15_01"));
                DC(int64(0xfdd92f12cbcaa31e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_VIPER, Document::UDocumentSegment_Glossary_OM_STT_VIPER_Trader);
                DB(int64(0x7ec56dc721168ca4), Viper != nullptr && Viper.IsAngryTowards(Hero));
                
                if (Viper != nullptr && Viper.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168ca6), EConversationDebugInfo::Executing);
                    // Listen. We're all breaking our backs here. You think ...
                    Viper.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_115720_2483"));
                    DC(int64(0x7ec56dc721168ca6), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231631f17), EConversationDebugInfo::Executing);
                    // I know you're one of those guys that only cause trouble. ...
                    Viper.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_150759"));
                    DC(int64(0x81b634f231631f17), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_302_viper_buy_exit_1");
                    DC(int64(0x7ec56dc721168ca7), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168ca7), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168ca9), EConversationDebugInfo::Executing);
                    // If you got goods to trade - sure!
                    Viper.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_115733_3346"));
                    DC(int64(0x7ec56dc721168ca9), EConversationDebugInfo::Done);
                    DC(int64(0xa4610215cd29c8db), EConversationDebugInfo::Executing);
                    Viper.AI.StartTradingWith(Hero);
                    DC(int64(0xa4610215cd29c8db), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_stt_302_viper_buy_exit_2");
                }
            }
        }
        
        
        class UChoiceStt302ViperExit : UTopic_Hero__OM_STT_VIPER_302
        {
            default DebugId = int64(0xfdd92f12cbcaa312);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfdd92f12cbcaa313), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xfdd92f12cbcaa313), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceStt302ViperGreet : UTopic_Hero__OM_STT_VIPER_302
        {
            default DebugId = int64(0xfdd92f12cbcaa314);
            default Caption = LocText("STT_302_VIPER_GREET_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceStt302ViperGreet);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfdd92f12cbcaa315), EConversationDebugInfo::Executing);
                // You're the smelter, aren't you?
                Hero.AI.Say(LocText("STT_302_VIPER_GREET_INFO_15_01"));
                DC(int64(0xfdd92f12cbcaa315), EConversationDebugInfo::Done);
                DC(int64(0xfdd92f12cbcaa316), EConversationDebugInfo::Executing);
                
                // Now just how did you figure that out.
                Viper.AI.Say(LocText("STT_302_VIPER_GREET_INFO_11_02"));
                DC(int64(0xfdd92f12cbcaa316), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_STT_VIPER, Document::UDocumentSegment_Glossary_OM_STT_VIPER_Introduction);
            }
        }
        
        
        class UChoiceStt302ViperMelt : UTopic_Hero__OM_STT_VIPER_302
        {
            default DebugId = int64(0xfdd92f12cbcaa317);
            default Caption = LocText("STT_302_VIPER_MELT_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceStt302ViperGreet);
            default Rules.HideIfKnows(UChoiceStt302ViperMelt);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GRD_260_DRAKE_MINE_MEHR_INFO_11_02"), int64(0xfdd92f12cbcaa317));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef934), Viper != nullptr && !Viper.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Viper_302_Collapsed));
                }
                
                return Viper != nullptr && !Viper.HasAssignedDailyRoutine(UDailyRoutine_OM_STT_Viper_302_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfdd92f12cbcaa318), EConversationDebugInfo::Executing);
                // Is ore smelting tough work? 
                Hero.AI.Say(LocText("STT_302_VIPER_MELT_INFO_15_01"));
                DC(int64(0xfdd92f12cbcaa318), EConversationDebugInfo::Done);
                DC(int64(0xfdd92f12cbcaa319), EConversationDebugInfo::Executing);
                
                // No. It's the most fun I've had in my entire life. Would ...
                Viper.AI.Say(LocText("STT_302_VIPER_MELT_INFO_11_02"));
                DC(int64(0xfdd92f12cbcaa319), EConversationDebugInfo::Done);
                DC(int64(0xfdd92f12cbcaa31a), EConversationDebugInfo::Executing);
                // OF COURSE it's tough work. If you mess it up, you lose ...
                Viper.AI.Say(LocText("STT_302_VIPER_MELT_INFO_11_03"));
                DC(int64(0xfdd92f12cbcaa31a), EConversationDebugInfo::Done);
                DC(int64(0xfdd92f12cbcaa31b), EConversationDebugInfo::Executing);
                // Not to mention all that fucking dust. It always gets ...
                Viper.AI.Say(LocText("STT_302_VIPER_MELT_INFO_11_04"));
                DC(int64(0xfdd92f12cbcaa31b), EConversationDebugInfo::Done);
                DC(int64(0xfdd92f12cbcaa31c), EConversationDebugInfo::Executing);
                // But still. Beats digging. 
                Viper.AI.Say(LocText("STT_302_VIPER_MELT_INFO_11_05"));
                DC(int64(0xfdd92f12cbcaa31c), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */