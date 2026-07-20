#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_Orc_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_Orc;
        }
        
        
        class UDocument_ItWr_Map_Orc : UDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_Orc_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_Orc : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_Orc;
        }
    }
}
#endif /* WITH_STORY_G1R */