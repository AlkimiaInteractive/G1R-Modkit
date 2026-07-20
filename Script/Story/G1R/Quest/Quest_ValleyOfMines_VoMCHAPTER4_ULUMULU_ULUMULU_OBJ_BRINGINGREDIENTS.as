#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006a), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_ULUMULU_BRINGINGREDIENTS);
                DC(int64(0x0000006a), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS GetValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_BRINGINGREDIENTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */