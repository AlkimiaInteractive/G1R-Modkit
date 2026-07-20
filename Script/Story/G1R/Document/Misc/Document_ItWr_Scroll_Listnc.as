#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_Listnc_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_Listnc;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_2"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_3"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_4"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_5"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_6"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_7"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_8"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_9"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_10"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_11"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_12"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_13"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_14"));
                AddParagraph(LocText("Document-ItWr_Scroll_Listnc-Text_15"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_Listnc : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_Listnc_Initial);
            default Title = "Document-ItWr_Scroll_Listnc-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_Listnc : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_Listnc;
        }
    }
}
#endif /* WITH_STORY_G1R */