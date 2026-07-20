#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_ToyMaker_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_ToyMaker;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113404"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165825"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165835"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165903"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165909"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165917"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165923"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165930"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_165936"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_ToyMaker : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_ToyMaker_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_ToyMaker : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_ToyMaker;
        }
    }
}
#endif /* WITH_STORY_G1R */