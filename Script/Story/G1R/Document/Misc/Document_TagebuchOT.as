#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_TagebuchOT_Initial : UDocumentSegment
        {
            default InDocument = UDocument_TagebuchOT;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-TagebuchOT-Heading_1"));
                AddParagraph(LocText("Document-TagebuchOT-Text_1"));
                AddParagraph(LocText("Document-TagebuchOT-Text_2"));
                AddParagraph(LocText("Document-TagebuchOT-Text_3"));
                AddParagraph(LocText("Document-TagebuchOT-Text_4"));
                AddChapterHeading(LocText("Document-TagebuchOT-Heading_2"));
                AddParagraph(LocText("Document-TagebuchOT-Text_5"));
                AddParagraph(LocText("Document-TagebuchOT-Text_6"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-TagebuchOT-Heading_3"));
                AddParagraph(LocText("Document-TagebuchOT-Text_7"));
                AddParagraph(LocText("Document-TagebuchOT-Text_8"));
                AddChapterHeading(LocText("Document-TagebuchOT-Heading_4"));
                AddParagraph(LocText("Document-TagebuchOT-Text_9"));
                AddParagraph(LocText("Document-TagebuchOT-Text_10"));
            }
        }
        
        
        class UDocument_TagebuchOT : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_TagebuchOT_Initial);
            default Title = "Document-TagebuchOT-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_TagebuchOT : UWritingDefinition
        {
            default m_WritingDocument = UDocument_TagebuchOT;
        }
    }
}
#endif /* WITH_STORY_G1R */