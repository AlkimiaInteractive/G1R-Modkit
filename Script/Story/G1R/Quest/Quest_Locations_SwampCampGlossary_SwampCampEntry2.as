#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_SwampCampGlossary_SwampCampEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_SwampCampGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_SwampCamp_Temple != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SwampCamp, Document::UDocumentSegment_Glossary_SwampCamp_Entry2);
            }
        }
        
        
        UQuest_Locations_SwampCampGlossary_SwampCampEntry2 GetLocations_SwampCampGlossary_SwampCampEntry2() property
        {
            return Cast<UQuest_Locations_SwampCampGlossary_SwampCampEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_SwampCampGlossary_SwampCampEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */