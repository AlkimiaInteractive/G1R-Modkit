#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Troll_03, 1, 0);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL GetValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_TROLL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */