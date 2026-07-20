#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Letter_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Letter_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_02-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_02-Text_2"));
                AddParagraph(LocText("Document-ItWr_Scroll_Letter_02-Text_3"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Letter_02 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Letter_02_Initial);
            default Title = "Document-ItWr_Scroll_Letter_02-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Letter_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Letter_02;
        }
    }
}
#endif /* WITH_STORY_G1R */