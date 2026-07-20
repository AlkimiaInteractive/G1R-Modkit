#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerEntry5 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_ScavengerGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Scavenger_Adult, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Scavenger, Document::UDocumentSegment_Glossary_Scavenger_Entry5);
            }
        }
        
        
        UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerEntry5 GetCreaturesGlossary_ScavengerGlossary_ScavengerEntry5() property
        {
            return Cast<UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerEntry5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ScavengerGlossary_ScavengerEntry5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */