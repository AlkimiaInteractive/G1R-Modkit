#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_GHORIM_1310 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_GHORIM_1310";
        }
        
        
        class UTopic_Hero__SC_NOV_GHORIM_1310 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_GHORIM_1310";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGhorim() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetHarlok() const property
            {
                return GetCharacter(n"SC_NOV_HARLOK_1358");
            }
        }
        
        
        class UChoiceGhorim157913 : UTopic_Hero__SC_NOV_GHORIM_1310
        {
            default DebugId = int64(0x8b2a4e84c87b8467);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceGhorim157913);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Ghorim, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                    DB(int64(0x8b2a4e84c87b846a), G1R != nullptr && !G1R.HasReachedChapter(4));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Ghorim, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(4))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8b2a4e84c87b8466), EConversationDebugInfo::Executing);
                // Hey, do you know what the hell happened? I was so tired ...
                Ghorim.AI.Say(LocText("TEXT_WIP_HNXNLPG_20250217_141203_41"));
                DC(int64(0x8b2a4e84c87b8466), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGhorimExit : UTopic_Hero__SC_NOV_GHORIM_1310
        {
            default DebugId = int64(0x55f91c1df7f88afd);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x55f91c1df7f88afe), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x55f91c1df7f88afe), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGhorimMissingharlok : UTopic_Hero__SC_NOV_GHORIM_1310
        {
            default DebugId = int64(0x55f91c1df7f88aff);
            default Caption = LocText("DIA_GHORIM_MISSINGHARLOK_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGhorimMissingharlok);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x55f91c1df7f88b00), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && !Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF != nullptr && !Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x55f91c1df7f88b01), EConversationDebugInfo::Executing);
                // Hey. How's it going?
                Hero.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_15_00"));
                DC(int64(0x55f91c1df7f88b01), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b02), EConversationDebugInfo::Executing);
                
                // What's it look like? I'm hangin' by a thread here ... ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_01"));
                DC(int64(0x55f91c1df7f88b02), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b03), EConversationDebugInfo::Executing);
                // Harlok should've taken over ages ago, but it's always ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_02"));
                DC(int64(0x55f91c1df7f88b03), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b04), EConversationDebugInfo::Executing);
                // Bet you a hundred nuggs he's still in his hut, snorin' ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_03"));
                DC(int64(0x55f91c1df7f88b04), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b05), EConversationDebugInfo::Executing);
                
                // Aren't you gonna do anything about that?
                Hero.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_15_04"));
                DC(int64(0x55f91c1df7f88b05), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b06), EConversationDebugInfo::Executing);
                
                // Believe me, I would, but I can't leave my post as long ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_05"));
                DC(int64(0x55f91c1df7f88b06), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b07), EConversationDebugInfo::Executing);
                // But since you're askin', why don't you pay him a visit? ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_06"));
                DC(int64(0x55f91c1df7f88b07), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b08), EConversationDebugInfo::Executing);
                // Tell him to move his lazy arse over here, else I'm gonna ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_MISSINGHARLOK_02_07"));
                DC(int64(0x55f91c1df7f88b08), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_GHORIM, Document::UDocumentSegment_Glossary_SC_NOV_GHORIM_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_GHORIMSRELIEF, Document::UDocumentSegment_CH1_GHORIMSRELIEF_Start);
                DC(int64(0x281bfa5ab8fe7b6), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF.StartQuest();
                DC(int64(0x281bfa5ab8fe7b6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGhorimSuccess : UTopic_Hero__SC_NOV_GHORIM_1310
        {
            default DebugId = int64(0x55f91c1df7f88b0a);
            default Caption = LocText("DIA_GHORIM_SUCCESS_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x77b3f5e706507ca7), Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN != nullptr && Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x55f91c1df7f88b0c), EConversationDebugInfo::Executing);
                // Seems you finally got relieved.
                Hero.AI.Say(LocText("DIA_GHORIM_SUCCESS_15_00"));
                DC(int64(0x55f91c1df7f88b0c), EConversationDebugInfo::Done);
                DC(int64(0x55f91c1df7f88b0d), EConversationDebugInfo::Executing);
                
                // Damn right, I did. Finally some rest ... thanks again, ...
                Ghorim.AI.Say(LocText("DIA_GHORIM_SUCCESS_02_01"));
                DC(int64(0x55f91c1df7f88b0d), EConversationDebugInfo::Done);
                DC(int64(0x6e79dfa677596cee), EConversationDebugInfo::Executing);
                Ghorim.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Ghorim_1310_Sleep);
                DC(int64(0x6e79dfa677596cee), EConversationDebugInfo::Done);
                DC(int64(0x6e79dfa677596cf0), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_GHORIMSRELIEF_GHORIMSRELIEF_OBJ_RETURN.SucceedQuest();
                DC(int64(0x6e79dfa677596cf0), EConversationDebugInfo::Done);
                DC(int64(0xe01047196862ad4c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Harlok))) { Harlok.RemoveImmortality(); }
                DC(int64(0xe01047196862ad4c), EConversationDebugInfo::Done);
                DC(int64(0x6e79dfa677596cf3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6e79dfa677596cf3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */