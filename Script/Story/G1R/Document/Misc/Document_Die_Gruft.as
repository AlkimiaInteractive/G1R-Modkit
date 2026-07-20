#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Die_Gruft_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Die_Gruft;
        }
        
        
        class UDocument_Die_Gruft : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Die_Gruft_Initial);
            default Title = "Document-Die_Gruft-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Die_Gruft : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Die_Gruft;
        }
    }
}
#endif /* WITH_STORY_G1R */