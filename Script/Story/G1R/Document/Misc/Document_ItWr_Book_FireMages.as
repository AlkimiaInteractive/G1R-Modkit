#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_FireMages_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_FireMages;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_XGDWEXI_20250919_195356"));
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_113443"));
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_113522"));
                AddPageBreak();
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_113507"));
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_113547"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Order_of_Fire"), LocText("TEXT_WIP_GGPNVSI_20260313_113638"));
            }
        }
        
        
        class UDocument_ItWr_Book_FireMages : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_FireMages_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_FireMages : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_FireMages;
        }
    }
}
#endif /* WITH_STORY_G1R */