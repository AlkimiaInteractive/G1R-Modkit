#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_01_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_01;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_01_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_134957"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_01-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_01-Text_1"));
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_01-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_01-Text_2"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_01-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_01-Text_4"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_142704"));
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_153122"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_153125"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_142841"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_01"), LocText("TEXT_WIP_HGPNVSI_20260312_135041"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_01 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_01_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_01 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_01;
        }
    }
}
#endif /* WITH_STORY_G1R */