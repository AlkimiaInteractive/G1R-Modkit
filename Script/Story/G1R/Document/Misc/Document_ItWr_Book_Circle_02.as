#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Circle_02_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Circle_02;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_02_Symbol"), LocText("TEXT_WIP_HGPNVSI_20260312_135157"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Circle_02-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_02-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Circle_02-Text_2"));
                AddPageBreak();
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_145835"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_145838"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_143155"));
                AddSectionHeading(LocText("TEXT_WIP_XEWZKBJ_20250920_145842"));
                AddParagraph(LocText("TEXT_WIP_XEWZKBJ_20250920_145846"));
                AddParagraph(LocText("TEXT_WIP_EMOHWID_20251104_143237"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Circle_Magic_02"), LocText("TEXT_WIP_HGPNVSI_20260312_135248"));
            }
        }
        
        
        class UDocument_ItWr_Book_Circle_02 : UBookMageDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Circle_02_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Circle_02 : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Circle_02;
        }
    }
}
#endif /* WITH_STORY_G1R */