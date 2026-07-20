#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_GUR_BAALTYON_1210 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_GUR_BAALTYON_1210";
        }
        
        
        class UTopic_Hero__SC_GUR_BAALTYON_1210 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_GUR_BAALTYON_1210";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBaalTyon() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetCaine() const property
            {
                return GetCharacter(n"SC_NOV_CAINE_1301");
            }
        }
        
        
        class UChoiceBaaltyon157291 : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xed4abbb5972f50a7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceBaaltyon157291);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(BaalTyon, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalTyon, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed4abbb5972f50a6), EConversationDebugInfo::Executing);
                // Angar isn't a guru. He's a templar. We don't need muscle ...
                BaalTyon.AI.Say(LocText("TEXT_WIP_WSLLGEC_20250214_095327_2386"));
                DC(int64(0xed4abbb5972f50a6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltyonExit : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xca110f6151eb64ae);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64af), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca110f6151eb64af), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltyonNotalk : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xca110f6151eb64b0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca110f6151eb64b1), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xca110f6151eb64b2), G1R.BaalTyon_responsive == 0);
                    DB(int64(0xca110f6151eb64b3), BaalTyon != nullptr && !BaalTyon.IsFriendlyTowards(Hero));
                    DB(int64(0x56a4a1bf16980ec8), G1R != nullptr && !G1R.HasReachedChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.BaalTyon_responsive != 0)
                    return false;
                
                if (BaalTyon != nullptr && BaalTyon.IsFriendlyTowards(Hero))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Introduction);
                Subdialog(
                    UChoiceBaaltyonSpecialjoint,
                    UChoiceBaaltyonNotalkImp,
                    UChoiceBaaltyonNotalkSleeper,
                    UChoiceBaaltyonNotalkHi,
                    UBaalTyon_79086
                );
            }
        }
        
        
        class UChoiceBaaltyonSpecialjoint : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xe8603e87342bf34c);
            default Caption = LocText("DIA_BAALTYON_SPECIALJOINT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8c514fdfe4f34817), Hero != nullptr && Hero.HasItem(UItMi_Specialjoint, 1, 0));
                    DB(int64(0x646f6c8d1ce49640), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMi_Specialjoint, 1, 0))
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64b7), EConversationDebugInfo::Executing);
                // Master, please accept this humble present from a humble ...
                Hero.AI.Say(LocText("DIA_BAALTYON_SPECIALJOINT_15_00"), bUnskippable = true);
                DC(int64(0xca110f6151eb64b7), EConversationDebugInfo::Done);
                DC(int64(0xa330338aa52523d1), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(BaalTyon, UItMi_Specialjoint, 1);
                DC(int64(0xa330338aa52523d1), EConversationDebugInfo::Done);
                DB(int64(0xca110f6151eb64ba), BaalTyon != nullptr && BaalTyon.IsSitting());
                
                if (BaalTyon != nullptr && BaalTyon.IsSitting())
                {
                    DC(int64(0xa330338aa52523cb), EConversationDebugInfo::Executing);
                    BaalTyon.AI.StandUp();
                    DC(int64(0xa330338aa52523cb), EConversationDebugInfo::Done);
                    DC(int64(0xa330338aa52523cd), EConversationDebugInfo::Executing);
                    BaalTyon.AI.TurnToCharacter(Hero);
                    DC(int64(0xa330338aa52523cd), EConversationDebugInfo::Done);
                }
                DC(int64(0xca110f6151eb64be), EConversationDebugInfo::Executing);
                // Hmmm ....
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_SPECIALJOINT_11_01"), ForceCameraPreset = n"TWO SHOT FULL", bUnskippable = true);
                DC(int64(0xca110f6151eb64be), EConversationDebugInfo::Done);
                DC(int64(0xa330338aa52523c7), EConversationDebugInfo::Executing);
                BaalTyon.AI.UseItem(UItMi_Joint_01);
                DC(int64(0xa330338aa52523c7), EConversationDebugInfo::Done);
                DC(int64(0xa330338aa52523c2), EConversationDebugInfo::Executing);
                G1R.BaalTyon_responsive = 1;
                DC(int64(0xa330338aa52523c2), EConversationDebugInfo::Done);
                DC(int64(0x650a35e13859b611), EConversationDebugInfo::Executing);
                BaalTyon.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Drained);
                DC(int64(0x650a35e13859b611), EConversationDebugInfo::Done);
                DC(int64(0x776e33a32f074a1d), EConversationDebugInfo::Executing);
                BaalTyon.AI.WaitSeconds(5);
                DC(int64(0x776e33a32f074a1d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltyonNotalkImp : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xe8603e87342bf35d);
            default Caption = LocText("DIA_BAALTYON_NOTALK_IMP_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64c3), EConversationDebugInfo::Executing);
                // The wisdom sleeps in your eyes, Master.
                Hero.AI.Say(LocText("DIA_BAALTYON_NOTALK_IMP_15_00"));
                DC(int64(0xca110f6151eb64c3), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64c4), EConversationDebugInfo::Executing);
                
                // (sighs)
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_NOTALK_IMP_11_01"));
                DC(int64(0xca110f6151eb64c4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Ignore);
                DC(int64(0xa330338aa52523d9), EConversationDebugInfo::Executing);
                G1R.BaalTyon_Sacrilege = 1;
                DC(int64(0xa330338aa52523d9), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64c6), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xca110f6151eb64c6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltyonNotalkSleeper : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xe8603e87342bf363);
            default Caption = LocText("DIA_BAALTYON_NOTALK_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64c8), EConversationDebugInfo::Executing);
                // I come seeking guidance, Master.
                Hero.AI.Say(LocText("DIA_BAALTYON_NOTALK_SLEEPER_15_00"));
                DC(int64(0xca110f6151eb64c8), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64c9), EConversationDebugInfo::Executing);
                
                // (sigh)
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_NOTALK_SLEEPER_11_01"));
                DC(int64(0xca110f6151eb64c9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Ignore);
                DC(int64(0xa330338aa52523e0), EConversationDebugInfo::Executing);
                G1R.BaalTyon_Sacrilege = 1;
                DC(int64(0xa330338aa52523e0), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64cb), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xca110f6151eb64cb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBaaltyonNotalkHi : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xe8603e87342bf369);
            default Caption = LocText("DIA_BAALTYON_NOTALK_HI_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64cd), EConversationDebugInfo::Executing);
                // Hello there. I'm new to this place.
                Hero.AI.Say(LocText("DIA_BAALTYON_NOTALK_HI_15_00"));
                DC(int64(0xca110f6151eb64cd), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64ce), EConversationDebugInfo::Executing);
                
                // (sighs)
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_NOTALK_HI_11_01"));
                DC(int64(0xca110f6151eb64ce), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Ignore);
                DC(int64(0xa330338aa52523e7), EConversationDebugInfo::Executing);
                G1R.BaalTyon_Sacrilege = 1;
                DC(int64(0xa330338aa52523e7), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64d0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0xca110f6151eb64d0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UBaalTyon_79086 : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xa330338aa52535f6);
            default Caption = LocText("TEXT_USUARIO_20231030_170022_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa330338aa52535f7), EConversationDebugInfo::Executing);
                // That's one shiny pate.
                Hero.AI.Say(LocText("TEXT_USUARIO_20231030_170022_41"));
                DC(int64(0xa330338aa52535f7), EConversationDebugInfo::Done);
                DC(int64(0xa330338aa52535fa), EConversationDebugInfo::Executing);
                
                // (sighs)
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_NOTALK_HI_11_01"));
                DC(int64(0xa330338aa52535fa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Ignore);
                DC(int64(0xa330338aa5253600), EConversationDebugInfo::Executing);
                G1R.BaalTyon_Sacrilege = 1;
                DC(int64(0xa330338aa5253600), EConversationDebugInfo::Done);
                DC(int64(0xa330338aa52535fb), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xa330338aa52535fb), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBaaltyonVision : UTopic_Hero__SC_GUR_BAALTYON_1210
        {
            default DebugId = int64(0xca110f6151eb64d1);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltyonSpecialjoint);
            default Rules.HideIfKnows(UChoiceBaaltyonVision);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xca110f6151eb64d2), G1R.BaalTyon_responsive != 0);
                    DB(int64(0xca110f6151eb64d3), BaalTyon != nullptr && !BaalTyon.IsRefusingToTalkWith(Hero));
                    DB(int64(0xca110f6151eb64d4), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                }
                
                if (G1R.BaalTyon_responsive == 0)
                    return false;
                
                if (BaalTyon != nullptr && BaalTyon.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xca110f6151eb64d5), EConversationDebugInfo::Executing);
                // By the Sleeper! I just had a vision!
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_VISION_11_00"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xca110f6151eb64d5), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64d6), EConversationDebugInfo::Executing);
                // It was ... incredible. I saw a new Brother arrive, but ...
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_VISION_11_01"));
                DC(int64(0xca110f6151eb64d6), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64d7), EConversationDebugInfo::Executing);
                // I ... I saw him do something. He was going down an ...
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_VISION_11_02"));
                DC(int64(0xca110f6151eb64d7), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64d8), EConversationDebugInfo::Executing);
                // Hmm ... and I must say, he looked quite a lot like you. ...
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_VISION_11_03"));
                DC(int64(0xca110f6151eb64d8), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64d9), EConversationDebugInfo::Executing);
                
                // No, Master. I'm just a humble servant of the Sleeper.
                Hero.AI.Say(LocText("DIA_BAALTYON_VISION_15_04"));
                DC(int64(0xca110f6151eb64d9), EConversationDebugInfo::Done);
                DC(int64(0xca110f6151eb64da), EConversationDebugInfo::Executing);
                
                // Hmm ... Well, the vision DID feel powerful. Fine, then - ...
                BaalTyon.AI.Say(LocText("DIA_BAALTYON_VISION_11_05"));
                DC(int64(0xca110f6151eb64da), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_GUR_BAALTYON, Document::UDocumentSegment_Glossary_SC_GUR_BAALTYON_Joint);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_TyonImpressed);
                DC(int64(0x1a34e2931ab9dbd0), EConversationDebugInfo::Executing);
                G1R.Kalom_Counter += 1;
                DC(int64(0x1a34e2931ab9dbd0), EConversationDebugInfo::Done);
                DC(int64(0x177474618b93f9cd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_TYON.SucceedQuest();
                DC(int64(0x177474618b93f9cd), EConversationDebugInfo::Done);
                DC(int64(0xcbb09311201a600d), EConversationDebugInfo::Executing);
                BaalTyon.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_BaalTyon_1210_Start);
                DC(int64(0xcbb09311201a600d), EConversationDebugInfo::Done);
                DB(int64(0x1a34e2931ab9dbd2), G1R.Kalom_Counter >= 2);
                DB(int64(0x1547dbe6d32bec87), G1R.CaineVanished == 0);
                
                if (G1R.Kalom_Counter >= 2 && G1R.CaineVanished == 0)
                {
                    DC(int64(0x1a34e2931ab9dbd4), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Caine_1301_Dead); }
                    DC(int64(0x1a34e2931ab9dbd4), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd82fa), EConversationDebugInfo::Executing);
                    G1R.ActivateStoryDataLayer("FindingCaine");
                    DC(int64(0x608d6fba46cd82fa), EConversationDebugInfo::Done);
                    DC(int64(0x608d6fba46cd8305), EConversationDebugInfo::Executing);
                    UWorldPointManager::Get().CallGlobalEvent(n"OnFindingCaine");
                    DC(int64(0x608d6fba46cd8305), EConversationDebugInfo::Done);
                    DC(int64(0x1547dbe6d32bec85), EConversationDebugInfo::Executing);
                    G1R.CaineVanished = 1;
                    DC(int64(0x1547dbe6d32bec85), EConversationDebugInfo::Done);
                    DC(int64(0x28003880c3e01fd7), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(Caine))) { Caine.NPCState.RemoveFromWorld(); }
                    DC(int64(0x28003880c3e01fd7), EConversationDebugInfo::Done);
                }
                DC(int64(0xca110f6151eb64df), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xca110f6151eb64df), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */