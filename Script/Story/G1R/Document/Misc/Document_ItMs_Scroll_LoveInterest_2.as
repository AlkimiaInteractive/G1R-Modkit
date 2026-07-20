#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItMs_Scroll_LoveInterest_2_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItMs_Scroll_LoveInterest_2;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_MEUWDJF_20260408_123305"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170236"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170242"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170256"));
                AddParagraph(LocText("TEXT_WIP_KOYHWBI_20260519_170305"));
            }
        }
        
        
        class UDocument_ItMs_Scroll_LoveInterest_2 : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItMs_Scroll_LoveInterest_2_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItMs_Scroll_LoveInterest_2 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItMs_Scroll_LoveInterest_2;
        }
    }
}
#endif /* WITH_STORY_G1R */