#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_TrollGlossary_TrollEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_TrollGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Troll_Adult, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Troll, Document::UDocumentSegment_Glossary_Troll_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_TrollGlossary_TrollEntry2 GetCreaturesGlossary_TrollGlossary_TrollEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_TrollGlossary_TrollEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_TrollGlossary_TrollEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */