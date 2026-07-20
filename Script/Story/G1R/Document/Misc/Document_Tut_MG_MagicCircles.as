#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Tut_MG_MagicCircles_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Tut_MG_MagicCircles;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145700"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145702"));
                AddParagraph(LocText("TEXT_WIP_FBBFEBC_20260204_145719"));
            }
        }
        
        
        class UDocument_Tut_MG_MagicCircles : UGlossaryTutorialsDocument
        {
            default AddedSegments.Add(UDocumentSegment_Tut_MG_MagicCircles_Initial);
            default Title = "TEXT_WIP_FBBFEBC_20260204_145639";
            default m_SortOrder = 604;
            default Metadata.Add(n"SortOrder", "604");
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Tut_MG_MagicCircles : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Tut_MG_MagicCircles;
        }
    }
}
#endif /* WITH_STORY_G1R */