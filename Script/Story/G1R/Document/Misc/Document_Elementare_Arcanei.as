#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Elementare_Arcanei_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Elementare_Arcanei;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Elementare_Arcanei-Heading_1"));
                AddParagraph(LocText("Document-Elementare_Arcanei-Text_1"));
                AddParagraph(LocText("Document-Elementare_Arcanei-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Elementare_Arcanei-Text_3"));
            }
        }
        
        
        class UDocument_Elementare_Arcanei : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_Elementare_Arcanei_Initial);
            default Title = "Document-Elementare_Arcanei-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Elementare_Arcanei : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Elementare_Arcanei;
        }
    }
}
#endif /* WITH_STORY_G1R */