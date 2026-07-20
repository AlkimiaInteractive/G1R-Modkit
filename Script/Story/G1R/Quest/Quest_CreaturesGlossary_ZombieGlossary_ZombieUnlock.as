#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ZombieGlossary_ZombieUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_ZombieGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Zombie, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Zombie, Document::UDocumentSegment_Glossary_Zombie_Unlock1);
            }
        }
        
        
        UQuest_CreaturesGlossary_ZombieGlossary_ZombieUnlock GetCreaturesGlossary_ZombieGlossary_ZombieUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_ZombieGlossary_ZombieUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ZombieGlossary_ZombieUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */