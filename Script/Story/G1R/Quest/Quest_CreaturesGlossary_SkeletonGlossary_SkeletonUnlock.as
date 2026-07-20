#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SkeletonGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Undead_Skeleton, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000108), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SkeletonGlossary_SkeletonEntry2.StartQuest();
                DC(int64(0x00000108), EConversationDebugInfo::Done);
                DC(int64(0x00000109), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SkeletonGlossary_SkeletonEntry3.StartQuest();
                DC(int64(0x00000109), EConversationDebugInfo::Done);
                DC(int64(0x0000010a), EConversationDebugInfo::Executing);
                Quest::CreaturesGlossary_SkeletonGlossary_SkeletonEntry5.StartQuest();
                DC(int64(0x0000010a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Skeleton, Document::UDocumentSegment_Glossary_Skeleton_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonUnlock GetCreaturesGlossary_SkeletonGlossary_SkeletonUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SkeletonGlossary_SkeletonUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */