#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Slave_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Slave;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Book_Slave-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_1"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_2"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_3"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_4"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Slave-Heading_2"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_5"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_6"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Slave_1"), LocText("TEXT_WIP_HGPNVSI_20260312_144214"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Slave_3"), LocText("TEXT_WIP_HGPNVSI_20260312_144603"));
                AddPageBreak();
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Slave_4"), LocText("TEXT_WIP_HGPNVSI_20260312_144720"));
                AddPageBreak();
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Slave_5"), LocText("TEXT_WIP_HGPNVSI_20260312_144738"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Slave-Heading_3"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_7"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_8"));
                AddPageBreak();
                AddChapterHeading(LocText("Document-ItWr_Book_Slave-Heading_4"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_9"));
                AddParagraph(LocText("Document-ItWr_Book_Slave-Text_10"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Slave_2"), LocText("TEXT_WIP_HGPNVSI_20260312_144816"));
            }
        }
        
        
        class UDocument_ItWr_Book_Slave : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Slave_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Slave : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Slave;
        }
    }
}
#endif /* WITH_STORY_G1R */