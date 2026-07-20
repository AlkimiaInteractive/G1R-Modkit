#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_ZombieGlossary;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Zombie, Document::UDocumentSegment_Glossary_Zombie_Unlock2);
            }
        }
        
        
        UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry2 GetCreaturesGlossary_ZombieGlossary_ZombieEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */