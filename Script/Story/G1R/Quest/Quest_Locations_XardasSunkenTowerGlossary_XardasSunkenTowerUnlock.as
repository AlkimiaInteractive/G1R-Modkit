#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_XardasSunkenTowerGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_XardasSunkenTower);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b3), EConversationDebugInfo::Executing);
                Quest::Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2.StartQuest();
                DC(int64(0x000000b3), EConversationDebugInfo::Done);
                DC(int64(0x000000b4), EConversationDebugInfo::Executing);
                Quest::Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry3.StartQuest();
                DC(int64(0x000000b4), EConversationDebugInfo::Done);
                DC(int64(0x000000b5), EConversationDebugInfo::Executing);
                Quest::Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry4.StartQuest();
                DC(int64(0x000000b5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasSunkenTower, Document::UDocumentSegment_Glossary_XardasSunkenTower_Unlock);
            }
        }
        
        
        UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerUnlock GetLocations_XardasSunkenTowerGlossary_XardasSunkenTowerUnlock() property
        {
            return Cast<UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */