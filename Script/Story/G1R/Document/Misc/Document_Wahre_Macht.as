#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Wahre_Macht_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Wahre_Macht;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Wahre_Macht-Heading_1"));
                AddParagraph(LocText("Document-Wahre_Macht-Text_1"));
                AddParagraph(LocText("Document-Wahre_Macht-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Wahre_Macht-Text_3"));
            }
        }
        
        
        class UDocument_Wahre_Macht : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Wahre_Macht_Initial);
            default Title = "Document-Wahre_Macht-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Wahre_Macht : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Wahre_Macht;
        }
    }
}
#endif /* WITH_STORY_G1R */