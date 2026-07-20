#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Map_SwampCamp_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Map_SwampCamp;
        }
        
        
        class UDocument_ItWr_Map_SwampCamp : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Map_SwampCamp_Initial);
            default Title = "Document-ItWr_Map_SwampCamp-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Map_SwampCamp : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Map_SwampCamp;
        }
    }
}
#endif /* WITH_STORY_G1R */