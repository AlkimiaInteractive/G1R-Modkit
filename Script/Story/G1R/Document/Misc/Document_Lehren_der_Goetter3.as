#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Lehren_der_Goetter3_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Lehren_der_Goetter3;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Lehren_der_Goetter3-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Lehren_der_Goetter3-Text_2"));
            }
        }
        
        
        class UDocument_Lehren_der_Goetter3 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Lehren_der_Goetter3_Initial);
            default Title = "Document-Lehren_der_Goetter3-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Lehren_der_Goetter3 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Lehren_der_Goetter3;
        }
    }
}
#endif /* WITH_STORY_G1R */