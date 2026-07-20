#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Orkparcment_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Orkparcment_01;
        }
        
        
        class UDocument_ItWr_Scroll_Orkparcment_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Orkparcment_01_Initial);
            default Title = "Document-ItWr_Scroll_Orkparcment_01-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Orkparcment_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Orkparcment_01;
        }
    }
}
#endif /* WITH_STORY_G1R */