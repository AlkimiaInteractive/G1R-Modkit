#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Machtvolle_Kunst_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Machtvolle_Kunst;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Machtvolle_Kunst-Heading_1"));
                AddParagraph(LocText("Document-Machtvolle_Kunst-Text_1"));
                AddParagraph(LocText("Document-Machtvolle_Kunst-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Machtvolle_Kunst-Text_3"));
            }
        }
        
        
        class UDocument_Machtvolle_Kunst : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Machtvolle_Kunst_Initial);
            default Title = "Document-Machtvolle_Kunst-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Machtvolle_Kunst : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Machtvolle_Kunst;
        }
    }
}
#endif /* WITH_STORY_G1R */