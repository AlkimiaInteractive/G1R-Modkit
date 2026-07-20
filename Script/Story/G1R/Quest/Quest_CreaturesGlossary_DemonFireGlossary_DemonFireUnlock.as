#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonFireGlossary_DemonFireUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_DemonFireGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Demon_Fire, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FireDemon, Document::UDocumentSegment_Glossary_FireDemon_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_DemonFireGlossary_DemonFireUnlock GetCreaturesGlossary_DemonFireGlossary_DemonFireUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonFireGlossary_DemonFireUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonFireGlossary_DemonFireUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */