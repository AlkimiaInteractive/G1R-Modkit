#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_PaintersCave_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_PaintersCave;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113347"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170718"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170723"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_PaintersCave : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_PaintersCave_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_PaintersCave : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_PaintersCave;
        }
    }
}
#endif /* WITH_STORY_G1R */