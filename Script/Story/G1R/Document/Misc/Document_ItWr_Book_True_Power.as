#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_True_Power_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_True_Power;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Book_True_Power-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_True_Power-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_True_Power-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_True_Power-Text_3"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_True_Power"), LocText("TEXT_WIP_HGPNVSI_20260312_145200"));
            }
        }
        
        
        class UDocument_ItWr_Book_True_Power : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_True_Power_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_True_Power : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_True_Power;
        }
    }
}
#endif /* WITH_STORY_G1R */