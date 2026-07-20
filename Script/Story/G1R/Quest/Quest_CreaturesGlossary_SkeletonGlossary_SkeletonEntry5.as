#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry5 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_CreaturesGlossary_SkeletonGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Hero != nullptr && Hero.HasItem(UItAr_Scroll_SummonSkeletons, 1, 0)) || (Hero != nullptr && Hero.HasItem(UItAr_Scroll_SummonArmyOfDarkness, 1, 0));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Skeleton, Document::UDocumentSegment_Glossary_Skeleton_Entry5);
            }
        }
        
        
        UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry5 GetCreaturesGlossary_SkeletonGlossary_SkeletonEntry5() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonEntry5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */