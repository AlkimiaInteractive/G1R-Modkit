#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OrcTerritoryGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcTerritory);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000050), EConversationDebugInfo::Executing);
                Quest::Locations_OrcTerritoryGlossary_OrcTerritoryEntry2.StartQuest();
                DC(int64(0x00000050), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcTerritory, Document::UDocumentSegment_Glossary_OrcTerritory_Unlock);
            }
        }
        
        
        UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryUnlock GetLocations_OrcTerritoryGlossary_OrcTerritoryUnlock() property
        {
            return Cast<UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcTerritoryGlossary_OrcTerritoryUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */