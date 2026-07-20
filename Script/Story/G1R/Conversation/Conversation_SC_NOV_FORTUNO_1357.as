#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_FORTUNO_1357 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_FORTUNO_1357";
        }
        
        
        class UTopic_Hero__SC_NOV_FORTUNO_1357 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_FORTUNO_1357";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetFortuno() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
        }
        
        
        class UChoiceFortuno156804 : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x14e8115e07a95cd5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceFortuno156804);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Fortuno, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Fortuno, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95cd0), EConversationDebugInfo::Executing);
                // Seems we're stuck here for a little longer. Good thing ...
                Fortuno.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_161429_3436"));
                DC(int64(0x14e8115e07a95cd0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFortuno156825 : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x14e8115e07a95cea);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceFortuno156825);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Fortuno, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Fortuno, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95ce5), EConversationDebugInfo::Executing);
                // Oh, hey. I can't get that vision out of my head ... It's ...
                Fortuno.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_161516_686"));
                DC(int64(0x14e8115e07a95ce5), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFortunoBuyjoints : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x1e824b558408083e);
            default Caption = LocText("DIA_FORTUNO_BUYJOINTS_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFortunoGetgeschenk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e824b558408083f), EConversationDebugInfo::Executing);
                
                // Let's trade.
                Hero.AI.Say(LocText("DIA_FORTUNO_BUYJOINTS_15_00"));
                DC(int64(0x1e824b558408083f), EConversationDebugInfo::Done);
                DB(int64(0x7ec56dc721168d17), Fortuno != nullptr && Fortuno.IsAngryTowards(Hero));
                
                if (Fortuno != nullptr && Fortuno.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168d1b), EConversationDebugInfo::Executing);
                    // See, I know you're in trouble. If they catch us, I'll be ...
                    Fortuno.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_121234_1091"));
                    DC(int64(0x7ec56dc721168d1b), EConversationDebugInfo::Done);
                    DC(int64(0x81b634f231631f3b), EConversationDebugInfo::Executing);
                    // So I'm gonna have to add a small hazard fee.
                    Fortuno.AI.Say(LocText("TEXT_WIP_CVNQHYB_20250211_152926"));
                    DC(int64(0x81b634f231631f3b), EConversationDebugInfo::Done);
                    DC(int64(0x1e824b5584080841), EConversationDebugInfo::Executing);
                    Fortuno.AI.StartTradingWith(Hero);
                    DC(int64(0x1e824b5584080841), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fortuno_buyjoints_exit_1");
                }
                else
                {
                    DC(int64(0x7ec56dc721168d24), EConversationDebugInfo::Executing);
                    // You buying or selling?
                    Fortuno.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_121250_1723"));
                    DC(int64(0x7ec56dc721168d24), EConversationDebugInfo::Done);
                    DC(int64(0x1e824b5584080841), EConversationDebugInfo::Executing);
                    Fortuno.AI.StartTradingWith(Hero);
                    DC(int64(0x1e824b5584080841), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fortuno_buyjoints_exit_2");
                }
            }
        }
        
        
        class UChoiceFortunoDailyration : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x1e824b5584080835);
            default Caption = LocText("DIA_FORTUNO_DAILYRATION_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceFortunoGetgeschenk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e824b5584080836), EConversationDebugInfo::Executing);
                // I'm here for my daily ration.
                Hero.AI.Say(LocText("DIA_FORTUNO_DAILYRATION_15_00"));
                DC(int64(0x1e824b5584080836), EConversationDebugInfo::Done);
                DB(int64(0x1e824b5584080838), G1R.Fortuno_RationDay.IsValid() && !G1R.Fortuno_RationDay.IsToday());
                
                if (G1R.Fortuno_RationDay.IsValid() && !G1R.Fortuno_RationDay.IsToday())
                {
                    DC(int64(0x1e824b5584080839), EConversationDebugInfo::Executing);
                    // Here you go - three black sages. Don't smoke them all at ...
                    Fortuno.AI.Say(LocText("DIA_FORTUNO_DAILYRATION_05_01"));
                    DC(int64(0x1e824b5584080839), EConversationDebugInfo::Done);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                    Fortuno.AddItemToInventory(UItMi_Joint_02, 3);
                    DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                    DC(int64(0x1e824b558408083b), EConversationDebugInfo::Executing);
                    Fortuno.AI.GiveItemTo(Hero, UItMi_Joint_02, 3);
                    DC(int64(0x1e824b558408083b), EConversationDebugInfo::Done);
                    DC(int64(0x1e824b558408083c), EConversationDebugInfo::Executing);
                    G1R.Fortuno_RationDay = FInGameTime::Now();
                    DC(int64(0x1e824b558408083c), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fortuno_dailyration_exit_1");
                }
                else
                {
                    DC(int64(0x1e824b558408083d), EConversationDebugInfo::Executing);
                    // Nice try, friend. You've already had it. If you want ...
                    Fortuno.AI.Say(LocText("DIA_FORTUNO_DAILYRATION_05_02"));
                    DC(int64(0x1e824b558408083d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_fortuno_dailyration_exit_2");
                }
            }
        }
        
        
        class UChoiceFortunoExit : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x1e824b5584080827);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e824b5584080828), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1e824b5584080828), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceFortunoGetgeschenk : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x1e824b558408082c);
            default Caption = LocText("DIA_FORTUNO_GETGESCHENK_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceFortunoGetgeschenk);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e824b558408082e), EConversationDebugInfo::Executing);
                // What kind of gift do you have?
                Hero.AI.Say(LocText("DIA_FORTUNO_GETGESCHENK_15_00"));
                DC(int64(0x1e824b558408082e), EConversationDebugInfo::Done);
                DC(int64(0x1e824b558408082f), EConversationDebugInfo::Executing);
                
                // Three rolls of fresh swampweed. It's black sage ... good ...
                Fortuno.AI.Say(LocText("DIA_FORTUNO_GETGESCHENK_05_01"));
                DC(int64(0x1e824b558408082f), EConversationDebugInfo::Done);
                DC(int64(0x1e824b5584080830), EConversationDebugInfo::Executing);
                // You get a ration of three every day - if you want more, ...
                Fortuno.AI.Say(LocText("DIA_FORTUNO_GETGESCHENK_05_02"));
                DC(int64(0x1e824b5584080830), EConversationDebugInfo::Done);
                DC(int64(0x1e824b5584080831), EConversationDebugInfo::Executing);
                // Oh, and should you find some other herbs or berries ...
                Fortuno.AI.Say(LocText("DIA_FORTUNO_GETGESCHENK_05_03"));
                DC(int64(0x1e824b5584080831), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_FORTUNO, Document::UDocumentSegment_Glossary_SC_NOV_FORTUNO_DailyRation_Trader);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                Fortuno.AddItemToInventory(UItMi_Joint_02, 3);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x1e824b5584080833), EConversationDebugInfo::Executing);
                Fortuno.AI.GiveItemTo(Hero, UItMi_Joint_02, 3);
                DC(int64(0x1e824b5584080833), EConversationDebugInfo::Done);
                DC(int64(0x1e824b5584080834), EConversationDebugInfo::Executing);
                G1R.Fortuno_RationDay = FInGameTime::Now();
                DC(int64(0x1e824b5584080834), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceFortunoGreet : UTopic_Hero__SC_NOV_FORTUNO_1357
        {
            default DebugId = int64(0x1e824b5584080829);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceFortunoGreet);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x1e824b558408082a), Fortuno != nullptr && Fortuno.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f));
                }
                
                return Fortuno != nullptr && Fortuno.IsCloseToCharacter(Hero, G1R.ZivilAnquatschDist * 100.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e824b558408082b), EConversationDebugInfo::Executing);
                // Hey! You're new, aren't you? Come over, I have a welcome ...
                Fortuno.AI.Say(LocText("DIA_FORTUNO_GREET_05_00"));
                DC(int64(0x1e824b558408082b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_FORTUNO, Document::UDocumentSegment_Glossary_SC_NOV_FORTUNO_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */