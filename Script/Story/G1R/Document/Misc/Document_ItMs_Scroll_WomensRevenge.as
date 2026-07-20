#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_WomensRevenge_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_WomensRevenge;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113423"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170338"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170343"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170355"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170402"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170407"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170413"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170419"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170425"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_WomensRevenge : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_WomensRevenge_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_WomensRevenge : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_WomensRevenge;
        }
    }
}
#endif /* WITH_STORY_G1R */