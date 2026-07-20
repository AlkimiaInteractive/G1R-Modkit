#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonLordGlossary_DemonLordUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_DemonLordGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Demon_Lord, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_DemonLord, Document::UDocumentSegment_Glossary_DemonLord_Unlock);
            }
        }
        
        
        UQuest_CreaturesGlossary_DemonLordGlossary_DemonLordUnlock GetCreaturesGlossary_DemonLordGlossary_DemonLordUnlock() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonLordGlossary_DemonLordUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonLordGlossary_DemonLordUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */