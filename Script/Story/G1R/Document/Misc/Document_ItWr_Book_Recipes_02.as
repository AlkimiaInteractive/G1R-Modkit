#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Recipes_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Recipes_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddSectionHeading(LocText("Document-Itwr_book_recipes_02-Heading_1"));
                AddParagraph(LocText("Document-Itwr_book_recipes_02-Text_1"));
                AddParagraph(LocText("Document-Itwr_book_recipes_02-Text_2"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Recipes_2"), LocText("TEXT_WIP_HGPNVSI_20260312_143718"));
            }
        }
        
        
        class UDocument_ItWr_Book_Recipes_02 : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Recipes_02_Initial);
            default Title = "Document-Itwr_book_recipes_02-Title";
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Recipes_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Recipes_02;
        }
    }
}
#endif /* WITH_STORY_G1R */