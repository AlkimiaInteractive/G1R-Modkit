#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneUnlock : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_ExchangeZoneGlossary;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return G1R != nullptr && G1R.HasReachedChapter(0);
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasEverEnteredArea(GameplayTag::Area_ExchangeZone_Elevator);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000002), EConversationDebugInfo::Executing);
                Quest::Locations_ExchangeZoneGlossary_ExchangeZoneEntry2.StartQuest();
                DC(int64(0x00000002), EConversationDebugInfo::Done);
                DC(int64(0x00000003), EConversationDebugInfo::Executing);
                Quest::Locations_ExchangeZoneGlossary_ExchangeZoneEntry3.StartQuest();
                DC(int64(0x00000003), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_ExchangeZone, Document::UDocumentSegment_Glossary_ExchangeZone_Unlock);
            }
        }
        
        
        UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneUnlock GetLocations_ExchangeZoneGlossary_ExchangeZoneUnlock() property
        {
            return Cast<UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneUnlock>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneUnlock::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */