#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"OG_TPL_GORNAZAR_1446");
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetGorNaZar() const property { return GetCharacter(n"OG_TPL_GORNAZAR_1446"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                DC(int64(0x000000c2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaZar))) { GorNaZar.ExchangeDailyRoutineToClass(UDailyRoutine_OG_TPL_GorNaZar_1446_SharpWeapon); }
                DC(int64(0x000000c2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_Start);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000c5), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaZar))) { GorNaZar.ExchangeDailyRoutineToClass(UDailyRoutine_OG_TPL_GorNaZar_1446_Start); }
                DC(int64(0x000000c5), EConversationDebugInfo::Done);
                DC(int64(0x000000c6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_OC_FORGEDRIVALRIES1_FINDSWORD);
                DC(int64(0x000000c6), EConversationDebugInfo::Done);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestFailed() 
            {
                DC(int64(0x000000c7), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaZar))) { GorNaZar.ExchangeDailyRoutineToClass(UDailyRoutine_OG_TPL_GorNaZar_1446_Start); }
                DC(int64(0x000000c7), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD GetOldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */