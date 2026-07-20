#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_List_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_List;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_1"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_2"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_3"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_4"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_5"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_6"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_7"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_8"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_9"));
                AddParagraph(LocText("Document-ItWr_Scroll_List-Text_10"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_List : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_List_Initial);
            default Title = "Document-ItWr_Scroll_List-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_List : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_List;
        }
    }
}
#endif /* WITH_STORY_G1R */