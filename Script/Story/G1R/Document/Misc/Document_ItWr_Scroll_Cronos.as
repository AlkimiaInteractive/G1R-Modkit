#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Cronos_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Cronos;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_Cronos-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Cronos-Text_2"));
                AddParagraph(LocText("Document-ItWr_Scroll_Cronos-Text_3"));
                AddParagraph(LocText("Document-ItWr_Scroll_Cronos-Text_4"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Cronos : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Cronos_Initial);
            default Title = "Document-ItWr_Scroll_Cronos-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Cronos : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Cronos;
        }
    }
}
#endif /* WITH_STORY_G1R */