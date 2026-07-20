#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Godsgift_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Godsgift;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-Itwr_book_godsgift-Heading_1"));
                AddSectionHeading(LocText("TEXT_WIP_QGPNVSI_20260319_123002"));
                AddParagraph(LocText("Document-Itwr_book_godsgift-Text_2"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Gods_Given_Gift_2"), LocText("TEXT_WIP_HGPNVSI_20260312_142634"));
                AddPageBreak();
                AddParagraph(LocText("Document-Itwr_book_godsgift-Text_3"));
                AddParagraph(LocText("Document-Itwr_book_godsgift-Text_4"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Gods_Given_Gift_1"), LocText("TEXT_WIP_HGPNVSI_20260312_142648"));
            }
        }
        
        
        class UDocument_ItWr_Book_Godsgift : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Godsgift_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Godsgift : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Godsgift;
        }
    }
}
#endif /* WITH_STORY_G1R */