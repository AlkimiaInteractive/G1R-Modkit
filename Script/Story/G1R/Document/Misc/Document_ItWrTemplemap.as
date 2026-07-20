#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWrTemplemap_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWrTemplemap;
        }
        
        
        class UDocument_ItWrTemplemap : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWrTemplemap_Initial);
            default Title = "Document-ItWrTemplemap-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWrTemplemap : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWrTemplemap;
        }
    }
}
#endif /* WITH_STORY_G1R */