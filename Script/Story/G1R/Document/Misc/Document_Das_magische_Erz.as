#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Das_magische_Erz_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Das_magische_Erz;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Das_magische_Erz-Heading_1"));
                AddParagraph(LocText("Document-Das_magische_Erz-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Das_magische_Erz-Text_2"));
            }
        }
        
        
        class UDocument_Das_magische_Erz : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Das_magische_Erz_Initial);
            default Title = "Document-Das_magische_Erz-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Das_magische_Erz : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Das_magische_Erz;
        }
    }
}
#endif /* WITH_STORY_G1R */