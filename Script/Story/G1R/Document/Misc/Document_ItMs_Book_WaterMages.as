#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Book_WaterMages_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Book_WaterMages;
        }
        
        
        class UDocument_ItMs_Book_WaterMages : UDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Book_WaterMages_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Book_WaterMages : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Book_WaterMages;
        }
    }
}
#endif /* WITH_STORY_G1R */