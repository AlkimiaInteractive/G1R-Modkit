#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_DemonGlossary_DemonEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_DemonGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Demon_Lesser, 5);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Demon, Document::UDocumentSegment_Glossary_Demon_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_DemonGlossary_DemonEntry2 GetCreaturesGlossary_DemonGlossary_DemonEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_DemonGlossary_DemonEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_DemonGlossary_DemonEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */