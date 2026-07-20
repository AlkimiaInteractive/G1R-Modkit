#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasTowerGlossary_XardasTowerEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_XardasTowerGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_XardasTower_Bedroom != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasTower, Document::UDocumentSegment_Glossary_XardasTower_Entry3);
            }
        }
        
        
        UQuest_Locations_XardasTowerGlossary_XardasTowerEntry3 GetLocations_XardasTowerGlossary_XardasTowerEntry3() property
        {
            return Cast<UQuest_Locations_XardasTowerGlossary_XardasTowerEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasTowerGlossary_XardasTowerEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */