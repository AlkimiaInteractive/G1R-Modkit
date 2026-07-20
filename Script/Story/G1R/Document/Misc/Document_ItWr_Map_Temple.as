#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_Temple_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_Temple;
        }
        
        
        class UDocument_ItWr_Map_Temple : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_Temple_Initial);
            default Title = "Document-ItWr_Map_Temple-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_Temple : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_Temple;
        }
    }
}
#endif /* WITH_STORY_G1R */