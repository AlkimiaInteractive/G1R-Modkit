#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_04_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_04;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_04_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_135701"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_04-Heading_1"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_145141"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_04-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_04-Text_2"));
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_04-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_04-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_04-Text_4"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_162941"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_04-Heading_5"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_04-Text_6"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_164425"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_04_1"), LocText("TEXT_WIP_HGPNVSI_20260312_135928"));
                AddPageBreak();
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_153221"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_153223"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_145536"));
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_153227"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_153230"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_164444"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_04-Heading_4"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_04-Text_5"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_04_2"), LocText("TEXT_WIP_HGPNVSI_20260312_135912"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_04 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_04_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_04 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_04;
        }
    }
}
#endif /* WITH_STORY_G1R */