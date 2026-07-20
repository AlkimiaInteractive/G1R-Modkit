#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Certificate_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Certificate;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Scroll_Certificate-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Certificate-Text_1"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Certificate : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Certificate_Initial);
            default Title = "Document-ItWr_Scroll_Certificate-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Certificate : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Certificate;
        }
    }
}
#endif /* WITH_STORY_G1R */