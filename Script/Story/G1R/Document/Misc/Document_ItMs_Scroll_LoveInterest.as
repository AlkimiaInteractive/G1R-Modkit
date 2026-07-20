#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_LoveInterest_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_LoveInterest;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_QHMTAUF_20260316_113332"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170051"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170056"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170102"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170108"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170114"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170125"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170132"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_LoveInterest : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_LoveInterest_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_LoveInterest : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_LoveInterest;
        }
    }
}
#endif /* WITH_STORY_G1R */