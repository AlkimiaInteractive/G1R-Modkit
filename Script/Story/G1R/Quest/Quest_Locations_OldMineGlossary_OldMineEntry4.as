#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldMineGlossary_OldMineEntry4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_OldMineGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_OldMineCollapsed != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldMine, Document::UDocumentSegment_Glossary_OldMine_Entry4);
            }
        }
        
        
        UQuest_Locations_OldMineGlossary_OldMineEntry4 GetLocations_OldMineGlossary_OldMineEntry4() property
        {
            return Cast<UQuest_Locations_OldMineGlossary_OldMineEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldMineGlossary_OldMineEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */