#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_OrcEnclaveGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(1);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_OrcEnclave);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000092), EConversationDebugInfo::Executing);
                Quest::Locations_OrcEnclaveGlossary_OrcEnclaveEntry2.StartQuest();
                DC(int64(0x00000092), EConversationDebugInfo::Done);
                DC(int64(0x00000093), EConversationDebugInfo::Executing);
                Quest::Locations_OrcEnclaveGlossary_OrcEnclaveEntry3.StartQuest();
                DC(int64(0x00000093), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcEnclave, Document::UDocumentSegment_Glossary_OrcEnclave_Unlock);
            }
        }
        
        
        UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveUnlock GetLocations_OrcEnclaveGlossary_OrcEnclaveUnlock() property
        {
            return Cast<UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */