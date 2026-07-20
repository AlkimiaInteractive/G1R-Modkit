#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_TrollCanyonGlossary_TrollCanyonUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_TrollCanyonGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_TrollCanyon);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_TrollCanyon, Document::UDocumentSegment_Glossary_TrollCanyon_Unlock);
            }
        }
        
        
        UQuest_Locations_TrollCanyonGlossary_TrollCanyonUnlock GetLocations_TrollCanyonGlossary_TrollCanyonUnlock() property
        {
            return Cast<UQuest_Locations_TrollCanyonGlossary_TrollCanyonUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_TrollCanyonGlossary_TrollCanyonUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */