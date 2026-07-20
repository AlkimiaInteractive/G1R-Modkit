#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_TPL_GORNADUN_1411 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_TPL_GORNADUN_1411";
        }
        
        
        class UTopic_Hero__SC_TPL_GORNADUN_1411 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_TPL_GORNADUN_1411";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaDun() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGornadun156783 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x14e8115e07a95cc4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGornadun156783);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(GorNaDun, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(GorNaDun, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14e8115e07a95cc3), EConversationDebugInfo::Executing);
                // I don't understand what's so hard about this. The ...
                GorNaDun.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_161049_2785"));
                DC(int64(0x14e8115e07a95cc3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UGorNaDun_88880 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x1170e0da2e357305);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UGorNaDun_88880);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e357304), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1170e0da2e357304), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UGorNaDun_88896 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x1170e0da2e357309);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UGorNaDun_89021);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_EJJNSVE_20240403_155038"), int64(0x1170e0da2e357309));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcd2db676dbf6f1ff), G1R.Templar_Duel == 0);
                }
                
                return G1R.Templar_Duel == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e357308), EConversationDebugInfo::Executing);
                // For the Sleeper!
                GorNaDun.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_155755_2995"));
                DC(int64(0x1170e0da2e357308), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNADUN, Document::UDocumentSegment_Glossary_SC_TPL_GORNADUN_Introduction);
                DC(int64(0x1170e0da2e35730c), EConversationDebugInfo::Executing);
                GorNaDun.AI.StartTrainingFight(Hero);
                DC(int64(0x1170e0da2e35730c), EConversationDebugInfo::Done);
                DC(int64(0xcd2db676dbf6f1fe), EConversationDebugInfo::Executing);
                G1R.Templar_Duel = 1;
                DC(int64(0xcd2db676dbf6f1fe), EConversationDebugInfo::Done);
                DC(int64(0x7f42d8e5f455787a), EConversationDebugInfo::Executing);
                GorNaDun.MakeUnlootable();
                DC(int64(0x7f42d8e5f455787a), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e35730d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1170e0da2e35730d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UGorNaDun_89021 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x1170e0da2e35745b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UGorNaDun_89021);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_FVXAWSC_20240415_171343"), int64(0x1170e0da2e35745b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7336f5aad0cb3391), Hero != nullptr && Hero.HasRecentlyDefeated(GorNaDun));
                }
                
                return Hero != nullptr && Hero.HasRecentlyDefeated(GorNaDun);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1170e0da2e35745a), EConversationDebugInfo::Executing);
                // Not bad. Where did you learn to fight like this? 
                GorNaDun.AI.Say(LocText("TEXT_WIP_EJJNSVE_20240403_163248_1340"));
                DC(int64(0x1170e0da2e35745a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_TPL_GORNADUN, Document::UDocumentSegment_Glossary_SC_TPL_GORNADUN_Beated);
                DC(int64(0x7858bf075764a1f3), EConversationDebugInfo::Executing);
                GorNaDun.RemoveImmortality();
                DC(int64(0x7858bf075764a1f3), EConversationDebugInfo::Done);
                DC(int64(0x7f42d8e5f455787c), EConversationDebugInfo::Executing);
                GorNaDun.MakeLootable();
                DC(int64(0x7f42d8e5f455787c), EConversationDebugInfo::Done);
                Subdialog(
                    UGorNaDun_122944,
                    UGorNaDun_122964,
                    UGorNaDun_123355
                );
            }
        }
        
        
        class UGorNaDun_122944 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x5dcd7126285f5cf);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_155618_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UGorNaDun_122944);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f5d0), EConversationDebugInfo::Executing);
                // On the streets. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155618_2083"));
                DC(int64(0x5dcd7126285f5d0), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5d7), EConversationDebugInfo::Executing);
                
                // Like most of us, I guess. Not bad. Seems like I still ...
                GorNaDun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155656"));
                DC(int64(0x5dcd7126285f5d7), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5dcd7126285f5e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UGorNaDun_122964 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x5dcd7126285f5d3);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_155618_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UGorNaDun_122964);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f5d4), EConversationDebugInfo::Executing);
                // Here and there. 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155618_1924"));
                DC(int64(0x5dcd7126285f5d4), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5d8), EConversationDebugInfo::Executing);
                
                // Don't want to talk about it, huh? Fine by me. Thanks for ...
                GorNaDun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155735"));
                DC(int64(0x5dcd7126285f5d8), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5d9), EConversationDebugInfo::Executing);
                // I have a long way to go. 
                GorNaDun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155751"));
                DC(int64(0x5dcd7126285f5d9), EConversationDebugInfo::Done);
                DC(int64(0x1170e0da2e35745d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x1170e0da2e35745d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UGorNaDun_123355 : UTopic_Hero__SC_TPL_GORNADUN_1411
        {
            default DebugId = int64(0x5dcd7126285f5da);
            default Caption = LocText("TEXT_WIP_DDCKZPD_20241106_155800_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UGorNaDun_123355);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5dcd7126285f5db), EConversationDebugInfo::Executing);
                // In here.
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155800_2785"));
                DC(int64(0x5dcd7126285f5db), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5de), EConversationDebugInfo::Executing);
                
                // You can't be serious. Really? You gotta be a natural... 
                GorNaDun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155807"));
                DC(int64(0x5dcd7126285f5de), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5df), EConversationDebugInfo::Executing);
                // Anyway, thanks for the fight. I still have a long way to ...
                GorNaDun.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_155829"));
                DC(int64(0x5dcd7126285f5df), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f5e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5dcd7126285f5e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */