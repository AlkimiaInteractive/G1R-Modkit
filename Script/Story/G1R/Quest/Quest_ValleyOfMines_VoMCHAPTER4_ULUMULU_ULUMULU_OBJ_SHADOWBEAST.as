#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAt_Shadow_05, 1, 0);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST GetValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_SHADOWBEAST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */