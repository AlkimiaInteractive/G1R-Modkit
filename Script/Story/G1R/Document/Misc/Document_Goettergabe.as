#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Goettergabe_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Goettergabe;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Goettergabe-Heading_1"));
                AddParagraph(LocText("Document-Goettergabe-Text_1"));
                AddParagraph(LocText("Document-Goettergabe-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Goettergabe-Text_3"));
                AddParagraph(LocText("Document-Goettergabe-Text_4"));
            }
        }
        
        
        class UDocument_Goettergabe : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Goettergabe_Initial);
            default Title = "Document-Goettergabe-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Goettergabe : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Goettergabe;
        }
    }
}
#endif /* WITH_STORY_G1R */