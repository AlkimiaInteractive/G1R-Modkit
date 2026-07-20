#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_GoblinGlossary_GoblinEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_GoblinGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Goblin_Black, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Goblin, Document::UDocumentSegment_Glossary_Goblin_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_GoblinGlossary_GoblinEntry2 GetCreaturesGlossary_GoblinGlossary_GoblinEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_GoblinGlossary_GoblinEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_GoblinGlossary_GoblinEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */