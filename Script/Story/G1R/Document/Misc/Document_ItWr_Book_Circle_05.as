#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_05_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_05;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_05_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_140015"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_05-Heading_1"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_05-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_05-Text_1"));
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_123420"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_05-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_05-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_05-Text_3"));
                AddParagraph(LocText("TEXT_WIP_GGPNVSI_20260313_123505"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_05 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_05_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_05 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_05;
        }
    }
}
#endif /* WITH_STORY_G1R */