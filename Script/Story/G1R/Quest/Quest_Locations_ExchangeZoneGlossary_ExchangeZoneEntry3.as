#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_ExchangeZoneGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::OldCamp_OCCHAPTER3_RANKUPGUARD != nullptr && Quest::OldCamp_OCCHAPTER3_RANKUPGUARD.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_ExchangeZone, Document::UDocumentSegment_Glossary_ExchangeZone_Entry3);
            }
        }
        
        
        UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry3 GetLocations_ExchangeZoneGlossary_ExchangeZoneEntry3() property
        {
            return Cast<UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_ExchangeZoneGlossary_ExchangeZoneEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */