#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SkeletonGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton_Scout, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Skeleton, Document::UDocumentSegment_Glossary_Skeleton_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry2 GetCreaturesGlossary_SkeletonGlossary_SkeletonEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */