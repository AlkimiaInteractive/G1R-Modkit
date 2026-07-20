#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle5_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle5;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle5-Heading_1"));
                AddParagraph(LocText("Document-theriddle5-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-theriddle5-Text_2"));
            }
        }
        
        
        class UDocument_Theriddle5 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle5_Initial);
            default Title = "Document-theriddle5-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle5 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle5;
        }
    }
}
#endif /* WITH_STORY_G1R */