#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Jagd_und_Beute_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Jagd_und_Beute;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Jagd_und_Beute-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Jagd_und_Beute-Text_2"));
            }
        }
        
        
        class UDocument_Jagd_und_Beute : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Jagd_und_Beute_Initial);
            default Title = "Document-Jagd_und_Beute-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Jagd_und_Beute : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Jagd_und_Beute;
        }
    }
}
#endif /* WITH_STORY_G1R */