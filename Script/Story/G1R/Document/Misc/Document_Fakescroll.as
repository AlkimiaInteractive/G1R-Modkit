#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Fakescroll_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Fakescroll;
        }
        
        
        class UDocument_Fakescroll : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Fakescroll_Initial);
            default Title = "Document-Fakescroll-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Fakescroll : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Fakescroll;
        }
    }
}
#endif /* WITH_STORY_G1R */