#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OrcTerritoryGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return (Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory_Watchtower_03)) || (Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory_Watchtower_02)) || (Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory_Watchtower_01));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcTerritory, Document::UDocumentSegment_Glossary_OrcTerritory_Entry2);
            }
        }
        
        
        UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryEntry2 GetLocations_OrcTerritoryGlossary_OrcTerritoryEntry2() property
        {
            return Cast<UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */