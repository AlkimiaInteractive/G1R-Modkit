#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_Ranged : UG1RQuest
        {
            default InvolvedCharacters.Add(n"AITESTCHARACTER");
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Tutorials;
            
            AGothicCharacterState GetTestCharacter() const property { return GetCharacter(n"AITESTCHARACTER"); }
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (TestCharacter != nullptr && TestCharacter.HasObtainedItemOfType(GameplayTag::Item_Weapon_Crossbow, 1)) || (Hero != nullptr && Hero.HasObtainedItemOfType(GameplayTag::Item_Weapon_Bow, 1));
            }
        }
        
        
        UQuest_Tutorials_Tut_Ranged GetTutorials_Tut_Ranged() property
        {
            return Cast<UQuest_Tutorials_Tut_Ranged>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_Ranged::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */