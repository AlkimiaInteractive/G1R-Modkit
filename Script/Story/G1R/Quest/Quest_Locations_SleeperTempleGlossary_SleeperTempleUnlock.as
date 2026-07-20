#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SleeperTempleGlossary_SleeperTempleUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_SleeperTempleGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_SleeperTemple);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000009d), EConversationDebugInfo::Executing);
                Quest::Locations_SleeperTempleGlossary_SleeperTempleEntry2.StartQuest();
                DC(int64(0x0000009d), EConversationDebugInfo::Done);
                DC(int64(0x0000009e), EConversationDebugInfo::Executing);
                Quest::Locations_SleeperTempleGlossary_SleeperTempleEntry3.StartQuest();
                DC(int64(0x0000009e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SleeperTemple, Document::UDocumentSegment_Glossary_SleeperTemple_Unlock);
            }
        }
        
        
        UQuest_Locations_SleeperTempleGlossary_SleeperTempleUnlock GetLocations_SleeperTempleGlossary_SleeperTempleUnlock() property
        {
            return Cast<UQuest_Locations_SleeperTempleGlossary_SleeperTempleUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SleeperTempleGlossary_SleeperTempleUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */