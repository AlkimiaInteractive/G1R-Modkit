#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_XardasSunkenTowerGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.SunkenTowerElementsDoorOpen != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasSunkenTower, Document::UDocumentSegment_Glossary_XardasSunkenTower_Entry2);
            }
        }
        
        
        UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2 GetLocations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2() property
        {
            return Cast<UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasSunkenTowerGlossary_XardasSunkenTowerEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */