#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Crypt_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Crypt;
        }
        
        
        class UDocument_ItWr_Book_Crypt : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Crypt_Initial);
            default Title = "Document-ItWr_Book_Crypt-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Crypt : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Crypt;
        }
    }
}
#endif /* WITH_STORY_G1R */