#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireGolemGlossary_FireGolemEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_FireGolemGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasKilledCharactersOfSpecies(GameplayTag::Species_Creature_Golem_Fire, 1);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FireGolem, Document::UDocumentSegment_Glossary_FireGolem_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_FireGolemGlossary_FireGolemEntry2 GetCreaturesGlossary_FireGolemGlossary_FireGolemEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_FireGolemGlossary_FireGolemEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireGolemGlossary_FireGolemEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */