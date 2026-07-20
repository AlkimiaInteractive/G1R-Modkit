#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Arcanum_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Arcanum;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Arcanum"), LocText("TEXT_WIP_HGPNVSI_20260312_144858"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Arcanum-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Arcanum-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Arcanum-Text_2"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Arcanum-Text_3"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Arcanum_2"), LocText("TEXT_WIP_HGPNVSI_20260312_144914"));
            }
        }
        
        
        class UDocument_ItWr_Book_Arcanum : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Arcanum_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Arcanum : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Arcanum;
        }
    }
}
#endif /* WITH_STORY_G1R */