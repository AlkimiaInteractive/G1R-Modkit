#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OldCampGlossary_OldCampEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_OldCampGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.FireMagesPermission != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OldCamp, Document::UDocumentSegment_Glossary_OldCamp_Entry2);
            }
        }
        
        
        UQuest_Locations_OldCampGlossary_OldCampEntry2 GetLocations_OldCampGlossary_OldCampEntry2() property
        {
            return Cast<UQuest_Locations_OldCampGlossary_OldCampEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OldCampGlossary_OldCampEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */