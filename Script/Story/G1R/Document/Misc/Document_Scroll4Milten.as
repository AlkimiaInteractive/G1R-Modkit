#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Scroll4Milten_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Scroll4Milten;
        }
        
        
        class UDocument_Scroll4Milten : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Scroll4Milten_Initial);
            default Title = "Document-Scroll4Milten-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Scroll4Milten : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Scroll4Milten;
        }
    }
}
#endif /* WITH_STORY_G1R */