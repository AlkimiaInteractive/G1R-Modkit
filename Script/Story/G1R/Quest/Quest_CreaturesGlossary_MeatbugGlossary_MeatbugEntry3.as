#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry3 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MeatbugGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Meatbug, 10);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Meatbug, Document::UDocumentSegment_Glossary_Meatbug_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry3 GetCreaturesGlossary_MeatbugGlossary_MeatbugEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */