#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_Schlacht_um_Varant1_Initial : UDocumentSegment
        {
            default InDocument = UDocument_Schlacht_um_Varant1;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("Document-Schlacht_um_Varant1-Text_1"));
                AddPageBreak();
                AddParagraph(LocText("Document-Schlacht_um_Varant1-Text_2"));
                AddParagraph(LocText("Document-Schlacht_um_Varant1-Text_3"));
            }
        }
        
        
        class UDocument_Schlacht_um_Varant1 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_Schlacht_um_Varant1_Initial);
            default Title = "Document-Schlacht_um_Varant1-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_Schlacht_um_Varant1 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_Schlacht_um_Varant1;
        }
    }
}
#endif /* WITH_STORY_G1R */