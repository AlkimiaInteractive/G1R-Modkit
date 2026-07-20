#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonMageGlossary_SkeletonMageUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SkeletonMageGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton_Mage, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SkeletonMage, Document::UDocumentSegment_Glossary_SkeletonMage_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_SkeletonMageGlossary_SkeletonMageUnlock GetCreaturesGlossary_SkeletonMageGlossary_SkeletonMageUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonMageGlossary_SkeletonMageUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonMageGlossary_SkeletonMageUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */