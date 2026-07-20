#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_06_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_06;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_06_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_140451"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_06-Heading_1"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_145230"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_06-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_06-Text_1"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_164711"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_06-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_06-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_06-Text_3"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_164735"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_06 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_06_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_06 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_06;
        }
    }
}
#endif /* WITH_STORY_G1R */