#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_Locations_OrcEnclaveGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH != nullptr && Quest::ORCENCLAVE_ACCESSSLEEPERTEMPLE_ACCESSSLEEPERTEMPLE_INTELLIGENCEPATH.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OrcEnclave, Document::UDocumentSegment_Glossary_OrcEnclave_Entry3);
            }
        }
        
        
        UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry3 GetLocations_OrcEnclaveGlossary_OrcEnclaveEntry3() property
        {
            return Cast<UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Locations_OrcEnclaveGlossary_OrcEnclaveEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */