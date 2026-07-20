#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"SH_ZOMBIE_01");
            default ParentQuestClass = UQuest_CreaturesGlossary_ZombieGlossary;
            
            AGothicCharacterState GetSH_ZOMBIE_01() const property { return GetCharacter(n"SH_ZOMBIE_01"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(3);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return SH_ZOMBIE_01 != nullptr && SH_ZOMBIE_01.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Zombie, Document::UDocumentSegment_Glossary_Zombie_Unlock3);
            }
        }
        
        
        UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry3 GetCreaturesGlossary_ZombieGlossary_ZombieEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ZombieGlossary_ZombieEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */