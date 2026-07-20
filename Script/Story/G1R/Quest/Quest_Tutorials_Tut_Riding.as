#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Riding : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Tutorials;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Riding);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                /* Skip invalid: UnlockDocumentSegment Tut_SR_Riding/ */;
            }
        }
        
        
        UQuest_Tutorials_Tut_Riding GetTutorials_Tut_Riding() property
        {
            return Cast<UQuest_Tutorials_Tut_Riding>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Riding::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */