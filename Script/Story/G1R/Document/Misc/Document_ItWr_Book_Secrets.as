#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Secrets_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Secrets;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("TEXT_WIP_GGPNVSI_20260313_121147"));
                AddParagraph(LocText("Document-ItWr_Book_Secrets-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Secrets-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Secrets-Text_4"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Secrets_Magic"), LocText("TEXT_WIP_HGPNVSI_20260312_142359"));
            }
        }
        
        
        class UDocument_ItWr_Book_Secrets : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Secrets_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Secrets : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Secrets;
        }
    }
}
#endif /* WITH_STORY_G1R */