#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrPSImap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrPSImap;
        }
        
        
        class UDocument_ItWrPSImap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrPSImap_Initial);
            default Title = "Document-ItWrPSImap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrPSImap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrPSImap;
        }
    }
}
#endif /* WITH_STORY_G1R */