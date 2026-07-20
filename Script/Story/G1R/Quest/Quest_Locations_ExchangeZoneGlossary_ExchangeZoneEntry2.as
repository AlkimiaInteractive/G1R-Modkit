#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_Locations_ExchangeZoneGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasListenedTo(LocText("DIA_ORRY_GUARDGATE_06_01"));
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_ExchangeZone, Document::UDocumentSegment_Glossary_ExchangeZone_Entry2);
            }
        }
        
        
        UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry2 GetLocations_ExchangeZoneGlossary_ExchangeZoneEntry2() property
        {
            return Cast<UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */