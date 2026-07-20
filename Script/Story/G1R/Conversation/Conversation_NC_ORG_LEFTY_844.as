#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_LEFTY_844 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_LEFTY_844";
        }
        
        
        class UTopic_Hero__NC_ORG_LEFTY_844 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_LEFTY_844";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLefty() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceLeftyExit : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e212b5);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212b6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e212b6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyFirst : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e212be);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLeftyFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa676b4b172e212bf), GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(19, 0)));
                    DB(int64(0xa676b4b172e212c0), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                    DB(int64(0xa676b4b172e212c1), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted());
                }
                
                if (!GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(19, 0)))
                    return false;
                
                if (Lefty != nullptr && Lefty.WasDefeatedBy(Hero))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212c2), EConversationDebugInfo::Executing);
                // Oy, freshie! You got a second? The farmers are thirsty, ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_07_00"));
                DC(int64(0xa676b4b172e212c2), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212c3), EConversationDebugInfo::Executing);
                // FANTASTIC way to make some friends around here. What do ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_07_01"));
                DC(int64(0xa676b4b172e212c3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LEFTY, Document::UDocumentSegment_Glossary_NC_ORG_LEFTY_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_Start);
                DC(int64(0x61a39c21bde6da62), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.StartQuest();
                DC(int64(0x61a39c21bde6da62), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceLeftyFirstYes,
                    UChoiceLeftyFirstNever,
                    UChoiceLeftyFirstLater
                );
            }
        }
        
        
        class UChoiceLeftyFirstYes : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca21);
            default Caption = LocText("DIA_LEFTY_FIRST_YES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212d3), EConversationDebugInfo::Executing);
                // Sure. Happy to help. 
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_YES_15_00"));
                DC(int64(0xa676b4b172e212d3), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212d4), EConversationDebugInfo::Executing);
                
                // Good man! Go find Ulmar - he'll give you the water and ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_YES_07_01"));
                DC(int64(0xa676b4b172e212d4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_AskWater);
                DC(int64(0x61a39c21bde6da59), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6da59), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da5b), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.StartQuest();
                DC(int64(0x61a39c21bde6da5b), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da5d), EConversationDebugInfo::Executing);
                G1R.Peasants_have_water = 0;
                DC(int64(0x61a39c21bde6da5d), EConversationDebugInfo::Done);
                DC(int64(0xbf07cd693d2767c6), EConversationDebugInfo::Executing);
                G1R.Ricelord_AskedForWater = 1;
                DC(int64(0xbf07cd693d2767c6), EConversationDebugInfo::Done);
                DC(int64(0x4c3c0bd4878197e7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4c3c0bd4878197e7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyFirstNever : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca18);
            default Caption = LocText("DIA_LEFTY_FIRST_NEVER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212cb), EConversationDebugInfo::Executing);
                // I'm not your errand boy.
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_NEVER_15_00"));
                DC(int64(0xa676b4b172e212cb), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212cc), EConversationDebugInfo::Executing);
                
                // Well, well, well ... is that any way to speak to a ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_NEVER_07_01"));
                DC(int64(0xa676b4b172e212cc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_TurnedDown);
                DC(int64(0x61a39c21bde6da4e), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6da4e), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da50), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.FailQuest();
                DC(int64(0x61a39c21bde6da50), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da52), EConversationDebugInfo::Executing);
                Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a39c21bde6da52), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e212d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyFirstLater : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca13);
            default Caption = LocText("DIA_LEFTY_FIRST_LATER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceLeftyFirstLater);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212c7), EConversationDebugInfo::Executing);
                // Maybe later.
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_15_00"));
                DC(int64(0xa676b4b172e212c7), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212c8), EConversationDebugInfo::Executing);
                
                // No, the farmers need someone NOW. You're gonna help or ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_07_01"));
                DC(int64(0xa676b4b172e212c8), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212c9), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xa676b4b172e212c9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLeftyFirstatnight : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e212b7);
            default Caption = LocText("DIA_AIDAN_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceLeftyFirst);
            default Rules.HideIfKnows(UChoiceLeftyFirstatnight);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa676b4b172e212b8), GameTime.CurrentClockTime.IsBetween(FClockTime(19, 0), FClockTime(8, 30)));
                }
                
                return GameTime.CurrentClockTime.IsBetween(FClockTime(19, 0), FClockTime(8, 30));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212b9), EConversationDebugInfo::Executing);
                // What's your job?
                Hero.AI.Say(LocText("DIA_AIDAN_HELLO_15_00"));
                DC(int64(0xa676b4b172e212b9), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212ba), EConversationDebugInfo::Executing);
                
                // I work for the Rice Lord.
                Lefty.AI.Say(LocText("DIA_846_HELLO_07_01"));
                DC(int64(0xa676b4b172e212ba), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212bb), EConversationDebugInfo::Executing);
                
                // Can I help you with anything?
                Hero.AI.Say(LocText("DIA_RICELORD_ARBEIT_15_00"));
                DC(int64(0xa676b4b172e212bb), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212bc), EConversationDebugInfo::Executing);
                
                // Hmm ... maybe. But let's talk when the sun's up, okay? I ...
                Lefty.AI.Say(LocText("DIA_SHRIKE_GETLOST_07_01"));
                DC(int64(0xa676b4b172e212bc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_LEFTY, Document::UDocumentSegment_Glossary_NC_ORG_LEFTY_Introduction);
                DC(int64(0xa676b4b172e212bd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e212bd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyNeveragain : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e212fc);
            default Caption = LocText("DIA_LEFTY_NEVERAGAIN_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLeftyFirstYes);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa676b4b172e212fd), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning());
                    DB(int64(0xa676b4b172e212fe), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning())
                    return false;
                
                if (Lefty != nullptr && Lefty.WasDefeatedBy(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212ff), EConversationDebugInfo::Executing);
                // I'm done handing out your water.
                Hero.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_15_00"));
                DC(int64(0xa676b4b172e212ff), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21300), EConversationDebugInfo::Executing);
                
                // Oh? Got something better to do, do we? 
                Lefty.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_07_01"));
                DC(int64(0xa676b4b172e21300), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21301), EConversationDebugInfo::Executing);
                // I think you need a reminder who's boss. 
                Lefty.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_07_02"));
                DC(int64(0xa676b4b172e21301), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da70), EConversationDebugInfo::Executing);
                Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a39c21bde6da70), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21304), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e21304), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyPerm : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e21305);
            default Caption = LocText("DIA_LEFTY_PERM_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7977b3a471c7961f), Lefty != nullptr && Lefty.WasDefeatedBy(Hero));
                    DB(int64(0x7977b3a471c79624), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted());
                }
                
                if (Lefty != nullptr && !Lefty.WasDefeatedBy(Hero))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && !Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e21308), EConversationDebugInfo::Executing);
                // How's it going, my friend?
                Hero.AI.Say(LocText("DIA_LEFTY_PERM_15_00"));
                DC(int64(0xa676b4b172e21308), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21309), EConversationDebugInfo::Executing);
                
                // Oh, fuck's sake! What d'you want?
                Lefty.AI.Say(LocText("DIA_LEFTY_PERM_07_01"));
                DC(int64(0xa676b4b172e21309), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_LeftyDefeated);
                DB(int64(0x646376e2eec9c85a), G1R.Lefty_WasBeaten == 0);
                
                if (G1R.Lefty_WasBeaten == 0)
                {
                    DC(int64(0x61a39c21bde6da8b), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CARRYWATER.SucceedQuest();
                    DC(int64(0x61a39c21bde6da8b), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6da8d), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_NC_CARRYWATER_CONFRONT);
                    DC(int64(0x61a39c21bde6da8d), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6da8f), EConversationDebugInfo::Executing);
                    G1R.Lefty_WasBeaten = 1;
                    DC(int64(0x61a39c21bde6da8f), EConversationDebugInfo::Done);
                    DC(int64(0xa2f911ca66fa9049), EConversationDebugInfo::Executing);
                    G1R.Points_NC += 5;
                    DC(int64(0xa2f911ca66fa9049), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UChoiceLeftyPermNothing,
                    UChoiceLeftyPermDurstig,
                    UChoiceLeftyPermAufsmaul
                );
            }
        }
        
        
        class UChoiceLeftyPermNothing : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca5a);
            default Caption = LocText("DIA_LEFTY_PERM_NOTHING_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e21311), EConversationDebugInfo::Executing);
                // Just checking in on you.
                Hero.AI.Say(LocText("DIA_LEFTY_PERM_NOTHING_15_00"));
                DC(int64(0xa676b4b172e21311), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21312), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e21312), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyPermDurstig : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca5e);
            default Caption = LocText("DIA_LEFTY_PERM_DURSTIG_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e21314), EConversationDebugInfo::Executing);
                // The farmers look a little, uh... parched.
                Hero.AI.Say(LocText("DIA_LEFTY_PERM_DURSTIG_15_00"));
                DC(int64(0xa676b4b172e21314), EConversationDebugInfo::Done);
                DC(int64(0xdb8408dae1cc14b1), EConversationDebugInfo::Executing);
                
                // You fuckin'-
                Lefty.AI.Say(LocText("TEXT_WIP_IETOSNL_20240327_151552"));
                DC(int64(0xdb8408dae1cc14b1), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21315), EConversationDebugInfo::Executing);
                // All right. I'll take care of it. 
                Lefty.AI.Say(LocText("DIA_LEFTY_PERM_DURSTIG_07_01"));
                DC(int64(0xa676b4b172e21315), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e21316), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e21316), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyPermAufsmaul : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xe8603e87342bca63);
            default Caption = LocText("DIA_LEFTY_PERM_AUFSMAUL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e21318), EConversationDebugInfo::Executing);
                // Just wanted to let off some steam. Hold still, will you?
                Hero.AI.Say(LocText("DIA_LEFTY_PERM_AUFSMAUL_15_00"));
                DC(int64(0xa676b4b172e21318), EConversationDebugInfo::Done);
                Print("Skipped Lefty.AI.SayAmbientVoicelineTo(Hero, YOUWANNAFOOLME)");
                DC(int64(0x61a39c21bde6da85), EConversationDebugInfo::Executing);
                Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a39c21bde6da85), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e2131c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e2131c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLeftyWorkday : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xa676b4b172e212d8);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x67d0ddf013e40fcf), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsAtLeastXDaysAgo(1));
                    DB(int64(0x67d0ddf013e40fd0), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                    DB(int64(0x67d0ddf013e40fd1), GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(19, 0)));
                    DB(int64(0x67d0ddf013e40fd2), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning());
                    DB(int64(0x67d0ddf013e40fd3), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                    DB(int64(0x67d0ddf013e40fd4), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning());
                    DB(int64(0x67d0ddf013e40fd5), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsAtLeastXDaysAgo(1));
                    DB(int64(0x67d0ddf013e40fd6), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                    DB(int64(0x67d0ddf013e40fd7), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning());
                    DB(int64(0x67d0ddf013e40fd8), Lefty != nullptr && !Lefty.WasDefeatedBy(Hero));
                    DB(int64(0x67d0ddf013e40fd9), GameTime.CurrentClockTime.IsBetween(FClockTime(8, 30), FClockTime(19, 0)));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsAtLeastXDaysAgo(1) && Lefty != nullptr && !Lefty.WasDefeatedBy(Hero) && GameTime.CurrentClockTime.IsBetween(FClockTime(8, 0), FClockTime(19, 0)))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning() && Lefty != nullptr && !Lefty.WasDefeatedBy(Hero))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning() && G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsAtLeastXDaysAgo(1) && Lefty != nullptr && !Lefty.WasDefeatedBy(Hero))
                    return true;
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning() && Lefty != nullptr && !Lefty.WasDefeatedBy(Hero) && GameTime.CurrentClockTime.IsBetween(FClockTime(8, 30), FClockTime(19, 0)))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa676b4b172e212dc), EConversationDebugInfo::Executing);
                // Oy!
                Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_07_00"));
                DC(int64(0xa676b4b172e212dc), EConversationDebugInfo::Done);
                DB(int64(0xe38ea28ae4804ce6), G1R.Lefty_CarriedWater != 0);
                
                if (G1R.Lefty_CarriedWater != 0)
                {
                    DC(int64(0xe38ea28ae4804ce8), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.RestartQuest();
                    DC(int64(0xe38ea28ae4804ce8), EConversationDebugInfo::Done);
                }
                DB(int64(0xa676b4b172e212de), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasFailed());
                DB(int64(0xa676b4b172e212e6), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.IsRunning());
                DB(int64(0xa676b4b172e212e6), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning());
                DB(int64(0xa676b4b172e212ef), Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning());
                
                if (Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasFailed())
                {
                    DC(int64(0xa676b4b172e212df), EConversationDebugInfo::Executing);
                    // You're a lucky man - I'm givin' you a second chance!
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_NEXTCHANCE_07_00"));
                    DC(int64(0xa676b4b172e212df), EConversationDebugInfo::Done);
                    DC(int64(0xa676b4b172e212e0), EConversationDebugInfo::Executing);
                    // Make sure not to blow it this time. So, go find Ulmar ...
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_NEXTCHANCE_07_01"));
                    DC(int64(0xa676b4b172e212e0), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_LeftyAgain);
                    Subdialog(
                        UTopic_Lefty_216451,
                        UTopic_Lefty_216471,
                        UTopic_Lefty_216497
                    );
                }
                else if ((Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.IsRunning()) || (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.IsRunning()))
                {
                    DC(int64(0xa676b4b172e212e7), EConversationDebugInfo::Executing);
                    // Didn't I tell you to fetch the farmers some water? 
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_STILLRUNNING_07_00"));
                    DC(int64(0xa676b4b172e212e7), EConversationDebugInfo::Done);
                    DC(int64(0xa676b4b172e212e8), EConversationDebugInfo::Executing);
                    // You disappointed me, mate. I hate it when someone goes ...
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_STILLRUNNING_07_01"));
                    DC(int64(0xa676b4b172e212e8), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_LeftyMad);
                    DC(int64(0x61a39c21bde6daa4), EConversationDebugInfo::Executing);
                    G1R.Lefty_WorkDay = FInGameTime::Now();
                    DC(int64(0x61a39c21bde6daa4), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6daa6), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER1_CARRYWATER.FailQuest();
                    DC(int64(0x61a39c21bde6daa6), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6daa8), EConversationDebugInfo::Executing);
                    Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0x61a39c21bde6daa8), EConversationDebugInfo::Done);
                    DC(int64(0xa676b4b172e212ee), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xa676b4b172e212ee), EConversationDebugInfo::Done);
                    return;
                }
                else if (Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.IsRunning())
                {
                    DC(int64(0xa676b4b172e212f0), EConversationDebugInfo::Executing);
                    // Well done! Man, you're a natural. You looked SO happy ...
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_SUCCESS_07_00"));
                    DC(int64(0xa676b4b172e212f0), EConversationDebugInfo::Done);
                    DC(int64(0xa676b4b172e212f1), EConversationDebugInfo::Executing);
                    // Since you seem to be likin' this job so much, why don't ...
                    Lefty.AI.Say(LocText("DIA_LEFTY_WORKDAY_SUCCESS_07_01"));
                    DC(int64(0xa676b4b172e212f1), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CARRYWATER, Document::UDocumentSegment_CH1_CARRYWATER_Restart);
                    Subdialog(
                        UTopic_Lefty_216584,
                        UTopic_Lefty_216604,
                        UTopic_Lefty_216672
                    );
                }
            }
        }
        
        
        class UTopic_Lefty_216451 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b28b);
            default Caption = LocText("DIA_LEFTY_FIRST_YES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b28c), EConversationDebugInfo::Executing);
                // Sure. Happy to help. 
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_YES_15_00"));
                DC(int64(0xc4873e872a48b28c), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b296), EConversationDebugInfo::Executing);
                
                // Good man! Go find Ulmar - he'll give you the water and ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_YES_07_01"));
                DC(int64(0xc4873e872a48b296), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da9a), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6da9a), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da9c), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.RestartQuest();
                DC(int64(0x61a39c21bde6da9c), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da9e), EConversationDebugInfo::Executing);
                G1R.Peasants_have_water = 0;
                DC(int64(0x61a39c21bde6da9e), EConversationDebugInfo::Done);
                DC(int64(0xbf07cd693d2767d1), EConversationDebugInfo::Executing);
                G1R.Ricelord_AskedForWater = 1;
                DC(int64(0xbf07cd693d2767d1), EConversationDebugInfo::Done);
                DC(int64(0xaab0a550d5755104), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.RestartQuest();
                DC(int64(0xaab0a550d5755104), EConversationDebugInfo::Done);
                DC(int64(0xa0718338a690d126), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.RestartQuest();
                DC(int64(0xa0718338a690d126), EConversationDebugInfo::Done);
                DC(int64(0xa676b4b172e212e5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e212e5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lefty_216471 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b28f);
            default Caption = LocText("DIA_LEFTY_FIRST_NEVER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b2a5), EConversationDebugInfo::Executing);
                // I'm not your errand boy.
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_NEVER_15_00"));
                DC(int64(0xc4873e872a48b2a5), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2a6), EConversationDebugInfo::Executing);
                
                // Well, well, well ... is that any way to speak to a ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_NEVER_07_01"));
                DC(int64(0xc4873e872a48b2a6), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da4e), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6da4e), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da50), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.FailQuest();
                DC(int64(0x61a39c21bde6da50), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6da52), EConversationDebugInfo::Executing);
                Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a39c21bde6da52), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2ae), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc4873e872a48b2ae), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lefty_216497 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b297);
            default Caption = LocText("DIA_LEFTY_FIRST_LATER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lefty_216497);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b298), EConversationDebugInfo::Executing);
                // Maybe later.
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_15_00"));
                DC(int64(0xc4873e872a48b298), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2b5), EConversationDebugInfo::Executing);
                
                // No, the farmers need someone NOW. You're gonna help or ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_07_01"));
                DC(int64(0xc4873e872a48b2b5), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b29a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc4873e872a48b29a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lefty_216584 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b2bb);
            default Caption = LocText("DIA_LEFTY_FIRST_YES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b2bc), EConversationDebugInfo::Executing);
                // Sure. Happy to help. 
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_YES_15_00"));
                DC(int64(0xc4873e872a48b2bc), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2c3), EConversationDebugInfo::Executing);
                
                // Good man! Go find Ulmar - he'll give you the water and ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_YES_07_01"));
                DC(int64(0xc4873e872a48b2c3), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6dab6), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6dab6), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6daba), EConversationDebugInfo::Executing);
                G1R.Peasants_have_water = 0;
                DC(int64(0x61a39c21bde6daba), EConversationDebugInfo::Done);
                DC(int64(0xbf07cd693d2767d3), EConversationDebugInfo::Executing);
                G1R.Ricelord_AskedForWater = 1;
                DC(int64(0xbf07cd693d2767d3), EConversationDebugInfo::Done);
                DC(int64(0xbf07cd693d2767de), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_LEFTY.SucceedQuest();
                DC(int64(0xbf07cd693d2767de), EConversationDebugInfo::Done);
                DC(int64(0x73df9d02602ffdd), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.RestartQuest();
                DC(int64(0x73df9d02602ffdd), EConversationDebugInfo::Done);
                DC(int64(0xd62e042635cdcc49), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_ULMAR.RestartQuest();
                DC(int64(0xd62e042635cdcc49), EConversationDebugInfo::Done);
                DC(int64(0xa0718338a690d122), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.RestartQuest();
                DC(int64(0xa0718338a690d122), EConversationDebugInfo::Done);
                DB(int64(0x646376e2eec9c847), G1R.Lefty_CarriedWater == 0);
                
                if (G1R.Lefty_CarriedWater == 0)
                {
                    DC(int64(0x61a39c21bde6dab0), EConversationDebugInfo::Executing);
                    Hero.GiveExperience(G1R.XP_NC_CARRYWATER_COMPLETE);
                    DC(int64(0x61a39c21bde6dab0), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6dab2), EConversationDebugInfo::Executing);
                    G1R.Lefty_CarriedWater = 1;
                    DC(int64(0x61a39c21bde6dab2), EConversationDebugInfo::Done);
                }
                DC(int64(0xa676b4b172e212fa), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa676b4b172e212fa), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lefty_216604 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b2bf);
            default Caption = LocText("DIA_LEFTY_NEVERAGAIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b2c0), EConversationDebugInfo::Executing);
                // I'm done handing out your water.
                Hero.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_15_00"));
                DC(int64(0xc4873e872a48b2c0), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2c7), EConversationDebugInfo::Executing);
                
                // Oh? Got something better to do, do we? 
                Lefty.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_07_01"));
                DC(int64(0xc4873e872a48b2c7), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2c8), EConversationDebugInfo::Executing);
                // I think you need a reminder who's boss. 
                Lefty.AI.Say(LocText("DIA_LEFTY_NEVERAGAIN_07_02"));
                DC(int64(0xc4873e872a48b2c8), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6daa4), EConversationDebugInfo::Executing);
                G1R.Lefty_WorkDay = FInGameTime::Now();
                DC(int64(0x61a39c21bde6daa4), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6daa6), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_CARRYWATER.FailQuest();
                DC(int64(0x61a39c21bde6daa6), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6daa8), EConversationDebugInfo::Executing);
                Lefty.AI.StartAttackingImmediatelyLootOnly(Hero);
                DC(int64(0x61a39c21bde6daa8), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2cb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc4873e872a48b2cb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lefty_216672 : UTopic_Hero__NC_ORG_LEFTY_844
        {
            default DebugId = int64(0xc4873e872a48b2cf);
            default Caption = LocText("DIA_LEFTY_FIRST_LATER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lefty_216672);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc4873e872a48b2d0), EConversationDebugInfo::Executing);
                // Maybe later.
                Hero.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_15_00"));
                DC(int64(0xc4873e872a48b2d0), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2d3), EConversationDebugInfo::Executing);
                
                // No, the farmers need someone NOW. You're gonna help or ...
                Lefty.AI.Say(LocText("DIA_LEFTY_FIRST_LATER_07_01"));
                DC(int64(0xc4873e872a48b2d3), EConversationDebugInfo::Done);
                DC(int64(0xc4873e872a48b2d2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xc4873e872a48b2d2), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */