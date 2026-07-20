#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Kalom_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Kalom;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_Kalom-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Kalom-Text_2"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Kalom : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Kalom_Initial);
            default Title = "Document-ItWr_Scroll_Kalom-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Kalom : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Kalom;
        }
    }
}
#endif /* WITH_STORY_G1R */