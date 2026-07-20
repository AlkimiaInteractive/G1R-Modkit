#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Scroll_RankWaterMages_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Scroll_RankWaterMages;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddParagraph(LocText("TEXT_WIP_FZNRRS_20251008_154500"));
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_105542"));
                AddParagraph(LocText("TEXT_WIP_OUJXIRD_20251007_105619"));
                AddParagraph(LocText("TEXT_WIP_FZNRRS_20251008_131322"));
                AddParagraph(LocText("TEXT_WIP_FZNRRS_20251008_133120"));
                AddParagraph(LocText("TEXT_WIP_FZNRRS_20251008_133132"));
            }
        }
        
        
        class UDocument_ItWr_Scroll_RankWaterMages : ULetterDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Scroll_RankWaterMages_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Scroll_RankWaterMages : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Scroll_RankWaterMages;
        }
    }
}
#endif /* WITH_STORY_G1R */