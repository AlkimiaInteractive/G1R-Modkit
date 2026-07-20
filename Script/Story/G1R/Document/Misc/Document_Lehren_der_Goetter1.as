#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Lehren_der_Goetter1_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Lehren_der_Goetter1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Lehren_der_Goetter1-Text_1"));
                AddParagraph(LocText("Document-Lehren_der_Goetter1-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Lehren_der_Goetter1-Text_3"));
                AddParagraph(LocText("Document-Lehren_der_Goetter1-Text_4"));
            }
        }
        
        
        class UDocument_Lehren_der_Goetter1 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Lehren_der_Goetter1_Initial);
            default Title = "Document-Lehren_der_Goetter1-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Lehren_der_Goetter1 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Lehren_der_Goetter1;
        }
    }
}
#endif /* WITH_STORY_G1R */