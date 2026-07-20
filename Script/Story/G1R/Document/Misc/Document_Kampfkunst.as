#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Kampfkunst_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Kampfkunst;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Kampfkunst-Text_1"));
                AddParagraph(LocText("Document-Kampfkunst-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Kampfkunst-Text_3"));
                AddParagraph(LocText("Document-Kampfkunst-Text_4"));
            }
        }
        
        
        class UDocument_Kampfkunst : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Kampfkunst_Initial);
            default Title = "Document-Kampfkunst-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Kampfkunst : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Kampfkunst;
        }
    }
}
#endif /* WITH_STORY_G1R */