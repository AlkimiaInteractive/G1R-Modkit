#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle3_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle3-Heading_1"));
                AddParagraph(LocText("Document-theriddle3-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-theriddle3-Text_2"));
            }
        }
        
        
        class UDocument_Theriddle3 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle3_Initial);
            default Title = "Document-theriddle3-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle3 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle3;
        }
    }
}
#endif /* WITH_STORY_G1R */