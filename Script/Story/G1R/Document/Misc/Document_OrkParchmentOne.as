#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_OrkParchmentOne_Initial : UDocumentSegment
        {
            default InDocument = UDocument_OrkParchmentOne;
        }
        
        
        class UDocument_OrkParchmentOne : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_OrkParchmentOne_Initial);
            default Title = "Document-OrkParchmentOne-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_OrkParchmentOne : UWritingDefinition
        {
            default m_WritingDocument = UDocument_OrkParchmentOne;
        }
    }
}
#endif /* WITH_STORY_G1R */