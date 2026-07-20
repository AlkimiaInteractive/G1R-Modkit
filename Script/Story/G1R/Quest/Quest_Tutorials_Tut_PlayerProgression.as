#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_PlayerProgression : UG1RQuest
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
                return Hero.GetLevelAttribute() >= 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                /* Skip invalid: UnlockDocumentSegment Tut_PR_Attributes/ */;
                /* Skip invalid: UnlockDocumentSegment Tut_PR_Learning/ */;
                /* Skip invalid: UnlockDocumentSegment Tut_PR_Skill/ */;
                /* Skip invalid: UnlockDocumentSegment Tut_PR_Leveling/ */;
            }
        }
        
        
        UQuest_Tutorials_Tut_PlayerProgression GetTutorials_Tut_PlayerProgression() property
        {
            return Cast<UQuest_Tutorials_Tut_PlayerProgression>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_PlayerProgression::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */