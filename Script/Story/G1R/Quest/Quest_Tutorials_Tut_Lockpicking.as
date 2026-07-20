#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Lockpicking : UG1RQuest
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
                return Hero != nullptr && Hero.HasStartedLockPicking();
            }
        }
        
        
        UQuest_Tutorials_Tut_Lockpicking GetTutorials_Tut_Lockpicking() property
        {
            return Cast<UQuest_Tutorials_Tut_Lockpicking>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Lockpicking::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */