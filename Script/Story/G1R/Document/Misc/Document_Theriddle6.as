#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Theriddle6_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Theriddle6;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-theriddle6-Heading_1"));
                AddPageBreak();
            }
        }
        
        
        class UDocument_Theriddle6 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Theriddle6_Initial);
            default Title = "Document-theriddle6-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Theriddle6 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Theriddle6;
        }
    }
}
#endif /* WITH_STORY_G1R */