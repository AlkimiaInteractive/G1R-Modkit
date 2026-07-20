#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle1_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle1-Heading_1"));
                AddParagraph(LocText("Document-theriddle1-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-theriddle1-Text_2"));
            }
        }
        
        
        class UDocument_Theriddle1 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle1_Initial);
            default Title = "Document-theriddle1-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle1 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle1;
        }
    }
}
#endif /* WITH_STORY_G1R */