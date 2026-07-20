#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Recipes_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Recipes_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddSectionHeading(LocText("Document-Itwr_book_recipes_01-Heading_1"));
                AddParagraph(LocText("Document-Itwr_book_recipes_01-Text_1"));
                AddParagraph(LocText("Document-Itwr_book_recipes_01-Text_2"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Recipes_1"), LocText("TEXT_WIP_HGPNVSI_20260312_143746"));
            }
        }
        
        
        class UDocument_ItWr_Book_Recipes_01 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Recipes_01_Initial);
            default Title = "Document-Itwr_book_recipes_01-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Recipes_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Recipes_01;
        }
    }
}
#endif /* WITH_STORY_G1R */