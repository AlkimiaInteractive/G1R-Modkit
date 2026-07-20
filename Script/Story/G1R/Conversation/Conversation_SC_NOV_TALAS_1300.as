#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_TALAS_1300 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_TALAS_1300";
        }
        
        
        class UTopic_Hero__SC_NOV_TALAS_1300 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_TALAS_1300";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetTalas() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNov1300TalasBack : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x7de0013fdc5ea757);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNov1300TalasBridge);
            default Rules.HideIfKnows(UChoiceNov1300TalasBack);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7de0013fdc5ea758), Hero != nullptr && Hero.HasItem(UItWr_Book_Focus, 1, 0));
                    DB(int64(0x7de0013fdc5ea759), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Book_Focus, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea75a), EConversationDebugInfo::Executing);
                // You found it, didn't you? 
                Talas.AI.Say(LocText("NOV_1300_TALAS_BACK_INFO_02_01"));
                DC(int64(0x7de0013fdc5ea75a), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e15b), EConversationDebugInfo::Executing);
                
                // Yes.
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142018"));
                DC(int64(0xbd3986b5b236e15b), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e15c), EConversationDebugInfo::Executing);
                
                // Blimey, I knew you could do it! Oh, the bloodflies came ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142020"));
                DC(int64(0xbd3986b5b236e15c), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e15d), EConversationDebugInfo::Executing);
                // I fought them all back, but, woah, 'twas a close call. ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_142137"));
                DC(int64(0xbd3986b5b236e15d), EConversationDebugInfo::Done);
                DC(int64(0xab325dc2441f6527), EConversationDebugInfo::Executing);
                // Anyway. Back to the camp!
                Talas.AI.Say(LocText("TEXT_WIP_FTYFCYK_20240412_021138"));
                DC(int64(0xab325dc2441f6527), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Camp);
                DC(int64(0x7de0013fdc5ea75b), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Returntocamp);
                DC(int64(0x7de0013fdc5ea75b), EConversationDebugInfo::Done);
                DC(int64(0xc01092bc7b0e9a11), EConversationDebugInfo::Executing);
                Talas.JoinPartyOf(Hero);
                DC(int64(0xc01092bc7b0e9a11), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea75c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7de0013fdc5ea75c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNov1300TalasBridge : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x7de0013fdc5ea751);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Talas_88151);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Talas_881512);
            default Rules.HideIfKnows(UChoiceNov1300TalasBridge);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OW_29_TALAS", 500.0f, int64(0x7de0013fdc5ea751));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7de0013fdc5ea753), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea754), EConversationDebugInfo::Executing);
                // There - that's the bridge. I think there's a cave ...
                Talas.AI.Say(LocText("NOV_1300_TALAS_BRIDGE_INFO_02_01"));
                DC(int64(0x7de0013fdc5ea754), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e15a), EConversationDebugInfo::Executing);
                // So, um ... how about you go in and deal with the ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_141546"));
                DC(int64(0xbd3986b5b236e15a), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea755), EConversationDebugInfo::Executing);
                
                // What does that even mean? 
                Hero.AI.Say(LocText("NOV_1300_TALAS_BRIDGE_INFO_15_02"));
                DC(int64(0x7de0013fdc5ea755), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea756), EConversationDebugInfo::Executing);
                
                // Ey, there's bloodflies and lurkers round here! You don't ...
                Talas.AI.Say(LocText("NOV_1300_TALAS_BRIDGE_INFO_02_03"));
                DC(int64(0x7de0013fdc5ea756), EConversationDebugInfo::Done);
                DC(int64(0xab325dc2441f6525), EConversationDebugInfo::Executing);
                
                // (sighs) I'll handle it. 
                Hero.AI.Say(LocText("TEXT_WIP_FTYFCYK_20240412_021037"));
                DC(int64(0xab325dc2441f6525), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_Coward);
                DC(int64(0xc01092bc7b0e9a0f), EConversationDebugInfo::Executing);
                Talas.LeavePartyOf(Hero);
                DC(int64(0xc01092bc7b0e9a0f), EConversationDebugInfo::Done);
                DC(int64(0xf8589f7c6a3d51a4), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_StayGobbo);
                DC(int64(0xf8589f7c6a3d51a4), EConversationDebugInfo::Done);
                DC(int64(0xf8589f7c6a3d51a2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf8589f7c6a3d51a2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNov1300TalasExit : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x7de0013fdc5ea732);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea733), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7de0013fdc5ea733), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNov1300TalasReturned : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x7de0013fdc5ea75d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceNov1300TalasBack);
            default Rules.HideIfKnows(UChoiceNov1300TalasReturned);
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_SC_START_SWAMPCAMP", 300.0f, int64(0x7de0013fdc5ea75d));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7de0013fdc5ea75e), Hero != nullptr && Hero.HasItem(UItWr_Book_Focus, 1, 0));
                    DB(int64(0x7de0013fdc5ea760), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Book_Focus, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea761), EConversationDebugInfo::Executing);
                // Here we are. So, it's probably best you turn in the tome ...
                Talas.AI.Say(LocText("INFO_TALAS_RETURNED_02_01"));
                DC(int64(0x7de0013fdc5ea761), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea763), EConversationDebugInfo::Executing);
                // Thanks again, mate. You saved me arse here. 
                Talas.AI.Say(LocText("INFO_TALAS_RETURNED_02_03"));
                DC(int64(0x7de0013fdc5ea763), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_Back);
                DC(int64(0x7de0013fdc5ea764), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Backincamp);
                DC(int64(0x7de0013fdc5ea764), EConversationDebugInfo::Done);
                DC(int64(0xc01092bc7b0e9a13), EConversationDebugInfo::Executing);
                Talas.LeavePartyOf(Hero);
                DC(int64(0xc01092bc7b0e9a13), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea765), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7de0013fdc5ea765), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNov1300TalasUr : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x7de0013fdc5ea734);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceNov1300TalasUr);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf26f9319cd1c94bf), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea737), EConversationDebugInfo::Executing);
                // Oy! Wait up. 
                Talas.AI.Say(LocText("NOV_1300_TALAS_UR_INFO_02_02"));
                DC(int64(0x7de0013fdc5ea737), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_TalasRequest);
                DB(int64(0xbd3986b5b236e0df), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xbd3986b5b236e0e6), EConversationDebugInfo::Executing);
                    // I know you, you're that new novice. Are ... are you ...
                    Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_124352"));
                    DC(int64(0xbd3986b5b236e0e6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xbd3986b5b236e0e3), EConversationDebugInfo::Executing);
                    // I know you, you're that freshie, right? Are you ... are ...
                    Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_124250_2083"));
                    DC(int64(0xbd3986b5b236e0e3), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UChoiceNov1300TalasHelpOk,
                    UChoiceNov1300TalasHelpBring
                );
                DC(int64(0xbd3986b5b236e0f3), EConversationDebugInfo::Executing);
                // Seriously, I can't mess this up, not now after they've ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_125855_1924"));
                DC(int64(0xbd3986b5b236e0f3), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e118), EConversationDebugInfo::Executing);
                // Ah, for fuck's sake, why's this gotta be so complicated? 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_132026"));
                DC(int64(0xbd3986b5b236e118), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Talas_94087,
                    UTopic_Talas_94107,
                    UTopic_Talas_95701,
                    UTopic_Talas_95824,
                    UTopic_Talas_95756
                );
                DC(int64(0xbd3986b5b236e131), EConversationDebugInfo::Executing);
                // Just try and get the book, and tell Y'Berion I helped ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_134350"));
                DC(int64(0xbd3986b5b236e131), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e133), EConversationDebugInfo::Executing);
                // That's all. I just don't want Baal Orun to send me back ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_134839"));
                DC(int64(0xbd3986b5b236e133), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Talas_96908,
                    UTopic_Talas_96928,
                    UTopic_Talas_90956
                );
            }
        }
        
        
        class UChoiceNov1300TalasHelpOk : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe8603e87342bfa6e);
            default Caption = LocText("NOV_1300_TALAS_HELP_OK_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea73f), EConversationDebugInfo::Executing);
                // None of your business. 
                Hero.AI.Say(LocText("NOV_1300_TALAS_HELP_OK_15_01"));
                DC(int64(0x7de0013fdc5ea73f), EConversationDebugInfo::Done);
                DC(int64(0xab325dc2441f651b), EConversationDebugInfo::Executing);
                
                // What? Come on, man, I'm in a tight spot here. 
                Talas.AI.Say(LocText("TEXT_WIP_FTYFCYK_20240412_012554"));
                DC(int64(0xab325dc2441f651b), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e0f4), EConversationDebugInfo::Executing);
                // The gurus sent me to get a book for Y'Berion, but that ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_130108"));
                DC(int64(0xbd3986b5b236e0f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNov1300TalasHelpBring : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe8603e87342bfa72);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_021708");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f8ff), EConversationDebugInfo::Executing);
                
                // You must be Talas. Y'Berion sent me to fetch that focus ...
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_021708"));
                DC(int64(0x2144d13931a3f8ff), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f921), EConversationDebugInfo::Executing);
                
                // What? He's sending YOU now?
                Talas.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_030501"));
                DC(int64(0x2144d13931a3f921), EConversationDebugInfo::Done);
                DB(int64(0xbd3986b5b236e0f8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xbd3986b5b236e0fa), EConversationDebugInfo::Executing);
                    // Aw, bollocks ... 
                    Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_130735_3436"));
                    DC(int64(0xbd3986b5b236e0fa), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xbd3986b5b236e0fc), EConversationDebugInfo::Executing);
                    // But you ain't even one of us!
                    Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_130744_3286"));
                    DC(int64(0xbd3986b5b236e0fc), EConversationDebugInfo::Done);
                    DC(int64(0xbd3986b5b236e0fd), EConversationDebugInfo::Executing);
                    
                    // Long story. 
                    Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_130921"));
                    DC(int64(0xbd3986b5b236e0fd), EConversationDebugInfo::Done);
                    DC(int64(0xbd3986b5b236e0fe), EConversationDebugInfo::Executing);
                    
                    // Oh, bollocks ... 
                    Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_130948"));
                    DC(int64(0xbd3986b5b236e0fe), EConversationDebugInfo::Done);
                }
                DC(int64(0xbd3986b5b236e100), EConversationDebugInfo::Executing);
                // Look, I was gonna get that book, I swear, but that ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131003_686"));
                DC(int64(0xbd3986b5b236e100), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e101), EConversationDebugInfo::Executing);
                // Even though I showed him Y'Berion's amulet.
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131106"));
                DC(int64(0xbd3986b5b236e101), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_94087 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e10b);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_131222_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_94087);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e10c), EConversationDebugInfo::Executing);
                
                // Why won't he let you in? 
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131222_2386"));
                DC(int64(0xbd3986b5b236e10c), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e113), EConversationDebugInfo::Executing);
                
                // What? ... I dunno.
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131233"));
                DC(int64(0xbd3986b5b236e113), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e114), EConversationDebugInfo::Executing);
                
                // ... 
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131246"));
                DC(int64(0xbd3986b5b236e114), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e115), EConversationDebugInfo::Executing);
                
                // All right, all right, it's 'cause he and I go back and ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131252"));
                DC(int64(0xbd3986b5b236e115), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e116), EConversationDebugInfo::Executing);
                // But that was ages ago. The bloke's gotta learn a lesson ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131423"));
                DC(int64(0xbd3986b5b236e116), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e10e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbd3986b5b236e10e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_94107 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e10f);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_131222_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_94107);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e110), EConversationDebugInfo::Executing);
                // Y'Berion said he sent you days ago. What were you doing ...
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131222_1609"));
                DC(int64(0xbd3986b5b236e110), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e117), EConversationDebugInfo::Executing);
                
                // You're really gonna make me say it, are you?
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_131903"));
                DC(int64(0xbd3986b5b236e117), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e11b), EConversationDebugInfo::Executing);
                // I fucked up, okay? I fucked up, and I didn't wanna go ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_132523"));
                DC(int64(0xbd3986b5b236e11b), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e11c), EConversationDebugInfo::Executing);
                // Then I smoked another one ... and another one ... yeah. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_132554"));
                DC(int64(0xbd3986b5b236e11c), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e112), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xbd3986b5b236e112), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_95701 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e11d);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_132708_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_95701);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbd3986b5b236e122), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_021708")));
                }
                
                return Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_021708"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e11e), EConversationDebugInfo::Executing);
                // What do you want me to do?
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_132708_3569"));
                DC(int64(0xbd3986b5b236e11e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_95824 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e127);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_133300_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_95824);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xbd3986b5b236e12c), Hero != nullptr && Hero.HasSaid(LocText("NOV_1300_TALAS_HELP_OK_15_01")));
                }
                
                return Hero != nullptr && Hero.HasSaid(LocText("NOV_1300_TALAS_HELP_OK_15_01"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e128), EConversationDebugInfo::Executing);
                // Actually, Y'Berion sent me. He wants me to get that book ...
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133300_443"));
                DC(int64(0xbd3986b5b236e128), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e12d), EConversationDebugInfo::Executing);
                
                // What? You've got to be kidding. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133531"));
                DC(int64(0xbd3986b5b236e12d), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e12e), EConversationDebugInfo::Executing);
                // All right, but that doesn't mean you can't help me out. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133613"));
                DC(int64(0xbd3986b5b236e12e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_95756 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e123);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_133242_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_95756);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e124), EConversationDebugInfo::Executing);
                
                // I can't help you. 
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133242_2801"));
                DC(int64(0xbd3986b5b236e124), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e12f), EConversationDebugInfo::Executing);
                
                // But - godsdammit, you bastards are all the same!
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133638"));
                DC(int64(0xbd3986b5b236e12f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Ignore);
                DC(int64(0xbd3986b5b236e130), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbd3986b5b236e130), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_96908 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e13f);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_135029_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_96908);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e140), EConversationDebugInfo::Executing);
                // All right. I'll take care of it.
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_135029_731"));
                DC(int64(0xbd3986b5b236e140), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e147), EConversationDebugInfo::Executing);
                
                // You're serious? Thank you, mate! You're a lifesaver. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_135038"));
                DC(int64(0xbd3986b5b236e147), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e148), EConversationDebugInfo::Executing);
                // I'm gonna wait out here, and, um ... "assess the ...
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_135047"));
                DC(int64(0xbd3986b5b236e148), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Help);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_AcceptHelpFree);
                DC(int64(0xbd3986b5b236e14a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbd3986b5b236e14a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_96928 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xbd3986b5b236e143);
            default Caption = LocText("TEXT_WIP_HVXAWSC_20240417_135029_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_96928);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xbd3986b5b236e144), EConversationDebugInfo::Executing);
                // I can't help you. 
                Hero.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_135029_3719"));
                DC(int64(0xbd3986b5b236e144), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e149), EConversationDebugInfo::Executing);
                
                // But - godsdammit, you bastards are all the same!
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_133638"));
                DC(int64(0xbd3986b5b236e149), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Ignore);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_RejectHelp);
                DC(int64(0xbd3986b5b236e14b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xbd3986b5b236e14b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_90956 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x5590ba10a8bff500);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_035841_3990");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_90956);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f950), EConversationDebugInfo::Executing);
                // Make it worth my time. 
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_035841_3990"));
                DC(int64(0x2144d13931a3f950), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f953), EConversationDebugInfo::Executing);
                
                // (deep sigh) Thirty nuggets will do?
                Talas.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_040019"));
                DC(int64(0x2144d13931a3f953), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Help);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_AcceptHelpPay);
                Subdialog(
                    UTopic_Talas_942102,
                    UTopic_Talas_942302
                );
                DC(int64(0x5590ba10a8bff507), EConversationDebugInfo::Executing);
                // You come tell me when you've got the book, all right? 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_162333_2083"));
                DC(int64(0x5590ba10a8bff507), EConversationDebugInfo::Done);
                DC(int64(0x5590ba10a8bff508), EConversationDebugInfo::Executing);
                // I'll be out here, and ... um ... "assess the situation."
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_162350"));
                DC(int64(0x5590ba10a8bff508), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e7b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3bda590fcab1e7b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_942102 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f963);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_040605_531");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_942102);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f964), EConversationDebugInfo::Executing);
                // Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_040605_531"));
                DC(int64(0x2144d13931a3f964), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e159), EConversationDebugInfo::Executing);
                
                // Bloody crook ... 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_141253"));
                DC(int64(0xbd3986b5b236e159), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Talas.AddItemToInventory(UItMi_Orenugget, 30);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea745), EConversationDebugInfo::Executing);
                Talas.AI.GiveItemTo(Hero, UItMi_Orenugget, 30);
                DC(int64(0x7de0013fdc5ea745), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Talas_942302 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f967);
            default Caption = LocText("NOV_1300_TALAS_HELP_MORE_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_942302);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea747), EConversationDebugInfo::Executing);
                // Fifty. 
                Hero.AI.Say(LocText("NOV_1300_TALAS_HELP_MORE_15_01"));
                DC(int64(0x7de0013fdc5ea747), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea748), EConversationDebugInfo::Executing);
                
                // Bloody crook ... all right, fine. Here. 
                Talas.AI.Say(LocText("NOV_1300_TALAS_HELP_MORE_02_02"));
                DC(int64(0x7de0013fdc5ea748), EConversationDebugInfo::Done);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Executing);
                Talas.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0x3399d06059b5acc7), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea74a), EConversationDebugInfo::Executing);
                Talas.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x7de0013fdc5ea74a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTalas106537 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x81e251a536e5912a);
            default Caption = LocText("TEXT_WIP_CNPPQAN_20241024_103122");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTalas106537);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("GUR_1202_CORANGAR_WHERE_INFO_08_02"), int64(0x81e251a536e5912a));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81e251a536e59134), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81e251a536e59128), EConversationDebugInfo::Executing);
                // Cor Angar sent me. He said you could show me the way to ...
                Hero.AI.Say(LocText("TEXT_WIP_CNPPQAN_20241024_103122"));
                DC(int64(0x81e251a536e59128), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59129), EConversationDebugInfo::Executing);
                
                // The orc graveyard? What by Beliar's foul breath would ...
                Talas.AI.Say(LocText("TEXT_WIP_CNPPQAN_20241024_103122_41"));
                DC(int64(0x81e251a536e59129), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5b0), EConversationDebugInfo::Executing);
                
                // To find Baal Lukor.
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154041"));
                DC(int64(0x5dcd7126285f5b0), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e5912d), EConversationDebugInfo::Executing);
                
                // Oh, well, that sounds ominous. Okay, I'll lead the way.
                Talas.AI.Say(LocText("TEXT_WIP_CNPPQAN_20241024_103452"));
                DC(int64(0x81e251a536e5912d), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59136), EConversationDebugInfo::Executing);
                Talas.JoinPartyOf(Hero);
                DC(int64(0x81e251a536e59136), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e5913f), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_GuideOrcCemetery);
                DC(int64(0x81e251a536e5913f), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59137), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x81e251a536e59137), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTalas106558 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x81e251a536e59130);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTalas106558);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"WP_OG_TALAS_BRIDGE", 1000.0f, int64(0x81e251a536e59130));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x81e251a536e5913d), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x81e251a536e5912f), EConversationDebugInfo::Executing);
                // Okay, the graveyard's just past that bridge. 
                Talas.AI.Say(LocText("TEXT_WIP_CNPPQAN_20241024_103506_2238"));
                DC(int64(0x81e251a536e5912f), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5b1), EConversationDebugInfo::Executing);
                
                // Let me guess: you're not following? 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154141"));
                DC(int64(0x5dcd7126285f5b1), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5b2), EConversationDebugInfo::Executing);
                
                // What? No, of course not. Do I look like a lunatic?
                Talas.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154148"));
                DC(int64(0x5dcd7126285f5b2), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59138), EConversationDebugInfo::Executing);
                // No offense. 
                Talas.AI.Say(LocText("TEXT_WIP_CNPPQAN_20241024_103638"));
                DC(int64(0x81e251a536e59138), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5b3), EConversationDebugInfo::Executing);
                
                // None taken. Get back to camp, I'll handle this. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_154229"));
                DC(int64(0x5dcd7126285f5b3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_OrcGraveyard);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ORCGRAVEYARD, Document::UDocumentSegment_CH3_ORCGRAVEYARD_TalasCoward);
                DC(int64(0x81e251a536e5913b), EConversationDebugInfo::Executing);
                Talas.LeavePartyOf(Hero);
                DC(int64(0x81e251a536e5913b), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59141), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Backincamp);
                DC(int64(0x81e251a536e59141), EConversationDebugInfo::Done);
                DC(int64(0x6b57aa941eb3b1cb), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD_ORCGRAVEYARD_OBJ_TALAS.SucceedQuest();
                DC(int64(0x6b57aa941eb3b1cb), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a1eb), EConversationDebugInfo::Executing);
                Talas.RemoveImmortality();
                DC(int64(0x7858bf075764a1eb), EConversationDebugInfo::Done);
                DC(int64(0x81e251a536e59142), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x81e251a536e59142), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTalas111558 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe6a87e4844750395);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTalas111558);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe5940119ee283643), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.HasSucceeded());
                    DB(int64(0xe5940119ee283644), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x81e251a536e5912c), G1R != nullptr && G1R.IsInChapter(2));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe6a87e4844750394), EConversationDebugInfo::Executing);
                // Oh, hello. Thanks again for helpin' me out back there. ...
                Talas.AI.Say(LocText("TEXT_WIP_FGXCIAC_20240909_185946_3286"));
                DC(int64(0xe6a87e4844750394), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTalas156731 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x14e8115e07a95c82);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTalas156731);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Talas, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Talas, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95c81), EConversationDebugInfo::Executing);
                // Oh, you. Right proper fuck-up we got ourselves in, ...
                Talas.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_153941_41"));
                DC(int64(0x14e8115e07a95c81), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTalas156751 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x14e8115e07a95c8f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceTalas156751);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Talas, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Talas, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95c8e), EConversationDebugInfo::Executing);
                // Think it's time to get out of here ...
                Talas.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_154056_2238"));
                DC(int64(0x14e8115e07a95c8e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTalas93601 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f93f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceTalas93601);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_HVXAWSC_20240417_133638"), int64(0x2144d13931a3f93f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xe5940119ee283647), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x129327624d052831), Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE != nullptr && !Quest::SwampCamp_SCCHAPTER2_BOOK_BOOK_OBJ_CAVE.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f93e), EConversationDebugInfo::Executing);
                // Comin' to gloat? Just leave me alone.
                Talas.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_034415_3615"));
                DC(int64(0x2144d13931a3f93e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Talas_93672,
                    UTopic_Talas_93692
                );
            }
        }
        
        
        class UTopic_Talas_93672 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f942);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_034551");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_93672);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_93692 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f946);
            default Caption = LocText("TEXT_WIP_KTYFCYK_20240415_034551_3068");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_93692);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x2144d13931a3f947), EConversationDebugInfo::Executing);
                // I had a chat with the mages. They don't have the book ...
                Hero.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_034551_3068"));
                DC(int64(0x2144d13931a3f947), EConversationDebugInfo::Done);
                DC(int64(0x2144d13931a3f96d), EConversationDebugInfo::Executing);
                
                // What?
                Talas.AI.Say(LocText("TEXT_WIP_KTYFCYK_20240415_040830"));
                DC(int64(0x2144d13931a3f96d), EConversationDebugInfo::Done);
                DC(int64(0xab325dc2441f6524), EConversationDebugInfo::Executing);
                
                // One of the mages lost it. Some goblins took it, near the ...
                Hero.AI.Say(LocText("TEXT_WIP_FTYFCYK_20240412_015705"));
                DC(int64(0xab325dc2441f6524), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e82), EConversationDebugInfo::Executing);
                
                // Are you serious? I know where that is! How about I show ...
                Talas.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165025"));
                DC(int64(0xe3bda590fcab1e82), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Talas_88151,
                    UTopic_Talas_88171
                );
            }
        }
        
        
        class UTopic_Talas_88151 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe3bda590fcab1e86);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_165519_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_88151);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e87), EConversationDebugInfo::Executing);
                // Lead the way. 
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165519_1609"));
                DC(int64(0xe3bda590fcab1e87), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_AcceptGuide);
                DC(int64(0x7de0013fdc5ea74f), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_GuideGobbocave);
                DC(int64(0x7de0013fdc5ea74f), EConversationDebugInfo::Done);
                DC(int64(0xc01092bc7b0e9a0d), EConversationDebugInfo::Executing);
                Talas.JoinPartyOf(Hero);
                DC(int64(0xc01092bc7b0e9a0d), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea750), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7de0013fdc5ea750), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_88171 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe3bda590fcab1e8a);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_165519_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_88171);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e8b), EConversationDebugInfo::Executing);
                // I'll be fine.
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165519_2801"));
                DC(int64(0xe3bda590fcab1e8b), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e8e), EConversationDebugInfo::Executing);
                
                // You sure? All right, you do you. But don't forget our ...
                Talas.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165648"));
                DC(int64(0xe3bda590fcab1e8e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Camp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_RejectGuide);
                DC(int64(0xe3bda590fcab1e90), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Start);
                DC(int64(0xe3bda590fcab1e90), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTalas93781 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0x2144d13931a3f94d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceTalas93781);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7de0013fdc5ea74c), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                    DB(int64(0xe01c98df54d4c75d), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_004729_443")));
                    DB(int64(0xe5940119ee283648), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_HVXAWSC_20240417_135029_731")));
                    DB(int64(0xe5940119ee28364a), Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning());
                    DB(int64(0xe5940119ee28364b), Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_004729_443")));
                    DB(int64(0xe5940119ee28364c), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_HVXAWSC_20240417_162333_2083")));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning() && Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_004729_443")) && Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_HVXAWSC_20240417_135029_731")))
                    return true;
                
                if (Quest::SwampCamp_SCCHAPTER2_BOOK != nullptr && Quest::SwampCamp_SCCHAPTER2_BOOK.IsRunning() && Hero != nullptr && Hero.HasSaid(LocText("TEXT_WIP_KTYFCYK_20240415_004729_443")) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_HVXAWSC_20240417_162333_2083")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7de0013fdc5ea74e), EConversationDebugInfo::Executing);
                // So? You got the book?
                Talas.AI.Say(LocText("NOV_1300_TALAS_READY_INFO_02_02"));
                DC(int64(0x7de0013fdc5ea74e), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e80), EConversationDebugInfo::Executing);
                
                // One of the mages lost it. Some goblins took it, near the ...
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_164847"));
                DC(int64(0xe3bda590fcab1e80), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e82), EConversationDebugInfo::Executing);
                
                // Are you serious? I know where that is! How about I show ...
                Talas.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165025"));
                DC(int64(0xe3bda590fcab1e82), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Talas_881512,
                    UTopic_Talas_881712
                );
            }
        }
        
        
        class UTopic_Talas_881512 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe3bda590fcab1e86);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_165519_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_881512);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e87), EConversationDebugInfo::Executing);
                // Lead the way. 
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165519_1609"));
                DC(int64(0xe3bda590fcab1e87), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e156), EConversationDebugInfo::Executing);
                
                // Grand! Come on, it ain't far. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_140642"));
                DC(int64(0xbd3986b5b236e156), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_AcceptGuide);
                DC(int64(0x7de0013fdc5ea74f), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_GuideGobbocave);
                DC(int64(0x7de0013fdc5ea74f), EConversationDebugInfo::Done);
                DC(int64(0xc01092bc7b0e9a0d), EConversationDebugInfo::Executing);
                Talas.JoinPartyOf(Hero);
                DC(int64(0xc01092bc7b0e9a0d), EConversationDebugInfo::Done);
                DC(int64(0x7de0013fdc5ea750), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7de0013fdc5ea750), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Talas_881712 : UTopic_Hero__SC_NOV_TALAS_1300
        {
            default DebugId = int64(0xe3bda590fcab1e8a);
            default Caption = LocText("TEXT_WIP_NYPYEZL_20240325_165519_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Talas_881712);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe3bda590fcab1e8b), EConversationDebugInfo::Executing);
                // I'll be fine.
                Hero.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165519_2801"));
                DC(int64(0xe3bda590fcab1e8b), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e8e), EConversationDebugInfo::Executing);
                
                // You sure? All right, you do you. But don't forget our ...
                Talas.AI.Say(LocText("TEXT_WIP_NYPYEZL_20240325_165648"));
                DC(int64(0xe3bda590fcab1e8e), EConversationDebugInfo::Done);
                DC(int64(0xbd3986b5b236e157), EConversationDebugInfo::Executing);
                // You said you'd cover for me. 
                Talas.AI.Say(LocText("TEXT_WIP_HVXAWSC_20240417_140750"));
                DC(int64(0xbd3986b5b236e157), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_TALAS, Document::UDocumentSegment_Glossary_SC_NOV_TALAS_Camp);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BOOK, Document::UDocumentSegment_CH2_BOOK_RejectGuide);
                DC(int64(0xe3bda590fcab1e90), EConversationDebugInfo::Executing);
                Talas.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Talas_1300_Start);
                DC(int64(0xe3bda590fcab1e90), EConversationDebugInfo::Done);
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe3bda590fcab1e91), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */