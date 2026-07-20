#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_OrcEnclaveGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.Location_OrcEnclave_Arena != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcEnclave, Document::UDocumentSegment_Glossary_OrcEnclave_Entry2);
            }
        }
        
        
        UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry2 GetLocations_OrcEnclaveGlossary_OrcEnclaveEntry2() property
        {
            return Cast<UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */