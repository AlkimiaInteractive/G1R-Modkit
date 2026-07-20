#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Drugs : UG1RQuest
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
                return (Hero != nullptr && Hero.HasObtainedItemOfType(GameplayTag::Item_Drug, 1)) || (Hero != nullptr && Hero.HasObtainedItemWithProperty(GameplayTag::Item_Property_Alcohol, 1));
            }
        }
        
        
        UQuest_Tutorials_Tut_Drugs GetTutorials_Tut_Drugs() property
        {
            return Cast<UQuest_Tutorials_Tut_Drugs>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Drugs::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */