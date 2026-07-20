#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_FreeMine_BALOROS_WAFFE;
            default NameText = "QUEST-FREEMINE_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 2, 0);
            }
        }
        
        
        UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY GetFreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY() property
        {
            return Cast<UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */