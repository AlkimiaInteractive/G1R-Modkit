#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SkeletonGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton_Warrior, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Skeleton, Document::UDocumentSegment_Glossary_Skeleton_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry3 GetCreaturesGlossary_SkeletonGlossary_SkeletonEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */