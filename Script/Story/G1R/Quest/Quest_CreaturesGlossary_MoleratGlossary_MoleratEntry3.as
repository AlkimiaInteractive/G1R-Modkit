#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MoleratGlossary_MoleratEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MoleratGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Molerat_Queen, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Molerat, Document::UDocumentSegment_Glossary_Molerat_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_MoleratGlossary_MoleratEntry3 GetCreaturesGlossary_MoleratGlossary_MoleratEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_MoleratGlossary_MoleratEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MoleratGlossary_MoleratEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */