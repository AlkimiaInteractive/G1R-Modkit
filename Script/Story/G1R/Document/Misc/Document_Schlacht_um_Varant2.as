#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Schlacht_um_Varant2_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Schlacht_um_Varant2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Schlacht_um_Varant2-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Schlacht_um_Varant2-Text_2"));
            }
        }
        
        
        class UDocument_Schlacht_um_Varant2 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Schlacht_um_Varant2_Initial);
            default Title = "Document-Schlacht_um_Varant2-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Schlacht_um_Varant2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Schlacht_um_Varant2;
        }
    }
}
#endif /* WITH_STORY_G1R */