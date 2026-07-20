#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_OrkParchmentTwo_Initial : UDocumentSegment
        {
            default InDocument = UDocument_OrkParchmentTwo;
        }
        
        
        class UDocument_OrkParchmentTwo : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_OrkParchmentTwo_Initial);
            default Title = "Document-OrkParchmentTwo-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_OrkParchmentTwo : UWritingDefinition
        {
            default m_WritingDocument = UDocument_OrkParchmentTwo;
        }
    }
}
#endif /* WITH_STORY_G1R */