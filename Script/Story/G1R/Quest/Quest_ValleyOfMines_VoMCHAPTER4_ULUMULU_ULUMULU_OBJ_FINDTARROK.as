#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000005c), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_ULUMULU_FINDTARROK);
                DC(int64(0x0000005c), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK GetValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_FINDTARROK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */