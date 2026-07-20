#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_03_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_03;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_03_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_135403"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_03-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_2"));
                AddPageBreak();
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_03-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_4"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_143630"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_03-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_5"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_143804"));
                AddSectionHeading(LocText("Document-ItWr_Book_Circle_03-Heading_4"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_03-Text_6"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_145429"));
                AddPageBreak();
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_153144"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_153147"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_144207"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_03_1"), LocText("TEXT_WIP_HGPNVSI_20260312_135454"));
                AddPageBreak();
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_153204"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_153206"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_144535"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_03_2"), LocText("TEXT_WIP_HGPNVSI_20260312_135531"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_03_3"), LocText("TEXT_WIP_HGPNVSI_20260312_135546"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_03 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_03_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_03 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_03;
        }
    }
}
#endif /* WITH_STORY_G1R */