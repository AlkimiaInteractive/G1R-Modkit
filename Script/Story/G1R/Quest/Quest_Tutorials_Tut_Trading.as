#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Trading : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Tutorials;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasStartedTrading();
            }
        }
        
        
        UQuest_Tutorials_Tut_Trading GetTutorials_Tut_Trading() property
        {
            return Cast<UQuest_Tutorials_Tut_Trading>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Trading::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */