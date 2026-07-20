#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Powerfulart_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Powerfulart;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Book_Powerfulart-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Powerfulart-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Powerfulart-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Powerfulart-Text_3"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Roots_of_power"), LocText("TEXT_WIP_HGPNVSI_20260312_142309"));
            }
        }
        
        
        class UDocument_ItWr_Book_Powerfulart : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Powerfulart_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Powerfulart : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Powerfulart;
        }
    }
}
#endif /* WITH_STORY_G1R */