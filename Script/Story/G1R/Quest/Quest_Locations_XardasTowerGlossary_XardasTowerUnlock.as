#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasTowerGlossary_XardasTowerUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_XardasTowerGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_XardasTower);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000a8), EConversationDebugInfo::Executing);
                Quest::Locations_XardasTowerGlossary_XardasTowerEntry2.StartQuest();
                DC(int64(0x000000a8), EConversationDebugInfo::Done);
                DC(int64(0x000000a9), EConversationDebugInfo::Executing);
                Quest::Locations_XardasTowerGlossary_XardasTowerEntry3.StartQuest();
                DC(int64(0x000000a9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasTower, Document::UDocumentSegment_Glossary_XardasTower_Unlock);
            }
        }
        
        
        UQuest_Locations_XardasTowerGlossary_XardasTowerUnlock GetLocations_XardasTowerGlossary_XardasTowerUnlock() property
        {
            return Cast<UQuest_Locations_XardasTowerGlossary_XardasTowerUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasTowerGlossary_XardasTowerUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */