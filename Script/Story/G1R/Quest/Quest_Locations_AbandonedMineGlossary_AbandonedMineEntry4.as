#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_AbandonedMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R != nullptr && G1R.IsDoorOpen(n"AbandonedMine_UluTalisman_Door");
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_AbandonedMine, Document::UDocumentSegment_Glossary_AbandonedMine_Entry4);
            }
        }
        
        
        UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry4 GetLocations_AbandonedMineGlossary_AbandonedMineEntry4() property
        {
            return Cast<UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_AbandonedMineGlossary_AbandonedMineEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */