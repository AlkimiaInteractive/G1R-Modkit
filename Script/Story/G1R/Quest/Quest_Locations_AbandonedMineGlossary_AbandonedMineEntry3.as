#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_AbandonedMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_AbandonedMine_OrcGrave != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_AbandonedMine, Document::UDocumentSegment_Glossary_AbandonedMine_Entry3);
            }
        }
        
        
        UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry3 GetLocations_AbandonedMineGlossary_AbandonedMineEntry3() property
        {
            return Cast<UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */