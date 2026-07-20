#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Astronomy_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Astronomy;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_QGPNVSI_20260319_121525"));
                AddParagraph(LocText("Document-Itwr_book_astronomy-Text_1"));
                AddParagraph(LocText("Document-Itwr_book_astronomy-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-Itwr_book_astronomy-Text_3"));
                AddParagraph(LocText("Document-Itwr_book_astronomy-Text_4"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Astronomy"), LocText("TEXT_WIP_HGPNVSI_20260312_134527"));
            }
        }
        
        
        class UDocument_ItWr_Book_Astronomy : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Astronomy_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Astronomy : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Astronomy;
        }
    }
}
#endif /* WITH_STORY_G1R */