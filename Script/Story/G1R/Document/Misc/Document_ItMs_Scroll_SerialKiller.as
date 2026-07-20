#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_SerialKiller_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_SerialKiller;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113320"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165545"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165551"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165558"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165604"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165611"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165618"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165624"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165629"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165638"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165644"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165649"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_SerialKiller : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_SerialKiller_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_SerialKiller : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_SerialKiller;
        }
    }
}
#endif /* WITH_STORY_G1R */