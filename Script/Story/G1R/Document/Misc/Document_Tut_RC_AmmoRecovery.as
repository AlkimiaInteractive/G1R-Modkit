#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_RC_AmmoRecovery_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_RC_AmmoRecovery;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145210"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145219"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145229"));
                AddBulletListEntry(LocText("TEXT_WIP_FBBFEBC_20260204_145236"));
            }
        }
        
        
        class UDocument_Tut_RC_AmmoRecovery : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_RC_AmmoRecovery_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_145154";
            default m_SortOrder = 504;
            default Metadata.Add(n"SortOrder", "504");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_RC_AmmoRecovery : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_RC_AmmoRecovery;
        }
    }
}
#endif /* WITH_STORY_G1R */