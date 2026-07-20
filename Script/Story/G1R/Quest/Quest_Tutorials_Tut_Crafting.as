#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Crafting : UG1RQuest
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
                return (Hero != nullptr && Hero.HasLearnedRecipes()) || (Hero != nullptr && Hero.HasStartedCrafting());
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                /* Skip invalid: UnlockDocumentSegment Tut_CF_Learning/ */;
                /* Skip invalid: UnlockDocumentSegment Tut_CF_Crafts/ */;
                /* Skip invalid: UnlockDocumentSegment Tut_CF_Stations/ */;
            }
        }
        
        
        UQuest_Tutorials_Tut_Crafting GetTutorials_Tut_Crafting() property
        {
            return Cast<UQuest_Tutorials_Tut_Crafting>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Crafting::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */