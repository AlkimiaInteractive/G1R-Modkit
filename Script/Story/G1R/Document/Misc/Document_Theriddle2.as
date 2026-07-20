#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle2_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle2-Heading_1"));
                AddParagraph(LocText("Document-theriddle2-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-theriddle2-Text_2"));
            }
        }
        
        
        class UDocument_Theriddle2 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle2_Initial);
            default Title = "Document-theriddle2-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle2;
        }
    }
}
#endif /* WITH_STORY_G1R */