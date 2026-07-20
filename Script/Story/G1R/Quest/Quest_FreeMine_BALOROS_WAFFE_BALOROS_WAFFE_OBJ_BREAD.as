#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_FreeMine_BALOROS_WAFFE;
            default NameText = "QUEST-FREEMINE_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItFo_Loaf, 3, 0);
            }
        }
        
        
        UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD GetFreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD() property
        {
            return Cast<UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */