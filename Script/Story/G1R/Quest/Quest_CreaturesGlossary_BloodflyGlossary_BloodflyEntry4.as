#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BloodflyGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Bloodfly, 10);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Bloodfly, Document::UDocumentSegment_Glossary_Bloodfly_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry4 GetCreaturesGlossary_BloodflyGlossary_BloodflyEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */