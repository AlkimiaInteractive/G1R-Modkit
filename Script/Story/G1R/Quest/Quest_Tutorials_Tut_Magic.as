#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Magic : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Tutorials;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.IsInChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Hero != nullptr && Hero.HasObtainedItemOfType(GameplayTag::Item_Weapon_Rune, 1)) || (Hero != nullptr && Hero.HasObtainedItemOfType(GameplayTag::Item_Weapon_Scroll, 1));
            }
        }
        
        
        UQuest_Tutorials_Tut_Magic GetTutorials_Tut_Magic() property
        {
            return Cast<UQuest_Tutorials_Tut_Magic>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Magic::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */