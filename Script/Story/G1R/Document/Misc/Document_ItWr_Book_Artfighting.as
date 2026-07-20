#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Artfighting_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Artfighting;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Art_of_Fighting"), LocText("TEXT_WIP_HGPNVSI_20260312_134438"));
                AddPageBreak();
                AddParagraph(LocText("Document-Itwr_book_artfighting-Text_1"));
                AddParagraph(LocText("Document-Itwr_book_artfighting-Text_2"));
                AddParagraph(LocText("Document-Itwr_book_artfighting-Text_3"));
                AddParagraph(LocText("Document-Itwr_book_artfighting-Text_4"));
            }
        }
        
        
        class UDocument_ItWr_Book_Artfighting : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Artfighting_Initial);
            default Title = "Document-Itwr_book_artfighting-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Artfighting : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Artfighting;
        }
    }
}
#endif /* WITH_STORY_G1R */