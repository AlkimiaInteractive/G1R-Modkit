#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_HARLOK_1358 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_HARLOK_1358";
        }
        
        
        class UTopic_Hero__SC_NOV_HARLOK_1358 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_HARLOK_1358";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHarlok() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
            
            AGothicCharacterState GetGhorim() const property
            {
                return GetCharacter(n"SC_NOV_GHORIM_1310");
            }
        }
        
        
        class UChoiceHarlokAngry : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x373418fb302fd4ce);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_HARLOK_SENDHARLOK_01_03"), int64(0x373418fb302fd4ce));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x373418fb302fd4cf), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4d1), EConversationDebugInfo::Executing);
                // What is it, man? Just leave me alone ...
                Harlok.AI.Say(LocText("DIA_HARLOK_ANGRY_01_00"));
                DC(int64(0x373418fb302fd4d1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_HARLOK, Document::UDocumentSegment_Glossary_SC_NOV_HARLOK_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_GHORIMSRELIEF, Document::UDocumentSegment_CH1_GHORIMSRELIEF_Completed);
                DC(int64(0x373418fb302fd4d2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x373418fb302fd4d2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHarlokExit : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x373418fb302fd4ac);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4ad), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x373418fb302fd4ad), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHarlokFetchharlok : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x373418fb302fd4ae);
            default Caption = LocText("DIA_HARLOK_FETCHHARLOK_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceHarlokFetchharlok);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x373418fb302fd4af), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4b0), EConversationDebugInfo::Executing);
                // Ghorim sent me.
                Hero.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_15_00"));
                DC(int64(0x373418fb302fd4b0), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4b1), EConversationDebugInfo::Executing);
                
                // What?
                Harlok.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_01_01"));
                DC(int64(0x373418fb302fd4b1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_HARLOK, Document::UDocumentSegment_Glossary_SC_NOV_HARLOK_Introduction);
                Subdialog(
                    UChoiceHarlokFetchharlokOrelse,
                    UChoiceHarlokFetchharlokPlease,
                    UChoiceHarlokFetchharlokBack
                );
            }
        }
        
        
        class UChoiceHarlokFetchharlokOrelse : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x12946e94fb0787c);
            default Caption = LocText("DIA_HARLOK_FETCHHARLOK_ORELSE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4b4), EConversationDebugInfo::Executing);
                // Get your lazy ass to the herb mashers or I'll kick it ...
                Hero.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_ORELSE_15_00"));
                DC(int64(0x373418fb302fd4b4), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4b5), EConversationDebugInfo::Executing);
                
                // What?! Watch your fuckin' mouth!
                Harlok.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_ORELSE_01_01"));
                DC(int64(0x373418fb302fd4b5), EConversationDebugInfo::Done);
                DC(int64(0xbf7e9d8404fc2012), EConversationDebugInfo::Executing);
                Harlok.AI.StartFightCustomWithFists(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Defeat, GameplayTag::AIConflict_Duration_UntilDefeated);
                DC(int64(0xbf7e9d8404fc2012), EConversationDebugInfo::Done);
                DC(int64(0x5265f0ad15a47e9), EConversationDebugInfo::Executing);
                Harlok.MakeUnlootable();
                DC(int64(0x5265f0ad15a47e9), EConversationDebugInfo::Done);
                DC(int64(0xae73f906338c26a3), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Ghorim))) { Ghorim.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Ghorim_1310_Wait); }
                DC(int64(0xae73f906338c26a3), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4b6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x373418fb302fd4b6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHarlokFetchharlokPlease : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x487932c12c0e65f0);
            default Caption = LocText("DIA_HARLOK_FETCHHARLOK_PLEASE_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4b8), EConversationDebugInfo::Executing);
                // He wants me to remind you about your shift. You're ...
                Hero.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_PLEASE_15_00"));
                DC(int64(0x373418fb302fd4b8), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4b9), EConversationDebugInfo::Executing);
                
                // Aw, how nice of him. Remind me again when I've gotten ...
                Harlok.AI.Say(LocText("DIA_HARLOK_FETCHHARLOK_PLEASE_01_01"));
                DC(int64(0x373418fb302fd4b9), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4ba), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x373418fb302fd4ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHarlokFetchharlokBack : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0xb8d5d0d8e7d55c0d);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceHarlokHarlokagain : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x373418fb302fd4bb);
            default Caption = LocText("DIA_HARLOK_HARLOKAGAIN_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHarlokFetchharlok);
            default Rules.HideIfKnows(UChoiceHarlokHarlokagain);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x373418fb302fd4bc), Hero != nullptr && !Hero.HasRecentlyDefeated(Harlok));
                    DB(int64(0x373418fb302fd4bd), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasRecentlyDefeated(Harlok))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && !Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4be), EConversationDebugInfo::Executing);
                // Ghorim's still waiting. 
                Hero.AI.Say(LocText("DIA_HARLOK_HARLOKAGAIN_15_00"));
                DC(int64(0x373418fb302fd4be), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4bf), EConversationDebugInfo::Executing);
                
                // And I'm still tired. 
                Harlok.AI.Say(LocText("DIA_HARLOK_HARLOKAGAIN_01_01"));
                DC(int64(0x373418fb302fd4bf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_GHORIMSRELIEF, Document::UDocumentSegment_CH1_GHORIMSRELIEF_Lazy);
                DC(int64(0x5265f0ad15a47ed), EConversationDebugInfo::Executing);
                Harlok.MakeLootable();
                DC(int64(0x5265f0ad15a47ed), EConversationDebugInfo::Done);
                DC(int64(0xe5a53d8516d2c855), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xe5a53d8516d2c855), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHarlokSendharlok : UTopic_Hero__SC_NOV_HARLOK_1358
        {
            default DebugId = int64(0x373418fb302fd4c0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHarlokFetchharlok);
            default Rules.HideIfKnows(UChoiceHarlokSendharlok);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x373418fb302fd4c1), Hero != nullptr && Hero.HasRecentlyDefeated(Harlok));
                    DB(int64(0x373418fb302fd4c2), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Harlok))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && !Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x373418fb302fd4c3), EConversationDebugInfo::Executing);
                // You look like you can't wait to mash some herbs. 
                Hero.AI.Say(LocText("DIA_HARLOK_SENDHARLOK_15_00"));
                DC(int64(0x373418fb302fd4c3), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4c4), EConversationDebugInfo::Executing);
                
                // Bastard ... what's it to you, anyway?
                Harlok.AI.Say(LocText("DIA_HARLOK_SENDHARLOK_01_01"));
                DC(int64(0x373418fb302fd4c4), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4c5), EConversationDebugInfo::Executing);
                
                // Just wanna see you mashing.
                Hero.AI.Say(LocText("DIA_HARLOK_SENDHARLOK_15_02"));
                DC(int64(0x373418fb302fd4c5), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4c6), EConversationDebugInfo::Executing);
                
                // All right, all right, I'm going  ... asshole.
                Harlok.AI.Say(LocText("DIA_HARLOK_SENDHARLOK_01_03"));
                DC(int64(0x373418fb302fd4c6), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_HARLOK, Document::UDocumentSegment_Glossary_SC_NOV_HARLOK_Beated);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_GHORIMSRELIEF, Document::UDocumentSegment_CH1_GHORIMSRELIEF_Beated);
                DC(int64(0x281bfa5ab8fe7eb), EConversationDebugInfo::Executing);
                Harlok.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Harlok_1358_Work);
                DC(int64(0x281bfa5ab8fe7eb), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe7f1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Ghorim))) { Ghorim.SetRelationshipTowards(Hero, ERelationship::Friend); }
                DC(int64(0x281bfa5ab8fe7f1), EConversationDebugInfo::Done);
                DC(int64(0x281bfa5ab8fe7f3), EConversationDebugInfo::Executing);
                Harlok.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x281bfa5ab8fe7f3), EConversationDebugInfo::Done);
                DC(int64(0x138d345a7dba528a), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_HARLOK.SucceedQuest();
                DC(int64(0x138d345a7dba528a), EConversationDebugInfo::Done);
                DC(int64(0x5265f0ad15a47eb), EConversationDebugInfo::Executing);
                Harlok.MakeLootable();
                DC(int64(0x5265f0ad15a47eb), EConversationDebugInfo::Done);
                DC(int64(0x373418fb302fd4cd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x373418fb302fd4cd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */