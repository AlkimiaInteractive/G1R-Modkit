#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_XardasTowerGlossary_XardasTowerEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_XardasTowerGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS != nullptr && Quest::NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_XardasTower, Document::UDocumentSegment_Glossary_XardasTower_Entry2);
            }
        }
        
        
        UQuest_Locations_XardasTowerGlossary_XardasTowerEntry2 GetLocations_XardasTowerGlossary_XardasTowerEntry2() property
        {
            return Cast<UQuest_Locations_XardasTowerGlossary_XardasTowerEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_XardasTowerGlossary_XardasTowerEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */