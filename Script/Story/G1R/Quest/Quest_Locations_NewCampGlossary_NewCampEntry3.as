#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_NewCampGlossary_NewCampEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_NewCampGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_NewCamp_OrePile != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NewCamp, Document::UDocumentSegment_Glossary_NewCamp_Entry3);
            }
        }
        
        
        UQuest_Locations_NewCampGlossary_NewCampEntry3 GetLocations_NewCampGlossary_NewCampEntry3() property
        {
            return Cast<UQuest_Locations_NewCampGlossary_NewCampEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_NewCampGlossary_NewCampEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */