#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_CombatBasics : UG1RQuest
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
                return Hero != nullptr && Hero.HasItem(UItMs_Glossary, 1, 0);
            }
        }
        
        
        UQuest_Tutorials_Tut_CombatBasics GetTutorials_Tut_CombatBasics() property
        {
            return Cast<UQuest_Tutorials_Tut_CombatBasics>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_CombatBasics::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */