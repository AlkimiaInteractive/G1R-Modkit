#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Document
    {
        class UDocumentSegment_ItWr_Book_Magicore_Initial : UDocumentSegment
        {
            default InDocument = UDocument_ItWr_Book_Magicore;
            
            UFUNCTION(BlueprintOverride)
            void BuildSegment(const AGothicCharacterState Reader)
            {
                AddChapterHeading(LocText("Document-ItWr_Book_Magicore-Heading_1"));
                AddParagraph(LocText("Document-ItWr_Book_Magicore-Text_1"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Magicore"), LocText("TEXT_WIP_HGPNVSI_20260312_141306"));
                AddPageBreak();
                AddParagraph(LocText("Document-ItWr_Book_Magicore-Text_2"));
                AddImage(TSoftObjectPtr<UTexture2D>(n"/Script/AlkimiaStoryFiles.Assets:images/Writings/T_Book_Magicore_V2"), LocText("TEXT_WIP_HGPNVSI_20260312_141322"));
            }
        }
        
        
        class UDocument_ItWr_Book_Magicore : UBookDocument
        {
            default AddedSegments.Add(UDocumentSegment_ItWr_Book_Magicore_Initial);
        }
        
        
        UCLASS(Abstract)
        class UWritingDefinition_ItWr_Book_Magicore : UWritingDefinition
        {
            default m_WritingDocument = UDocument_ItWr_Book_Magicore;
        }
    }
}
#endif /* WITH_STORY_G1R */