#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle4_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle4;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle4-Heading_1"));
                AddParagraph(LocText("Document-theriddle4-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-theriddle4-Text_2"));
            }
        }
        
        
        class UDocument_Theriddle4 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle4_Initial);
            default Title = "Document-theriddle4-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle4 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle4;
        }
    }
}
#endif /* WITH_STORY_G1R */