#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_IceGolemGlossary_IceGolemUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_IceGolemGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Golem_Ice, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_IceGolem, Document::UDocumentSegment_Glossary_IceGolem_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_IceGolemGlossary_IceGolemUnlock GetCreaturesGlossary_IceGolemGlossary_IceGolemUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_IceGolemGlossary_IceGolemUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_IceGolemGlossary_IceGolemUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */